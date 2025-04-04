/**
 * RNG Service Tests
 *
 * Tests for the Random Number Generation service.
 */
import { RNGService } from '../index';

describe('RNGService', () => {
  let rngService: RNGService;

  beforeEach(() => {
    // Create a new instance for each test
    rngService = new RNGService({ initialSeed: 12345 });
  });

  describe('getStream', () => {
    it('should return a random number generator function', () => {
      const rng = rngService.getStream('test');

      // Verify the function returns a number between 0 and 1
      const result = rng();
      expect(typeof result).toBe('number');
      expect(result).toBeGreaterThanOrEqual(0);
      expect(result).toBeLessThan(1);
    });

    it('should return the same generator for the same stream name', () => {
      const rng1 = rngService.getStream('test');
      const rng2 = rngService.getStream('test');

      // Verify both functions are the same instance
      expect(rng1).toBe(rng2);

      // Generate a value from the first RNG
      const value1 = rng1();

      // Get the stream again
      const rng3 = rngService.getStream('test');

      // Verify it's still the same instance
      expect(rng1).toBe(rng3);

      // But the next value will be different because the RNG has advanced
      expect(rng3()).not.toEqual(value1);
    });

    it('should return different generators for different stream names', () => {
      const rng1 = rngService.getStream('test1');
      const rng2 = rngService.getStream('test2');

      // Verify the functions generate different values
      expect(rng1()).not.toEqual(rng2());
    });
  });

  describe('createStream', () => {
    it('should create a new random number generator', () => {
      const rng = rngService.createStream('test', 54321);

      // Verify the function returns a number between 0 and 1
      const result = rng();
      expect(typeof result).toBe('number');
      expect(result).toBeGreaterThanOrEqual(0);
      expect(result).toBeLessThan(1);
    });

    it('should override an existing stream with the same name', () => {
      const rng1 = rngService.createStream('test', 12345);
      const value1 = rng1();

      const rng2 = rngService.createStream('test', 54321);
      const value2 = rng2();

      // Verify the functions generate different values
      expect(value1).not.toEqual(value2);
    });
  });

  describe('removeStream', () => {
    it('should remove a stream', () => {
      // Create a stream
      const rng1 = rngService.createStream('test', 12345);

      // Verify the stream exists
      expect(rngService.getStream('test')).toBe(rng1);

      // Remove the stream
      rngService.removeStream('test');

      // Create a new stream with the same name
      const rng2 = rngService.getStream('test');

      // Verify it's a different instance
      expect(rng2).not.toBe(rng1);
    });
  });

  describe('setMasterSeed', () => {
    it('should update the master seed and reset all streams', () => {
      // Create streams with the initial seed
      const rng1 = rngService.getStream('test1');
      const rng2 = rngService.getStream('test2');

      // Get initial values
      const value1 = rng1();
      const value2 = rng2();

      // Set a new master seed
      rngService.setMasterSeed(54321);

      // Get the streams again
      const rng1After = rngService.getStream('test1');
      const rng2After = rngService.getStream('test2');

      // Get new values
      const value1After = rng1After();
      const value2After = rng2After();

      // Verify the values are different
      expect(value1).not.toEqual(value1After);
      expect(value2).not.toEqual(value2After);
    });
  });

  describe('getMasterSeed', () => {
    it('should return the current master seed', () => {
      // Verify the initial seed
      expect(rngService.getMasterSeed()).toBe(12345);

      // Set a new seed
      rngService.setMasterSeed(54321);

      // Verify the new seed
      expect(rngService.getMasterSeed()).toBe(54321);
    });
  });

  describe('determinism', () => {
    it('should generate the same sequence for the same seed', () => {
      // Create two services with the same seed
      const service1 = new RNGService({ initialSeed: 12345 });
      const service2 = new RNGService({ initialSeed: 12345 });

      // Get streams with the same name
      const rng1 = service1.getStream('test');
      const rng2 = service2.getStream('test');

      // Generate 10 values from each and compare
      for (let i = 0; i < 10; i++) {
        expect(rng1()).toEqual(rng2());
      }
    });

    it('should generate different sequences for different seeds', () => {
      // Create two services with different seeds
      const service1 = new RNGService({ initialSeed: 12345 });
      const service2 = new RNGService({ initialSeed: 54321 });

      // Get streams with the same name
      const rng1 = service1.getStream('test');
      const rng2 = service2.getStream('test');

      // Verify the first values are different
      expect(rng1()).not.toEqual(rng2());
    });
  });
});
