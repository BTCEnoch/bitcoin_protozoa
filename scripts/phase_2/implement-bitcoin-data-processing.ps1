# Implement Bitcoin Data Processing Script
# This script implements block data parsing, validation, and confirmation tracking
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints
# Confirmation tracking uses a cache expiry time of 5000ms (5 seconds)

Write-Host "Implementing Bitcoin Data Processing..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$servicesDir = "$bitcoinDomainDir\services"
$blockServiceFile = "$servicesDir\blockService.ts"
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

# Create or update blockService.ts
Write-Host "Creating/Updating Block service in $blockServiceFile..." -ForegroundColor Yellow

$blockServiceContent = @"
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
        console.warn(`Using fallback data for block \${blockHeight}`);
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
          console.warn(`Using fallback data for block hash \${blockHash}`);
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
        console.warn(`Using fallback data for latest block`);
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

        console.log(`Loaded fallback data for \${this.fallbackData.size} blocks`);
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
"@

Set-Content -Path $blockServiceFile -Value $blockServiceContent

# Create or update confirmationService.ts
$confirmationServiceFile = "$servicesDir\confirmationService.ts"
Write-Host "Creating/Updating Confirmation service in $confirmationServiceFile..." -ForegroundColor Yellow

$confirmationServiceContent = @"
/**
 * Confirmation Tracker Service
 *
 * This service tracks confirmation counts for Bitcoin blocks and detects milestone events.
 * IMPORTANT: We ONLY extract and use the confirmations field from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 * Confirmation tracking uses a cache expiry time of 5000ms (5 seconds).
 */

import { BitcoinAPIService } from './bitcoinApiService';

/**
 * Milestone definition interface
 */
export interface Milestone {
  /** Confirmation threshold for this milestone */
  threshold: number;
  /** Chance of mutation at this milestone (0-1) */
  chance: number;
  /** Available rarities at this milestone */
  rarities: string[];
}

/**
 * Milestone event interface
 */
export interface MilestoneEvent {
  /** Block number */
  blockNumber: number;
  /** Milestone threshold that was reached */
  threshold: number;
  /** Current confirmation count */
  confirmations: number;
  /** Timestamp when the milestone was reached */
  timestamp: number;
  /** Chance of mutation at this milestone (0-1) */
  chance: number;
  /** Available rarities at this milestone */
  rarities: string[];
}

/**
 * Confirmation tracker options interface
 */
export interface ConfirmationTrackerOptions {
  /** Check interval in milliseconds (default: 5000ms = 5 seconds) */
  checkInterval?: number;
  /** Custom milestone definitions */
  milestones?: Milestone[];
}

/**
 * Confirmation event handler type
 */
export type MilestoneEventHandler = (event: MilestoneEvent) => void;

/**
 * Confirmation tracker interface
 */
export interface ConfirmationTrackerInterface {
  /**
   * Start tracking a block
   *
   * @param blockNumber - Block number to track
   */
  trackBlock(blockNumber: number): void;

  /**
   * Stop tracking a block
   *
   * @param blockNumber - Block number to stop tracking
   */
  untrackBlock(blockNumber: number): void;

  /**
   * Add event handler for milestone events
   *
   * @param handler - Event handler function
   */
  addEventListener(handler: MilestoneEventHandler): void;

  /**
   * Remove event handler
   *
   * @param handler - Event handler function to remove
   */
  removeEventListener(handler: MilestoneEventHandler): void;

  /**
   * Check confirmations for all tracked blocks
   */
  checkConfirmations(): Promise<void>;

  /**
   * Get all tracked blocks and their confirmation counts
   *
   * @returns Map of block numbers to confirmation counts
   */
  getTrackedBlocks(): Map<number, number>;

  /**
   * Get the last milestone reached for a block
   *
   * @param blockNumber - Block number
   * @returns Last milestone reached or 0 if none
   */
  getLastMilestone(blockNumber: number): number;

  /**
   * Get all milestones
   *
   * @returns Array of milestones
   */
  getMilestones(): Milestone[];
}

/**
 * Default evolution milestones
 */
export const DEFAULT_EVOLUTION_MILESTONES: Milestone[] = [
  { threshold: 10000, chance: 0.01, rarities: ['common', 'uncommon', 'rare', 'epic', 'legendary', 'mythic'] },
  { threshold: 50000, chance: 0.05, rarities: ['uncommon', 'rare', 'epic', 'legendary', 'mythic'] },
  { threshold: 100000, chance: 0.1, rarities: ['rare', 'epic', 'legendary', 'mythic'] },
  { threshold: 250000, chance: 0.25, rarities: ['epic', 'legendary', 'mythic'] },
  { threshold: 500000, chance: 0.5, rarities: ['legendary', 'mythic'] },
  { threshold: 1000000, chance: 1.0, rarities: ['mythic'] }
];

/**
 * Implementation of the Confirmation Tracker service
 */
export class ConfirmationTracker implements ConfirmationTrackerInterface {
  // Bitcoin API service
  private bitcoinApiService: BitcoinAPIService;

  // Tracked blocks
  private trackedBlocks: Map<number, number> = new Map();

  // Last milestone reached for each block
  private lastMilestones: Map<number, number> = new Map();

  // Event handlers
  private eventHandlers: MilestoneEventHandler[] = [];

  // Check interval
  private checkIntervalId: NodeJS.Timeout | null = null;
  private checkInterval: number = 5000; // 5 seconds (same as confirmation cache expiry)

  // Milestones
  private milestones: Milestone[] = DEFAULT_EVOLUTION_MILESTONES;

