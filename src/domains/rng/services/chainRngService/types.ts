/**
 * Types for Chain RNG Service
 *
 * These types define the interfaces for the Chain RNG system.
 * The Chain RNG system creates sequences of related random number generators
 * that are deterministically derived from a single seed.
 */
import { RNGFunction } from '../rngService/types';

/**
 * Chain RNG service options interface
 */
export interface ChainRNGServiceOptions {
  /** Initial seed value */
  initialSeed?: number;
  /** Default chain length */
  defaultChainLength?: number;
}

/**
 * Chain RNG interface
 */
export interface ChainRNG {
  /** Chain name/purpose */
  name: string;
  /** Array of RNG functions in the chain */
  generators: RNGFunction[];
  /** Get the next RNG in the chain */
  next(): RNGFunction;
  /** Reset the chain to the beginning */
  reset(): void;
  /** Get the current position in the chain */
  getPosition(): number;
}
