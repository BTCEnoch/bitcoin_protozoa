# Bitcoin Integration Details - Part 2: Implementation Code

This document details the technical implementation of Bitcoin integration in the Bitcoin Protozoa project, focusing on implementation code and technical details.

## Table of Contents

1. [Overview](#overview)
2. [Caching Strategy](#caching-strategy)
3. [Confirmation Tracking](#confirmation-tracking)
4. [Error Handling](#error-handling)
5. [Module Structure](#module-structure)
6. [Related Documents](#related-documents)

## Overview

This document provides the technical implementation details for the Bitcoin integration in the Bitcoin Protozoa project. It focuses on the implementation code and technical details of the integration.

## Caching Strategy

### Cache Implementation

The application uses a two-tier caching strategy:

```typescript
/**
 * Cache implementation
 */
class BlockDataCache {
  private cache: Map<string, { data: any, timestamp: number }> = new Map();
  private blockCacheExpiry: number = 60000; // 1 minute for block data
  private confirmationCacheExpiry: number = 5000; // 5 seconds for confirmations
  
  /**
   * Get item from cache
   */
  get(key: string, confirmationOnly: boolean = false): any {
    const cached = this.cache.get(key);
    if (!cached) return null;
    
    const expiry = confirmationOnly ? this.confirmationCacheExpiry : this.blockCacheExpiry;
    if (Date.now() - cached.timestamp > expiry) {
      // Cache expired
      return null;
    }
    
    return cached.data;
  }
  
  /**
   * Set item in cache
   */
  set(key: string, data: any): void {
    this.cache.set(key, {
      data,
      timestamp: Date.now()
    });
  }
  
  /**
   * Clear cache
   */
  clear(): void {
    this.cache.clear();
  }
  
  /**
   * Remove expired items
   */
  cleanExpired(): void {
    const now = Date.now();
    for (const [key, value] of this.cache.entries()) {
      if (now - value.timestamp > this.blockCacheExpiry) {
        this.cache.delete(key);
      }
    }
  }
}
```

### Mock Data for Testing

During development and testing, mock data can be used:

```typescript
/**
 * Generate mock block data
 */
function generateMockBlockData(height: number): BlockInfo {
  // Use height as seed for deterministic randomness
  const seed = height;
  const random = seededRandom(seed);
  
  // Generate mock nonce (important for our RNG)
  const nonce = Math.floor(random() * 4294967296); // 32-bit integer
  
  // Mock confirmations based on current height
  const currentHeight = 800000; // Approximate current Bitcoin height
  const confirmations = Math.max(1, currentHeight - height + 1);
  
  return {
    blockNumber: height,
    nonce,
    confirmations
  };
}

/**
 * Seeded random number generator
 */
function seededRandom(seed: number): () => number {
  return function() {
    const x = Math.sin(seed++) * 10000;
    return x - Math.floor(x);
  };
}
```

## Confirmation Tracking

### Confirmation Tracker Implementation

The application tracks confirmation changes using a dedicated service:

```typescript
/**
 * Confirmation tracker service
 */
class ConfirmationTracker {
  private apiService: BitcoinAPIService;
  private eventEmitter: EventEmitter;
  private trackedBlocks: Map<number, number> = new Map(); // blockNumber -> last confirmation count
  private intervalId: number | null = null;
  private checkInterval: number = 60000; // 1 minute
  
  constructor(apiService: BitcoinAPIService, eventEmitter: EventEmitter) {
    this.apiService = apiService;
    this.eventEmitter = eventEmitter;
  }
  
  /**
   * Start tracking a block
   */
  trackBlock(blockNumber: number): void {
    // Add to tracked blocks
    this.trackedBlocks.set(blockNumber, 0);
    
    // Start interval if not already running
    if (this.intervalId === null) {
      this.intervalId = window.setInterval(() => this.checkConfirmations(), this.checkInterval);
    }
    
    // Initial check
    this.checkConfirmations();
  }
  
  /**
   * Stop tracking a block
   */
  stopTracking(blockNumber: number): void {
    this.trackedBlocks.delete(blockNumber);
    
    // Stop interval if no blocks are being tracked
    if (this.trackedBlocks.size === 0 && this.intervalId !== null) {
      window.clearInterval(this.intervalId);
      this.intervalId = null;
    }
  }
  
  /**
   * Check confirmations for all tracked blocks
   */
  private async checkConfirmations(): Promise<void> {
    for (const [blockNumber] of this.trackedBlocks) {
      try {
        const confirmations = await this.apiService.getConfirmationCount(blockNumber);
        const lastConfirmations = this.trackedBlocks.get(blockNumber) || 0;
        
        // Update tracked confirmations
        this.trackedBlocks.set(blockNumber, confirmations);
        
        // Emit event if confirmations changed
        if (confirmations !== lastConfirmations) {
          this.eventEmitter.emit('confirmations-changed', {
            blockNumber,
            confirmations,
            previousConfirmations: lastConfirmations
          });
        }
      } catch (error) {
        console.error(`Failed to check confirmations for block ${blockNumber}:`, error);
      }
    }
  }
  
  /**
   * Set check interval
   */
  setCheckInterval(interval: number): void {
    this.checkInterval = interval;
    
    // Restart interval if running
    if (this.intervalId !== null) {
      window.clearInterval(this.intervalId);
      this.intervalId = window.setInterval(() => this.checkConfirmations(), this.checkInterval);
    }
  }
}
```

### Confirmation Update Hook

A React hook for tracking confirmation updates:

```typescript
/**
 * Hook for tracking confirmation updates
 */
function useConfirmationUpdates(blockNumber: number): {
  confirmations: number;
  loading: boolean;
  error: Error | null;
} {
  const [confirmations, setConfirmations] = useState<number>(0);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<Error | null>(null);
  
  useEffect(() => {
    let mounted = true;
    const bitcoinService = BitcoinService.getInstance();
    
    // Initial fetch
    setLoading(true);
    bitcoinService.getConfirmations(blockNumber)
      .then(confirmations => {
        if (mounted) {
          setConfirmations(confirmations);
          setLoading(false);
        }
      })
      .catch(error => {
        if (mounted) {
          setError(error);
          setLoading(false);
        }
      });
    
    // Listen for confirmation updates
    const handleConfirmationsUpdated = (data: { blockNumber: number; confirmations: number }) => {
      if (data.blockNumber === blockNumber && mounted) {
        setConfirmations(data.confirmations);
      }
    };
    
    // Subscribe to confirmation updates
    const eventService = EventService.getInstance();
    eventService.on('bitcoin:confirmationsUpdated', handleConfirmationsUpdated);
    
    // Start tracking confirmations
    bitcoinService.trackConfirmations(blockNumber);
    
    // Cleanup
    return () => {
      mounted = false;
      eventService.off('bitcoin:confirmationsUpdated', handleConfirmationsUpdated);
      bitcoinService.stopTrackingConfirmations(blockNumber);
    };
  }, [blockNumber]);
  
  return { confirmations, loading, error };
}
```

## Error Handling

### Error Handling Implementation

The application handles API errors gracefully:

```typescript
/**
 * Fetch with error handling
 */
async function fetchWithErrorHandling(endpoint: string): Promise<any> {
  try {
    const response = await fetch(endpoint);
    
    if (!response.ok) {
      throw new Error(`HTTP error ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to fetch from ${endpoint}:`, error);
    
    // Provide user-friendly error message
    if (error.message.includes('Failed to fetch')) {
      throw new Error('Network error: Please check your internet connection');
    } else if (error.message.includes('HTTP error 404')) {
      throw new Error('Block not found: Please check the block number');
    } else if (error.message.includes('HTTP error 429')) {
      throw new Error('Rate limit exceeded: Please try again later');
    } else {
      throw new Error(`API error: ${error.message}`);
    }
  }
}
```

### Error Boundary Component

A React error boundary component for handling errors:

```typescript
/**
 * Error boundary component
 */
class BitcoinErrorBoundary extends React.Component<
  { children: React.ReactNode; fallback: React.ReactNode },
  { hasError: boolean }
> {
  constructor(props: { children: React.ReactNode; fallback: React.ReactNode }) {
    super(props);
    this.state = { hasError: false };
  }
  
  static getDerivedStateFromError(error: Error) {
    return { hasError: true };
  }
  
  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('Bitcoin integration error:', error, errorInfo);
    
    // Log error to monitoring service
    // logError('BitcoinIntegration', error, errorInfo);
  }
  
  render() {
    if (this.state.hasError) {
      return this.props.fallback;
    }
    
    return this.props.children;
  }
}
```

### Error Message Component

A component for displaying error messages:

```typescript
/**
 * Error message component
 */
function BitcoinErrorMessage({ error, onRetry }: { error: Error; onRetry?: () => void }) {
  return (
    <div className="bitcoin-error">
      <h3>Bitcoin Integration Error</h3>
      <p>{error.message}</p>
      {onRetry && (
        <button onClick={onRetry}>
          Retry
        </button>
      )}
      <p>
        If the problem persists, please try a different block number.
      </p>
    </div>
  );
}
```

## Module Structure

### Bitcoin Domain Structure

The Bitcoin integration code is organized into the following module structure:

```
domains/bitcoin/
├── index.ts                  # Public API
├── types.ts                  # Bitcoin types
├── constants.ts              # Bitcoin constants
├── hooks/                    # Bitcoin hooks
│   ├── useBlockData.ts       # Hook for block data
│   └── useConfirmations.ts   # Hook for confirmations
├── services/                 # Bitcoin services
│   ├── bitcoinService.ts     # Main Bitcoin service
│   ├── apiService.ts         # API service
│   └── confirmationTracker.ts # Confirmation tracker
├── components/               # Bitcoin components
│   ├── BlockInfo.tsx         # Block info component
│   └── ErrorBoundary.tsx     # Error boundary component
└── utils/                    # Bitcoin utilities
    ├── validation.ts         # Validation utilities
    ├── caching.ts            # Caching utilities
    └── mockData.ts           # Mock data utilities
```

### Service Registration

The Bitcoin services are registered with the application:

```typescript
/**
 * Register Bitcoin services
 */
function registerBitcoinServices() {
  // Create services
  const apiService = new BitcoinAPIService();
  const eventEmitter = new EventEmitter();
  const confirmationTracker = new ConfirmationTracker(apiService, eventEmitter);
  
  // Register services with dependency injection container
  container.register('bitcoinApiService', apiService);
  container.register('bitcoinEventEmitter', eventEmitter);
  container.register('bitcoinConfirmationTracker', confirmationTracker);
  
  // Start services
  confirmationTracker.setCheckInterval(60000); // 1 minute
  
  return {
    apiService,
    eventEmitter,
    confirmationTracker
  };
}
```

### Bitcoin Service Implementation

The main Bitcoin service implementation:

```typescript
/**
 * Bitcoin service
 */
export class BitcoinService {
  private static instance: BitcoinService;
  private apiService: BitcoinAPIService;
  private confirmationTracker: ConfirmationTracker;
  private eventService: EventService;
  
  private constructor() {
    this.apiService = new BitcoinAPIService();
    this.eventService = EventService.getInstance();
    this.confirmationTracker = new ConfirmationTracker(
      this.apiService,
      this.eventService
    );
  }
  
  /**
   * Get the singleton instance
   */
  public static getInstance(): BitcoinService {
    if (!BitcoinService.instance) {
      BitcoinService.instance = new BitcoinService();
    }
    return BitcoinService.instance;
  }
  
  /**
   * Get block data
   */
  public async getBlockData(blockNumber: number): Promise<BlockInfo> {
    return this.apiService.getBlockByHeight(blockNumber);
  }
  
  /**
   * Get confirmations
   */
  public async getConfirmations(blockNumber: number): Promise<number> {
    return this.apiService.getConfirmationCount(blockNumber);
  }
  
  /**
   * Track confirmations
   */
  public trackConfirmations(blockNumber: number): void {
    this.confirmationTracker.trackBlock(blockNumber);
  }
  
  /**
   * Stop tracking confirmations
   */
  public stopTrackingConfirmations(blockNumber: number): void {
    this.confirmationTracker.stopTracking(blockNumber);
  }
  
  /**
   * Clear cache
   */
  public clearCache(): void {
    this.apiService.clearCache();
  }
}
```

## Related Documents

- [Blockchain Integration](01_blockchain_integration.md) - For details on Bitcoin blockchain integration
- [Evolution Mechanics](02_evolution_mechanics.md) - For details on confirmation-based mutation system
- [RNG System](03_rng_system.md) - For details on nonce-based RNG
- [Bitcoin Integration Approach](04_bitcoin_integration_approach.md) - For details on integration strategy
- [Bitcoin Integration Details - Part 1](05_bitcoin_integration_details_part1.md) - For details on data structures and API
