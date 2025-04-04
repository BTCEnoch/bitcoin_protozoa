/**
 * Chain RNG Service
 *
 * Service for creating and managing chains of related random number generators.
 * This service creates sequences of RNG functions that are deterministically
 * derived from a single seed, allowing for reproducible sequences of random values.
 *
 * Features:
 * - Create chains of related RNG functions
 * - Deterministic sequence generation
 * - Named chains for different purposes
 * - Chain position tracking and reset
 */
import { mulberry32 } from '../../utils/mulberry32';
import { RNGFunction } from '../rngService/types';
import { ChainRNG, ChainRNGServiceOptions } from './types';

/**
 * Chain RNG implementation
 */
class ChainRNGImpl implements ChainRNG {
  /** Chain name/purpose */
  public name: string;

  /** Array of RNG functions in the chain */
  public generators: RNGFunction[];

  /** Current position in the chain */
  private position: number = 0;

  /**
   * Constructor
   * @param name - Chain name/purpose
   * @param generators - Array of RNG functions
   */
  constructor(name: string, generators: RNGFunction[]) {
    this.name = name;
    this.generators = generators;
  }

  /**
   * Get the next RNG in the chain
   * @returns The next RNG function
   */
  next(): RNGFunction {
    if (this.position >= this.generators.length) {
      this.position = 0;
    }
    return this.generators[this.position++];
  }

  /**
   * Reset the chain to the beginning
   */
  reset(): void {
    this.position = 0;
  }

  /**
   * Get the current position in the chain
   * @returns The current position
   */
  getPosition(): number {
    return this.position;
  }
}

/**
 * Chain RNG Service class
 * Manages chains of related RNG functions
 */
export class ChainRNGService {
  /** Map of RNG chains by name */
  private chains: Map<string, ChainRNG> = new Map();

  /** Default chain length */
  private defaultChainLength: number;

  /**
   * Constructor
   * @param options - Service configuration options
   */
  constructor(options?: ChainRNGServiceOptions) {
    this.defaultChainLength = options?.defaultChainLength ?? 10;
  }

  /**
   * Create a new RNG chain
   * @param name - Chain name/purpose
   * @param seed - Initial seed value
   * @param length - Chain length (number of generators)
   * @returns The created chain
   */
  createChain(name: string, seed: number, length: number = this.defaultChainLength): ChainRNG {
    const generators: RNGFunction[] = [];
    let currentSeed = seed;

    // Create a chain of RNG generators
    for (let i = 0; i < length; i++) {
      const generator = mulberry32(currentSeed);
      generators.push(generator);

      // Use the first random number as the seed for the next generator
      currentSeed = Math.floor(generator() * 4294967296);
    }

    const chain = new ChainRNGImpl(name, generators);
    this.chains.set(name, chain);

    return chain;
  }

  /**
   * Get an existing chain by name
   * @param name - Chain name/purpose
   * @returns The chain or undefined if not found
   */
  getChain(name: string): ChainRNG | undefined {
    return this.chains.get(name);
  }

  /**
   * Get an existing chain or create a new one
   * @param name - Chain name/purpose
   * @param seed - Seed to use if creating a new chain
   * @param length - Chain length if creating a new chain
   * @returns The chain
   */
  getOrCreateChain(name: string, seed: number, length: number = this.defaultChainLength): ChainRNG {
    const existing = this.getChain(name);
    if (existing) {
      return existing;
    }
    return this.createChain(name, seed, length);
  }

  /**
   * Remove a chain
   * @param name - Chain name/purpose
   */
  removeChain(name: string): void {
    this.chains.delete(name);
  }

  /**
   * Clear all chains
   */
  clearChains(): void {
    this.chains.clear();
  }

  /**
   * Get all chain names
   * @returns Array of chain names
   */
  getChainNames(): string[] {
    return Array.from(this.chains.keys());
  }
}

export * from './types';
