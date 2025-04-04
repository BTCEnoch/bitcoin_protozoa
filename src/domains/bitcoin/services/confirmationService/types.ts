/**
 * Types for Confirmation Service
 *
 * These types define the interfaces for the Bitcoin confirmation tracking service.
 * The service monitors confirmation counts for Bitcoin blocks and detects milestone events
 * for evolution mechanics.
 */
import { BlockService } from '../blockService';

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
}

/**
 * Confirmation tracker options interface
 */
export interface ConfirmationTrackerOptions {
  /** Block service instance */
  blockService: BlockService;
  /** Check interval in milliseconds (default: 60000ms = 1 minute) */
  checkInterval?: number;
  /** Custom milestone definitions */
  milestones?: Milestone[];
}

/**
 * Confirmation tracker event handler type
 */
export type ConfirmationEventHandler = (event: MilestoneEvent) => void;
