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
        console.error(`Failed to check confirmations for block ${blockNumber}:`, error);
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
