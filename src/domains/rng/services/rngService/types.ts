/**
 * Types for RNG Service
 *
 * These types define the interfaces for the Random Number Generation system.
 * The RNG system is responsible for generating deterministic random numbers
 * based on Bitcoin block nonce values.
 */

/**
 * RNG function type - represents a random number generator function
 * Returns a number between 0 and 1
 */
export type RNGFunction = () => number;

/**
 * RNG stream type - represents a named RNG stream
 */
export interface RNGStream {
  /** Stream name/purpose */
  name: string;
  /** RNG function for this stream */
  rng: RNGFunction;
}

/**
 * RNG system interface - manages multiple RNG streams
 */
export interface RNGSystemInterface {
  /** Get an existing RNG stream or create a new one */
  getStream(name: string): RNGFunction;
  /** Create a new RNG stream with a specific seed */
  createStream(name: string, seed: number): RNGFunction;
  /** Remove an RNG stream */
  removeStream(name: string): void;
  /** Set the master seed for the RNG system */
  setMasterSeed(seed: number): void;
  /** Get the current master seed */
  getMasterSeed(): number;
  /** Clear all streams */
  clearStreams(): void;
}

/**
 * RNG service options interface
 */
export interface RNGServiceOptions {
  /** Initial seed value */
  initialSeed?: number;
  /** Whether to cache RNG streams */
  cacheStreams?: boolean;
  /** Maximum number of streams to cache */
  maxStreamCache?: number;
}
