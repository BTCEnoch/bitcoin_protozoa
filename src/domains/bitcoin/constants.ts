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
