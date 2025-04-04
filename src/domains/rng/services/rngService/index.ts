/**
 * RNG Service
 *
 * Service for managing random number generation based on Bitcoin block nonce.
 * This service implements the Mulberry32 algorithm for deterministic RNG and
 * provides purpose-specific RNG streams for different aspects of the application.
 *
 * Features:
 * - Deterministic RNG using Mulberry32 algorithm
 * - Purpose-specific RNG streams
 * - Seeding from Bitcoin block nonce
 * - Stream management (create, get, remove)
 * - LRU cache for streams
 */
import { mulberry32 } from '../../utils/mulberry32';
import { RNGFunction, RNGServiceOptions, RNGStream, RNGSystemInterface } from './types';

/**
 * RNG Service class
 * Manages random number generation for the application
 */
export class RNGService implements RNGSystemInterface {
  /** Map of RNG streams by name */
  private streams: Map<string, RNGFunction> = new Map();
  
  /** Stream access order for LRU cache */
  private streamAccessOrder: string[] = [];
  
  /** Master seed for the RNG system */
  private masterSeed: number;
  
  /** Maximum number of streams to cache */
  private maxStreamCache: number;
  
  /** Whether to cache streams */
  private cacheStreams: boolean;

  /**
   * Constructor
   * @param options - Service configuration options
   */
  constructor(options?: RNGServiceOptions) {
    // Set initial seed or use default
    this.masterSeed = options?.initialSeed ?? 0;
    
    // Set caching options
    this.cacheStreams = options?.cacheStreams ?? true;
    this.maxStreamCache = options?.maxStreamCache ?? 20;

    // Initialize default streams
    this.initializeDefaultStreams();
  }

  /**
   * Get an RNG stream by name
   * If the stream doesn't exist, it will be created
   * @param name - Stream name/purpose
   * @returns RNG function for the stream
   */
  getStream(name: string): RNGFunction {
    // Check if the stream exists
    if (this.streams.has(name)) {
      // Update access order for LRU cache
      this.updateStreamAccessOrder(name);
      return this.streams.get(name)!;
    }
    
    // Create a new stream
    return this.createStream(name, this.masterSeed);
  }

  /**
   * Create a new RNG stream with a specific seed
   * @param name - Stream name/purpose
   * @param seed - Seed value for the stream
   * @returns RNG function for the new stream
   */
  createStream(name: string, seed: number): RNGFunction {
    const purposeHash = this.hashString(name);
    const streamSeed = seed ^ purposeHash;
    const rng = mulberry32(streamSeed);
    
    // Cache the stream if caching is enabled
    if (this.cacheStreams) {
      this.streams.set(name, rng);
      this.updateStreamAccessOrder(name);
    }
    
    return rng;
  }

  /**
   * Remove an RNG stream
   * @param name - Stream name/purpose
   */
  removeStream(name: string): void {
    this.streams.delete(name);
    this.streamAccessOrder = this.streamAccessOrder.filter(n => n !== name);
  }

  /**
   * Set the master seed for the RNG system
   * This will reset all streams
   * @param seed - New master seed value
   */
  setMasterSeed(seed: number): void {
    this.masterSeed = seed;

    // Reset all streams with the new seed
    const streamNames = Array.from(this.streams.keys());
    this.streams.clear();
    this.streamAccessOrder = [];

    // Recreate all streams with the new seed
    for (const name of streamNames) {
      this.createStream(name, this.masterSeed);
    }
  }

  /**
   * Get the current master seed
   * @returns The current master seed value
   */
  getMasterSeed(): number {
    return this.masterSeed;
  }
  
  /**
   * Clear all streams
   */
  clearStreams(): void {
    this.streams.clear();
    this.streamAccessOrder = [];
  }

  /**
   * Initialize default RNG streams
   */
  private initializeDefaultStreams(): void {
    // Create default streams for different purposes
    this.createStream('traits', this.masterSeed);
    this.createStream('physics', this.masterSeed);
    this.createStream('formation', this.masterSeed);
    this.createStream('visual', this.masterSeed);
    this.createStream('mutations', this.masterSeed);
  }
  
  /**
   * Update stream access order for LRU cache
   * @param name - Stream name that was accessed
   */
  private updateStreamAccessOrder(name: string): void {
    // Remove the stream from the access order if it exists
    this.streamAccessOrder = this.streamAccessOrder.filter(n => n !== name);
    
    // Add the stream to the end of the access order
    this.streamAccessOrder.push(name);
    
    // If the cache is too large, remove the least recently used stream
    if (this.streamAccessOrder.length > this.maxStreamCache) {
      const lruName = this.streamAccessOrder.shift();
      if (lruName) {
        this.streams.delete(lruName);
      }
    }
  }

  /**
   * Hash a string to a number
   * Used to create purpose-specific seeds
   * @param str - String to hash
   * @returns Numeric hash value
   */
  private hashString(str: string): number {
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
      hash = ((hash << 5) - hash) + str.charCodeAt(i);
      hash |= 0; // Convert to 32-bit integer
    }
    return hash >>> 0; // Convert to unsigned
  }
}

export * from './types';
