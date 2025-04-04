/**
 * Bitcoin Block Service
 *
 * This service is responsible for processing Bitcoin block data,
 * including parsing, validation, and confirmation tracking.
 */

import { BitcoinBlockData } from '../types';
import { BitcoinApiService } from './bitcoinApiService';
import { createRNG } from '../utils/rngUtils';

/**
 * Block service interface
 */
export interface BlockServiceInterface {
  /**
   * Get block data by height
   *
   * @param blockHeight - The block number to fetch
   * @returns Promise resolving to the block data
   */
  getBlockByHeight(blockHeight: number): Promise<BitcoinBlockData>;

  /**
   * Get block data by hash
   *
   * @param blockHash - The block hash to fetch
   * @returns Promise resolving to the block data
   */
  getBlockByHash(blockHash: string): Promise<BitcoinBlockData>;

  /**
   * Get the latest block data
   *
   * @returns Promise resolving to the latest block data
   */
  getLatestBlock(): Promise<BitcoinBlockData>;

  /**
   * Extract nonce from block data
   *
   * @param blockData - The block data
   * @returns The nonce value
   */
  extractNonce(blockData: BitcoinBlockData): number;

  /**
   * Get confirmation count for a block
   *
   * @param blockData - The block data
   * @returns The confirmation count
   */
  getConfirmations(blockData: BitcoinBlockData): number;

  /**
   * Create a random number generator from block data
   *
   * @param blockData - The block data
   * @returns A function that returns a random number between 0 and 1
   */
  createRNGFromBlock(blockData: BitcoinBlockData): () => number;

  /**
   * Validate block data
   *
   * @param blockData - The block data to validate
   * @returns True if the block data is valid, false otherwise
   */
  validateBlockData(blockData: BitcoinBlockData): boolean;
}

/**
 * Implementation of the Block service
 */
export class BlockService implements BlockServiceInterface {
  private apiService: BitcoinApiService;
  private fallbackData: Map<number, BitcoinBlockData> = new Map();

  /**
   * Creates a new BlockService
   *
   * @param apiService - The Bitcoin API service to use
   */
  constructor(apiService: BitcoinApiService) {
    this.apiService = apiService;
    this.loadFallbackData();
  }

  /**
   * Get block data by height
   *
   * @param blockHeight - The block number to fetch
   * @returns Promise resolving to the block data
   */
  async getBlockByHeight(blockHeight: number): Promise<BitcoinBlockData> {
    try {
      const blockData = await this.apiService.fetchBlockByHeight(blockHeight);

      if (this.validateBlockData(blockData)) {
        // Store valid block data as fallback
        this.fallbackData.set(blockHeight, blockData);
        this.saveFallbackData();

        return blockData;
      } else {
        throw new Error('Invalid block data received');
      }
    } catch (error) {
      // Try to use fallback data
      const fallbackData = this.fallbackData.get(blockHeight);

      if (fallbackData) {
        console.warn(`Using fallback data for block ${blockHeight}`);
        return fallbackData;
      }

      throw error;
    }
  }

  /**
   * Get block data by hash
   *
   * @param blockHash - The block hash to fetch
   * @returns Promise resolving to the block data
   */
  async getBlockByHash(blockHash: string): Promise<BitcoinBlockData> {
    try {
      const blockData = await this.apiService.fetchBlockByHash(blockHash);

      if (this.validateBlockData(blockData)) {
        // Store valid block data as fallback
        this.fallbackData.set(blockData.height, blockData);
        this.saveFallbackData();

        return blockData;
      } else {
        throw new Error('Invalid block data received');
      }
    } catch (error) {
      // Try to find fallback data by iterating through the map
      for (const [_, data] of this.fallbackData) {
        if (data.hash === blockHash) {
          console.warn(`Using fallback data for block hash ${blockHash}`);
          return data;
        }
      }

      throw error;
    }
  }

  /**
   * Get the latest block data
   *
   * @returns Promise resolving to the latest block data
   */
  async getLatestBlock(): Promise<BitcoinBlockData> {
    try {
      const blockData = await this.apiService.fetchLatestBlock();

      if (this.validateBlockData(blockData)) {
        // Store valid block data as fallback
        this.fallbackData.set(blockData.height, blockData);
        this.saveFallbackData();

        return blockData;
      } else {
        throw new Error('Invalid block data received');
      }
    } catch (error) {
      // Try to use the highest block height from fallback data
      let highestBlock: BitcoinBlockData | null = null;
      let highestHeight = -1;

      for (const [height, data] of this.fallbackData) {
        if (height > highestHeight) {
          highestHeight = height;
          highestBlock = data;
        }
      }

      if (highestBlock) {
        console.warn(Using fallback data for latest block);
        return highestBlock;
      }

      throw error;
    }
  }

  /**
   * Extract nonce from block data
   *
   * @param blockData - The block data
   * @returns The nonce value
   */
  extractNonce(blockData: BitcoinBlockData): number {
    return blockData.nonce || 0;
  }

  /**
   * Get confirmation count for a block
   *
   * @param blockData - The block data
   * @returns The confirmation count
   */
  getConfirmations(blockData: BitcoinBlockData): number {
    return blockData.confirmations || 0;
  }

  /**
   * Create a random number generator from block data
   *
   * @param blockData - The block data
   * @returns A function that returns a random number between 0 and 1
   */
  createRNGFromBlock(blockData: BitcoinBlockData): () => number {
    const nonce = this.extractNonce(blockData);
    return createRNG(nonce);
  }

  /**
   * Validate block data
   *
   * @param blockData - The block data to validate
   * @returns True if the block data is valid, false otherwise
   */
  validateBlockData(blockData: BitcoinBlockData): boolean {
    // Check if required fields are present
    if (!blockData) return false;
    if (typeof blockData.hash !== 'string' || !blockData.hash) return false;
    if (typeof blockData.height !== 'number' || blockData.height < 0) return false;
    if (typeof blockData.timestamp !== 'number' || blockData.timestamp <= 0) return false;

    // Nonce can be 0, so just check if it's a number
    if (typeof blockData.nonce !== 'number') return false;

    // Additional validation logic can be added here

    return true;
  }

  /**
   * Load fallback data from localStorage
   */
  private loadFallbackData(): void {
    try {
      const storedData = localStorage.getItem('bitcoin_fallback_data');

      if (storedData) {
        const parsedData = JSON.parse(storedData);

        for (const [heightStr, data] of Object.entries(parsedData)) {
          const height = parseInt(heightStr, 10);
          this.fallbackData.set(height, data as BitcoinBlockData);
        }

        console.log(Loaded fallback data for \ blocks);
      }
    } catch (error) {
      console.error('Failed to load fallback data:', error);
    }
  }

  /**
   * Save fallback data to localStorage
   */
  private saveFallbackData(): void {
    try {
      const dataToStore: Record<number, BitcoinBlockData> = {};

      for (const [height, data] of this.fallbackData) {
        dataToStore[height] = data;
      }

      localStorage.setItem('bitcoin_fallback_data', JSON.stringify(dataToStore));
    } catch (error) {
      console.error('Failed to save fallback data:', error);
    }
  }

  /**
   * Clear fallback data
   */
  clearFallbackData(): void {
    this.fallbackData.clear();
    localStorage.removeItem('bitcoin_fallback_data');
  }
}
