# Implement RNG Utility Functions Script
# This script implements utility functions for common RNG operations
# These functions build on top of the Mulberry32 RNG algorithm

Write-Host "Implementing RNG Utility Functions..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$rngDomainDir = "$srcDir\domains\rng"
$utilsDir = "$rngDomainDir\utils"
$rngHelpersFile = "$utilsDir\rngHelpers.ts"
$indexFile = "$utilsDir\index.ts"

# Check if directories exist, create if not
if (-not (Test-Path $rngDomainDir)) {
    Write-Host "Creating RNG domain directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $rngDomainDir -Force | Out-Null
}

if (-not (Test-Path $utilsDir)) {
    Write-Host "Creating RNG utils directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $utilsDir -Force | Out-Null
}

# Create or update rngHelpers.ts
Write-Host "Creating/Updating RNG helpers in $rngHelpersFile..." -ForegroundColor Yellow

$rngHelpersContent = @"
/**
 * RNG Helper Functions
 * 
 * Utility functions for working with random number generators.
 * These functions build on top of the Mulberry32 RNG algorithm.
 */
import { RNGFunction } from '../services/rngService/types';

/**
 * Generate a random float between min and max
 * @param random - Random number generator function
 * @param min - Minimum value (inclusive)
 * @param max - Maximum value (exclusive)
 * @returns Random float between min and max
 */
export function randomFloat(random: RNGFunction, min: number, max: number): number {
  return min + random() * (max - min);
}

/**
 * Generate a random integer between min and max
 * @param random - Random number generator function
 * @param min - Minimum value (inclusive)
 * @param max - Maximum value (exclusive)
 * @returns Random integer between min and max
 */
export function randomInt(random: RNGFunction, min: number, max: number): number {
  return Math.floor(randomFloat(random, min, max));
}

/**
 * Choose a random item from an array
 * @param random - Random number generator function
 * @param array - Array to choose from
 * @returns Random item from the array
 */
export function randomChoice<T>(random: RNGFunction, array: T[]): T {
  return array[Math.floor(random() * array.length)];
}

/**
 * Choose multiple random items from an array
 * @param random - Random number generator function
 * @param array - Array to choose from
 * @param count - Number of items to choose
 * @param allowDuplicates - Whether to allow the same item to be chosen multiple times
 * @returns Array of randomly chosen items
 */
export function randomChoices<T>(
  random: RNGFunction,
  array: T[],
  count: number,
  allowDuplicates: boolean = false
): T[] {
  if (count <= 0) {
    return [];
  }
  
  if (count >= array.length && !allowDuplicates) {
    // If we want all items without duplicates, just shuffle and return
    return shuffleArray(random, [...array]).slice(0, count);
  }
  
  if (allowDuplicates) {
    // With duplicates, just pick randomly each time
    const result: T[] = [];
    for (let i = 0; i < count; i++) {
      result.push(randomChoice(random, array));
    }
    return result;
  } else {
    // Without duplicates, shuffle and take the first 'count' items
    return shuffleArray(random, [...array]).slice(0, count);
  }
}

/**
 * Shuffle an array using the Fisher-Yates algorithm
 * @param random - Random number generator function
 * @param array - Array to shuffle
 * @returns Shuffled copy of the array
 */
export function shuffleArray<T>(random: RNGFunction, array: T[]): T[] {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

/**
 * Generate a weighted random choice from an array
 * @param random - Random number generator function
 * @param items - Array of items to choose from
 * @param weights - Array of weights for each item
 * @returns Randomly chosen item based on weights
 */
export function weightedRandomChoice<T>(
  random: RNGFunction,
  items: T[],
  weights: number[]
): T {
  if (items.length !== weights.length) {
    throw new Error('Items and weights arrays must have the same length');
  }
  
  const totalWeight = weights.reduce((sum, weight) => sum + weight, 0);
  const randomValue = random() * totalWeight;
  
  let cumulativeWeight = 0;
  for (let i = 0; i < items.length; i++) {
    cumulativeWeight += weights[i];
    if (randomValue < cumulativeWeight) {
      return items[i];
    }
  }
  
  // Fallback (should never happen unless weights are all zero)
  return items[items.length - 1];
}

/**
 * Generate a random boolean with a given probability
 * @param random - Random number generator function
 * @param probability - Probability of returning true (0-1)
 * @returns Random boolean
 */
export function randomBoolean(random: RNGFunction, probability: number = 0.5): boolean {
  return random() < probability;
}

/**
 * Generate a random value following a normal distribution
 * @param random - Random number generator function
 * @param mean - Mean of the distribution
 * @param stdDev - Standard deviation of the distribution
 * @returns Random value following a normal distribution
 */
export function randomNormal(random: RNGFunction, mean: number = 0, stdDev: number = 1): number {
  // Box-Muller transform
  const u1 = random();
  const u2 = random();
  
  const z0 = Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2.0 * Math.PI * u2);
  
  return z0 * stdDev + mean;
}

