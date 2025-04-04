# Implement Bitcoin State Management Script
# This script implements the Bitcoin state management using Zustand
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints

Write-Host "Implementing Bitcoin State Management..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$storeDir = "$bitcoinDomainDir\store"

# Check if directories exist, create if not
if (-not (Test-Path $bitcoinDomainDir)) {
    Write-Host "Creating Bitcoin domain directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $bitcoinDomainDir -Force | Out-Null
}

if (-not (Test-Path $storeDir)) {
    Write-Host "Creating Bitcoin store directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $storeDir -Force | Out-Null
}

# Create Bitcoin store
$bitcoinStoreFile = "$storeDir\bitcoinStore.ts"
Write-Host "Creating Bitcoin store in $bitcoinStoreFile..." -ForegroundColor Yellow

$bitcoinStoreContent = @"
/**
 * Bitcoin Store
 * 
 * This store manages the Bitcoin state for the application.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */
import { create } from 'zustand';
import { BitcoinAPIService } from '../services/bitcoinApiService';
import { ConfirmationTracker } from '../services/confirmationService';
import { MilestoneEvent } from '../services/confirmationService';

/**
 * Bitcoin store state interface
 */
export interface BitcoinState {
  // Services
  apiService: BitcoinAPIService;
  confirmationTracker: ConfirmationTracker;
  
  // State
  currentBlockNumber: number;
  blockNonce: number;
  confirmations: number;
  lastMilestone: number;
  milestoneEvents: MilestoneEvent[];
  loading: boolean;
  error: string | null;
  
  // Actions
  setBlockNumber: (blockNumber: number) => Promise<void>;
  refreshConfirmations: () => Promise<void>;
  clearMilestoneEvents: () => void;
}

/**
 * Create Bitcoin store
 */
export const useBitcoinStore = create<BitcoinState>((set, get) => {
  // Create services
  const apiService = new BitcoinAPIService();
  const confirmationTracker = new ConfirmationTracker(apiService);
  
  // Add milestone event handler
  confirmationTracker.addEventListener((event) => {
    set((state) => ({
      lastMilestone: event.threshold,
      milestoneEvents: [...state.milestoneEvents, event]
    }));
  });
  
  return {
    // Services
    apiService,
    confirmationTracker,
    
    // Initial state
    currentBlockNumber: 0,
    blockNonce: 0,
    confirmations: 0,
    lastMilestone: 0,
    milestoneEvents: [],
    loading: false,
    error: null,
    
    // Actions
    setBlockNumber: async (blockNumber: number) => {
      const { confirmationTracker, apiService } = get();
      
      // Update state
      set({ loading: true, error: null, currentBlockNumber: blockNumber });
      
      try {
        // Fetch block data
        const blockData = await apiService.getBlockByHeight(blockNumber);
        
        // Update state with block data
        set({
          blockNonce: blockData.nonce,
          confirmations: blockData.confirmations,
          loading: false
        });
        
        // Start tracking the block for confirmations
        confirmationTracker.trackBlock(blockNumber);
      } catch (error) {
        // Handle error
        set({
          loading: false,
          error: `Failed to fetch block data: \${error instanceof Error ? error.message : String(error)}`
        });
      }
    },
    
    refreshConfirmations: async () => {
      const { currentBlockNumber, apiService } = get();
      
      if (currentBlockNumber === 0) {
        return;
      }
      
      try {
        // Fetch confirmation count
        const confirmations = await apiService.getConfirmationCount(currentBlockNumber);
        
        // Update state
        set({ confirmations });
      } catch (error) {
        // Handle error
        set({
          error: `Failed to refresh confirmations: \${error instanceof Error ? error.message : String(error)}`
        });
      }
    },
    
    clearMilestoneEvents: () => {
      set({ milestoneEvents: [] });
    }
  };
});

/**
 * Bitcoin store selector hooks
 */

/**
 * Use Bitcoin block data
 * @returns Bitcoin block data
 */
export const useBitcoinBlockData = () => {
  return useBitcoinStore((state) => ({
    blockNumber: state.currentBlockNumber,
    nonce: state.blockNonce,
    confirmations: state.confirmations,
    lastMilestone: state.lastMilestone,
    loading: state.loading,
    error: state.error
  }));
};

/**
 * Use Bitcoin milestone events
 * @returns Bitcoin milestone events
 */
export const useBitcoinMilestoneEvents = () => {
  return useBitcoinStore((state) => ({
    milestoneEvents: state.milestoneEvents,
    clearMilestoneEvents: state.clearMilestoneEvents
  }));
};

/**
 * Use Bitcoin actions
 * @returns Bitcoin actions
 */
export const useBitcoinActions = () => {
  return useBitcoinStore((state) => ({
    setBlockNumber: state.setBlockNumber,
    refreshConfirmations: state.refreshConfirmations
  }));
};
"@

Set-Content -Path $bitcoinStoreFile -Value $bitcoinStoreContent

# Create Bitcoin store test
$testDir = "$storeDir\__tests__"
if (-not (Test-Path $testDir)) {
    Write-Host "Creating Bitcoin store tests directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $testDir -Force | Out-Null
}

$bitcoinStoreTestFile = "$testDir\bitcoinStore.test.ts"
Write-Host "Creating Bitcoin store test in $bitcoinStoreTestFile..." -ForegroundColor Yellow

$bitcoinStoreTestContent = @"
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
"@

Set-Content -Path $bitcoinStoreTestFile -Value $bitcoinStoreTestContent

# Create index.ts
$indexFile = "$storeDir\index.ts"
Write-Host "Creating Bitcoin store index in $indexFile..." -ForegroundColor Yellow

$indexContent = @"
/**
 * Bitcoin Store Index
 * 
 * This file exports the Bitcoin store.
 */

export * from './bitcoinStore';
"@

Set-Content -Path $indexFile -Value $indexContent

Write-Host "Bitcoin State Management implementation complete!" -ForegroundColor Green
