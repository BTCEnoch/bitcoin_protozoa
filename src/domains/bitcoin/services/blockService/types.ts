/**
 * Types for BlockService
 *
 * These types define the interfaces for the Bitcoin block data service.
 * The service fetches block data from the ordinals.com API and extracts
 * only the nonce and confirmations fields as per project requirements.
 */

/**
 * Bitcoin block data interface
 * Contains only the fields we need from the Bitcoin block
 */
export interface BlockInfo {
  /** Block number/height */
  blockNumber: number;
  /** Block nonce (used for RNG seeding) */
  nonce: number;
  /** Number of confirmations (used for evolution) */
  confirmations: number;
}

/**
 * Cache entry interface
 */
export interface CacheEntry<T> {
  /** Cached data */
  data: T;
  /** Timestamp when the data was cached */
  timestamp: number;
}

/**
 * BlockService options interface
 */
export interface BlockServiceOptions {
  /** Cache expiry time for block data in milliseconds (default: 60000ms = 1 minute) */
  blockCacheExpiry?: number;
  /** Cache expiry time for confirmation data in milliseconds (default: 5000ms = 5 seconds) */
  confirmationCacheExpiry?: number;
  /** Development API endpoint (default: 'https://ordinals.com/r/blockinfo') */
  devEndpoint?: string;
  /** Production API endpoint (default: '/r/blockinfo') */
  prodEndpoint?: string;
}

/**
 * Environment type
 */
export type Environment = 'development' | 'production';
