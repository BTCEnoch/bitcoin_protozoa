/**
 * Types for BlockDataVisualizer component
 * 
 * This component visualizes Bitcoin block data.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 */
import { MilestoneEvent } from '../../services/confirmationService';

/**
 * BlockDataVisualizer Props
 */
export interface BlockDataVisualizerProps {
  /** Initial block number to fetch (optional) */
  initialBlockNumber?: string;
}

/**
 * Block data interface
 */
export interface BlockData {
  /** Block number */
  blockNumber: number;
  /** Block nonce */
  nonce: number;
  /** Block confirmations */
  confirmations: number;
}

/**
 * Particle interface for visualization
 */
export interface Particle {
  /** Particle ID */
  id: number;
  /** X position (percentage) */
  x: string;
  /** Y position (percentage) */
  y: string;
  /** Particle size */
  size: string;
  /** Particle color */
  color: string;
}
