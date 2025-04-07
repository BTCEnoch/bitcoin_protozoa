# bitcoin DOCUMENTATION 
 
This document contains all the content from the bitcoin subdirectory of the Bitcoin Protozoa project. 
 
## Files 
 
### 00_summary.md 
 
```.md 
# Bitcoin Integration Summary

This directory contains documentation on the Bitcoin blockchain integration and evolution mechanics for the Bitcoin Protozoa project.

## Key Documents

- [Blockchain Integration](01_blockchain_integration.md) - Bitcoin blockchain integration approach
- [Evolution Mechanics](02_evolution_mechanics.md) - Confirmation-based mutation system
- [RNG System](03_rng_system.md) - Deterministic random number generation
- [Bitcoin Integration Approach](04_bitcoin_integration_approach.md) - Integration strategy and API usage
- [Bitcoin Integration Details - Part 1](05_bitcoin_integration_details_part1.md) - Data structures and API integration
- [Bitcoin Integration Details - Part 2](06_bitcoin_integration_details_part2.md) - Implementation code and technical details

## Bitcoin Integration Overview

The Bitcoin Protozoa project integrates with the Bitcoin blockchain in several ways:

1. **Block Data Retrieval**: Fetching Bitcoin block data for particle generation
2. **Nonce-Based RNG**: Using block nonce as seed for deterministic RNG
3. **Confirmation Tracking**: Monitoring block confirmations for evolution triggers
4. **Ordinals Inscription**: Deploying the application as Bitcoin Ordinals inscriptions
5. **Recursive Inscriptions**: Using recursive inscriptions for code organization

## Evolution Mechanics

The evolution mechanics system enables Bitcoin Protozoa to evolve based on blockchain confirmations:

1. **Confirmation Milestones**: Evolution triggers at specific confirmation counts
2. **Mutation System**: Random mutations based on confirmation milestones
3. **Rarity System**: Tiered rarity system for mutations
4. **Group Selection**: Selection of particle groups for mutation
5. **Multi-Group Mutations**: Mutations affecting multiple particle groups

## Confirmation Milestones

Evolution is triggered at specific confirmation milestones:

1. **10,000 Confirmations**: ~70 days (Common mutations)
2. **50,000 Confirmations**: ~347 days (Uncommon mutations)
3. **100,000 Confirmations**: ~694 days (Rare mutations)
4. **250,000 Confirmations**: ~1,736 days (Epic mutations)
5. **500,000 Confirmations**: ~3,472 days (Legendary mutations)
6. **1,000,000 Confirmations**: ~6,944 days (Mythic mutations)

## Ordinals Deployment

The application is deployed on Bitcoin using the Ordinals protocol:

1. **Build Optimization**: Optimizing code for inscription
2. **Chunk Preparation**: Splitting the application into optimal chunks
3. **Inscription Order**: Planning the order of inscriptions
4. **Recursive Loading**: Loading dependencies using recursive inscriptions
5. **Fallback Mechanisms**: Handling inscription loading failures

## Related Documentation

- [Development Workflow](../deployment/01_development_workflow.md) - For details on development process
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on deployment process
- [RNG System](03_rng_system.md) - For details on nonce-based RNG
 
``` 
 
--- 
 
### 01_blockchain_integration.md 
 
```.md 
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
 
``` 
 
--- 
 
### 02_evolution_mechanics.md 
 
```.md 
# Evolution Mechanics

This document outlines the mutation-based evolution mechanics for Bitcoin Protozoa creatures based on Bitcoin block confirmations. These mechanics allow creatures to evolve and change over time as their associated Bitcoin blocks gain more confirmations.

## Table of Contents

1. [Core Concept](#core-concept)
2. [Confirmation-Based Mutation System](#confirmation-based-mutation-system)
3. [Mutation Types](#mutation-types)
4. [Rarity System](#rarity-system)
5. [Group Selection and Multi-Group Mutations](#group-selection-and-multi-group-mutations)
6. [Implementation Considerations](#implementation-considerations)
7. [Testing Approach](#testing-approach)
8. [Implementation Plan](#implementation-plan)
9. [Related Documents](#related-documents)

## Core Concept

As a Bitcoin block gains more confirmations, its associated particle creature will have opportunities to mutate at specific confirmation milestones. Each milestone has a small percentage chance to trigger a mutation event, with the rarity of potential mutations determined by the milestone level. This creates a dynamic, living ecosystem where creatures age with Bitcoin and develop unique characteristics over time.

## Confirmation-Based Mutation System

### Mutation Milestones

Mutations will be checked at specific confirmation thresholds:

1. **10,000 Confirmations Milestone**
   - 1% chance for mutation
   - All rarities available (Common to Mythic)
   - Occurs approximately every 10,000 blocks (~70 days)

2. **50,000 Confirmations Milestone**
   - 5% chance for mutation
   - Uncommon to Mythic rarities available
   - Occurs approximately every 50,000 blocks (~347 days)

3. **100,000 Confirmations Milestone**
   - 10% chance for mutation
   - Rare to Mythic rarities available
   - Occurs approximately every 100,000 blocks (~694 days)

4. **250,000 Confirmations Milestone**
   - 25% chance for mutation
   - Epic to Mythic rarities available
   - Occurs approximately every 250,000 blocks (~1,736 days)

5. **500,000 Confirmations Milestone**
   - 50% chance for mutation
   - Legendary to Mythic rarities available
   - Occurs approximately every 500,000 blocks (~3,472 days)

6. **1,000,000 Confirmations Milestone**
   - 100% chance for mutation
   - Mythic rarity only
   - Occurs approximately every 1,000,000 blocks (~6,944 days)

### Implementation Approach

```typescript
interface EvolutionState {
  version: number;
  confirmations: number;
  mutationHistory: MutationEvent[];
  lastMutation?: MutationEvent;
}

