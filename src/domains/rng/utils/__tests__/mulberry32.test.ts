/**
 * Mulberry32 RNG Tests
 * 
 * Tests for the Mulberry32 RNG algorithm.
 * This tests the deterministic nature of the RNG based on Bitcoin block nonce.
 */
import { mulberry32 } from '../mulberry32';

describe('Mulberry32 RNG', () => {
  describe('determinism', () => {
    it('should generate the same sequence for the same seed', () => {
      // Create two RNGs with the same seed
      const rng1 = mulberry32(12345);
      const rng2 = mulberry32(12345);
      
      // Generate 10 values from each and compare
      for (let i = 0; i < 10; i++) {
        expect(rng1()).toEqual(rng2());
      }
    });
    
    it('should generate different sequences for different seeds', () => {
      // Create two RNGs with different seeds
      const rng1 = mulberry32(12345);
      const rng2 = mulberry32(54321);
      
      // Verify the first values are different
      expect(rng1()).not.toEqual(rng2());
    });
  });
  
  describe('distribution', () => {
    it('should generate values between 0 and 1', () => {
      // Create an RNG
      const rng = mulberry32(12345);
      
      // Generate 100 values and check they're all between 0 and 1
      for (let i = 0; i < 100; i++) {
        const value = rng();
        expect(value).toBeGreaterThanOrEqual(0);
        expect(value).toBeLessThan(1);
      }
    });
    
    it('should have a uniform distribution', () => {
      // Create an RNG
      const rng = mulberry32(12345);
      
      // Generate 1000 values and check distribution
      const buckets = Array(10).fill(0);
      for (let i = 0; i < 1000; i++) {
        const value = rng();
        const bucketIndex = Math.floor(value * 10);
        buckets[bucketIndex]++;
      }
      
      // Check that each bucket has a reasonable number of values
      // (roughly 100 each, but allow for some variation)
      for (const count of buckets) {
        expect(count).toBeGreaterThan(50);
        expect(count).toBeLessThan(150);
      }
    });
  });
  
  describe('seed handling', () => {
    it('should handle 32-bit unsigned integer seeds', () => {
      // Create an RNG with a large seed
      const rng = mulberry32(0xFFFFFFFF);
      
      // Verify it works correctly
      const value = rng();
      expect(value).toBeGreaterThanOrEqual(0);
      expect(value).toBeLessThan(1);
    });
    
    it('should convert negative seeds to unsigned', () => {
      // Create an RNG with a negative seed
      const rng = mulberry32(-1);
      
      // Verify it works correctly
      const value = rng();
      expect(value).toBeGreaterThanOrEqual(0);
      expect(value).toBeLessThan(1);
    });
  });
});
