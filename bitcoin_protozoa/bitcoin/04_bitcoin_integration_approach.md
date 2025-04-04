# Bitcoin Integration Approach

This document outlines the approach for integrating the Bitcoin Protozoa project with the Bitcoin blockchain, including integration strategy, API usage, data retrieval, error handling, and security considerations.

## Table of Contents

1. [Overview](#overview)
2. [Integration Strategy](#integration-strategy)
3. [API Usage](#api-usage)
4. [Data Retrieval](#data-retrieval)
5. [Error Handling](#error-handling)
6. [Security Considerations](#security-considerations)
7. [Related Documents](#related-documents)

## Overview

The Bitcoin Protozoa project is fully integrated with the Bitcoin blockchain, using block data for deterministic creature generation and confirmation counts for evolution. This document outlines the approach for this integration, ensuring reliability, security, and performance.

## Integration Strategy

### Bitcoin-Only Approach

Bitcoin Protozoa follows a Bitcoin-only approach, meaning:

1. **Immutable Deployment**: Once inscribed, the codebase is permanently stored on Bitcoin and cannot be modified
2. **Recursive Inscription Structure**: The application uses recursive inscriptions to reference dependencies
3. **No External Dependencies**: All runtime dependencies are sourced from Bitcoin inscriptions
4. **Bitcoin as Server**: Bitcoin network serves as the hosting infrastructure

### Core Integration Components

The Bitcoin integration architecture consists of the following components:

```
┌─────────────────────────────────────────────────┐
│              Bitcoin Integration                 │
├─────────┬─────────┬─────────────┬───────────────┤
│  API    │  Block  │Confirmation │    RNG        │
│ Service │  Cache  │  Tracker    │   System      │
└─────────┴─────────┴─────────────┴───────────────┘
      │         │          │             │
      ▼         ▼          ▼             ▼
┌─────────┐┌─────────┐┌─────────────┐┌───────────────┐
│ Fetch   ││ Store   ││ Monitor     ││ Generate      │
│ Block   ││ Block   ││ Confirmation││ Random        │
│ Data    ││ Data    ││ Changes     ││ Numbers       │
└─────────┘└─────────┘└─────────────┘└───────────────┘
```

1. **Bitcoin API Service**: Handles communication with Bitcoin APIs
2. **Block Data Cache**: Caches block data to reduce API calls
3. **Confirmation Tracker**: Monitors confirmation count for evolution
4. **RNG System**: Generates deterministic random numbers from block data

### Integration Flow

The integration flow follows these steps:

1. **User Input**: User enters a Bitcoin block number
2. **Block Data Retrieval**: System fetches block data from the ordinals.com API
3. **Data Extraction**: System extracts nonce and confirmations from the block data
4. **RNG Initialization**: RNG system is initialized with the block nonce
5. **Creature Generation**: Creature is generated using the RNG system
6. **Confirmation Tracking**: System periodically checks for confirmation updates
7. **Evolution Triggers**: Evolution is triggered based on confirmation milestones

## API Usage

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

### API Restrictions

The application follows these API usage restrictions:

1. **Ordinals.com Only**: Only the ordinals.com API is used for block data
2. **Minimal Data**: Only nonce and confirmations are extracted from block data
3. **No Fallback APIs**: No alternative APIs are used if ordinals.com is unavailable
4. **Rate Limiting**: API calls are rate-limited to prevent abuse
5. **Caching**: Aggressive caching is used to reduce API calls

### API Service Implementation

```typescript
class BitcoinAPIService {
  // Use only the Ordinals.com API
  private devEndpoint = 'https://ordinals.com/r/blockinfo';
  private prodEndpoint = '/r/blockinfo';
  private cache: Map<string, { data: any, timestamp: number }> = new Map();
  private cacheExpiry: number = 60000; // 1 minute cache for most data
  private confirmationCacheExpiry: number = 5000; // 5 seconds for confirmation data
  
  // Get block data by height
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
  
  // Get confirmation count for a block
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
}
```

## Data Retrieval

### Block Data Structure

The application uses the following block data structure:

```typescript
interface BlockInfo {
  blockNumber: number; // Block height
  nonce: number;       // Block nonce (used for RNG)
  confirmations: number; // Confirmation count (used for evolution)
}
```

### Data Extraction

Only the nonce and confirmations are extracted from the block data:

```typescript
// Extract only the needed data
const blockInfo: BlockInfo = {
  blockNumber: height,
  nonce: blockData.nonce,
  confirmations: blockData.confirmations
};
```

### Caching Strategy

The application uses a two-tier caching strategy:

1. **Block Data Cache**: Caches block data for 1 minute
2. **Confirmation Cache**: Caches confirmation data for 5 seconds

```typescript
// Cache settings
private cacheExpiry: number = 60000; // 1 minute cache for most data
private confirmationCacheExpiry: number = 5000; // 5 seconds for confirmation data
```

### Mock Data for Testing

During development and testing, mock data can be used:

```typescript
// Generate a mock block
private generateMockBlock(height: number): BlockInfo {
  // Use height as seed for deterministic randomness
  const seed = height;
  const random = this.seededRandom(seed);
  
  // Generate mock nonce (important for our RNG)
  const nonce = Math.floor(random() * 4294967296); // 32-bit integer
  
  return {
    blockNumber: height,
    nonce,
    confirmations: this.currentHeight - height + 1
  };
}

// Seeded random number generator
private seededRandom(seed: number): () => number {
  return function() {
    const x = Math.sin(seed++) * 10000;
    return x - Math.floor(x);
  };
}
```

## Error Handling

### Error Handling Approach

The application follows a comprehensive error handling approach:

1. **Prevention First**: Prevent errors through thorough validation
2. **Graceful Degradation**: Degrade gracefully rather than crashing
3. **Informative Feedback**: Provide clear, helpful information to users
4. **Recovery When Possible**: Attempt to recover from errors when feasible

### API Error Handling

API errors are handled as follows:

```typescript
try {
  // API call
  const response = await fetch(endpoint);
  
  if (!response.ok) {
    throw new Error(`HTTP error ${response.status}`);
  }
  
  // Process response
} catch (error) {
  // Log error
  console.error(`Failed to fetch block ${height}:`, error);
  
  // Provide user feedback
  throw new Error(`Failed to fetch block ${height}: ${error.message}`);
}
```

### Error Recovery Strategies

The application implements the following error recovery strategies:

1. **Cache Fallback**: Use cached data if available
2. **Mock Data**: Use mock data for testing and development
3. **Retry Mechanism**: Retry failed API calls with exponential backoff
4. **User Feedback**: Provide clear error messages to users
5. **Graceful Degradation**: Continue with limited functionality when possible

### User Feedback

The application provides clear feedback to users when errors occur:

1. **Error Messages**: Clear, concise error messages
2. **Loading States**: Visual indicators for loading states
3. **Recovery Options**: Options for users to retry or use alternative approaches
4. **Contextual Help**: Contextual help for common errors

## Security Considerations

### Data Validation

All data received from the ordinals.com API is validated:

```typescript
// Validate block data
function validateBlockData(data: any): boolean {
  // Check if data exists
  if (!data) return false;
  
  // Check if nonce exists and is a number
  if (typeof data.nonce !== 'number') return false;
  
  // Check if confirmations exists and is a number
  if (typeof data.confirmations !== 'number') return false;
  
  return true;
}
```

### Rate Limiting

API calls are rate-limited to prevent abuse:

```typescript
// Rate limiting
private lastApiCall: number = 0;
private minApiCallInterval: number = 1000; // 1 second

async fetchWithRateLimit(endpoint: string): Promise<any> {
  // Check if we need to wait
  const now = Date.now();
  const timeSinceLastCall = now - this.lastApiCall;
  
  if (timeSinceLastCall < this.minApiCallInterval) {
    // Wait for the remaining time
    await new Promise(resolve => setTimeout(resolve, this.minApiCallInterval - timeSinceLastCall));
  }
  
  // Update last API call time
  this.lastApiCall = Date.now();
  
  // Make the API call
  return fetch(endpoint);
}
```

### Error Logging

Errors are logged for debugging and monitoring:

```typescript
// Log error
console.error(`Failed to fetch block ${height}:`, error);

// In production, we might use a more sophisticated logging system
if (process.env.NODE_ENV === 'production') {
  logError('BitcoinAPIService', `Failed to fetch block ${height}`, error);
}
```

### User Privacy

User privacy is respected in API requests:

1. **Minimal Data**: Only necessary data is requested
2. **No User Data**: No user data is sent to the API
3. **Local Storage**: User preferences are stored locally
4. **No Tracking**: No tracking or analytics are used

### Content Security

Content security is ensured through:

1. **Subresource Integrity**: Verify integrity of loaded resources
2. **Content Verification**: Validate content before execution
3. **Error Handling**: Handle loading errors gracefully
4. **User Feedback**: Provide clear feedback for security issues

## Related Documents

- [Blockchain Integration](01_blockchain_integration.md) - For details on Bitcoin blockchain integration
- [Evolution Mechanics](02_evolution_mechanics.md) - For details on confirmation-based mutation system
- [RNG System](03_rng_system.md) - For details on nonce-based RNG
- [Bitcoin Integration Details](05_bitcoin_integration_details.md) - For details on technical implementation
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on Ordinals inscription