interface MutationEvent {
  type: MutationType;
  rarity: Rarity;
  groupId: string;
  timestamp: number;
  milestone: number;
  details: {
    oldValue: any;
    newValue: any;
    [key: string]: any;
  };
}

enum MutationType {
  ATTRIBUTE_BOOST = 'attribute_boost',
  TYPE_CHANGE = 'type_change',
  COUNT_INCREASE = 'count_increase',
  GROUP_SPLIT = 'group_split'
}

enum Rarity {
  COMMON = 'common',
  UNCOMMON = 'uncommon',
  RARE = 'rare',
  EPIC = 'epic',
  LEGENDARY = 'legendary',
  MYTHIC = 'mythic'
}

class MutationSystem {
  private rng: () => number;
  private lastProcessedNonce: number | null = null;

  constructor() {
    this.rng = getRNG('mutations');
  }

  public checkMilestoneEvolution(
    traits: Record<string, Trait>,
    confirmations: number
  ): { traits: Record<string, Trait>; event?: MutationEvent } {
    // Check if we've hit a milestone
    const milestone = this.determineMilestone(confirmations);
    if (!milestone) {
      return { traits };
    }

    // Roll for mutation chance
    if (!this.rollForMutation(milestone.chance)) {
      return { traits };
    }

    // Determine rarity based on milestone
    const rarity = this.determineRarity(milestone.rarities);

    // Choose mutation type
    const mutationType = this.determineMutationType(rarity);

    // Select target group
    const groupId = this.selectRandomGroup(traits);

    // Apply mutation
    const { updatedTraits, details } = this.applyMutation(
      traits,
      mutationType,
      rarity,
      groupId
    );

    // Create mutation event
    const event: MutationEvent = {
      type: mutationType,
      rarity,
      groupId,
      timestamp: Date.now(),
      milestone: milestone.threshold,
      details
    };

    return { traits: updatedTraits, event };
  }

  private determineMilestone(confirmations: number): { threshold: number; chance: number; rarities: Rarity[] } | null {
    // Check highest milestones first for efficiency
    if (confirmations >= 1000000 && confirmations % 1000000 === 0) {
      return {
        threshold: 1000000,
        chance: 1.0, // 100% chance
        rarities: [Rarity.MYTHIC]
      };
    }
    if (confirmations >= 500000 && confirmations % 500000 === 0) {
      return {
        threshold: 500000,
        chance: 0.5, // 50% chance
        rarities: [Rarity.LEGENDARY, Rarity.MYTHIC]
      };
    }
    if (confirmations >= 250000 && confirmations % 250000 === 0) {
      return {
        threshold: 250000,
        chance: 0.25, // 25% chance
        rarities: [Rarity.EPIC, Rarity.LEGENDARY, Rarity.MYTHIC]
      };
    }
    if (confirmations >= 100000 && confirmations % 100000 === 0) {
      return {
        threshold: 100000,
        chance: 0.1, // 10% chance
        rarities: [Rarity.RARE, Rarity.EPIC, Rarity.LEGENDARY, Rarity.MYTHIC]
      };
    }
    if (confirmations >= 50000 && confirmations % 50000 === 0) {
      return {
        threshold: 50000,
        chance: 0.05, // 5% chance
        rarities: [Rarity.UNCOMMON, Rarity.RARE, Rarity.EPIC, Rarity.LEGENDARY, Rarity.MYTHIC]
      };
    }
    if (confirmations >= 10000 && confirmations % 10000 === 0) {
      return {
        threshold: 10000,
        chance: 0.01, // 1% chance
        rarities: [Rarity.COMMON, Rarity.UNCOMMON, Rarity.RARE, Rarity.EPIC, Rarity.LEGENDARY, Rarity.MYTHIC]
      };
    }
    // ... other milestones
    return null;
  }
}
```

## Mutation Types

### Attribute Boost

- Increases attribute value by 10-30%
- Capped at maximum value of 1.0
- Applied to a single randomly selected group
- Visual effects reflect the boosted attribute
- Rarity influences the boost percentage

### Type Change

- Changes particle group type
- Updates associated color and visual properties
- Maintains count and other attributes
- Visual transition effect during change
- Rarity influences available type options

### Count Increase

- Adds up to 20% more particles to a group
- Distributes increase proportionally
- Respects total particle limits (500 total)
- Visual effect shows new particles spawning
- Rarity influences the percentage increase

### Group Split

- Creates new group from 40% of particles in an existing group
- New group inherits type with slight attribute variation
- Requires minimum particle counts to execute
- Visual effect shows group division
- Rarity influences the attribute variation in the new group

## Rarity System

### Rarity Distribution

The rarity system follows this distribution:

1. **Common**: 40% chance when a mutation occurs
2. **Uncommon**: 30% chance when a mutation occurs
3. **Rare**: 20% chance when a mutation occurs
4. **Epic**: 8% chance when a mutation occurs
5. **Legendary**: 1.5% chance when a mutation occurs
6. **Mythic**: 0.5% chance when a mutation occurs

### Milestone Restrictions

Higher milestones restrict available rarities to higher tiers:

- 10,000 confirmations: All rarities available
- 50,000 confirmations: Uncommon and above
- 100,000 confirmations: Rare and above
- 250,000 confirmations: Epic and above
- 500,000 confirmations: Legendary and above
- 1,000,000 confirmations: Mythic only

### Implementation Approach

```typescript
interface RarityWeight {
  rarity: Rarity;
  weight: number;
}

