# Testing Strategy

This document outlines the testing approach for the Bitcoin Protozoa project, focusing on ensuring the application works correctly with immutable on-chain resources.

## Table of Contents

1. [Testing Philosophy](#testing-philosophy) [Line 20]
2. [Testing Layers](#testing-layers) [Line 40]
   - [Unit Testing](#1-unit-testing) [Line 45]
   - [Integration Testing](#2-integration-testing) [Line 120]
   - [Visual Testing](#3-visual-testing) [Line 170]
   - [Performance Testing](#4-performance-testing) [Line 210]
   - [Bitcoin Integration Testing](#5-bitcoin-integration-testing) [Line 250]
3. [Testing Tools](#testing-tools) [Line 300]
4. [Testing Environment](#testing-environment) [Line 340]
5. [Test Automation](#test-automation) [Line 370]
6. [Implementation Plan](#implementation-plan) [Line 400]
7. [Related Documents](#related-documents) [Line 450]

## Testing Philosophy

Since the final application will rely on immutable, static resources on the Bitcoin blockchain, our testing strategy focuses on:

1. **Pre-deployment Validation**: Thorough testing before inscription to ensure everything works correctly
2. **Deterministic Behavior**: Verifying that the same inputs always produce the same outputs
3. **Resource Independence**: Testing that the application works with the expected immutable resources
4. **Performance Verification**: Ensuring the application meets performance targets

The key principles of our testing approach include:

- **Comprehensive Coverage**: Testing all critical functionality
- **Automated Testing**: Maximizing automated test coverage
- **Performance Focus**: Ensuring the application meets performance targets
- **Visual Verification**: Ensuring visual elements render correctly
- **Bitcoin Integration**: Verifying correct interaction with Bitcoin block data

## Testing Layers

Our testing strategy is organized into five layers, each focusing on different aspects of the application.

### 1. Unit Testing

Unit tests focus on individual functions and components to ensure they work as expected in isolation.

#### Core Functions to Test

- **RNG System**:
  - Deterministic output for the same seed
  - Chain RNG consistency
  - Purpose-specific RNG isolation

- **Trait Generation**:
  - Correct trait assignment based on RNG
  - Rarity distribution accuracy
  - Role-appropriate trait selection

- **Physics Calculations**:
  - Force calculations
  - Particle movement
  - Collision detection
  - Force field containment

- **Mutation System**:
  - Milestone detection
  - Mutation chance calculation
  - Mutation application

#### Implementation Approach

```typescript
// Example unit test for deterministic RNG
describe('RNG System', () => {
  test('produces the same sequence for the same seed', () => {
    const rng1 = mulberry32(12345);
    const rng2 = mulberry32(12345);

    // Generate 100 values from each RNG
    const sequence1 = Array.from({ length: 100 }, () => rng1());
    const sequence2 = Array.from({ length: 100 }, () => rng2());

    // Sequences should be identical
    expect(sequence1).toEqual(sequence2);
  });

  test('produces different sequences for different seeds', () => {
    const rng1 = mulberry32(12345);
    const rng2 = mulberry32(67890);

    // Generate values from each RNG
    const value1 = rng1();
    const value2 = rng2();

    // Values should be different
    expect(value1).not.toEqual(value2);
  });
});

// Example unit test for trait generation
describe('Trait Generation', () => {
  test('assigns traits based on RNG value', () => {
    // Mock RNG that returns a fixed value
    const mockRNG = jest.fn().mockReturnValue(0.1); // 10% - should be Rare

    // Generate trait with mock RNG
    const trait = determineRarity(mockRNG);

    // Should be Rare based on the RNG value
    expect(trait).toBe(Rarity.RARE);
  });

  test('respects rarity distribution', () => {
    // Mock RNG that returns specific values
    const mockRNG = jest.fn()
      .mockReturnValueOnce(0.001) // 0.1% - should be Mythic
      .mockReturnValueOnce(0.01)  // 1% - should be Legendary
      .mockReturnValueOnce(0.05)  // 5% - should be Epic
      .mockReturnValueOnce(0.15)  // 15% - should be Rare
      .mockReturnValueOnce(0.45)  // 45% - should be Uncommon
      .mockReturnValueOnce(0.75); // 75% - should be Common

    // Generate traits with mock RNG
    const traits = [
      determineRarity(mockRNG),
      determineRarity(mockRNG),
      determineRarity(mockRNG),
      determineRarity(mockRNG),
      determineRarity(mockRNG),
      determineRarity(mockRNG)
    ];

    // Verify rarity distribution
    expect(traits).toEqual([
      Rarity.MYTHIC,
      Rarity.LEGENDARY,
      Rarity.EPIC,
      Rarity.RARE,
      Rarity.UNCOMMON,
      Rarity.COMMON
    ]);
  });
});
```

### 2. Integration Testing

Integration tests verify that different parts of the system work together correctly.

#### Key Integration Points to Test

- **RNG to Trait System**: Verify traits are correctly generated from RNG
- **Trait System to Particle System**: Verify particles correctly apply traits
- **Particle System to Physics**: Verify physics calculations correctly use particle properties
- **Bitcoin API to Application**: Verify block data is correctly fetched and processed

#### Implementation Approach

```typescript
// Example integration test for RNG to Trait System
describe('RNG to Trait System Integration', () => {
  test('generates consistent traits for the same block nonce', () => {
    // Create two separate systems with the same block nonce
    const blockData1 = { nonce: 12345, confirmations: 1000 };
    const blockData2 = { nonce: 12345, confirmations: 1000 };

    const traitSystem1 = new TraitSystem(blockData1);
    const traitSystem2 = new TraitSystem(blockData2);

    // Generate traits for the same particle group role
    const traits1 = traitSystem1.generateTraitsForRole(ParticleRole.CORE);
    const traits2 = traitSystem2.generateTraitsForRole(ParticleRole.CORE);

    // Traits should be identical
    expect(traits1).toEqual(traits2);
  });

  test('generates different traits for different block nonces', () => {
    // Create two separate systems with different block nonces
    const blockData1 = { nonce: 12345, confirmations: 1000 };
    const blockData2 = { nonce: 67890, confirmations: 1000 };

    const traitSystem1 = new TraitSystem(blockData1);
    const traitSystem2 = new TraitSystem(blockData2);

    // Generate traits for the same particle group role
    const traits1 = traitSystem1.generateTraitsForRole(ParticleRole.CORE);
    const traits2 = traitSystem2.generateTraitsForRole(ParticleRole.CORE);

    // Traits should be different
    expect(traits1).not.toEqual(traits2);
  });
});
```

### 3. Visual Testing

Visual testing ensures that the application renders correctly and that visual traits are applied as expected.

#### Visual Aspects to Test

- **Particle Rendering**: Verify particles render with correct shapes, colors, and effects
- **Formation Visualization**: Verify formations are correctly applied
- **Animation Smoothness**: Verify animations run at the target frame rate
- **Visual Effects**: Verify effects render correctly

#### Implementation Approach

```typescript
// Example visual test using Storybook and Chromatic
import { Meta, StoryObj } from '@storybook/react';
import { ParticleRenderer } from '../components/ParticleRenderer';

const meta: Meta<typeof ParticleRenderer> = {
  title: 'Components/ParticleRenderer',
  component: ParticleRenderer,
  parameters: {
    chromatic: { disableSnapshot: false },
  },
};

export default meta;
type Story = StoryObj<typeof ParticleRenderer>;

// Test different particle shapes
export const Shapes: Story = {
  args: {
    particles: [
      { shape: 'sphere', color: { r: 1, g: 0, b: 0 }, position: { x: -2, y: 0, z: 0 } },
      { shape: 'cube', color: { r: 0, g: 1, b: 0 }, position: { x: 0, y: 0, z: 0 } },
      { shape: 'tetrahedron', color: { r: 0, g: 0, b: 1 }, position: { x: 2, y: 0, z: 0 } },
    ],
  },
};

// Test different color schemes
export const Colors: Story = {
  args: {
    particles: [
      { shape: 'sphere', color: { r: 1, g: 0, b: 0 }, position: { x: -2, y: 0, z: 0 } },
      { shape: 'sphere', color: { r: 0, g: 1, b: 0 }, position: { x: 0, y: 0, z: 0 } },
      { shape: 'sphere', color: { r: 0, g: 0, b: 1 }, position: { x: 2, y: 0, z: 0 } },
    ],
  },
};

// Test visual effects
export const Effects: Story = {
  args: {
    particles: [
      { shape: 'sphere', color: { r: 1, g: 0, b: 0 }, position: { x: -2, y: 0, z: 0 }, effect: 'glow' },
      { shape: 'sphere', color: { r: 0, g: 1, b: 0 }, position: { x: 0, y: 0, z: 0 }, effect: 'trail' },
      { shape: 'sphere', color: { r: 0, g: 0, b: 1 }, position: { x: 2, y: 0, z: 0 }, effect: 'pulse' },
    ],
  },
};
```

### 4. Performance Testing

Performance testing ensures the application meets performance targets and runs smoothly.

#### Performance Aspects to Test

- **Frame Rate**: Verify the application maintains 60 FPS with 500 particles
- **Memory Usage**: Verify memory usage remains within acceptable limits
- **CPU Usage**: Verify CPU usage remains within acceptable limits
- **Loading Time**: Verify the application loads within acceptable time

#### Implementation Approach

```typescript
// Example performance test for frame rate
describe('Performance', () => {
  test('maintains target frame rate with 500 particles', async () => {
    // Create a performance monitor
    const monitor = new PerformanceMonitor();

    // Create a particle system with 500 particles
    const system = new ParticleSystem(500);

    // Run the system for 5 seconds
    monitor.start();
    await runSystemForDuration(system, 5000);
    const metrics = monitor.stop();

    // Verify frame rate
    expect(metrics.averageFPS).toBeGreaterThanOrEqual(58); // Allow slight variation
    expect(metrics.minFPS).toBeGreaterThanOrEqual(55); // Minimum acceptable FPS
  });

  test('memory usage remains within limits', async () => {
    // Create a memory monitor
    const monitor = new MemoryMonitor();

    // Create a particle system with 500 particles
    const system = new ParticleSystem(500);

    // Run the system for 5 seconds
    monitor.start();
    await runSystemForDuration(system, 5000);
    const metrics = monitor.stop();

    // Verify memory usage
    expect(metrics.peakMemoryUsage).toBeLessThan(50 * 1024 * 1024); // 50 MB limit
  });
});
```

### 5. Bitcoin Integration Testing

Bitcoin integration testing ensures the application correctly interacts with Bitcoin block data.

#### Bitcoin Integration Aspects to Test

- **Block Data Fetching**: Verify block data is correctly fetched from the API
- **Nonce Processing**: Verify the nonce is correctly used for RNG
- **Confirmation Handling**: Verify confirmation count is correctly used for mutations
- **Error Handling**: Verify the application handles API errors gracefully

#### Implementation Approach

```typescript
// Example Bitcoin integration test
describe('Bitcoin Integration', () => {
  // Mock the Bitcoin API
  beforeEach(() => {
    jest.spyOn(global, 'fetch').mockImplementation((url) => {
      if (url.includes('/blockinfo/')) {
        return Promise.resolve({
          ok: true,
          json: () => Promise.resolve({
            nonce: 12345,
            confirmations: 1000
          })
        });
      }
      return Promise.reject(new Error('Not found'));
    });
  });

  afterEach(() => {
    jest.restoreAllMocks();
  });

  test('fetches block data correctly', async () => {
    const bitcoinService = new BitcoinService();
    const blockData = await bitcoinService.fetchBlockInfo(123456);

    expect(blockData).toEqual({
      blockNumber: 123456,
      nonce: 12345,
      confirmations: 1000
    });
  });

  test('handles API errors gracefully', async () => {
    // Override mock to simulate error
    global.fetch.mockImplementationOnce(() => {
      return Promise.reject(new Error('Network error'));
    });

    const bitcoinService = new BitcoinService();

    // Should throw an error
    await expect(bitcoinService.fetchBlockInfo(123456)).rejects.toThrow();

    // Error handler should be called
    expect(errorHandler.handleError).toHaveBeenCalled();
  });
});

test('uses nonce for deterministic RNG', () => {
  const bitcoinService = new BitcoinService();
  const rngService = new RNGService();

  // Fetch block data
  return bitcoinService.fetchBlockInfo(123456)
    .then(blockData => {
      // Initialize RNG with nonce
      rngService.initializeWithNonce(blockData.nonce);

      // Generate a sequence of random numbers
      const sequence = [];
      for (let i = 0; i < 10; i++) {
        sequence.push(rngService.random());
      }

      // Sequence should be deterministic for the same nonce
      expect(sequence).toEqual([0.12345, 0.67890, 0.54321, 0.98765, 0.13579, 0.24680, 0.36912, 0.48123, 0.59234, 0.60345]);
    });
});
```

## Testing Tools

### Unit and Integration Testing
- **Vitest**: Fast, Jest-compatible testing framework for Vite
- **React Testing Library**: For testing React components
- **MSW (Mock Service Worker)**: For mocking API requests

### Visual Testing
- **Storybook**: For developing and testing UI components in isolation
- **Chromatic**: For visual regression testing
- **Playwright**: For end-to-end testing with visual comparisons

### Performance Testing
- **Lighthouse**: For performance metrics
- **React Profiler**: For component performance analysis
- **Custom FPS Monitor**: For measuring frame rate

## Testing Environment

### Local Development
- **Development Mode**: Tests run against local resources
- **Mock Bitcoin API**: Simulated responses for development

### Pre-Deployment
- **Production Build**: Tests run against the production build
- **Simulated Inscription Environment**: Tests run with resources loaded as they would be from inscriptions

## Test Automation

### Continuous Integration
- **GitHub Actions**: Automated test runs on pull requests
- **Performance Benchmarks**: Automated performance testing

### Pre-Inscription Checklist
- **Full Test Suite**: All tests must pass
- **Performance Verification**: Performance tests must meet targets
- **Visual Verification**: Visual tests must pass
- **Manual Testing**: Final manual verification

## Implementation Plan

1. **Set Up Testing Framework**:
   - Configure Vitest with React Testing Library
   - Set up testing utilities and helpers

2. **Implement Core Unit Tests**:
   - RNG system tests
   - Trait generation tests
   - Physics calculation tests

3. **Implement Integration Tests**:
   - Component integration tests
   - System integration tests

4. **Implement Visual Tests**:
   - Set up Storybook for component development
   - Implement visual regression tests

5. **Implement Performance Tests**:
   - Create custom performance monitoring tools
   - Set up performance benchmarks

6. **Implement Bitcoin Integration Tests**:
   - Mock Bitcoin API
   - Test block data processing

7. **Create Pre-Inscription Test Suite**:
   - Comprehensive test suite for final verification
   - Automated and manual testing checklist

## Related Documents

- [Error Handling Strategy](02_error_handling.md) - For details on error handling approach
- [Development Workflow](../deployment/01_development_workflow.md) - For details on the development process
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on the deployment pipeline
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
- [Particle System](../particles/01_particle_system.md) - For details on the particle system