/**
 * Generate a random color
 * @param random - Random number generator function
 * @returns Random hex color string
 */
export function randomColor(random: RNGFunction): string {
  const r = Math.floor(random() * 256);
  const g = Math.floor(random() * 256);
  const b = Math.floor(random() * 256);
  return `#\${r.toString(16).padStart(2, '0')}\${g.toString(16).padStart(2, '0')}\${b.toString(16).padStart(2, '0')}`;
}

/**
 * Generate a random position within a sphere
 * @param random - Random number generator function
 * @param radius - Radius of the sphere
 * @returns Random position [x, y, z]
 */
export function randomPositionInSphere(random: RNGFunction, radius: number): [number, number, number] {
  // Generate random spherical coordinates
  const theta = random() * 2 * Math.PI; // Azimuthal angle (0 to 2π)
  const phi = Math.acos(2 * random() - 1); // Polar angle (0 to π)
  const r = radius * Math.cbrt(random()); // Radius (cube root for uniform distribution)
  
  // Convert to Cartesian coordinates
  const x = r * Math.sin(phi) * Math.cos(theta);
  const y = r * Math.sin(phi) * Math.sin(theta);
  const z = r * Math.cos(phi);
  
  return [x, y, z];
}

/**
 * Generate a random position on a sphere surface
 * @param random - Random number generator function
 * @param radius - Radius of the sphere
 * @returns Random position [x, y, z] on the sphere surface
 */
export function randomPositionOnSphere(random: RNGFunction, radius: number): [number, number, number] {
  // Generate random spherical coordinates
  const theta = random() * 2 * Math.PI; // Azimuthal angle (0 to 2π)
  const phi = Math.acos(2 * random() - 1); // Polar angle (0 to π)
  
  // Convert to Cartesian coordinates
  const x = radius * Math.sin(phi) * Math.cos(theta);
  const y = radius * Math.sin(phi) * Math.sin(theta);
  const z = radius * Math.cos(phi);
  
  return [x, y, z];
}
"@

Set-Content -Path $rngHelpersFile -Value $rngHelpersContent

# Create or update index.ts
Write-Host "Creating/Updating RNG utils index in $indexFile..." -ForegroundColor Yellow

$indexContent = @"
/**
 * RNG Utils Index
 * 
 * This file exports all RNG utility functions.
 */

export * from './rngHelpers';
export * from './mulberry32';
"@

Set-Content -Path $indexFile -Value $indexContent

# Create test file for RNG helpers
$testDir = "$utilsDir\__tests__"
if (-not (Test-Path $testDir)) {
    Write-Host "Creating RNG utils test directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $testDir -Force | Out-Null
}

$rngHelpersTestFile = "$testDir\rngHelpers.test.ts"
Write-Host "Creating/Updating RNG helpers tests in $rngHelpersTestFile..." -ForegroundColor Yellow

$rngHelpersTestContent = @"
/**
 * RNG Helper Functions Tests
 * 
 * Tests for the RNG utility functions.
 */
import { RNGFunction } from '../../services/rngService/types';
import {
  randomFloat,
  randomInt,
  randomChoice,
  randomChoices,
  shuffleArray,
  weightedRandomChoice,
  randomBoolean,
  randomNormal,
  randomColor,
  randomPositionInSphere,
  randomPositionOnSphere
} from '../rngHelpers';

