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
          error: Failed to fetch block data: \
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
          error: Failed to refresh confirmations: \
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
