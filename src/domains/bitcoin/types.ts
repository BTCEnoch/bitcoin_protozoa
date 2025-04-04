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