describe('RNG Helper Functions', () => {
  // Create a deterministic RNG for testing
  const createMockRng = (values: number[]): RNGFunction => {
    let index = 0;
    return () => {
      const value = values[index];
      index = (index + 1) % values.length;
      return value;
    };
  };
  
  describe('randomFloat', () => {
    it('should generate a random float between min and max', () => {
      const mockRng = createMockRng([0.25, 0.75]);
      
      expect(randomFloat(mockRng, 10, 20)).toBe(12.5);
      expect(randomFloat(mockRng, 10, 20)).toBe(17.5);
    });
  });
  
  describe('randomInt', () => {
    it('should generate a random integer between min and max', () => {
      const mockRng = createMockRng([0.25, 0.75]);
      
      expect(randomInt(mockRng, 10, 20)).toBe(12);
      expect(randomInt(mockRng, 10, 20)).toBe(17);
    });
  });
  
  describe('randomChoice', () => {
    it('should choose a random item from an array', () => {
      const mockRng = createMockRng([0.1, 0.6]);
      const array = ['a', 'b', 'c', 'd', 'e'];
      
      expect(randomChoice(mockRng, array)).toBe('a');
      expect(randomChoice(mockRng, array)).toBe('d');
    });
  });
  
  describe('randomChoices', () => {
    it('should choose multiple random items from an array with duplicates', () => {
      const mockRng = createMockRng([0.1, 0.6, 0.3]);
      const array = ['a', 'b', 'c', 'd', 'e'];
      
      expect(randomChoices(mockRng, array, 3, true)).toEqual(['a', 'd', 'b']);
    });
    
    it('should choose multiple random items from an array without duplicates', () => {
      const mockRng = createMockRng([0.1, 0.2, 0.3, 0.4, 0.5]);
      const array = ['a', 'b', 'c', 'd', 'e'];
      
      // With Fisher-Yates shuffle, the exact result depends on the implementation
      // So we just check that we get the right number of items and no duplicates
      const result = randomChoices(mockRng, array, 3, false);
      expect(result.length).toBe(3);
      expect(new Set(result).size).toBe(3);
    });
  });
  
  describe('shuffleArray', () => {
    it('should shuffle an array', () => {
      const mockRng = createMockRng([0.1, 0.2, 0.3, 0.4, 0.5]);
      const array = ['a', 'b', 'c', 'd', 'e'];
      
      // With Fisher-Yates shuffle, the exact result depends on the implementation
      // So we just check that we get all the items in some order
      const result = shuffleArray(mockRng, array);
      expect(result.length).toBe(array.length);
      expect(new Set(result)).toEqual(new Set(array));
    });
  });
  
  describe('weightedRandomChoice', () => {
    it('should choose an item based on weights', () => {
      const mockRng = createMockRng([0.1, 0.6, 0.9]);
      const items = ['a', 'b', 'c'];
      const weights = [1, 2, 3]; // Total weight: 6
      
      // 0.1 * 6 = 0.6, which is less than the first weight (1), so we get 'a'
      expect(weightedRandomChoice(mockRng, items, weights)).toBe('a');
      
      // 0.6 * 6 = 3.6, which is greater than the first weight (1) and the sum of the first and second weights (3),
      // so we get 'c'
      expect(weightedRandomChoice(mockRng, items, weights)).toBe('c');
      
      // 0.9 * 6 = 5.4, which is greater than the sum of the first and second weights (3),
      // so we get 'c'
      expect(weightedRandomChoice(mockRng, items, weights)).toBe('c');
    });
    
    it('should throw an error if items and weights have different lengths', () => {
      const mockRng = createMockRng([0.5]);
      const items = ['a', 'b', 'c'];
      const weights = [1, 2];
      
      expect(() => weightedRandomChoice(mockRng, items, weights)).toThrow();
    });
  });
  
  describe('randomBoolean', () => {
    it('should generate a random boolean with default probability', () => {
      const mockRng = createMockRng([0.4, 0.6]);
      
      expect(randomBoolean(mockRng)).toBe(true);
      expect(randomBoolean(mockRng)).toBe(false);
    });
    
    it('should generate a random boolean with custom probability', () => {
      const mockRng = createMockRng([0.2, 0.4, 0.6, 0.8]);
      
      expect(randomBoolean(mockRng, 0.3)).toBe(true);
      expect(randomBoolean(mockRng, 0.3)).toBe(false);
      expect(randomBoolean(mockRng, 0.7)).toBe(true);
      expect(randomBoolean(mockRng, 0.7)).toBe(false);
    });
  });
  
  describe('randomNormal', () => {
    it('should generate a value from a normal distribution', () => {
      const mockRng = createMockRng([0.5, 0.5]);
      
      // With u1 = u2 = 0.5, the Box-Muller transform gives z0 = 0
      // So with mean = 10 and stdDev = 2, we get 10
      expect(randomNormal(mockRng, 10, 2)).toBe(10);
    });
  });
  
  describe('randomColor', () => {
    it('should generate a random hex color', () => {
      const mockRng = createMockRng([0.5, 0.25, 0.75]);
      
      // 0.5 * 256 = 128 = 0x80
      // 0.25 * 256 = 64 = 0x40
      // 0.75 * 256 = 192 = 0xc0
      expect(randomColor(mockRng)).toBe('#804080');
    });
  });
  
  describe('randomPositionInSphere', () => {
    it('should generate a random position within a sphere', () => {
      const mockRng = createMockRng([0.5, 0.5, 0.5]);
      const radius = 10;
      
      const [x, y, z] = randomPositionInSphere(mockRng, radius);
      
      // Check that the position is within the sphere
      const distanceSquared = x*x + y*y + z*z;
      expect(distanceSquared).toBeLessThanOrEqual(radius * radius);
    });
  });
  
  describe('randomPositionOnSphere', () => {
    it('should generate a random position on a sphere surface', () => {
      const mockRng = createMockRng([0.5, 0.5]);
      const radius = 10;
      
      const [x, y, z] = randomPositionOnSphere(mockRng, radius);
      
      // Check that the position is on the sphere surface
      const distance = Math.sqrt(x*x + y*y + z*z);
      expect(distance).toBeCloseTo(radius);
    });
  });
});
"@

Set-Content -Path $rngHelpersTestFile -Value $rngHelpersTestContent

Write-Host "RNG Utility Functions implementation complete!" -ForegroundColor Green