const rarityWeights: RarityWeight[] = [
  { rarity: Rarity.COMMON, weight: 40 },
  { rarity: Rarity.UNCOMMON, weight: 30 },
  { rarity: Rarity.RARE, weight: 20 },
  { rarity: Rarity.EPIC, weight: 8 },
  { rarity: Rarity.LEGENDARY, weight: 1.5 },
  { rarity: Rarity.MYTHIC, weight: 0.5 }
];

function determineRarity(availableRarities: Rarity[]): Rarity {
  // Filter weights to only include available rarities
  const availableWeights = rarityWeights.filter(
    weight => availableRarities.includes(weight.rarity)
  );

  // Calculate total weight
  const totalWeight = availableWeights.reduce(
    (sum, weight) => sum + weight.weight, 0
  );

  // Roll for rarity
  const roll = this.rng() * totalWeight;
  let cumulativeWeight = 0;

  for (const weight of availableWeights) {
    cumulativeWeight += weight.weight;
    if (roll < cumulativeWeight) {
      return weight.rarity;
    }
  }

  // Fallback to highest available rarity
  return availableRarities[availableRarities.length - 1];
}
```

## Group Selection and Multi-Group Mutations

### Random Group Selection

When a mutation occurs, a group is randomly selected to receive the mutation:

```typescript
function selectRandomGroup(traits: Record<string, Trait>): string {
  const groupIds = Object.keys(traits);
  const randomIndex = Math.floor(this.rng() * groupIds.length);
  return groupIds[randomIndex];
}
```

### Multi-Group Mutation Chance

In rare cases, a mutation may apply to multiple groups:

```typescript
function determineAffectedGroups(traits: Record<string, Trait>, rarity: Rarity): string[] {
  // Select primary group
  const primaryGroup = this.selectRandomGroup(traits);

  // Determine if this is a multi-group mutation (rare chance)
  const multiGroupChance = rarity === Rarity.LEGENDARY ? 0.15 :
                          rarity === Rarity.MYTHIC ? 0.25 : 0.05;

  if (this.rng() < multiGroupChance) {
    // Select a second group different from the primary
    const remainingGroups = Object.keys(traits).filter(id => id !== primaryGroup);
    if (remainingGroups.length > 0) {
      const secondaryIndex = Math.floor(this.rng() * remainingGroups.length);
      return [primaryGroup, remainingGroups[secondaryIndex]];
    }
  }

  return [primaryGroup];
}
```

### Role-Specific Mutation Effects

Mutations may have different effects based on the role of the group:

- **CORE**: Attribute boosts focus on stability and influence
- **CONTROL**: Mutations enhance gyroscopic movement and control patterns
- **MOVEMENT**: Mutations improve speed and maneuverability
- **DEFENSE**: Mutations strengthen protective fields and barrier effects
- **ATTACK**: Mutations enhance patrol patterns and aggressive behaviors

## Implementation Considerations

### Nonce Tracking

To prevent duplicate mutations, we track the last processed nonce:

```typescript
// Skip if already processed this nonce
if (stateUpdateRef.current.lastNonce === blockDataRef.current.nonce) {
  return;
}

