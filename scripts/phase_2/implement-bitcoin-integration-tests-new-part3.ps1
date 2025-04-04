# Implement Bitcoin Integration Tests Script - Part 3
# This script implements tests for Bitcoin integration components
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints
# Tests include API fetching, caching, RNG generation, and confirmation tracking

Write-Host "Implementing Bitcoin Integration Tests (Part 3)..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$rngDomainDir = "$srcDir\domains\rng"
$rngUtilsTestDir = "$rngDomainDir\utils\__tests__"

# Create Mulberry32 RNG test
$mulberry32TestFile = "$rngUtilsTestDir\mulberry32.test.ts"
Write-Host "Creating Mulberry32 RNG test in $mulberry32TestFile..." -ForegroundColor Yellow

$mulberry32TestContent = @"
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
"@

Set-Content -Path $mulberry32TestFile -Value $mulberry32TestContent

# Create RNG Chain test
$rngChainTestFile = "$rngUtilsTestDir\rngChain.test.ts"
Write-Host "Creating RNG Chain test in $rngChainTestFile..." -ForegroundColor Yellow

$rngChainTestContent = @"
/**
 * RNG Chain Tests
 * 
 * Tests for the RNG Chain system.
 * This tests the chaining of RNG generators for deterministic sequences.
 */
import { ChainRNGService } from '../../services/chainRngService';
import { ChainRNG } from '../../services/chainRngService/types';

describe('ChainRNGService', () => {
  let chainRngService: ChainRNGService;
  
  beforeEach(() => {
    // Create a new instance for each test
    chainRngService = new ChainRNGService({ defaultChainLength: 5 });
  });
  
  describe('createChain', () => {
    it('should create a chain with the specified length', () => {
      const chain = chainRngService.createChain('test', 12345);
      
      // Verify the chain has the correct length
      expect(chain.generators.length).toBe(5);
    });
    
    it('should create a chain with a custom length', () => {
      const chain = chainRngService.createChain('test', 12345, 10);
      
      // Verify the chain has the correct length
      expect(chain.generators.length).toBe(10);
    });
    
    it('should create deterministic chains for the same seed', () => {
      const chain1 = chainRngService.createChain('test1', 12345);
      const chain2 = chainRngService.createChain('test2', 12345);
      
      // Verify the first generator in each chain produces the same value
      expect(chain1.generators[0]()).toEqual(chain2.generators[0]());
    });
    
    it('should create different chains for different seeds', () => {
      const chain1 = chainRngService.createChain('test1', 12345);
      const chain2 = chainRngService.createChain('test2', 54321);
      
      // Verify the first generator in each chain produces different values
      expect(chain1.generators[0]()).not.toEqual(chain2.generators[0]());
    });
  });
  
  describe('ChainRNG', () => {
    let chain: ChainRNG;
    
    beforeEach(() => {
      // Create a chain for testing
      chain = chainRngService.createChain('test', 12345, 3);
    });
    
    describe('next', () => {
      it('should return the next generator in the chain', () => {
        // Get the first generator
        const gen1 = chain.next();
        
        // Verify it's the first generator
        expect(gen1).toBe(chain.generators[0]);
        
        // Get the second generator
        const gen2 = chain.next();
        
        // Verify it's the second generator
        expect(gen2).toBe(chain.generators[1]);
      });
      
      it('should wrap around to the beginning when reaching the end', () => {
        // Get all generators plus one more
        const gen1 = chain.next();
        const gen2 = chain.next();
        const gen3 = chain.next();
        const gen4 = chain.next();
        
        // Verify it wrapped around
        expect(gen4).toBe(chain.generators[0]);
      });
    });
    
    describe('reset', () => {
      it('should reset the position to the beginning', () => {
        // Advance the position
        chain.next();
        chain.next();
        
        // Reset
        chain.reset();
        
        // Verify the position is reset
        expect(chain.getPosition()).toBe(0);
        
        // Verify the next generator is the first one
        expect(chain.next()).toBe(chain.generators[0]);
      });
    });
  });
});
"@

Set-Content -Path $rngChainTestFile -Value $rngChainTestContent

Write-Host "Bitcoin Integration Tests implementation complete!" -ForegroundColor Green
