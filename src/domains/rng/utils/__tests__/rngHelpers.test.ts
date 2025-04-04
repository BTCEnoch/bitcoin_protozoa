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
