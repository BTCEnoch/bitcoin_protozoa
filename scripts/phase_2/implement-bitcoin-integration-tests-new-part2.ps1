# Implement Bitcoin Integration Tests Script - Part 2
# This script implements tests for Bitcoin integration components
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints
# Tests include API fetching, caching, RNG generation, and confirmation tracking

Write-Host "Implementing Bitcoin Integration Tests (Part 2)..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$rngDomainDir = "$srcDir\domains\rng"
$servicesTestDir = "$bitcoinDomainDir\services\__tests__"
$rngUtilsTestDir = "$rngDomainDir\utils\__tests__"

# Create Confirmation Tracker test
$confirmationTrackerTestFile = "$servicesTestDir\confirmationTracker.test.ts"
Write-Host "Creating Confirmation Tracker test in $confirmationTrackerTestFile..." -ForegroundColor Yellow

$confirmationTrackerTestContent = @"
/**
 * Confirmation Tracker Tests
 * 
 * Tests for the Confirmation Tracker service.
 * IMPORTANT: We ONLY extract and use the confirmations field from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */
import { ConfirmationTracker } from '../confirmationService';
import { BitcoinAPIService } from '../bitcoinApiService';
import { MilestoneEvent } from '../confirmationService';

// Mock BitcoinAPIService
jest.mock('../bitcoinApiService');

describe('ConfirmationTracker', () => {
  let tracker: ConfirmationTracker;
  let mockApiService: jest.Mocked<BitcoinAPIService>;
  
  beforeEach(() => {
    // Reset mocks
    jest.resetAllMocks();
    
    // Create mock API service
    mockApiService = new BitcoinAPIService() as jest.Mocked<BitcoinAPIService>;
    
    // Mock getConfirmationCount method
    mockApiService.getConfirmationCount = jest.fn();
    
    // Create a new tracker for each test with a short check interval
    tracker = new ConfirmationTracker(mockApiService, {
      checkInterval: 100 // 100ms for faster tests
    });
    
    // Mock setInterval and clearInterval
    jest.useFakeTimers();
  });
  
  afterEach(() => {
    // Stop checking to prevent interval from continuing
    tracker.stopChecking();
    
    // Restore timers
    jest.useRealTimers();
  });
  
  describe('trackBlock', () => {
    it('should start tracking a block', async () => {
      // Mock confirmation count
      mockApiService.getConfirmationCount.mockResolvedValue(1000);
      
      // Track a block
      tracker.trackBlock(12345);
      
      // Verify the block is being tracked
      expect(tracker.getTrackedBlocks().has(12345)).toBe(true);
      
      // Verify getConfirmationCount was called
      expect(mockApiService.getConfirmationCount).toHaveBeenCalledWith(12345);
    });
    
    it('should start periodic checking', () => {
      // Track a block
      tracker.trackBlock(12345);
      
      // Advance timers
      jest.advanceTimersByTime(100);
      
      // Verify getConfirmationCount was called again
      expect(mockApiService.getConfirmationCount).toHaveBeenCalledTimes(2);
    });
  });
  
  describe('untrackBlock', () => {
    it('should stop tracking a block', () => {
      // Track a block
      tracker.trackBlock(12345);
      
      // Untrack the block
      tracker.untrackBlock(12345);
      
      // Verify the block is no longer being tracked
      expect(tracker.getTrackedBlocks().has(12345)).toBe(false);
    });
    
    it('should stop checking if no blocks are being tracked', () => {
      // Track a block
      tracker.trackBlock(12345);
      
      // Untrack the block
      tracker.untrackBlock(12345);
      
      // Reset the mock
      mockApiService.getConfirmationCount.mockClear();
      
      // Advance timers
      jest.advanceTimersByTime(100);
      
      // Verify getConfirmationCount was not called again
      expect(mockApiService.getConfirmationCount).not.toHaveBeenCalled();
    });
  });
  
  describe('milestone detection', () => {
    it('should detect when a block reaches a milestone', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      tracker.addEventListener(handler);
      
      // Mock confirmation count at a milestone
      mockApiService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      tracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the handler was called
      expect(handler).toHaveBeenCalled();
      
      // Verify the event data
      const event = handler.mock.calls[0][0] as MilestoneEvent;
      expect(event.blockNumber).toBe(12345);
      expect(event.threshold).toBe(10000);
      expect(event.confirmations).toBe(10000);
    });
    
    it('should not trigger the same milestone twice', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      tracker.addEventListener(handler);
      
      // Mock confirmation count at a milestone
      mockApiService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      tracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Reset the mock
      handler.mockClear();
      
      // Check confirmations again
      await tracker.checkConfirmations();
      
      // Verify the handler was not called again
      expect(handler).not.toHaveBeenCalled();
    });
    
    it('should trigger higher milestones after lower ones', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      tracker.addEventListener(handler);
      
      // Mock confirmation count at the first milestone
      mockApiService.getConfirmationCount.mockResolvedValueOnce(10000);
      
      // Track a block
      tracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the handler was called with the first milestone
      expect(handler).toHaveBeenCalledTimes(1);
      expect(handler.mock.calls[0][0].threshold).toBe(10000);
      
      // Reset the mock
      handler.mockClear();
      
      // Mock confirmation count at the second milestone
      mockApiService.getConfirmationCount.mockResolvedValueOnce(50000);
      
      // Check confirmations again
      await tracker.checkConfirmations();
      
      // Verify the handler was called with the second milestone
      expect(handler).toHaveBeenCalledTimes(1);
      expect(handler.mock.calls[0][0].threshold).toBe(50000);
    });
  });
});
"@

Set-Content -Path $confirmationTrackerTestFile -Value $confirmationTrackerTestContent

Write-Host "Bitcoin Integration Tests implementation continued! Second part complete." -ForegroundColor Green
