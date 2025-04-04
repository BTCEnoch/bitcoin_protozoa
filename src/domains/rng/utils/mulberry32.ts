/**
 * Mulberry32 RNG Implementation
 *
 * A simple, fast, seedable random number generator.
 * This implementation follows the specification in rng_system.md.
 */

/**
 * RNG Function type
 */
export type RNGFunction = () => number;

/**
 * Mulberry32 PRNG implementation
 *
 * @param seed - The seed value (32-bit unsigned integer)
 * @returns A function that returns a random number between 0 and 1
 */
export function mulberry32(seed: number): RNGFunction {
  // Ensure seed is a 32-bit unsigned integer
  seed = seed >>> 0;

  return () => {
    // Mulberry32 algorithm
    seed += 0x6D2B79F5;
    let t = seed;
    t = Math.imul(t ^ (t >>> 15), t | 1);
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

/**
 * Create a chain of random number generators
 *
 * @param seed - The initial seed value
 * @param length - The number of generators to create
 * @returns An array of RNG functions
 */
export function createChainRng(seed: number, length: number): RNGFunction[] {
  const generators: RNGFunction[] = [];
  let currentSeed = seed >>> 0; // Ensure seed is a 32-bit unsigned integer

  for (let i = 0; i < length; i++) {
    generators.push(mulberry32(currentSeed));
    // Use the first random number as the seed for the next generator
    currentSeed = Math.floor(generators[i]() * 4294967296);
  }

  return generators;
}

/**
 * Create a deterministic random number generator based on a seed
 * This is an alias for mulberry32 for backward compatibility
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random number between 0 and 1
 */
export function createRNG(seed: number): RNGFunction {
  return mulberry32(seed);
}