// Track processed nonce
stateUpdateRef.current.lastNonce = blockDataRef.current.nonce;
```

### Mutation Visualization

When a mutation occurs, we provide visual feedback:

```typescript
function visualizeMutation(mutation: MutationEvent) {
  // Create visual effect based on mutation type and rarity
  const effect = createEffect(mutation.type, mutation.rarity);

  // Apply effect to specific group(s)
  mutation.groupId.forEach(groupId => {
    applyVisualEffect(groupId, effect);
  });

  // Show notification
  showNotification(`${mutation.rarity} mutation occurred: ${getMutationDescription(mutation)}`);

  // Update mutation history UI
  updateMutationHistory(mutation);
}
```

### Confirmation Tracking

We track confirmation changes from the Bitcoin API:

```typescript
async function updateConfirmations(blockNumber: number) {
  // Fetch block data - ONLY need confirmations
  const blockInfo = await fetchBlockInfo(blockNumber);
  const confirmations = blockInfo.confirmations;

  // Check for milestone mutations
  const { traits: updatedTraits, event } = mutationSystem.checkMilestoneEvolution(
    traits,
    confirmations
  );

  // If mutation occurred, update state and visualize
  if (event) {
    setTraits(updatedTraits);
    visualizeMutation(event);
    addToMutationHistory(event);
  }
}
```

### User Interface

The UI should indicate:
- Current confirmation count
- Mutation history with rarity indicators
- Progress toward next milestone
- Visual cues during mutation events
- Attribute changes from mutations

## Testing Approach

### Milestone Testing

To test future milestones that haven't occurred yet in Bitcoin's history:

```typescript
function testMilestone(milestone: number) {
  // Override confirmation count for testing
  const testConfirmations = milestone;

  // Run mutation check with test confirmations
  const { traits: updatedTraits, event } = mutationSystem.checkMilestoneEvolution(
    traits,
    testConfirmations
  );

  // Log results
  console.log(`Testing milestone ${milestone}:`, {
    mutationOccurred: !!event,
    mutationType: event?.type,
    rarity: event?.rarity,
    affectedGroup: event?.groupId
  });

  // Visualize if mutation occurred
  if (event) {
    visualizeMutation(event);
  }
}
```

### Mutation Probability Testing

To verify mutation probabilities:

```typescript
function testMutationProbabilities(milestone: number, iterations: number) {
  const results = {
    total: iterations,
    mutations: 0,
    byRarity: {} as Record<Rarity, number>
  };

  for (let i = 0; i < iterations; i++) {
    // Set a different nonce for each iteration
    setNonce(i);

    const { event } = mutationSystem.checkMilestoneEvolution(
      traits,
      milestone
    );

    if (event) {
      results.mutations++;
      results.byRarity[event.rarity] = (results.byRarity[event.rarity] || 0) + 1;
    }
  }

  // Calculate percentages
  const mutationRate = (results.mutations / iterations) * 100;
  const rarityDistribution = Object.entries(results.byRarity).map(
    ([rarity, count]) => ({
      rarity,
      percentage: (count / results.mutations) * 100
    })
  );

  console.log(`Mutation rate at milestone ${milestone}: ${mutationRate.toFixed(2)}%`);
  console.log('Rarity distribution:', rarityDistribution);
}
```

## Implementation Plan

1. **Phase 1**: Implement the mutation system core logic
2. **Phase 2**: Add milestone detection and mutation chance rolling
3. **Phase 3**: Implement the four mutation types
4. **Phase 4**: Add visual effects for mutations
5. **Phase 5**: Implement mutation history and UI elements
6. **Phase 6**: Add testing tools for milestone and probability testing

## Related Documents

- [Blockchain Integration](01_blockchain_integration.md) - For details on Bitcoin integration
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [RNG System](../core/03_module_structure.md) - For details on the RNG system
- [User Experience](../ui/01_user_experience.md) - For details on the user interface
 
``` 
 
--- 
 
### 03_rng_system.md 
 
```.md 
# RNG System

This document details the Random Number Generation (RNG) system used in the Bitcoin Protozoa project, which creates deterministic, reproducible random values based on Bitcoin block data.

## Table of Contents

1. [Overview](#overview)
2. [Nonce-Based RNG](#nonce-based-rng)
3. [Chain RNG System](#chain-rng-system)
4. [Purpose-Specific RNG Streams](#purpose-specific-rng-streams)
5. [Deterministic Generation](#deterministic-generation)
6. [Implementation Details](#implementation-details)
7. [Related Documents](#related-documents)

## Overview

The RNG system is a core component of the Bitcoin Protozoa project, responsible for generating deterministic random values used throughout the application. It ensures that creatures can be recreated exactly given the same block height input, making the system fully deterministic and reproducible.

### Core Principles

1. **Determinism**: All RNG must be reproducible - same block height = same creature
2. **Sequence Importance**: Order of operations matters for consistency
3. **Purpose Isolation**: Different aspects need different RNG streams that remain independent
4. **Bitcoin-Sourced Entropy**: All randomness derives from Bitcoin block data

### Key Components

1. **Block Data Integration**: Using Bitcoin block data as the source of entropy
2. **Rehash Chain System**: Generating multiple unique but deterministic values from a single nonce
3. **Purpose-Specific RNG**: Creating dedicated RNG streams for different aspects of the simulation

## Nonce-Based RNG

The primary RNG algorithm used is Mulberry32, a simple but effective 32-bit pseudorandom number generator.

### Mulberry32 Algorithm

```typescript
/**
 * Mulberry32 RNG function
 * @param seed - Numeric seed value
 * @returns A function that returns a random number between 0 and 1
 */