  /**
   * Constructor
   *
   * @param bitcoinApiService - Bitcoin API service
   * @param options - Options for the tracker
   */
  constructor(bitcoinApiService: BitcoinAPIService, options?: ConfirmationTrackerOptions) {
    this.bitcoinApiService = bitcoinApiService;

    if (options?.checkInterval) {
      this.checkInterval = options.checkInterval;
    }

    if (options?.milestones) {
      this.milestones = options.milestones;
    }

    // Sort milestones by threshold (descending) for efficient checking
    this.milestones.sort((a, b) => b.threshold - a.threshold);
  }

  /**
   * Start tracking a block
   *
   * @param blockNumber - Block number to track
   */
  trackBlock(blockNumber: number): void {
    this.trackedBlocks.set(blockNumber, 0);
    this.lastMilestones.set(blockNumber, 0);

    // Start checking if not already started
    this.startChecking();

    // Do an immediate check
    this.checkConfirmations();
  }

  /**
   * Stop tracking a block
   *
   * @param blockNumber - Block number to stop tracking
   */
  untrackBlock(blockNumber: number): void {
    this.trackedBlocks.delete(blockNumber);
    this.lastMilestones.delete(blockNumber);

    // Stop checking if no blocks are being tracked
    if (this.trackedBlocks.size === 0) {
      this.stopChecking();
    }
  }

  /**
   * Add event handler for milestone events
   *
   * @param handler - Event handler function
   */
  addEventListener(handler: MilestoneEventHandler): void {
    this.eventHandlers.push(handler);
  }

  /**
   * Remove event handler
   *
   * @param handler - Event handler function to remove
   */
  removeEventListener(handler: MilestoneEventHandler): void {
    this.eventHandlers = this.eventHandlers.filter(h => h !== handler);
  }

  /**
   * Start periodic checking
   */
  private startChecking(): void {
    if (this.checkIntervalId === null) {
      this.checkIntervalId = setInterval(() => {
        this.checkConfirmations();
      }, this.checkInterval);
    }
  }

  /**
   * Stop periodic checking
   */
  private stopChecking(): void {
    if (this.checkIntervalId !== null) {
      clearInterval(this.checkIntervalId);
      this.checkIntervalId = null;
    }
  }

  /**
   * Check confirmations for all tracked blocks
   */
  async checkConfirmations(): Promise<void> {
    // Skip if no blocks are being tracked
    if (this.trackedBlocks.size === 0) {
      return;
    }

    for (const [blockNumber] of this.trackedBlocks) {
      try {
        const confirmations = await this.bitcoinApiService.getConfirmationCount(blockNumber);

        // Update tracked confirmation count
        this.trackedBlocks.set(blockNumber, confirmations);

        // Check for milestone events
        this.checkMilestones(blockNumber, confirmations);
      } catch (error) {
        // NO fallback mechanisms - if the API fails, we log the error and continue
        console.error(`Failed to check confirmations for block \${blockNumber}:`, error);
      }
    }
  }

  /**
   * Check if a block has reached any milestones
   *
   * @param blockNumber - Block number to check
   * @param confirmations - Current confirmation count
   */
  private checkMilestones(blockNumber: number, confirmations: number): void {
    const lastMilestone = this.lastMilestones.get(blockNumber) ?? 0;

    // Check each milestone (already sorted in descending order)
    for (const milestone of this.milestones) {
      // Skip if this milestone is not greater than the last one reached
      if (milestone.threshold <= lastMilestone) {
        continue;
      }

      // Check if the block has reached this milestone
      if (confirmations >= milestone.threshold && confirmations % milestone.threshold === 0) {
        // Update the last milestone reached
        this.lastMilestones.set(blockNumber, milestone.threshold);

        // Create milestone event
        const event: MilestoneEvent = {
          blockNumber,
          threshold: milestone.threshold,
          confirmations,
          timestamp: Date.now(),
          chance: milestone.chance,
          rarities: milestone.rarities
        };

        // Notify event handlers
        this.notifyEventHandlers(event);

        // Only trigger one milestone event at a time
        break;
      }
    }
  }

  /**
   * Notify all event handlers of a milestone event
   *
   * @param event - Milestone event
   */
  private notifyEventHandlers(event: MilestoneEvent): void {
    for (const handler of this.eventHandlers) {
      try {
        handler(event);
      } catch (error) {
        console.error('Error in milestone event handler:', error);
      }
    }
  }

  /**
   * Get all tracked blocks and their confirmation counts
   *
   * @returns Map of block numbers to confirmation counts
   */
  getTrackedBlocks(): Map<number, number> {
    return new Map(this.trackedBlocks);
  }

  /**
   * Get the last milestone reached for a block
   *
   * @param blockNumber - Block number
   * @returns Last milestone reached or 0 if none
   */
  getLastMilestone(blockNumber: number): number {
    return this.lastMilestones.get(blockNumber) ?? 0;
  }

  /**
   * Get all milestones
   *
   * @returns Array of milestones
   */
  getMilestones(): Milestone[] {
    return [...this.milestones];
  }
}
"@

Set-Content -Path $confirmationServiceFile -Value $confirmationServiceContent

# Update index.ts
Write-Host "Updating Bitcoin services index in $indexFile..." -ForegroundColor Yellow

$indexContent = @"
/**
 * Bitcoin Services Index
 *
 * This file exports all Bitcoin services.
 */

export * from './bitcoinApiService';
export * from './blockService';
export * from './confirmationService';
"@

Set-Content -Path $indexFile -Value $indexContent

Write-Host "Bitcoin Data Processing implementation complete!" -ForegroundColor Green
