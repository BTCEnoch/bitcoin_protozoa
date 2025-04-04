# Implement Bitcoin API Service Script
# This script implements the Bitcoin API service for fetching block data

Write-Host "Implementing Bitcoin API Service..." -ForegroundColor Cyan
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
 */

/**
 * Bitcoin Block Data
 *
 * Represents data from a Bitcoin block.
 */
export interface BitcoinBlockData {
  /**
   * Block hash
   */
  hash: string;

  /**
   * Block height (block number)
   */
  height: number;

  /**
   * Block timestamp
   */
  timestamp: number;

  /**
   * Block nonce value
   */
  nonce: number;

  /**
   * Number of confirmations
   */
  confirmations: number;

  /**
   * Block difficulty
   */
  difficulty: number;

  /**
   * Block size in bytes
   */
  size: number;

  /**
   * Block weight
   */
  weight: number;

  /**
   * Block version
   */
  version: number;

  /**
   * Merkle root
   */
  merkleroot: string;
}

/**
 * Bitcoin API Response
 *
 * Represents the response from the Bitcoin API.
 */
export interface BitcoinApiResponse {
  /**
   * Status of the response
   */
  status: 'success' | 'error';

  /**
   * Block data if status is success
   */
  data?: BitcoinBlockData;

  /**
   * Error message if status is error
   */
  error?: string;
}

/**
 * Bitcoin API Service Interface
 *
 * Defines the interface for the Bitcoin API service.
 */
export interface BitcoinApiServiceInterface {
  /**
   * Fetch block data for a specific block height
   *
   * @param blockHeight - The block number to fetch
   * @returns Promise resolving to the block data
   */
  fetchBlockByHeight(blockHeight: number): Promise<BitcoinBlockData>;

  /**
   * Fetch block data for a specific block hash
   *
   * @param blockHash - The block hash to fetch
   * @returns Promise resolving to the block data
   */
  fetchBlockByHash(blockHash: string): Promise<BitcoinBlockData>;

  /**
   * Fetch the latest block data
   *
   * @returns Promise resolving to the latest block data
   */
  fetchLatestBlock(): Promise<BitcoinBlockData>;
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
   * Base URL for the Bitcoin API
   */
  BASE_URL: 'https://ordinals.com/r/blockinfo',

  /**
   * Endpoint for fetching block by height
   */
  BLOCK_BY_HEIGHT: '/height',

  /**
   * Endpoint for fetching block by hash
   */
  BLOCK_BY_HASH: '/hash',

  /**
   * Endpoint for fetching the latest block
   */
  LATEST_BLOCK: '/latest'
};

/**
 * Bitcoin API request timeout in milliseconds
 */
export const API_TIMEOUT = 10000;

/**
 * Maximum number of API request retries
 */
export const MAX_RETRIES = 3;

/**
 * Delay between retries in milliseconds
 */
export const RETRY_DELAY = 1000;

/**
 * Cache duration in milliseconds (1 hour)
 */
export const CACHE_DURATION = 60 * 60 * 1000;
"@

Set-Content -Path $constantsFile -Value $constantsContent

# Create or update bitcoinApiService.ts
Write-Host "Creating/Updating Bitcoin API service in $apiServiceFile..." -ForegroundColor Yellow

$apiServiceContent = @"
/**
 * Bitcoin API Service
 *
 * This service is responsible for fetching Bitcoin block data from the API.
 */

import { BitcoinBlockData, BitcoinApiResponse, BitcoinApiServiceInterface } from '../types';
import { BITCOIN_API, API_TIMEOUT, MAX_RETRIES, RETRY_DELAY, CACHE_DURATION } from '../constants';

/**
 * Cache entry for block data
 */
interface CacheEntry {
  data: BitcoinBlockData;
  timestamp: number;
}

/**
 * Implementation of the Bitcoin API service
 */
export class BitcoinApiService implements BitcoinApiServiceInterface {
  private baseUrl: string;
  private cache: Map<string, CacheEntry> = new Map();

  /**
   * Creates a new BitcoinApiService
   *
   * @param baseUrl - Base URL for the Bitcoin API (optional, defaults to BITCOIN_API.BASE_URL)
   */
  constructor(baseUrl: string = BITCOIN_API.BASE_URL) {
    this.baseUrl = baseUrl;
  }

