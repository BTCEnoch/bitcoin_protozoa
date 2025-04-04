# Implement Bitcoin Integration Tests Script
# This script implements tests for Bitcoin integration components
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints
# Tests include API fetching, caching, RNG generation, and confirmation tracking

Write-Host "Implementing Bitcoin Integration Tests..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$rngDomainDir = "$srcDir\domains\rng"
$testDir = "$bitcoinDomainDir\__tests__"
$servicesTestDir = "$bitcoinDomainDir\services\__tests__"
$rngTestDir = "$rngDomainDir\__tests__"
$rngUtilsTestDir = "$rngDomainDir\utils\__tests__"

# Check if directories exist, create if not
if (-not (Test-Path $testDir)) {
    Write-Host "Creating Bitcoin tests directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $testDir -Force | Out-Null
}

if (-not (Test-Path $servicesTestDir)) {
    Write-Host "Creating Bitcoin services tests directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $servicesTestDir -Force | Out-Null
}

if (-not (Test-Path $rngTestDir)) {
    Write-Host "Creating RNG tests directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $rngTestDir -Force | Out-Null
}

if (-not (Test-Path $rngUtilsTestDir)) {
    Write-Host "Creating RNG utils tests directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $rngUtilsTestDir -Force | Out-Null
}

# Create Bitcoin API Service test
$bitcoinApiServiceTestFile = "$servicesTestDir\bitcoinApiService.test.ts"
Write-Host "Creating Bitcoin API Service test in $bitcoinApiServiceTestFile..." -ForegroundColor Yellow

$bitcoinApiServiceTestContent = @"
/**
 * Bitcoin API Service Tests
 * 
 * Tests for the Bitcoin API service.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */
import { BitcoinAPIService } from '../bitcoinApiService';

// Mock fetch
global.fetch = jest.fn();

describe('BitcoinAPIService', () => {
  let service: BitcoinAPIService;
  
  beforeEach(() => {
    // Reset mocks
    jest.resetAllMocks();
    
    // Create a new service for each test
    service = new BitcoinAPIService();
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
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
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
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
      // Verify the method throws an error
      await expect(service.getBlockByHeight(12345)).rejects.toThrow('HTTP error 404');
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
      await expect(service.getBlockByHeight(12345)).rejects.toThrow('Invalid block data');
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
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
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
        json: jest.fn().mockResolvedValue({
          nonce: 123456789,
          confirmations: 1000
        })
      };
      
      (fetch as jest.Mock).mockResolvedValue(mockResponse);
      
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
"@

Set-Content -Path $bitcoinApiServiceTestFile -Value $bitcoinApiServiceTestContent

Write-Host "Bitcoin Integration Tests implementation started! First part complete." -ForegroundColor Green
