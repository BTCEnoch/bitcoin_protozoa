/**
 * RNG Utilities
 *
 * This file contains utilities for random number generation based on Bitcoin block nonce.
 * It implements the Mulberry32 algorithm for deterministic random number generation.
 */

/**
 * Mulberry32 RNG algorithm
 *
 * A simple, fast, seedable random number generator.
 * This implementation follows the specification in rng_system.md.
 *
 * @param seed - The seed value (32-bit unsigned integer)
 * @returns A function that returns a random number between 0 and 1
 */
export function mulberry32(seed: number): () => number {
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
 * Creates a deterministic random number generator based on a seed
 * This is an alias for mulberry32 for backward compatibility
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random number between 0 and 1
 */
export function createRNG(seed: number): () => number {
  return mulberry32(seed);
}

/**
 * Creates a random integer generator based on a seed
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random integer between min and max (inclusive)
 */
export function createRandomIntGenerator(seed: number): (min: number, max: number) => number {
  const rng = createRNG(seed);

  return function(min: number, max: number): number {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(rng() * (max - min + 1)) + min;
  };
}

/**
 * Creates a random boolean generator based on a seed
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random boolean with the given probability of being true
 */
export function createRandomBooleanGenerator(seed: number): (probability?: number) => boolean {
  const rng = createRNG(seed);

  return function(probability: number = 0.5): boolean {
    return rng() < probability;
  };
}

/**
 * Creates a random item selector based on a seed
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random item from an array
 */
export function createRandomItemSelector<T>(seed: number): (items: T[]) => T {
  const randomInt = createRandomIntGenerator(seed);

  return function(items: T[]): T {
    if (items.length === 0) {
      throw new Error('Cannot select from an empty array');
    }

    const index = randomInt(0, items.length - 1);
    return items[index];
  };
}

/**
 * Creates a random color generator based on a seed
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random color in the specified format
 */
export function createRandomColorGenerator(seed: number): (format?: 'hex' | 'rgb' | 'object') => string | { r: number; g: number; b: number } {
  const rng = createRNG(seed);

  return function(format: 'hex' | 'rgb' | 'object' = 'hex'): string | { r: number; g: number; b: number } {
    const r = Math.floor(rng() * 256);
    const g = Math.floor(rng() * 256);
    const b = Math.floor(rng() * 256);

    switch (format) {
      case 'hex':
        return #\\\;
      case 'rgb':
        return gb(\, \, \);
      case 'object':
        return { r, g, b };
      default:
        return #\\\;
    }
  };
}

/**
 * Creates a weighted random item selector based on a seed
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a random item from an array based on weights
 */
export function createWeightedRandomSelector<T>(seed: number): (items: T[], weights: number[]) => T {
  const rng = createRNG(seed);

  return function(items: T[], weights: number[]): T {
    if (items.length === 0) {
      throw new Error('Cannot select from an empty array');
    }

    if (items.length !== weights.length) {
      throw new Error('Items and weights arrays must have the same length');
    }

    // Calculate sum of weights
    const totalWeight = weights.reduce((sum, weight) => sum + weight, 0);

    // Generate a random value between 0 and totalWeight
    const randomValue = rng() * totalWeight;

    // Find the item that corresponds to the random value
    let cumulativeWeight = 0;

    for (let i = 0; i < items.length; i++) {
      cumulativeWeight += weights[i];

      if (randomValue < cumulativeWeight) {
        return items[i];
      }
    }

    // Fallback (should never happen unless there's a floating-point precision issue)
    return items[items.length - 1];
  };
}

/**
 * Creates a shuffled array based on a seed
 *
 * @param seed - The seed value (typically a Bitcoin block nonce)
 * @returns A function that returns a shuffled copy of the input array
 */
export function createArrayShuffler<T>(seed: number): (array: T[]) => T[] {
  const rng = createRNG(seed);

  return function(array: T[]): T[] {
    const result = [...array];

    // Fisher-Yates shuffle algorithm
    for (let i = result.length - 1; i > 0; i--) {
      const j = Math.floor(rng() * (i + 1));
      [result[i], result[j]] = [result[j], result[i]];
    }

    return result;
  };
}