export function mulberry32(seed: number): () => number {
  return function() {
    let t = seed += 0x6D2B79F5;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
}
```

### Characteristics

- **Deterministic**: Same seed always produces the same sequence
- **Period**: Long period before repeating (2^32 values)
- **Distribution**: Uniform distribution between 0 and 1
- **Performance**: Fast and efficient for JavaScript
- **Simplicity**: Easy to implement and understand

### Initialization

The RNG system is initialized with the Bitcoin block nonce:

```typescript
class RandomStateManager {
  constructor() {
    this.state = {
      nonce: 0,
      generator: mulberry32(0),
      sequence: 0
    }
    this.rehashChain = [0]
    this.initializeFromBlock(0)
  }
  
  initializeFromBlock(blockNumber: number) {
    // Fetch block data from API
    const blockData = fetchBlockData(blockNumber)
    
    // Initialize with block nonce
    this.state.nonce = blockData.nonce
    this.state.generator = mulberry32(blockData.nonce)
    this.state.sequence = 0
    
    // Reset rehash chain
    this.rehashChain = [blockData.nonce]
    
    // Pre-generate initial rehash chain values
    for (let i = 0; i < 10; i++) {
      this.next()
    }
  }
}
```

## Chain RNG System

The Chain RNG System generates multiple unique but deterministic values from a single nonce, creating a chain of related random values.

### Rehash Chain Generation

```typescript
next(): number {
  const value = this.state.generator()
  this.state.sequence++
  
  if (this.state.sequence % 10 === 0) {
    this.addToRehashChain(value)
  }
  
  return value
}

addToRehashChain(value: number): void {
  // Convert to integer in range 0 to 2^32 - 1
  const intValue = Math.floor(value * 4294967296)
  
  // Add to rehash chain
  this.rehashChain.push(intValue)
  
  // Limit chain length
  if (this.rehashChain.length > this.maxChainLength) {
    this.rehashChain.shift()
  }
}
```

### Chain RNG Implementation

```typescript
function createChainRNG(seed: number, purpose: string): () => number {
  let currentSeed = seed;
  return () => {
    currentSeed = mulberry32(currentSeed)();
    return currentSeed;
  };
}
```

### Usage

The Chain RNG is used to create sequences of random values that are deterministically related:

```typescript
// Start with block nonce as seed
const initialSeed = blockData.nonce;
const rng = mulberry32(initialSeed);

// Create a chain of RNG values for different trait categories
const traitRNG = {
  visual: createChainRNG(rng(), 'visual'),
  formation: createChainRNG(rng(), 'formation'),
  behavior: createChainRNG(rng(), 'behavior'),
  force: createChainRNG(rng(), 'force')
};
```

## Purpose-Specific RNG Streams

Different aspects of the simulation use dedicated RNG streams to ensure independence and reproducibility.

### Purpose-Specific Generation

```typescript
getPurposeRng(purpose: string): () => number {
  if (!this.purposeRngs.has(purpose)) {
    const purposeHash = this.hashString(purpose)
    const seed = this.state.nonce ^ purposeHash
    this.purposeRngs.set(purpose, mulberry32(seed))
  }
  return this.purposeRngs.get(purpose)!
}

private hashString(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    hash = ((hash << 5) - hash) + str.charCodeAt(i);
    hash |= 0; // Convert to 32-bit integer
  }
  return hash >>> 0; // Convert to unsigned
}
```

### Current Purpose Streams

The system currently uses the following purpose-specific RNG streams:

1. **'traits'**: Used for creature trait generation
   ```typescript
   const traitsRNG = rngSystem.getStream('traits');
   const traitValue = traitsRNG();
   ```

2. **'physics'**: Used for movement and behavior
   ```typescript
   const physicsRNG = rngSystem.getStream('physics');
   const forceValue = physicsRNG();
   ```

3. **'formation'**: Used for particle formations
   ```typescript
   const formationRNG = rngSystem.getStream('formation');
   const formationValue = formationRNG();
   ```

4. **'visual'**: Used for visual characteristics
   ```typescript
   const visualRNG = rngSystem.getStream('visual');
   const colorValue = visualRNG();
   ```

### Future Purpose Streams

The system is designed to be extended with additional purpose streams:

- **'abilities'**: For creature abilities
- **'attributes'**: For creature attributes
- **'stats'**: For creature statistics
- **'mutations'**: For evolution mutations

## Deterministic Generation

The RNG system ensures deterministic generation of all random values, making the entire system reproducible.

### Trait Generation Process

```typescript
export function generateTraits(blockData: BlockData): GroupTraits {
  // Start with block nonce as seed
  const initialSeed = blockData.nonce;
  const rng = mulberry32(initialSeed);

  // Create a chain of RNG values for different trait categories
  const traitRNG = {
    visual: createChainRNG(rng(), 'visual'),
    formation: createChainRNG(rng(), 'formation'),
    behavior: createChainRNG(rng(), 'behavior'),
    force: createChainRNG(rng(), 'force')
  };

  // Generate traits for each category
  return {
    visual: generateVisualTraits(traitRNG.visual),
    formation: generateFormationTraits(traitRNG.formation),
    behavior: generateBehaviorTraits(traitRNG.behavior),
    force: generateForceTraits(traitRNG.force)
  };
}
```

### Role Determination

The RNG system is used to deterministically assign roles to particles:

```typescript
function determineRoleFromBlockData(particleId: string, blockData: BlockData): ParticleRole {
  // Use particle ID and block data to deterministically assign role
  const hash = deterministicHash(particleId + blockData.merkleRoot);
  const value = normalizeHash(hash, 0, 100);
  
  if (value < 10) return ParticleRole.CORE;      // 10% chance
  if (value < 25) return ParticleRole.CONTROL;   // 15% chance
  if (value < 45) return ParticleRole.ATTACK;    // 20% chance
  if (value < 70) return ParticleRole.DEFENSE;   // 25% chance
  return ParticleRole.MOVEMENT;                  // 30% chance
}
```

### Particle Distribution

The RNG system is used to distribute particles among the different roles:

```typescript
function distributeParticles(blockData: BlockData): RoleDistribution {
  const rng = mulberry32(blockData.nonce);
  
  // Base allocation: 40 particles per role (200 total)
  const distribution = {
    [ParticleRole.CORE]: 40,
    [ParticleRole.CONTROL]: 40,
    [ParticleRole.MOVEMENT]: 40,
    [ParticleRole.DEFENSE]: 40,
    [ParticleRole.ATTACK]: 40
  };
  
  // Generate 5 random values between 0.1 and 0.3 (10-30%)
  const randomValues = Array.from({ length: 5 }, () => 0.1 + rng() * 0.2);
  
  // Normalize to sum to 1.0
  const sum = randomValues.reduce((a, b) => a + b, 0);
  const normalizedValues = randomValues.map(v => v / sum);
  
  // Distribute remaining 300 particles
  const roles = Object.keys(distribution) as ParticleRole[];
  let remaining = 300;
  
  for (let i = 0; i < roles.length - 1; i++) {
    const role = roles[i];
    const count = Math.round(normalizedValues[i] * 300);
    distribution[role] += count;
    remaining -= count;
  }
  
  // Assign remaining to last role to ensure total is exactly 500
  distribution[roles[roles.length - 1]] += remaining;
  
  return distribution;
}
```

## Implementation Details

### RNG System Interface

```typescript
/**
 * RNG function type - represents a random number generator function
 */
