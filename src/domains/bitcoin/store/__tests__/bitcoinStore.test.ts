/**
 * Bitcoin Store Tests
 * 
 * Tests for the Bitcoin store.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */
import { renderHook, act } from '@testing-library/react-hooks';
import { useBitcoinStore, useBitcoinBlockData, useBitcoinMilestoneEvents, useBitcoinActions } from '../bitcoinStore';

// Mock the BitcoinAPIService
jest.mock('../../services/bitcoinApiService', () => {
  return {
    BitcoinAPIService: jest.fn().mockImplementation(() => ({
      getBlockByHeight: jest.fn(),
      getConfirmationCount: jest.fn()
    }))
  };
});

// Mock the ConfirmationTracker
jest.mock('../../services/confirmationService', () => {
  return {
    ConfirmationTracker: jest.fn().mockImplementation(() => ({
      addEventListener: jest.fn(),
      trackBlock: jest.fn(),
      untrackBlock: jest.fn()
    }))
  };
});

describe('Bitcoin Store', () => {
  beforeEach(() => {
    // Reset the store
    const { getState } = useBitcoinStore;
    const { apiService, confirmationTracker } = getState();
    
    // Reset mocks
    jest.clearAllMocks();
    
    // Reset state
    act(() => {
      useBitcoinStore.setState({
        currentBlockNumber: 0,
        blockNonce: 0,
        confirmations: 0,
        lastMilestone: 0,
        milestoneEvents: [],
        loading: false,
        error: null,
        apiService,
        confirmationTracker
      });
    });
  });
  
  describe('setBlockNumber', () => {
    it('should fetch block data and update state', async () => {
      // Mock successful API response
      const mockBlockData = {
        blockNumber: 12345,
        nonce: 123456789,
        confirmations: 1000
      };
      
      const { getState } = useBitcoinStore;
      const { apiService, confirmationTracker } = getState();
      
      // Mock getBlockByHeight
      (apiService.getBlockByHeight as jest.Mock).mockResolvedValue(mockBlockData);
      
      // Render the hook
      const { result, waitForNextUpdate } = renderHook(() => useBitcoinActions());
      
      // Call setBlockNumber
      act(() => {
        result.current.setBlockNumber(12345);
      });
      
      // Wait for the async action to complete
      await waitForNextUpdate();
      
      // Verify state was updated
      expect(getState().currentBlockNumber).toBe(12345);
      expect(getState().blockNonce).toBe(123456789);
      expect(getState().confirmations).toBe(1000);
      expect(getState().loading).toBe(false);
      expect(getState().error).toBeNull();
      
      // Verify API was called
      expect(apiService.getBlockByHeight).toHaveBeenCalledWith(12345);
      
      // Verify tracker was called
      expect(confirmationTracker.trackBlock).toHaveBeenCalledWith(12345);
    });
    
    it('should handle API errors', async () => {
      const { getState } = useBitcoinStore;
      const { apiService } = getState();
      
      // Mock API error
      (apiService.getBlockByHeight as jest.Mock).mockRejectedValue(new Error('API error'));
      
      // Render the hook
      const { result, waitForNextUpdate } = renderHook(() => useBitcoinActions());
      
      // Call setBlockNumber
      act(() => {
        result.current.setBlockNumber(12345);
      });
      
      // Wait for the async action to complete
      await waitForNextUpdate();
      
      // Verify error state
      expect(getState().loading).toBe(false);
      expect(getState().error).toBe('Failed to fetch block data: API error');
    });
  });
  
  describe('refreshConfirmations', () => {
    it('should fetch confirmation count and update state', async () => {
      const { getState } = useBitcoinStore;
      const { apiService } = getState();
      
      // Set initial state
      act(() => {
        useBitcoinStore.setState({ currentBlockNumber: 12345 });
      });
      
      // Mock getConfirmationCount
      (apiService.getConfirmationCount as jest.Mock).mockResolvedValue(2000);
      
      // Render the hook
      const { result, waitForNextUpdate } = renderHook(() => useBitcoinActions());
      
      // Call refreshConfirmations
      act(() => {
        result.current.refreshConfirmations();
      });
      
      // Wait for the async action to complete
      await waitForNextUpdate();
      
      // Verify state was updated
      expect(getState().confirmations).toBe(2000);
      
      // Verify API was called
      expect(apiService.getConfirmationCount).toHaveBeenCalledWith(12345);
    });
  });
  
  describe('clearMilestoneEvents', () => {
    it('should clear milestone events', () => {
      const { getState } = useBitcoinStore;
      
      // Set initial state with some milestone events
      act(() => {
        useBitcoinStore.setState({
          milestoneEvents: [
            { blockNumber: 12345, threshold: 10000, confirmations: 10000, timestamp: Date.now(), chance: 0.01, rarities: ['common'] }
          ]
        });
      });
      
      // Render the hook
      const { result } = renderHook(() => useBitcoinMilestoneEvents());
      
      // Call clearMilestoneEvents
      act(() => {
        result.current.clearMilestoneEvents();
      });
      
      // Verify state was updated
      expect(getState().milestoneEvents).toEqual([]);
    });
  });
});
