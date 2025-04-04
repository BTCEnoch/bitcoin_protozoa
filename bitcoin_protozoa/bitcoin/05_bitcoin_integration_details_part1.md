# Bitcoin Integration Details - Part 1: Data Structures and API

This document details the technical implementation of Bitcoin integration in the Bitcoin Protozoa project, focusing on data structures and API integration.

## Table of Contents

1. [Overview](#overview)
2. [Data Structures](#data-structures)
3. [API Integration](#api-integration)
4. [Data Validation](#data-validation)
5. [Caching Strategy](#caching-strategy)
6. [Related Documents](#related-documents)

## Overview

This document provides the technical implementation details for the Bitcoin integration in the Bitcoin Protozoa project. It focuses on the data structures and API integration aspects of the implementation.

## Data Structures

### Block Data Schema

The application uses the following data structures for Bitcoin block data:

```typescript
// Full Bitcoin block data schema (from API)
interface BitcoinBlockData {
  // Basic block information
  hash: string;           // Block hash
  height: number;         // Block height/number
  nonce: number;          // Block nonce (used for RNG seeding)
  time: number;           // Block timestamp
  
  // Confirmation data
  confirmations: number;  // Number of confirmations
}

// Simplified block data (used internally)
interface BlockInfo {
  blockNumber: number;    // Block height
  nonce: number;          // Block nonce (used for RNG)
  confirmations: number;  // Confirmation count (used for evolution)
}
```

### Mutation Data Schema

The application uses the following data structures for mutation tracking:

```typescript
// Mutation event
interface MutationEvent {
  type: MutationType;     // Type of mutation
  rarity: Rarity;         // Rarity level
  groupId: string;        // Affected group ID
  timestamp: number;      // When mutation occurred
  milestone: number;      // Confirmation milestone
  details: {              // Mutation details
    oldValue: any;        // Previous value
    newValue: any;        // New value
    [key: string]: any;   // Additional details
  };
}

// Mutation types
enum MutationType {
  ATTRIBUTE_BOOST = 'attribute_boost',
  TYPE_CHANGE = 'type_change',
  COUNT_INCREASE = 'count_increase',
  GROUP_SPLIT = 'group_split'
}

// Rarity levels
enum Rarity {
  COMMON = 'common',
  UNCOMMON = 'uncommon',
  RARE = 'rare',
  EPIC = 'epic',
  LEGENDARY = 'legendary',
  MYTHIC = 'mythic'
}
```

### Evolution State Schema

The application uses the following data structure to track evolution state:

```typescript
// Evolution state
interface EvolutionState {
  version: number;                // State version
  confirmations: number;          // Current confirmations
  mutationHistory: MutationEvent[]; // History of mutations
  lastMutation?: MutationEvent;   // Most recent mutation
}
```

## API Integration

### API Endpoints

The application uses the following API endpoints:

```typescript
// Development environment
const devBlockInfoEndpoint = `https://ordinals.com/r/blockinfo/${blockNumber}`;
const devContentEndpoint = `https://ordinals.com/content/${inscriptionID}`;

// Production environment
const prodBlockInfoEndpoint = `/r/blockinfo/${blockNumber}`;
const prodContentEndpoint = `/content/${inscriptionID}`;
```

### API Service Implementation

The Bitcoin API service is implemented as follows:

```typescript
/**
 * Bitcoin API service
 */
class BitcoinAPIService {
  // API endpoints
  private devEndpoint = 'https://ordinals.com/r/blockinfo';
  private prodEndpoint = '/r/blockinfo';
  
  // Cache settings
  private cache: Map<string, { data: any, timestamp: number }> = new Map();
  private cacheExpiry: number = 60000; // 1 minute cache for most data
  private confirmationCacheExpiry: number = 5000; // 5 seconds for confirmation data
  
  /**
   * Get block data by height
   */
  async getBlockByHeight(height: number): Promise<BlockInfo> {
    const cacheKey = `block-${height}`;
    
    // Check cache first
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.cacheExpiry) {
      return cached.data;
    }
    
    try {
      // Use appropriate endpoint based on environment
      const endpoint = process.env.NODE_ENV === 'development' 
        ? `${this.devEndpoint}/${height}`
        : `${this.prodEndpoint}/${height}`;
      
      const response = await fetch(endpoint);
      
      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }
      
      const blockData = await response.json();
      
      // Extract only the needed data
      const blockInfo: BlockInfo = {
        blockNumber: height,
        nonce: blockData.nonce,
        confirmations: blockData.confirmations
      };
      
      // Cache the result
      this.cache.set(cacheKey, {
        data: blockInfo,
        timestamp: Date.now()
      });
      
      return blockInfo;
    } catch (error) {
      console.error(`Failed to fetch block ${height}:`, error);
      throw new Error(`Failed to fetch block ${height}: ${error.message}`);
    }
  }
  
  /**
   * Get confirmation count for a block
   */
  async getConfirmationCount(height: number): Promise<number> {
    const cacheKey = `confirmation-${height}`;
    
    // Check cache first (shorter expiry for confirmations)
    const cached = this.cache.get(cacheKey);
    if (cached && Date.now() - cached.timestamp < this.confirmationCacheExpiry) {
      return cached.data;
    }
    
    try {
      // Use appropriate endpoint based on environment
      const endpoint = process.env.NODE_ENV === 'development' 
        ? `${this.devEndpoint}/${height}`
        : `${this.prodEndpoint}/${height}`;
      
      const response = await fetch(endpoint);
      
      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }
      
      const blockData = await response.json();
      
      // Cache the result
      this.cache.set(cacheKey, {
        data: blockData.confirmations,
        timestamp: Date.now()
      });
      
      return blockData.confirmations;
    } catch (error) {
      console.error(`Failed to fetch confirmations for block ${height}:`, error);
      throw new Error(`Failed to fetch confirmations for block ${height}: ${error.message}`);
    }
  }
  
  /**
   * Clear cache
   */
  clearCache(): void {
    this.cache.clear();
  }
}
```

### Fetch Block Info Implementation

The core function for fetching block information:

```typescript
/**
 * Fetch block info from the API
 */
async function fetchBlockInfo(blockNumber: number): Promise<BlockInfo> {
  // Use appropriate endpoint based on environment
  const endpoint = process.env.NODE_ENV === 'development'
    ? `https://ordinals.com/r/blockinfo/${blockNumber}`
    : `/r/blockinfo/${blockNumber}`;

  const response = await fetch(endpoint);

  if (!response.ok) {
    throw new Error(`Failed to fetch block info: ${response.status}`);
  }

  const data = await response.json();

  // Only extract the nonce and confirmations
  return {
    blockNumber, // We already know this from the input
    nonce: data.nonce,
    confirmations: data.confirmations
  };
}
```

## Data Validation

### Block Data Validation

The application validates all data received from the API:

```typescript
/**
 * Validate block data
 */
function validateBlockData(data: any): { valid: boolean; errors: string[] } {
  const errors: string[] = [];
  
  // Check required fields
  const requiredFields = ['hash', 'height', 'nonce', 'confirmations'];
  for (const field of requiredFields) {
    if (data[field] === undefined) {
      errors.push(`Missing required field: ${field}`);
    }
  }
  
  // Validate nonce (32-bit unsigned integer)
  if (data.nonce !== undefined) {
    if (!Number.isInteger(data.nonce) || data.nonce < 0 || data.nonce > 4294967295) {
      errors.push('Invalid nonce: must be a 32-bit unsigned integer');
    }
  }
  
  // Validate confirmations (positive integer)
  if (data.confirmations !== undefined) {
    if (!Number.isInteger(data.confirmations) || data.confirmations < 1) {
      errors.push('Invalid confirmations: must be a positive integer');
    }
  }
  
  return {
    valid: errors.length === 0,
    errors
  };
}
```

### Error Handling

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

## Related Documents

- [Blockchain Integration](01_blockchain_integration.md) - For details on Bitcoin blockchain integration
- [Evolution Mechanics](02_evolution_mechanics.md) - For details on confirmation-based mutation system
- [RNG System](03_rng_system.md) - For details on nonce-based RNG
- [Bitcoin Integration Approach](04_bitcoin_integration_approach.md) - For details on integration strategy
- [Bitcoin Integration Details - Part 2](06_bitcoin_integration_details_part2.md) - For details on implementation code