export type RNGFunction = () => number;

/**
 * RNG stream type - represents a named RNG stream
 */
export interface RNGStream {
  name: string;
  rng: RNGFunction;
}

/**
 * RNG system interface - manages multiple RNG streams
 */
export interface RNGSystem {
  getStream(name: string): RNGFunction;
  createStream(name: string, seed: number): RNGFunction;
  removeStream(name: string): void;
}
```

### RNG System Implementation

```typescript
/**
 * RNG system implementation
 */
export class RNGSystemImpl implements RNGSystem {
  private streams: Map<string, RNGFunction> = new Map();
  private nonce: number;
  
  constructor(nonce: number) {
    this.nonce = nonce;
  }
  
  getStream(name: string): RNGFunction {
    if (!this.streams.has(name)) {
      return this.createStream(name, this.nonce);
    }
    return this.streams.get(name)!;
  }
  
  createStream(name: string, seed: number): RNGFunction {
    const purposeHash = this.hashString(name);
    const streamSeed = seed ^ purposeHash;
    const rng = mulberry32(streamSeed);
    this.streams.set(name, rng);
    return rng;
  }
  
  removeStream(name: string): void {
    this.streams.delete(name);
  }
  
  private hashString(str: string): number {
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
      hash = ((hash << 5) - hash) + str.charCodeAt(i);
      hash |= 0; // Convert to 32-bit integer
    }
    return hash >>> 0; // Convert to unsigned
  }
}
```

### Module Structure

The RNG system is organized into the following module structure:

```
domains/rng/
├── index.ts                  # Public API
├── types.ts                  # RNG types
├── constants.ts              # RNG constants
├── services/                 # RNG services
│   └── rngService.ts         # RNG management service
├── utils/                    # RNG utilities
│   ├── mulberry32.ts         # Mulberry32 implementation
│   └── chainRng.ts           # Chain RNG implementation
└── workers/                  # RNG workers
    └── rngWorker.ts          # Worker for RNG calculations
```

### Utility Functions

```typescript
/**
 * Generate a random float between min and max
 */
export function randomFloat(random: () => number, min: number, max: number): number {
  return min + random() * (max - min);
}

/**
 * Choose a random item from an array
 */
export function randomChoice<T>(random: () => number, array: T[]): T {
  return array[Math.floor(random() * array.length)];
}

/**
 * Generate a random integer between min (inclusive) and max (exclusive)
 */
export function randomInt(random: () => number, min: number, max: number): number {
  return Math.floor(randomFloat(random, min, max));
}
```

## Related Documents

- [Blockchain Integration](01_blockchain_integration.md) - For details on Bitcoin blockchain integration
- [Evolution Mechanics](02_evolution_mechanics.md) - For details on confirmation-based mutation system
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Trait System](04_trait_system.md) - For details on the trait system
- [Force Calculations](../physics/02_force_calculations.md) - For details on force calculations
 
``` 
 
--- 
 
### 04_bitcoin_integration_approach.md 
 
```.md 
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
 
``` 
 
