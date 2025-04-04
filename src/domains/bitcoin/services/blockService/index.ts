/**
 * BlockService
 *
 * Service for fetching Bitcoin block data from the ordinals.com API.
 * This service extracts ONLY the nonce and confirmations fields from the block data,
 * as per project requirements.
 *
 * Features:
 * - Fetches block data from ordinals.com API
 * - Extracts only nonce and confirmations fields
 * - Implements caching with different expiry times for block data and confirmations
 * - Handles API errors gracefully
 * - Validates block data
 */
import { BlockInfo, BlockServiceOptions, CacheEntry, Environment } from './types';

/**
 * BlockService class
 * Handles fetching and caching of Bitcoin block data
 */
export class BlockService {
  /** Cache for block data */
  private cache: Map<string, CacheEntry<BlockInfo>> = new Map();

  /** Cache expiry time for block data in milliseconds (default: 60000ms = 1 minute) */
  private blockCacheExpiry: number;

  /** Cache expiry time for confirmation data in milliseconds (default: 5000ms = 5 seconds) */
  private confirmationCacheExpiry: number;

  /** Development API endpoint */
  private devEndpoint: string;

  /** Production API endpoint */
  private prodEndpoint: string;

  /** Current environment */
  private environment: Environment;

  /**
   * Constructor
   * @param options - Service configuration options
   */
  constructor(options?: BlockServiceOptions) {
    // Set default values or use provided options
    this.blockCacheExpiry = options?.blockCacheExpiry ?? 60000; // 1 minute
    this.confirmationCacheExpiry = options?.confirmationCacheExpiry ?? 5000; // 5 seconds
    this.devEndpoint = options?.devEndpoint ?? 'https://ordinals.com/r/blockinfo';
    this.prodEndpoint = options?.prodEndpoint ?? '/r/blockinfo';

    // Determine environment
    this.environment = process.env.NODE_ENV === 'production' ? 'production' : 'development';
  }

  /**
   * Get block data by height/number
   * @param blockNumber - The block height/number to fetch
   * @returns Promise resolving to block info
   */
  async getBlockByHeight(blockNumber: number): Promise<BlockInfo> {
    const cacheKey = `block-${blockNumber}`;

    // Check cache first
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.blockCacheExpiry) {
      return cached.data;
    }

    try {
      // Use appropriate endpoint based on environment
      const endpoint = this.getEndpoint(blockNumber);

      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const blockData = await response.json();

      // Validate the data
      this.validateBlockData(blockData);

      // Extract only the needed data
      const blockInfo: BlockInfo = {
        blockNumber,
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
      console.error(`Failed to fetch block ${blockNumber}:`, error);
      throw new Error(`Failed to fetch block ${blockNumber}: ${error instanceof Error ? error.message : String(error)}`);
    }
  }

  /**
   * Get confirmation count for a block
   * @param blockNumber - The block height/number to check
   * @returns Promise resolving to confirmation count
   */
  async getConfirmationCount(blockNumber: number): Promise<number> {
    const cacheKey = `confirmation-${blockNumber}`;

    // Check cache first (shorter expiry for confirmations)
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.confirmationCacheExpiry) {
      return cached.data.confirmations;
    }

    try {
      // Fetch the full block data
      const blockInfo = await this.getBlockByHeight(blockNumber);

      // Cache the confirmation count separately with shorter expiry
      this.cache.set(cacheKey, {
        data: blockInfo,
        timestamp: Date.now()
      });

      return blockInfo.confirmations;
    } catch (error) {
      console.error(`Failed to fetch confirmations for block ${blockNumber}:`, error);
      throw new Error(`Failed to fetch confirmations for block ${blockNumber}: ${error instanceof Error ? error.message : String(error)}`);
    }
  }

  /**
   * Clear the cache
   */
  clearCache(): void {
    this.cache.clear();
  }

  /**
   * Remove expired items from the cache
   */
  cleanExpiredCache(): void {
    const now = Date.now();
    for (const [key, value] of this.cache.entries()) {
      const isConfirmationCache = key.startsWith('confirmation-');
      const expiry = isConfirmationCache ? this.confirmationCacheExpiry : this.blockCacheExpiry;

      if (now - value.timestamp > expiry) {
        this.cache.delete(key);
      }
    }
  }

  /**
   * Get the appropriate API endpoint based on environment
   * @param blockNumber - The block height/number
   * @returns The API endpoint URL
   */
  private getEndpoint(blockNumber: number): string {
    return this.environment === 'development'
      ? `${this.devEndpoint}/${blockNumber}`
      : `${this.prodEndpoint}/${blockNumber}`;
  }

  /**
   * Validate block data from the API
   * @param data - The block data to validate
   * @throws Error if validation fails
   */
  private validateBlockData(data: any): void {
    // Check if data exists
    if (!data) {
      throw new Error('Invalid block data: empty response');
    }

    // Check if nonce exists and is a number
    if (typeof data.nonce !== 'number') {
      throw new Error('Invalid block data: nonce is missing or not a number');
    }

    // Check if confirmations exists and is a number
    if (typeof data.confirmations !== 'number') {
      throw new Error('Invalid block data: confirmations is missing or not a number');
    }
  }
}

export * from './types';
