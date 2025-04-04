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