--- 
 
### 05_bitcoin_integration_details_part1.md 
 
```.md 
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
 
``` 
 
--- 
 
### 06_bitcoin_integration_details_part2.md 
 
```.md 
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
 
``` 
 
--- 
 
### 06_bitcoin_onchain_resources.md 
 
```.md 
# Bitcoin On-Chain Resources

This document provides a comprehensive list of all Bitcoin-inscribed resources used in Bitcoin Protozoa. These on-chain resources ensure our application is truly eternal, leveraging Bitcoin's immutability to guarantee perpetual availability without reliance on any external servers, CDNs, or package repositories.

## Core Principles

1. **Bitcoin Permanence**: Bitcoin provides a permanent, immutable foundation for deployed applications
2. **Resource Eternity**: Inscribed libraries and resources are forever available on-chain
3. **No Fallbacks Required**: Since Bitcoin resources are eternal, there's no need for CDN or local fallbacks
4. **Lean Implementation**: Focus on minimizing our application footprint while maximizing functionality
5. **Bitcoin-Native Development**: Develop with the specific constraints and advantages of Bitcoin in mind

## On-Chain Resource Access

All resources are accessed directly from Bitcoin inscriptions via their inscription IDs. The application includes a specialized loader to fetch these resources in the correct order.

### Resource Access URLs

- **Development Environment**: `https://ordinals.com/content/InscriptionID`
- **Production Environment**: `/content/InscriptionID`

### Bitcoin Block Data Access

- **Development Environment**: `https://ordinals.com/r/blockinfo/${blockNumber}`
- **Production Environment**: `/r/blockinfo/${blockNumber}`

## React Framework Resources

| Resource | Version | Inscription ID | Purpose |
|----------|---------|----------------|---------|
| React | 18.2.0 | 7f403153b6484f7d24f50a51e1cdf8187219a3baf103ef0df5ea2437fb9de874i0 | Core UI framework |
| ReactDOM | 18.2.0 | 89295aaf617708128b95d22e7099ce32108d4b918386e6f90994e7979d22ba72i0 | DOM manipulation for React |
| Scheduler | 0.23.0 | 9b09a0f234355106e9311a21fbe5324c90f7317f04c00bc73e1114c9af745743i0 | Required React dependency |
| React Reconciler | 0.27.0 | 9b0338c4e84987a374845235a3b4f0fe73b205b336a7b936e05c71deb5a1882ci0 | React reconciliation engine |

## 3D Rendering Resources

| Resource | Version | Inscription ID | Purpose |
|----------|---------|----------------|---------|
| Three.js | 0.163.0 | 2dbdf9ebbec6be793fd16ae9b797c7cf968ab2427166aaf390b90b71778266abi0 | Core 3D rendering engine |
| React Three Fiber | 8.13.7 | 24c424c795d50c3f1d344253d163e7eaa34e904aef038b6031d706e76676c634i0 | React bindings for Three.js |
| React Three Drei | 9.80.7 | 9f77a1efc4c880197ba8d197d5e87539443ed5ebcf027b1fee25db8bd1cf4605i0 | Useful helpers for React Three Fiber |
| GLTFLoader | latest | 614855c7c7541594c846a96a81db7bcedaff2831711e3b89670aba4c2fefb404i0 | For loading 3D models |
| TextGeometry | latest | 77ef4bc8b15f0a764903f3bb2ccd0566ac6c111bd3d884bc814cfde49565dbc9i0 | For 3D text rendering |
| FontLoader | latest | fcacfdd75ef21965ec98d9a1a107e8f5468f23ff15131cae44fc6aca86538147i0 | For loading fonts in Three.js |
| BufferGeometryUtils | latest | 71616486e00954e0087b6bfd6b110fe0a32d1b174b94b634b34f27dd04f70a5ci0 | Buffer geometry utilities |

## Animation & Effects Resources

| Resource | Version | Inscription ID | Purpose |
|----------|---------|----------------|---------|
| GSAP | 3.6.1 | 6577ec768235a2a911e91a115b964618581bde91d99bc58f5c7390fdfb155ae6i0 | Animation library |
| React-spring-core | 9.7.3 | 09fe4a18d81abc481597bdd9ddfa65aadb95defc18de3ec925ec0b45ac3c7c49i0 | Physics-based animations |
| Shader-composer | 0.4.3 | 1c9c11c3b82bce54bfa989a44a1057f8c39d3b8b9dc2e13ec1f99e4a0f3a0f77i0 | WebGL shader composition |
| vfx-composer | 0.4.0 | 9f59e26bc81e4d741f77320eaf9e9df8cce623c9639f9c1a49497ac75607e9bei0 | Visual effects composition |
| Chroma | latest | c49f28a5c9e67efb85d44b9ee12efa2839b0251bad14efc5e6c32406505e259ci0 | Color manipulation |

## Utility Libraries

