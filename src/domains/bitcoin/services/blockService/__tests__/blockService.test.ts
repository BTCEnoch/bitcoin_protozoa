/**
 * BlockService Tests
 * 
 * Tests for the Bitcoin block data service.
 */
import { BlockService } from '../index';
import { BlockInfo } from '../types';

// Mock fetch
global.fetch = jest.fn();

describe('BlockService', () => {
  let blockService: BlockService;
  
  beforeEach(() => {
    // Reset mocks
    jest.resetAllMocks();
    
    // Create a new instance for each test
    blockService = new BlockService();
  });
  
  describe('getBlockByHeight', () => {
    it('should fetch block data from the API', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Call the method
      const result = await blockService.getBlockByHeight(12345);
      
      // Verify fetch was called with the correct URL
      expect(fetch).toHaveBeenCalledWith('https://ordinals.com/r/blockinfo/12345');
      
      // Verify the result contains only the required fields
      expect(result).toEqual({
        blockNumber: 12345,
        nonce: 123456789,
        confirmations: 1000
      });
    });
    
    it('should use the cache for subsequent calls', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Call the method twice
      await blockService.getBlockByHeight(12345);
      await blockService.getBlockByHeight(12345);
      
      // Verify fetch was called only once
      expect(fetch).toHaveBeenCalledTimes(1);
    });
    
    it('should throw an error if the API request fails', async () => {
      // Mock failed API response
      const mockResponse = {
        ok: false,
        status: 404
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Verify the method throws an error
      await expect(blockService.getBlockByHeight(12345)).rejects.toThrow('Failed to fetch block 12345: HTTP error 404');
    });
    
    it('should throw an error if the API response is invalid', async () => {
      // Mock successful API response with invalid data
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          // Missing nonce and confirmations
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Verify the method throws an error
      await expect(blockService.getBlockByHeight(12345)).rejects.toThrow('Invalid block data: nonce is missing or not a number');
    });
  });
  
  describe('getConfirmationCount', () => {
    it('should fetch confirmation count from the API', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Call the method
      const result = await blockService.getConfirmationCount(12345);
      
      // Verify fetch was called with the correct URL
      expect(fetch).toHaveBeenCalledWith('https://ordinals.com/r/blockinfo/12345');
      
      // Verify the result is the confirmation count
      expect(result).toBe(1000);
    });
    
    it('should use the cache for subsequent calls', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Call the method twice
      await blockService.getConfirmationCount(12345);
      await blockService.getConfirmationCount(12345);
      
      // Verify fetch was called only once
      expect(fetch).toHaveBeenCalledTimes(1);
    });
  });
  
  describe('clearCache', () => {
    it('should clear the cache', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Call the method once to populate the cache
      await blockService.getBlockByHeight(12345);
      
      // Clear the cache
      blockService.clearCache();
      
      // Call the method again
      await blockService.getBlockByHeight(12345);
      
      // Verify fetch was called twice
      expect(fetch).toHaveBeenCalledTimes(2);
    });
  });
  
  describe('cleanExpiredCache', () => {
    it('should remove expired items from the cache', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Create a service with a very short cache expiry
      const shortCacheService = new BlockService({
        blockCacheExpiry: 1, // 1ms
        confirmationCacheExpiry: 1 // 1ms
      });
      
      // Call the method once to populate the cache
      await shortCacheService.getBlockByHeight(12345);
      
      // Wait for the cache to expire
      await new Promise(resolve => setTimeout(resolve, 10));
      
      // Clean expired cache
      shortCacheService.cleanExpiredCache();
      
      // Call the method again
      await shortCacheService.getBlockByHeight(12345);
      
      // Verify fetch was called twice
      expect(fetch).toHaveBeenCalledTimes(2);
    });
  });
});
