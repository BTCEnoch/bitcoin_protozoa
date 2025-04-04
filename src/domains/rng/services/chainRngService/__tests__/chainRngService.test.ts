/**
 * Chain RNG Service Tests
 * 
 * Tests for the Chain Random Number Generation service.
 */
import { ChainRNGService } from '../index';
import { ChainRNG } from '../types';

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
  
  describe('getChain', () => {
    it('should return an existing chain', () => {
      // Create a chain
      const chain = chainRngService.createChain('test', 12345);
      
      // Get the chain
      const retrievedChain = chainRngService.getChain('test');
      
      // Verify it's the same chain
      expect(retrievedChain).toBe(chain);
    });
    
    it('should return undefined for a non-existent chain', () => {
      const chain = chainRngService.getChain('nonexistent');
      
      // Verify it's undefined
      expect(chain).toBeUndefined();
    });
  });
  
  describe('getOrCreateChain', () => {
    it('should return an existing chain', () => {
      // Create a chain
      const chain = chainRngService.createChain('test', 12345);
      
      // Get or create the chain
      const retrievedChain = chainRngService.getOrCreateChain('test', 54321);
      
      // Verify it's the same chain (not a new one with the different seed)
      expect(retrievedChain).toBe(chain);
    });
    
    it('should create a new chain if it doesn\'t exist', () => {
      // Get or create a chain
      const chain = chainRngService.getOrCreateChain('test', 12345);
      
      // Verify it's a new chain
      expect(chain).toBeDefined();
      expect(chain.name).toBe('test');
    });
  });
  
  describe('removeChain', () => {
    it('should remove an existing chain', () => {
      // Create a chain
      chainRngService.createChain('test', 12345);
      
      // Remove the chain
      chainRngService.removeChain('test');
      
      // Verify it's gone
      expect(chainRngService.getChain('test')).toBeUndefined();
    });
  });
  
  describe('clearChains', () => {
    it('should remove all chains', () => {
      // Create some chains
      chainRngService.createChain('test1', 12345);
      chainRngService.createChain('test2', 54321);
      
      // Clear all chains
      chainRngService.clearChains();
      
      // Verify they're all gone
      expect(chainRngService.getChainNames()).toEqual([]);
    });
  });
  
  describe('getChainNames', () => {
    it('should return all chain names', () => {
      // Create some chains
      chainRngService.createChain('test1', 12345);
      chainRngService.createChain('test2', 54321);
      
      // Get the chain names
      const names = chainRngService.getChainNames();
      
      // Verify the names
      expect(names).toEqual(['test1', 'test2']);
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
    
    describe('getPosition', () => {
      it('should return the current position', () => {
        // Initial position
        expect(chain.getPosition()).toBe(0);
        
        // Advance the position
        chain.next();
        
        // Verify the position
        expect(chain.getPosition()).toBe(1);
      });
    });
  });
});