  /**
   * Fetch block data for a specific block height
   *
   * @param blockHeight - The block number to fetch
   * @returns Promise resolving to the block data
   * @throws Error if the API request fails
   */
  async fetchBlockByHeight(blockHeight: number): Promise<BitcoinBlockData> {
    const cacheKey = `height-\${blockHeight}`;

    // Check cache first
    const cachedData = this.getCachedData(cacheKey);
    if (cachedData) {
      return cachedData;
    }

    const url = `\${this.baseUrl}\${BITCOIN_API.BLOCK_BY_HEIGHT}/\${blockHeight}`;
    const data = await this.fetchWithRetry(url);

    // Cache the result
    this.cacheData(cacheKey, data);

    return data;
  }

  /**
   * Fetch block data for a specific block hash
   *
   * @param blockHash - The block hash to fetch
   * @returns Promise resolving to the block data
   * @throws Error if the API request fails
   */
  async fetchBlockByHash(blockHash: string): Promise<BitcoinBlockData> {
    const cacheKey = `hash-\${blockHash}`;

    // Check cache first
    const cachedData = this.getCachedData(cacheKey);
    if (cachedData) {
      return cachedData;
    }

    const url = `\${this.baseUrl}\${BITCOIN_API.BLOCK_BY_HASH}/\${blockHash}`;
    const data = await this.fetchWithRetry(url);

    // Cache the result
    this.cacheData(cacheKey, data);

    return data;
  }

  /**
   * Fetch the latest block data
   *
   * @returns Promise resolving to the latest block data
   * @throws Error if the API request fails
   */
  async fetchLatestBlock(): Promise<BitcoinBlockData> {
    // Don't cache the latest block
    const url = `\${this.baseUrl}\${BITCOIN_API.LATEST_BLOCK}`;
    return await this.fetchWithRetry(url);
  }

  /**
   * Fetch data from the API with retry logic
   *
   * @param url - The URL to fetch
   * @returns Promise resolving to the block data
   * @throws Error if all retries fail
   */
  private async fetchWithRetry(url: string): Promise<BitcoinBlockData> {
    let lastError: Error | null = null;

    for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
      try {
        const response = await this.fetchWithTimeout(url, API_TIMEOUT);

        if (!response.ok) {
          throw new Error(`HTTP error: \${response.status}`);
        }

        const apiResponse: BitcoinApiResponse = await response.json();

        if (apiResponse.status === 'error') {
          throw new Error(apiResponse.error || 'Unknown API error');
        }

        if (!apiResponse.data) {
          throw new Error('No data in API response');
        }

        return apiResponse.data;
      } catch (error) {
        lastError = error as Error;

        // Wait before retrying
        if (attempt < MAX_RETRIES - 1) {
          await new Promise(resolve => setTimeout(resolve, RETRY_DELAY));
        }
      }
    }

    throw lastError || new Error('Failed to fetch data from API');
  }

  /**
   * Fetch with timeout
   *
   * @param url - The URL to fetch
   * @param timeout - Timeout in milliseconds
   * @returns Promise resolving to the fetch response
   * @throws Error if the request times out
   */
  private async fetchWithTimeout(url: string, timeout: number): Promise<Response> {
    const controller = new AbortController();
    const id = setTimeout(() => controller.abort(), timeout);

    try {
      const response = await fetch(url, {
        signal: controller.signal
      });

      clearTimeout(id);
      return response;
    } catch (error) {
      clearTimeout(id);
      throw error;
    }
  }

  /**
   * Get cached data if it exists and is not expired
   *
   * @param key - Cache key
   * @returns Cached data or null if not found or expired
   */
  private getCachedData(key: string): BitcoinBlockData | null {
    const entry = this.cache.get(key);

    if (!entry) {
      return null;
    }

    const now = Date.now();

    if (now - entry.timestamp > CACHE_DURATION) {
      // Cache expired
      this.cache.delete(key);
      return null;
    }

    return entry.data;
  }

  /**
   * Cache block data
   *
   * @param key - Cache key
   * @param data - Block data to cache
   */
  private cacheData(key: string, data: BitcoinBlockData): void {
    this.cache.set(key, {
      data,
      timestamp: Date.now()
    });
  }

  /**
   * Clear the cache
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
 */

export * from './bitcoinApiService';
"@

Set-Content -Path $indexFile -Value $indexContent

Write-Host "Bitcoin API Service implementation complete!" -ForegroundColor Green
