/**
 * Bitcoin API Service
 *
 * This service is responsible for fetching Bitcoin block data.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */

import { BlockInfo, BitcoinAPIServiceInterface } from '../types';
import { BITCOIN_API, CACHE_EXPIRY } from '../constants';

/**
 * Bitcoin API Service options interface
 */
export interface BitcoinAPIServiceOptions {
  /** Block data cache expiry time in milliseconds (default: 60000ms = 1 minute) */
  blockCacheExpiry?: number;
  /** Confirmation cache expiry time in milliseconds (default: 5000ms = 5 seconds) */
  confirmationCacheExpiry?: number;
}

/**
 * Implementation of the Bitcoin API service
 */
export class BitcoinAPIService implements BitcoinAPIServiceInterface {
  // API endpoints
  private devEndpoint = BITCOIN_API.DEV_ENDPOINT;
  private prodEndpoint = BITCOIN_API.PROD_ENDPOINT;

  // Cache settings
  private cache: Map<string, { data: any, timestamp: number }> = new Map();
  private blockDataCacheExpiry: number = CACHE_EXPIRY.BLOCK_DATA;
  private confirmationCacheExpiry: number = CACHE_EXPIRY.CONFIRMATION;

  /**
   * Constructor
   *
   * @param options - Optional configuration for the service
   */
  constructor(options?: BitcoinAPIServiceOptions) {
    // Override default cache expiry times if provided
    if (options?.blockCacheExpiry) {
      this.blockDataCacheExpiry = options.blockCacheExpiry;
    }

    if (options?.confirmationCacheExpiry) {
      this.confirmationCacheExpiry = options.confirmationCacheExpiry;
    }
  }

  /**
   * Get the appropriate API endpoint based on environment
   * 
   * @param blockNumber - The block number to fetch
   * @returns The full API endpoint URL
   * @private
   */
  private getEndpoint(blockNumber: number): string {
    return process.env.NODE_ENV === 'development'
      ? `${this.devEndpoint}/${blockNumber}`
      : `${this.prodEndpoint}/${blockNumber}`;
  }

  /**
   * Get block data by height
   *
   * @param height - The block number to fetch
   * @returns Promise resolving to the block info (nonce and confirmations only)
   */
  async getBlockByHeight(height: number): Promise<BlockInfo> {
    const cacheKey = `block-${height}`;

    // Check cache first
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.blockDataCacheExpiry) {
      return cached.data;
    }

    try {
      const endpoint = this.getEndpoint(height);
      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const blockData = await response.json();

      // Validate the data
      const validation = this.validateBlockData(blockData);
      if (!validation.valid) {
        throw new Error(`Invalid block data: ${validation.errors.join(', ')}`);
      }

      // Extract ONLY the needed data (nonce and confirmations)
      const blockInfo: BlockInfo = {
        blockNumber: height,
        nonce: blockData.nonce,
        confirmations: blockData.confirmations
      };

      // Cache the result
      this.cache.set(cacheKey, {
        data: blockInfo,
        timestamp: Date.now()
      });

      return blockInfo;
    } catch (error) {
      // NO fallback mechanisms - if the API fails, we fail
      console.error(`Failed to fetch block ${height}:`, error);
      throw new Error(`Failed to fetch block ${height}: ${error instanceof Error ? error.message : String(error)}`);
    }
  }

  /**
   * Get confirmation count for a block
   *
   * @param height - The block number to fetch confirmations for
   * @returns Promise resolving to the confirmation count
   */
  async getConfirmationCount(height: number): Promise<number> {
    const cacheKey = `confirmation-${height}`;

    // Check cache first (shorter expiry for confirmations)
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.confirmationCacheExpiry) {
      return cached.data;
    }

    try {
      const endpoint = this.getEndpoint(height);
      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const blockData = await response.json();

      // Validate the data
      if (typeof blockData.confirmations !== 'number') {
        throw new Error('Invalid block data: confirmations is missing or not a number');
      }

      // Cache the result
      this.cache.set(cacheKey, {
        data: blockData.confirmations,
        timestamp: Date.now()
      });

      return blockData.confirmations;
    } catch (error) {
      // NO fallback mechanisms - if the API fails, we fail
      console.error(`Failed to fetch confirmations for block ${height}:`, error);
      throw new Error(`Failed to fetch confirmations for block ${height}: ${error instanceof Error ? error.message : String(error)}`);
    }
  }

  /**
   * Validate block data
   *
   * @param data - The block data to validate
   * @returns Validation result
   * @private
   */
  private validateBlockData(data: any): { valid: boolean; errors: string[] } {
    const errors: string[] = [];

    // Check required fields
    if (data.nonce === undefined) {
      errors.push('Missing required field: nonce');
    }

    if (data.confirmations === undefined) {
      errors.push('Missing required field: confirmations');
    }

    // Validate nonce (32-bit unsigned integer)
    if (data.nonce !== undefined) {
      if (!Number.isInteger(data.nonce) || data.nonce < 0 || data.nonce > 4294967295) {
        errors.push('Invalid nonce: must be a 32-bit unsigned integer');
      }
    }

    // Validate confirmations (positive integer)
    if (data.confirmations !== undefined) {
      if (!Number.isInteger(data.confirmations) || data.confirmations < 0) {
        errors.push('Invalid confirmations: must be a non-negative integer');
      }
    }

    return {
      valid: errors.length === 0,
      errors
    };
  }

  /**
   * Clean expired cache entries
   */
  cleanExpiredCache(): void {
    const now = Date.now();

    // Clean block data cache
    for (const [key, entry] of this.cache.entries()) {
      if (key.startsWith('block-') && now - entry.timestamp > this.blockDataCacheExpiry) {
        this.cache.delete(key);
      } else if (key.startsWith('confirmation-') && now - entry.timestamp > this.confirmationCacheExpiry) {
        this.cache.delete(key);
      }
    }
  }

  /**
   * Clear cache
   */
  clearCache(): void {
    this.cache.clear();
  }
}
