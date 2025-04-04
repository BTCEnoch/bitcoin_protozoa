# Blockchain Integration

This document outlines the integration between the Bitcoin Protozoa project and the Bitcoin blockchain, including key features, blockchain-to-particle mapping, implementation architecture, and security considerations.

## Table of Contents

1. [Key Features](#key-features)
2. [Blockchain-to-Particle Mapping](#blockchain-to-particle-mapping)
3. [Implementation Architecture](#implementation-architecture)
4. [API Integration](#api-integration)
5. [Development vs. Production](#development-vs-production)
6. [Security Considerations](#security-considerations)
7. [Related Documents](#related-documents)

## Key Features

The Bitcoin integration for Bitcoin Protozoa includes the following key features:

1. **Block Data Retrieval**: Fetching Bitcoin block data for particle generation
2. **Nonce-Based RNG**: Using block nonce as seed for deterministic RNG
3. **Confirmation Tracking**: Monitoring block confirmations for evolution triggers
4. **Ordinals Inscription**: Deploying the application as Bitcoin Ordinals inscriptions
5. **Recursive Inscriptions**: Using recursive inscriptions for code organization

## Blockchain-to-Particle Mapping

Bitcoin block data is mapped to particle properties as follows:

1. **Block Nonce**: Used as the primary seed for the RNG system
2. **Confirmations**: Used to trigger evolution events
3. **Block Number**: Only used as an identifier for the creature (not fetched from API)

Note: We ONLY use nonce and confirmations from the block data API. The block number is provided by the user and used as an identifier.

The mapping process ensures that:

1. Each Bitcoin block generates a unique, deterministic creature
2. The same block always generates the same initial creature
3. Creatures evolve deterministically based on confirmation count
4. Visual and behavioral traits are derived from block data

## Implementation Architecture

The Bitcoin integration architecture consists of the following components:

1. **Bitcoin API Service**: Handles communication with Bitcoin APIs
2. **Block Data Cache**: Caches block data to reduce API calls
3. **Confirmation Tracker**: Monitors confirmation count for evolution
4. **RNG System**: Generates deterministic random numbers from block data
5. **Evolution System**: Triggers and applies mutations based on confirmations

```typescript
// Example architecture (simplified)
interface BitcoinIntegration {
  apiService: BitcoinAPIService;
  blockDataCache: BlockDataCache;
  confirmationTracker: ConfirmationTracker;
  rngSystem: RNGSystem;
  evolutionSystem: EvolutionSystem;
}
```

## API Integration

The application integrates with the Bitcoin blockchain through the following API:

```typescript
// Bitcoin API endpoint - use ordinals.com in development, relative path in production
// Fetch block data - ONLY extract nonce and confirmations
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

// Block info interface - ONLY includes what we need
interface BlockInfo {
  blockNumber: number; // Block number (for reference only)
  nonce: number;       // Block nonce (used for RNG)
  confirmations: number; // Number of confirmations (for evolution)
}
```

The API integration follows these principles:

1. **Minimal Data**: Only fetch the data needed for the application
2. **Caching**: Cache block data to reduce API calls
3. **Error Handling**: Handle API errors gracefully with clear user feedback
4. **Single API Source**: Use only the ordinals.com API with no fallbacks
5. **Rate Limiting**: Respect API rate limits

## Development vs. Production

The Bitcoin integration differs between development and production environments:

### Development Environment

1. **Mock Data**: Option to use mock Bitcoin data for testing
2. **Local Caching**: Aggressive caching to reduce API calls
3. **Confirmation Simulation**: Ability to simulate confirmation increases
4. **Debug Tools**: Additional tools for debugging Bitcoin integration
5. **Development API**: Use https://ordinals.com/r/blockinfo/${blockNumber} for development

### Production Environment

1. **Ordinals API**: Use only /r/blockinfo/${blockNumber} in production
2. **Minimal Requests**: Minimize API requests to reduce load
3. **Robust Error Handling**: Enhanced error handling for production
4. **Optimized Caching**: Optimized caching strategy
5. **User Feedback**: Clear feedback for API-related issues

## Security Considerations

The Bitcoin integration includes the following security considerations:

1. **Data Validation**: Validate all data received from the ordinals.com API
2. **Error Handling**: Handle errors gracefully with clear user feedback
3. **Rate Limiting**: Respect API rate limits to prevent blocking
4. **Graceful Degradation**: Display appropriate error messages when API calls fail
5. **User Privacy**: Respect user privacy in API requests

## Related Documents

- [Evolution Mechanics](02_evolution_mechanics.md) - For details on confirmation-based evolution
- [RNG System](../core/03_module_structure.md) - For details on nonce-based RNG
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on Ordinals inscription