| Resource | Version | Inscription ID | Purpose |
|----------|---------|----------------|---------|
| Crypto-js | 4.1.1 | 66979aec90e592bc5be7fddcef23daeff982662b7225e7804c1b271f1b0d267ai0 | Cryptography functions |
| Pako | 2.1.0 | fba6f95fb1152db43304a27dce8cb8c65509eba6ab0b6958cedeb33e5f443077i0 | Compression library |
| JSZip | 3.10.1 | 372c5388030820daed356d25d7a1218d0b88d78a6d051d27c91d0f25ac4c3c5ei0 | File compression/decompression |
| fflate | 0.8.0 | 657973995aa2a47c3fe02debb22405dadf6b49148d97027627bced89a73f408fi0 | Fast compression library |
| Buffer | latest | fb15f2a6ed1d3031aa214cc12d3fa696508080c0baa194463920c8a79d21aa54i0 | Binary data handling |
| brotli/decode.min.js | latest | b1d16a7a1ada08b5c7f51837478f578c0abd0973809c439228f28ccd5c38e44ai0 | Decompression utility |
| Moment.js | 2.29.1 | b90b4516ea1a0b882e67387eb4f3e5def0307704b046e8ef98c5e72092c47eedi0 | Date/time library |
| Axios | latest | 6b81993428a217a341ffd68f3b3aa3664b2cfc674d57aad0d3b6daa0f125b821i0 | HTTP client |
| Highlight.js | 11.7.0 | 41d856597a8474e7124a0641b54afb77bc034f800e1be8fe02a20b55023ff4a7i0 | Syntax highlighting |
| GRC-img | v1 | e5ef65604e1ad9c90fb3c74918e00a960ce2e814fba412556afec6b3a4e25257i0 | Image processing |
| Open Ordinal Stitch | 0.9.0 | a196634768a6a715779fa8d513b65b8d2099defc2bd09c36dccbf54ffdd04022i0 | Ordinals utility |

## CSS & UI Resources

| Resource | Version | Inscription ID | Purpose |
|----------|---------|----------------|---------|
| Tailwind | latest | 0703423f633ed5cef7e3b45bfd8df43ab0d6783850d51005b105f01dd60d25c3i0 | CSS framework |
| Bitcoin Icons | 1.0 | 01a4ff05b7591d14afa8a70aa80fd17b49e972f34a65bf69c6fc5ea09f08ab04i0 | Bitcoin-specific icons |
| Lucide Icons | 0.363.0 | 5546e0dea8b7fc991ef3ae22802ee7e793f814049ae9f32409ced33739840137i0 | General UI icons |

## Fonts

| Resource | Version | Inscription ID | Purpose |
|----------|---------|----------------|---------|
| Inter Font | latest | 7b47a3cb9fc6ac82af2c1a33bfa4d296bcb83e9219a6434d889f8b95e5b917a6i0 | Primary UI font |
| Roboto Mono | latest | 6dfd10683c0388525b48a8b0a922fada7c0472e8a6c0fb6167add56c9acc1c87i0 | Monospace font |
| IBM Plex Sans | latest | d0ab3f7fdbc7cfe83f3bad13c5754f2f48357a0b2af3f72443d3875bea78a680i0 | Secondary UI font |

## Implementation Details

### Resource Loading

All Bitcoin on-chain resources are loaded through our specialized `InscriptionLoaderService`, which handles dependency resolution, loading order, caching, and verification. This service ensures that all resources are loaded directly from Bitcoin inscriptions, with no fallbacks to external sources.

```javascript
// Example of loading process in HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bitcoin Protozoa - Eternal Edition</title>
</head>
<body>
  <div id="root"></div>

  <!-- Bootstrap loader for on-chain resources -->
  <script>
    // Minimal loader to bootstrap the inscription loader
    (function() {
      const bootLoader = document.createElement('script');
      bootLoader.src = '/content/[Loader Inscription ID]';
      bootLoader.onload = () => console.log('Bitcoin Protozoa resource loader initialized');
      bootLoader.onerror = () => console.error('Failed to load Bitcoin Protozoa resource loader');
      document.head.appendChild(bootLoader);
    })();
  </script>
</body>
</html>
```

### Bitcoin Block Data Access

The application accesses Bitcoin block data through the ordinals.com API during development and through the Bitcoin ordinals native endpoint in production. This data is used for:

1. **RNG Seeding**: The block nonce is used as a seed for the Mulberry32 RNG algorithm
2. **Evolution Mechanics**: The confirmation count is used to trigger evolution events at specific milestones

```javascript
// Example of Bitcoin block data access
async function fetchBlockData(blockNumber) {
  const endpoint = process.env.NODE_ENV === 'production'
    ? `/r/blockinfo/${blockNumber}`
    : `https://ordinals.com/r/blockinfo/${blockNumber}`;

  const response = await fetch(endpoint);
  const data = await response.json();

  // Extract only the nonce and confirmations fields
  return {
    nonce: data.nonce,
    confirmations: data.confirmations
  };
}
```

## Conclusion

By exclusively using Bitcoin-inscribed resources, Bitcoin Protozoa achieves true eternality. All dependencies and assets are permanently stored on the Bitcoin blockchain, ensuring the application will continue to function as long as Bitcoin exists, without reliance on centralized infrastructure.
 
``` 
 
--- 
 
