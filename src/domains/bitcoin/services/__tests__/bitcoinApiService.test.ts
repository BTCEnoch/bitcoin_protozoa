/**
 * Bitcoin API Service Tests
 *
 * Tests for the Bitcoin API service.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */
import { describe, beforeEach, afterEach, it, expect, vi } from 'vitest';
import { BitcoinAPIService } from '../bitcoinApiService';

// Mock fetch
global.fetch = vi.fn();

describe('BitcoinAPIService', () => {
  let service: BitcoinAPIService;

  beforeEach(() => {
    // Reset mocks
    vi.resetAllMocks();

    // Create a new service for each test
    service = new BitcoinAPIService();
  });

  describe('getBlockByHeight', () => {
    it('should fetch block data from the API', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: vi.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Call the method
      const result = await service.getBlockByHeight(12345);

      // Verify fetch was called with the correct URL
      expect(fetch).toHaveBeenCalledWith(expect.stringContaining('/12345'));

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
        json: vi.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Call the method twice
      await service.getBlockByHeight(12345);
      await service.getBlockByHeight(12345);

      // Verify fetch was called only once
      expect(fetch).toHaveBeenCalledTimes(1);
    });

    it('should throw an error if the API request fails', async () => {
      // Mock failed API response
      const mockResponse = {
        ok: false,
        status: 404
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Verify the method throws an error
      await expect(service.getBlockByHeight(12345)).rejects.toThrow('HTTP error 404');
    });

    it('should throw an error if the API response is invalid', async () => {
      // Mock successful API response with invalid data
      const mockResponse = {
        ok: true,
        json: vi.fn().mockResolvedValue({
          // Missing nonce and confirmations
        })
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Verify the method throws an error
      await expect(service.getBlockByHeight(12345)).rejects.toThrow('Invalid block data');
    });
  });

  describe('getConfirmationCount', () => {
    it('should fetch confirmation count from the API', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: vi.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Call the method
      const result = await service.getConfirmationCount(12345);

      // Verify fetch was called with the correct URL
      expect(fetch).toHaveBeenCalledWith(expect.stringContaining('/12345'));

      // Verify the result is the confirmation count
      expect(result).toBe(1000);
    });

    it('should use the cache for subsequent calls', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: vi.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Call the method twice
      await service.getConfirmationCount(12345);
      await service.getConfirmationCount(12345);

      // Verify fetch was called only once
      expect(fetch).toHaveBeenCalledTimes(1);
    });
  });

  describe('cleanExpiredCache', () => {
    it('should remove expired items from the cache', async () => {
      // Mock successful API response
      const mockResponse = {
        ok: true,
        json: vi.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };

      (fetch as any).mockResolvedValue(mockResponse);

      // Create a service with a very short cache expiry
      const shortCacheService = new BitcoinAPIService({
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
