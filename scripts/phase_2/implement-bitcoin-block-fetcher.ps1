# Implement Bitcoin Block Fetcher Script
# This script implements the Bitcoin block fetcher for retrieving block data
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints
# API endpoints: Dev: https://ordinals.com/r/blockinfo/${blockNumber}, Prod: /r/blockinfo/${blockNumber}
# Caching: Block Data: 60000ms (1 minute), Confirmation: 5000ms (5 seconds)

Write-Host "Implementing Bitcoin Block Fetcher..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$servicesDir = "$bitcoinDomainDir\services"
$typesFile = "$bitcoinDomainDir\types.ts"
$constantsFile = "$bitcoinDomainDir\constants.ts"
$apiServiceFile = "$servicesDir\bitcoinApiService.ts"
$indexFile = "$servicesDir\index.ts"

# Check if directories exist, create if not
if (-not (Test-Path $bitcoinDomainDir)) {
    Write-Host "Creating Bitcoin domain directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $bitcoinDomainDir -Force | Out-Null
}

if (-not (Test-Path $servicesDir)) {
    Write-Host "Creating Bitcoin services directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $servicesDir -Force | Out-Null
}

# Create or update types.ts
Write-Host "Creating/Updating Bitcoin types in $typesFile..." -ForegroundColor Yellow

$typesContent = @"
/**
 * Bitcoin Domain Types
 *
 * This file contains type definitions for the Bitcoin domain.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 */

/**
 * Block Info
 *
 * Represents the minimal required data from a Bitcoin block.
 * We only extract and use the nonce and confirmations fields.
 */
export interface BlockInfo {
  /**
   * Block number (for reference only, not used for generation)
   */
  blockNumber: number;

  /**
   * Block nonce value - used for RNG seed
   */
  nonce: number;

  /**
   * Number of confirmations - used for evolution triggers
   */
  confirmations: number;
}

/**
 * Bitcoin API Service Interface
 *
 * Defines the interface for the Bitcoin API service.
 */
export interface BitcoinAPIServiceInterface {
  /**
   * Get block data by height
   *
   * @param height - The block height to fetch
   * @returns Promise resolving to the block info (nonce and confirmations only)
   */
  getBlockByHeight(height: number): Promise<BlockInfo>;

  /**
   * Get confirmation count for a block
   *
   * @param height - The block height to fetch confirmations for
   * @returns Promise resolving to the confirmation count
   */
  getConfirmationCount(height: number): Promise<number>;

  /**
   * Clear the cache
   */
  clearCache(): void;
}
"@

Set-Content -Path $typesFile -Value $typesContent

# Create or update constants.ts
Write-Host "Creating/Updating Bitcoin constants in $constantsFile..." -ForegroundColor Yellow

$constantsContent = @"
/**
 * Bitcoin Domain Constants
 *
 * This file contains constants for the Bitcoin domain.
 */

/**
 * Bitcoin API endpoints
 */
export const BITCOIN_API = {
  /**
   * Development endpoint for the Bitcoin API
   */
  DEV_ENDPOINT: 'https://ordinals.com/r/blockinfo',

  /**
   * Production endpoint for the Bitcoin API
   */
  PROD_ENDPOINT: '/r/blockinfo'
};

/**
 * Cache expiry times in milliseconds
 */
export const CACHE_EXPIRY = {
  /**
   * Block data cache expiry (1 minute)
   * This is the time that block data will be cached before being refreshed
   */
  BLOCK_DATA: 60000, // 60 seconds = 1 minute

  /**
   * Confirmation data cache expiry (5 seconds)
   * This is shorter because confirmations change more frequently
   */
  CONFIRMATION: 5000 // 5 seconds
};

/**
 * Confirmation thresholds for evolution triggers
 */
export const CONFIRMATION_THRESHOLDS = {
  /**
   * Threshold for minor evolution (10,000 confirmations)
   */
  MINOR: 10000,

  /**
   * Threshold for major evolution (100,000 confirmations)
   */
  MAJOR: 100000,

  /**
   * Threshold for legendary evolution (1,000,000 confirmations)
   */
  LEGENDARY: 1000000
};
"@

Set-Content -Path $constantsFile -Value $constantsContent

# Create or update bitcoinApiService.ts
Write-Host "Creating/Updating Bitcoin API service in $apiServiceFile..." -ForegroundColor Yellow

$apiServiceContent = @"
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
   * Get block data by height
   *
   * @param height - The block number to fetch
   * @returns Promise resolving to the block info (nonce and confirmations only)
   */
  async getBlockByHeight(height: number): Promise<BlockInfo> {
    const cacheKey = `block-\${height}`;

    // Check cache first
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.blockDataCacheExpiry) {
      return cached.data;
    }

    try {
      // Use appropriate endpoint based on environment
      const endpoint = process.env.NODE_ENV === 'development'
        ? `\${this.devEndpoint}/\${height}`
        : `\${this.prodEndpoint}/\${height}`;

      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error \${response.status}`);
      }

      const blockData = await response.json();

      // Validate the data
      const validation = this.validateBlockData(blockData);
      if (!validation.valid) {
        throw new Error(`Invalid block data: \${validation.errors.join(', ')}`);
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
      console.error(`Failed to fetch block \${height}:`, error);
      throw new Error(`Failed to fetch block \${height}: \${error.message}`);
    }
  }

  /**
   * Get confirmation count for a block
   *
   * @param height - The block number to fetch confirmations for
   * @returns Promise resolving to the confirmation count
   */
  async getConfirmationCount(height: number): Promise<number> {
    const cacheKey = `confirmation-\${height}`;

    // Check cache first (shorter expiry for confirmations)
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.confirmationCacheExpiry) {
      return cached.data;
    }

    try {
      // Use appropriate endpoint based on environment
      const endpoint = process.env.NODE_ENV === 'development'
        ? `\${this.devEndpoint}/\${height}`
        : `\${this.prodEndpoint}/\${height}`;

      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error \${response.status}`);
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
      console.error(`Failed to fetch confirmations for block \${height}:`, error);
      throw new Error(`Failed to fetch confirmations for block \${height}: \${error.message}`);
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
"@

Set-Content -Path $apiServiceFile -Value $apiServiceContent

# Create or update index.ts
Write-Host "Creating/Updating Bitcoin services index in $indexFile..." -ForegroundColor Yellow

$indexContent = @"
/**
 * Bitcoin Services Index
 *
 * This file exports all Bitcoin services.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 */

export * from './bitcoinApiService';
"@

# Write the index file content
Set-Content -Path $indexFile -Value $indexContent

# Print completion message
Write-Host "Bitcoin Block Fetcher implementation complete!" -ForegroundColor Green
Write-Host "IMPORTANT: This implementation ONLY extracts and uses the nonce and confirmations fields from Bitcoin blocks." -ForegroundColor Yellow
