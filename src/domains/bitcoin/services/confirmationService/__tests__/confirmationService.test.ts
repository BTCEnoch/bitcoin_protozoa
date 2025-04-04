/**
 * Confirmation Service Tests
 * 
 * Tests for the Bitcoin confirmation tracking service.
 */
import { ConfirmationTracker } from '../index';
import { BlockService } from '../../blockService';
import { MilestoneEvent } from '../types';

// Mock BlockService
jest.mock('../../blockService');

describe('ConfirmationTracker', () => {
  let confirmationTracker: ConfirmationTracker;
  let mockBlockService: jest.Mocked<BlockService>;
  
  beforeEach(() => {
    // Reset mocks
    jest.resetAllMocks();
    
    // Create mock BlockService
    mockBlockService = new BlockService() as jest.Mocked<BlockService>;
    
    // Mock getConfirmationCount method
    mockBlockService.getConfirmationCount = jest.fn();
    
    // Create a new instance for each test with a short check interval
    confirmationTracker = new ConfirmationTracker({
      blockService: mockBlockService,
      checkInterval: 100 // 100ms for faster tests
    });
    
    // Mock setInterval and clearInterval
    jest.useFakeTimers();
  });
  
  afterEach(() => {
    // Stop checking to prevent interval from continuing
    confirmationTracker.stopChecking();
    
    // Restore timers
    jest.useRealTimers();
  });
  
  describe('trackBlock', () => {
    it('should start tracking a block', async () => {
      // Mock confirmation count
      mockBlockService.getConfirmationCount.mockResolvedValue(1000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Verify the block is being tracked
      expect(confirmationTracker.getTrackedBlocks().has(12345)).toBe(true);
      
      // Verify getConfirmationCount was called
      expect(mockBlockService.getConfirmationCount).toHaveBeenCalledWith(12345);
    });
    
    it('should start periodic checking', () => {
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Advance timers
      jest.advanceTimersByTime(100);
      
      // Verify getConfirmationCount was called again
      expect(mockBlockService.getConfirmationCount).toHaveBeenCalledTimes(2);
    });
  });
  
  describe('untrackBlock', () => {
    it('should stop tracking a block', () => {
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Untrack the block
      confirmationTracker.untrackBlock(12345);
      
      // Verify the block is no longer being tracked
      expect(confirmationTracker.getTrackedBlocks().has(12345)).toBe(false);
    });
    
    it('should stop checking if no blocks are being tracked', () => {
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Untrack the block
      confirmationTracker.untrackBlock(12345);
      
      // Reset the mock
      mockBlockService.getConfirmationCount.mockClear();
      
      // Advance timers
      jest.advanceTimersByTime(100);
      
      // Verify getConfirmationCount was not called again
      expect(mockBlockService.getConfirmationCount).not.toHaveBeenCalled();
    });
  });
  
  describe('addEventListener', () => {
    it('should add an event handler', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      confirmationTracker.addEventListener(handler);
      
      // Mock confirmation count at a milestone
      mockBlockService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
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
  });
  
  describe('removeEventListener', () => {
    it('should remove an event handler', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      confirmationTracker.addEventListener(handler);
      
      // Remove the event handler
      confirmationTracker.removeEventListener(handler);
      
      // Mock confirmation count at a milestone
      mockBlockService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the handler was not called
      expect(handler).not.toHaveBeenCalled();
    });
  });
  
  describe('checkConfirmations', () => {
    it('should check confirmations for all tracked blocks', async () => {
      // Mock confirmation counts
      mockBlockService.getConfirmationCount
        .mockResolvedValueOnce(1000) // First call for block 12345
        .mockResolvedValueOnce(2000); // First call for block 67890
      
      // Track two blocks
      confirmationTracker.trackBlock(12345);
      confirmationTracker.trackBlock(67890);
      
      // Wait for the checks to complete
      await Promise.resolve();
      
      // Verify getConfirmationCount was called for both blocks
      expect(mockBlockService.getConfirmationCount).toHaveBeenCalledWith(12345);
      expect(mockBlockService.getConfirmationCount).toHaveBeenCalledWith(67890);
      
      // Verify the tracked confirmation counts
      expect(confirmationTracker.getTrackedBlocks().get(12345)).toBe(1000);
      expect(confirmationTracker.getTrackedBlocks().get(67890)).toBe(2000);
    });
    
    it('should handle API errors gracefully', async () => {
      // Mock a failed API call
      mockBlockService.getConfirmationCount.mockRejectedValue(new Error('API error'));
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the block is still being tracked
      expect(confirmationTracker.getTrackedBlocks().has(12345)).toBe(true);
    });
  });
  
  describe('milestone detection', () => {
    it('should detect when a block reaches a milestone', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      confirmationTracker.addEventListener(handler);
      
      // Mock confirmation count at a milestone
      mockBlockService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
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
      confirmationTracker.addEventListener(handler);
      
      // Mock confirmation count at a milestone
      mockBlockService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Reset the mock
      handler.mockClear();
      
      // Check confirmations again
      await confirmationTracker.checkConfirmations();
      
      // Verify the handler was not called again
      expect(handler).not.toHaveBeenCalled();
    });
    
    it('should trigger higher milestones after lower ones', async () => {
      // Create a mock event handler
      const handler = jest.fn();
      
      // Add the event handler
      confirmationTracker.addEventListener(handler);
      
      // Mock confirmation count at the first milestone
      mockBlockService.getConfirmationCount.mockResolvedValueOnce(10000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the handler was called with the first milestone
      expect(handler).toHaveBeenCalledTimes(1);
      expect(handler.mock.calls[0][0].threshold).toBe(10000);
      
      // Reset the mock
      handler.mockClear();
      
      // Mock confirmation count at the second milestone
      mockBlockService.getConfirmationCount.mockResolvedValueOnce(50000);
      
      // Check confirmations again
      await confirmationTracker.checkConfirmations();
      
      // Verify the handler was called with the second milestone
      expect(handler).toHaveBeenCalledTimes(1);
      expect(handler.mock.calls[0][0].threshold).toBe(50000);
    });
  });
  
  describe('getLastMilestone', () => {
    it('should return the last milestone reached for a block', async () => {
      // Mock confirmation count at a milestone
      mockBlockService.getConfirmationCount.mockResolvedValue(10000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the last milestone
      expect(confirmationTracker.getLastMilestone(12345)).toBe(10000);
    });
    
    it('should return 0 for a block that hasn\'t reached any milestones', async () => {
      // Mock confirmation count below any milestone
      mockBlockService.getConfirmationCount.mockResolvedValue(1000);
      
      // Track a block
      confirmationTracker.trackBlock(12345);
      
      // Wait for the check to complete
      await Promise.resolve();
      
      // Verify the last milestone
      expect(confirmationTracker.getLastMilestone(12345)).toBe(0);
    });
  });
  
  describe('getMilestones', () => {
    it('should return all milestone definitions', () => {
      const milestones = confirmationTracker.getMilestones();
      
      // Verify the milestones
      expect(milestones).toHaveLength(6);
      expect(milestones[0].threshold).toBe(1000000);
      expect(milestones[5].threshold).toBe(10000);
    });
  });
});
