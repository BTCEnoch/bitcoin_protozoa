/**
 * Confirmation Service
 *
 * Service for tracking Bitcoin block confirmations and detecting milestone events.
 * This service monitors confirmation counts for Bitcoin blocks and triggers
 * events when specific confirmation milestones are reached.
 *
 * Features:
 * - Periodic confirmation checking
 * - Milestone detection
 * - Event-based notification system
 * - Configurable milestones and check intervals
 */
import { BlockService } from '../blockService';
import { ConfirmationEventHandler, ConfirmationTrackerOptions, Milestone, MilestoneEvent } from './types';

/**
 * Confirmation Tracker class
 * Tracks confirmation counts and detects milestone events
 */
export class ConfirmationTracker {
  /** Block service for fetching confirmation data */
  private blockService: BlockService;

  /** Check interval in milliseconds */
  private checkInterval: number;

  /** Milestone definitions */
  private milestones: Milestone[];

  /** Map of tracked blocks */
  private trackedBlocks: Map<number, number> = new Map();

  /** Map of last milestone reached for each block */
  private lastMilestones: Map<number, number> = new Map();

  /** Interval ID for periodic checking */
  private checkIntervalId: NodeJS.Timeout | null = null;

  /** Event handlers for milestone events */
  private eventHandlers: ConfirmationEventHandler[] = [];

  /**
   * Constructor
   * @param options - Service configuration options
   */
  constructor(options: ConfirmationTrackerOptions) {
    this.blockService = options.blockService;
    this.checkInterval = options.checkInterval ?? 60000; // 1 minute default

    // Set default milestones or use provided ones
    this.milestones = options.milestones ?? [
      { threshold: 10000, chance: 0.01, rarities: ['common', 'uncommon', 'rare', 'epic', 'legendary', 'mythic'] },
      { threshold: 50000, chance: 0.05, rarities: ['uncommon', 'rare', 'epic', 'legendary', 'mythic'] },
      { threshold: 100000, chance: 0.1, rarities: ['rare', 'epic', 'legendary', 'mythic'] },
      { threshold: 250000, chance: 0.25, rarities: ['epic', 'legendary', 'mythic'] },
      { threshold: 500000, chance: 0.5, rarities: ['legendary', 'mythic'] },
      { threshold: 1000000, chance: 1.0, rarities: ['mythic'] }
    ];

    // Sort milestones by threshold (descending) for efficient checking
    this.milestones.sort((a, b) => b.threshold - a.threshold);
  }

  /**
   * Start tracking a block
   * @param blockNumber - The block number to track
   */
  trackBlock(blockNumber: number): void {
    this.trackedBlocks.set(blockNumber, 0);
    this.lastMilestones.set(blockNumber, 0);

    // Start periodic checking if not already started
    this.startChecking();

    // Do an immediate check
    this.checkConfirmations();
  }

  /**
   * Stop tracking a block
   * @param blockNumber - The block number to stop tracking
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
   * Add an event handler for milestone events
   * @param handler - The event handler function
   */
  addEventListener(handler: ConfirmationEventHandler): void {
    this.eventHandlers.push(handler);
  }

  /**
   * Remove an event handler
   * @param handler - The event handler function to remove
   */
  removeEventListener(handler: ConfirmationEventHandler): void {
    this.eventHandlers = this.eventHandlers.filter(h => h !== handler);
  }

  /**
   * Start periodic confirmation checking
   */
  startChecking(): void {
    if (this.checkIntervalId === null) {
      this.checkIntervalId = setInterval(() => {
        this.checkConfirmations();
      }, this.checkInterval);
    }
  }

  /**
   * Stop periodic confirmation checking
   */
  stopChecking(): void {
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

    // Check each tracked block
    for (const [blockNumber] of this.trackedBlocks) {
      try {
        // Fetch current confirmation count
        const confirmations = await this.blockService.getConfirmationCount(blockNumber);

        // Update tracked confirmation count
        this.trackedBlocks.set(blockNumber, confirmations);

        // Check for milestone events
        this.checkMilestones(blockNumber, confirmations);
      } catch (error) {
        console.error(`Failed to check confirmations for block ${blockNumber}:`, error);
      }
    }
  }

  /**
   * Check if a block has reached any milestones
   * @param blockNumber - The block number to check
   * @param confirmations - The current confirmation count
   */
  private checkMilestones(blockNumber: number, confirmations: number): void {
    // Get the last milestone reached for this block
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
          timestamp: Date.now()
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
   * @param event - The milestone event
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
   * @returns Map of block numbers to confirmation counts
   */
  getTrackedBlocks(): Map<number, number> {
    return new Map(this.trackedBlocks);
  }

  /**
   * Get the last milestone reached for a block
   * @param blockNumber - The block number
   * @returns The last milestone reached or 0 if none
   */
  getLastMilestone(blockNumber: number): number {
    return this.lastMilestones.get(blockNumber) ?? 0;
  }

  /**
   * Get the milestone definitions
   * @returns Array of milestone definitions
   */
  getMilestones(): Milestone[] {
    return [...this.milestones];
  }
}

export * from './types';
