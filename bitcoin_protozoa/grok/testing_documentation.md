# testing DOCUMENTATION 
 
This document contains all the content from the testing subdirectory of the Bitcoin Protozoa project. 
 
## Files 
 
### 00_summary.md 
 
```.md 
# Testing Summary

This directory contains documentation on the testing strategy and error handling for the Bitcoin Protozoa project.

## Key Documents

- [Testing Strategy](01_testing_strategy.md) - Testing approach and methodology
- [Error Handling](02_error_handling.md) - Error handling strategy and recovery
- [Technical Implementation](03_technical_implementation.md) - Technical implementation details
- [Development UI](04_development_ui.md) - Development UI for testing

## Testing Strategy Overview

The testing strategy ensures the reliability and performance of the Bitcoin Protozoa project:

1. **Unit Testing**: Testing individual components in isolation
2. **Integration Testing**: Testing component interactions
3. **Performance Testing**: Testing performance under various conditions
4. **Bitcoin Integration Testing**: Testing Bitcoin data integration
5. **Visual Testing**: Testing visual appearance and animations

## Testing Tools

The project uses the following testing tools:

1. **Vitest**: For unit and integration testing
2. **React Testing Library**: For testing React components
3. **Performance Monitoring**: For performance testing
4. **Mock Bitcoin Data**: For testing Bitcoin integration
5. **Visual Regression Testing**: For testing visual appearance

## Testing Approach

The testing approach follows these principles:

1. **Test-Driven Development**: Writing tests before implementation
2. **Component Isolation**: Testing components in isolation
3. **Realistic Scenarios**: Testing with realistic data and scenarios
4. **Performance Benchmarks**: Testing against performance targets
5. **Continuous Testing**: Running tests continuously during development

## Error Handling Strategy

The error handling strategy ensures robustness and recovery:

1. **Error Types**: Categorizing errors by type and severity
2. **Error Boundaries**: Containing errors to prevent cascading failures
3. **Fallback Mechanisms**: Providing fallbacks for critical functionality
4. **Logging and Monitoring**: Tracking errors for debugging
5. **User Feedback**: Providing appropriate feedback to users

## Error Recovery

The error recovery approach includes:

1. **Graceful Degradation**: Maintaining core functionality when possible
2. **State Recovery**: Recovering from state corruption
3. **Retry Mechanisms**: Retrying failed operations
4. **Offline Support**: Functioning without network access
5. **Data Validation**: Validating data to prevent errors

## Technical Implementation

The technical implementation details include:

1. **Code Organization**: Structuring test code for maintainability
2. **Performance Testing**: Measuring and optimizing performance
3. **Security Testing**: Ensuring security of the application
4. **Deployment Testing**: Verifying deployment readiness
5. **Implementation Examples**: Practical examples of test implementation

## Related Documentation

- [Development Workflow](../deployment/01_development_workflow.md) - For details on development process
- [Bitcoin Integration](../bitcoin/00_summary.md) - For details on Bitcoin integration
- [Performance Optimization](../physics/00_summary.md) - For details on performance strategies
 
``` 
 
--- 
 
### 01_testing_strategy.md 
 
```.md 
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
``` 
 
--- 
 
### 02_error_handling.md 
 
```.md 
# Error Handling Strategy

This document outlines the comprehensive error handling strategy for the Bitcoin Protozoa project, focusing on graceful error recovery and user feedback.

## Table of Contents

1. [Error Handling Philosophy](#error-handling-philosophy) [Line 20]
2. [React Error Boundaries](#react-error-boundaries) [Line 40]
   - [Implementation](#implementation) [Line 45]
   - [Error Boundary Hierarchy](#error-boundary-hierarchy) [Line 120]
3. [Error Recovery Strategies](#error-recovery-strategies) [Line 150]
   - [Component Reset](#1-component-reset) [Line 155]
   - [State Rollback](#2-state-rollback) [Line 190]
   - [Feature Degradation](#3-feature-degradation) [Line 220]
4. [Async Error Handling](#async-error-handling) [Line 250]
   - [Promise Error Handling](#promise-error-handling) [Line 255]
   - [React Query](#react-query) [Line 290]
   - [Web Worker Errors](#web-worker-errors) [Line 320]
5. [User Feedback](#user-feedback) [Line 350]
   - [Error Messages](#error-messages) [Line 355]
   - [Loading States](#loading-states) [Line 390]
   - [Progress Indicators](#progress-indicators) [Line 420]
6. [Error Logging](#error-logging) [Line 450]
7. [Implementation Plan](#implementation-plan) [Line 480]
8. [Related Documents](#related-documents) [Line 520]

## Error Handling Philosophy

Since the application will be deployed as an immutable inscription on Bitcoin, error handling is critical:

1. **Prevention First**: Prevent errors through thorough testing and validation
2. **Graceful Degradation**: When errors occur, degrade gracefully rather than crashing
3. **Informative Feedback**: Provide clear, helpful information to users
4. **Recovery When Possible**: Attempt to recover from errors when feasible

The key principles of our error handling approach include:

- **Comprehensive Coverage**: Handle errors at all levels of the application
- **User-Centric**: Prioritize user experience when errors occur
- **Fail Gracefully**: Maintain core functionality when possible
- **Informative Feedback**: Provide clear, actionable error messages
- **Recovery Mechanisms**: Implement strategies to recover from errors

## React Error Boundaries

Error boundaries are React components that catch JavaScript errors in their child component tree, log those errors, and display a fallback UI.

### Implementation

```tsx
import React, { Component, ErrorInfo, ReactNode } from 'react';

interface ErrorBoundaryProps {
  children: ReactNode;
  fallback?: ReactNode;
  onError?: (error: Error, errorInfo: ErrorInfo) => void;
}

interface ErrorBoundaryState {
  hasError: boolean;
  error: Error | null;
}

class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  constructor(props: ErrorBoundaryProps) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error: Error): ErrorBoundaryState {
    // Update state so the next render will show the fallback UI
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo): void {
    // Log the error to an error reporting service
    console.error('Error caught by ErrorBoundary:', error, errorInfo);

    // Call the onError callback if provided
    if (this.props.onError) {
      this.props.onError(error, errorInfo);
    }
  }

  render(): ReactNode {
    if (this.state.hasError) {
      // Render fallback UI
      if (this.props.fallback) {
        return this.props.fallback;
      }

      // Default fallback UI
      return (
        <div className="error-boundary">
          <h2>Something went wrong.</h2>
          <p>The application encountered an error. Please try refreshing the page.</p>
          {this.state.error && (
            <details>
              <summary>Error details</summary>
              <pre>{this.state.error.toString()}</pre>
            </details>
          )}
        </div>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary;
```

### Error Boundary Hierarchy

Error boundaries should be strategically placed in the component tree:

```tsx
const App = () => {
  return (
    <ErrorBoundary fallback={<CriticalErrorScreen />} onError={logCriticalError}>
      {/* App-wide error boundary */}
      <Layout>
        <Header />
        <ErrorBoundary fallback={<ParticleSimulationError />} onError={logSimulationError}>
          {/* Simulation-specific error boundary */}
          <ParticleSimulation />
        </ErrorBoundary>
        <ErrorBoundary fallback={<ControlPanelError />} onError={logControlError}>
          {/* Control panel-specific error boundary */}
          <ControlPanel />
        </ErrorBoundary>
        <Footer />
      </Layout>
    </ErrorBoundary>
  );
};
```

This hierarchy ensures that:

1. **Isolated Failures**: Errors in one component don't crash the entire application
2. **Appropriate Fallbacks**: Each component has a contextually appropriate fallback UI
3. **Specific Error Handling**: Different types of errors can be handled differently
4. **Detailed Logging**: Errors can be logged with context-specific information

## Error Recovery Strategies

### 1. Component Reset

For component-level errors, reset the component to its initial state:

```tsx
const ParticleGroup = () => {
  const [error, setError] = useState<Error | null>(null);
  const [key, setKey] = useState(0);

  const handleError = (err: Error) => {
    setError(err);
    // Log the error
    console.error('Particle group error:', err);
    // Reset the component
    setKey(prev => prev + 1);
  };

  if (error) {
    return (
      <div className="particle-group-error">
        <p>Error in particle group. Attempting to recover...</p>
        <button onClick={() => setKey(prev => prev + 1)}>Retry</button>
      </div>
    );
  }

  return (
    <ErrorBoundary onError={handleError}>
      <ParticleGroupRenderer key={key} />
    </ErrorBoundary>
  );
};
```

### 2. State Rollback

For state corruption errors, roll back to a previous valid state:

```tsx
const ParticleSimulation = () => {
  const [currentState, setCurrentState] = useState<SimulationState>(initialState);
  const [previousState, setPreviousState] = useState<SimulationState>(initialState);
  const [error, setError] = useState<Error | null>(null);

  const updateState = (newState: SimulationState) => {
    try {
      // Validate the new state
      validateSimulationState(newState);

      // Store the current state as previous
      setPreviousState(currentState);

      // Update to the new state
      setCurrentState(newState);
    } catch (err) {
      // Log the error
      console.error('Invalid simulation state:', err);

      // Set the error state
      setError(err as Error);
    }
  };

  const rollbackState = () => {
    // Roll back to the previous state
    setCurrentState(previousState);
    setError(null);
  };

  if (error) {
    return (
      <div className="simulation-error">
        <p>Error in simulation state. Rolling back to previous state.</p>
        <button onClick={rollbackState}>Rollback</button>
      </div>
    );
  }

  return <SimulationRenderer state={currentState} onUpdate={updateState} />;
};
```

### 3. Feature Degradation

For non-critical features, degrade gracefully by disabling the feature:

```tsx
const ParticleEffects = () => {
  const [effectsEnabled, setEffectsEnabled] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  const applyEffects = (particles: Particle[]) => {
    try {
      if (!effectsEnabled) return particles;

      // Apply visual effects to particles
      return particles.map(particle => {
        // Complex effect calculations that might fail
        return applyVisualEffect(particle);
      });
    } catch (err) {
      // Log the error
      console.error('Error applying visual effects:', err);

      // Disable effects
      setEffectsEnabled(false);
      setError(err as Error);

      // Return particles without effects
      return particles;
    }
  };

  return (
    <div>
      {error && (
        <div className="effects-error">
          <p>Visual effects disabled due to an error.</p>
          <button onClick={() => { setEffectsEnabled(true); setError(null); }}>Retry Effects</button>
        </div>
      )}
      <ParticleRenderer particles={applyEffects(particles)} />
    </div>
  );
};
```

## Async Error Handling

### Promise Error Handling

For asynchronous operations, use proper error handling with try/catch and Promise chains:

```tsx
const ResourceLoader = ({ inscriptionId }: { inscriptionId: string }) => {
  const [resource, setResource] = useState<Resource | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    const loadResource = async () => {
      try {
        setLoading(true);

        // Try to load from inscription
        const inscriptionUrl = `/content/${inscriptionId}`;
        const response = await fetch(inscriptionUrl);

        if (!response.ok) {
          throw new Error(`Failed to load resource: ${response.status}`);
        }

        const data = await response.json();
        setResource(data);
      } catch (error) {
        console.error('Resource loading error:', error);
        setError(error as Error);

        // Try to load fallback
        try {
          const fallbackData = getFallbackResource(inscriptionId);
          setResource(fallbackData);
          // Clear error since we have fallback
          setError(null);
        } catch (fallbackError) {
          console.error('Fallback resource loading error:', fallbackError);
          // Keep the original error
        }
      } finally {
        setLoading(false);
      }
    };

    loadResource();
  }, [inscriptionId]);

  if (loading) {
    return <LoadingIndicator />;
  }

  if (error) {
    return (
      <div className="resource-error">
        <p>Failed to load resource: {error.message}</p>
        <button onClick={() => setError(null)}>Retry</button>
      </div>
    );
  }

  if (!resource) {
    return <div>No resource available</div>;
  }

  return <ResourceRenderer resource={resource} />;
};
```

### React Query

For data fetching, React Query provides built-in error handling and retry capabilities:

```tsx
import { useQuery } from '@tanstack/react-query';

const BlockDataDisplay = ({ blockNumber }: { blockNumber: number }) => {
  const { data, error, isLoading, refetch } = useQuery({
    queryKey: ['blockData', blockNumber],
    queryFn: async () => {
      const response = await fetch(`/r/blockinfo/${blockNumber}`);
      if (!response.ok) {
        throw new Error(`Failed to fetch block data: ${response.status}`);
      }
      return response.json();
    },
    retry: 3, // Retry failed requests 3 times
    retryDelay: attemptIndex => Math.min(1000 * 2 ** attemptIndex, 30000), // Exponential backoff
    staleTime: Infinity, // Data never goes stale (immutable blockchain data)
    cacheTime: 1000 * 60 * 60 * 24, // Cache for 24 hours
  });

  if (isLoading) {
    return <LoadingIndicator />;
  }

  if (error) {
    return (
      <div className="block-data-error">
        <p>Failed to fetch block data: {(error as Error).message}</p>
        <button onClick={() => refetch()}>Retry</button>
      </div>
    );
  }

  if (!data) {
    return <div>No block data available</div>;
  }

  return <BlockDataRenderer data={data} />;
};
```

### Web Worker Errors

For web workers, handle errors using the error event and message passing:

```tsx
// In the main thread
const PhysicsCalculator = () => {
  const [error, setError] = useState<Error | null>(null);
  const workerRef = useRef<Worker | null>(null);

  useEffect(() => {
    // Create a worker
    const worker = new Worker(new URL('../workers/physics.worker.ts', import.meta.url));

    // Handle messages from the worker
    worker.onmessage = (event) => {
      if (event.data.type === 'error') {
        setError(new Error(event.data.message));
      } else {
        // Handle successful results
        // ...
      }
    };

    // Handle worker errors
    worker.onerror = (event) => {
      console.error('Worker error:', event);
      setError(new Error('Physics calculation failed'));
    };

    workerRef.current = worker;

    return () => {
      worker.terminate();
    };
  }, []);

  const resetWorker = () => {
    if (workerRef.current) {
      workerRef.current.terminate();
    }

    const worker = new Worker(new URL('../workers/physics.worker.ts', import.meta.url));
    // Re-initialize worker
    // ...

    workerRef.current = worker;
    setError(null);
  };

  if (error) {
    return (
      <div className="physics-error">
        <p>Physics calculation error: {error.message}</p>
        <button onClick={resetWorker}>Reset Physics Engine</button>
      </div>
    );
  }

  return <PhysicsRenderer worker={workerRef.current} />;
};

// In the worker (physics.worker.ts)
self.onmessage = (event) => {
  try {
    // Perform physics calculations
    const result = performPhysicsCalculations(event.data);

    // Send result back to main thread
    self.postMessage({ type: 'result', data: result });
  } catch (error) {
    // Send error back to main thread
    self.postMessage({
      type: 'error',
      message: error instanceof Error ? error.message : 'Unknown error in physics worker'
    });
  }
};
```

## User Feedback

### Error Messages

Provide clear, actionable error messages to users:

```tsx
const ErrorMessage = ({ error, retry }: { error: Error; retry?: () => void }) => {
  // Determine error type and message
  let title = 'Error';
  let message = 'An unexpected error occurred.';

  if (error.message.includes('network') || error.message.includes('fetch')) {
    title = 'Network Error';
    message = 'Unable to connect to the server. Please check your internet connection.';
  } else if (error.message.includes('timeout')) {
    title = 'Request Timeout';
    message = 'The server took too long to respond. Please try again later.';
  } else if (error.message.includes('memory')) {
    title = 'Memory Error';
    message = 'The application ran out of memory. Try closing other tabs or refreshing the page.';
  }

  return (
    <div className="error-message">
      <h3>{title}</h3>
      <p>{message}</p>
      {error.message && (
        <details>
          <summary>Technical details</summary>
          <pre>{error.message}</pre>
        </details>
      )}
      {retry && (
        <button onClick={retry}>Retry</button>
      )}
    </div>
  );
};
```

### Loading States

Provide clear loading states to indicate that the application is working:

```tsx
const LoadingIndicator = ({ message = 'Loading...' }: { message?: string }) => {
  return (
    <div className="loading-indicator">
      <div className="spinner"></div>
      <p>{message}</p>
    </div>
  );
};

const ResourceLoader = ({ inscriptionId }: { inscriptionId: string }) => {
  const [loading, setLoading] = useState(true);
  const [progress, setProgress] = useState(0);
  const [loadingStage, setLoadingStage] = useState('Initializing...');

  useEffect(() => {
    const loadResource = async () => {
      try {
        setLoading(true);
        setProgress(0);
        setLoadingStage('Connecting to server...');

        // Simulate loading stages
        await new Promise(resolve => setTimeout(resolve, 500));
        setProgress(20);
        setLoadingStage('Fetching resource data...');

        await new Promise(resolve => setTimeout(resolve, 500));
        setProgress(50);
        setLoadingStage('Processing data...');

        await new Promise(resolve => setTimeout(resolve, 500));
        setProgress(80);
        setLoadingStage('Finalizing...');

        await new Promise(resolve => setTimeout(resolve, 500));
        setProgress(100);

        // Complete loading
        setLoading(false);
      } catch (error) {
        console.error('Loading error:', error);
        setLoadingStage(`Error: ${error.message}`);
      }
    };

    loadResource();
  }, [inscriptionId]);

  if (loading) {
    return (
      <div className="resource-loader">
        <LoadingIndicator message={loadingStage} />
        <ProgressBar progress={progress} />
      </div>
    );
  }

  return <ResourceDisplay inscriptionId={inscriptionId} />;
};
```

### Progress Indicators

Provide progress indicators for long-running operations:

```tsx
const ProgressBar = ({ progress }: { progress: number }) => {
  return (
    <div className="progress-container">
      <div
        className="progress-bar"
        style={{ width: `${Math.max(0, Math.min(100, progress))}%` }}
      ></div>
      <div className="progress-label">{Math.round(progress)}%</div>
    </div>
  );
};

const ResourceInitializer = () => {
  const [stage, setStage] = useState(0);
  const [progress, setProgress] = useState(0);
  const [error, setError] = useState<Error | null>(null);

  const stages = [
    { name: 'Loading physics engine', weight: 30 },
    { name: 'Loading particle system', weight: 30 },
    { name: 'Loading visual assets', weight: 20 },
    { name: 'Initializing simulation', weight: 20 }
  ];

  const totalWeight = stages.reduce((sum, stage) => sum + stage.weight, 0);

  // Calculate overall progress
  const calculateOverallProgress = (currentStage: number, currentProgress: number) => {
    const previousStagesWeight = stages
      .slice(0, currentStage)
      .reduce((sum, stage) => sum + stage.weight, 0);

    const currentStageProgress = (currentProgress / 100) * stages[currentStage].weight;

    return ((previousStagesWeight + currentStageProgress) / totalWeight) * 100;
  };

  useEffect(() => {
    const initializeResources = async () => {
      try {
        // Stage 0: Loading physics engine
        setStage(0);
        for (let i = 0; i <= 100; i += 10) {
          setProgress(i);
          await new Promise(resolve => setTimeout(resolve, 100));
        }

        // Stage 1: Loading particle system
        setStage(1);
        setProgress(0);
        for (let i = 0; i <= 100; i += 10) {
          setProgress(i);
          await new Promise(resolve => setTimeout(resolve, 100));
        }

        // Stage 2: Loading visual assets
        setStage(2);
        setProgress(0);
        for (let i = 0; i <= 100; i += 10) {
          setProgress(i);
          await new Promise(resolve => setTimeout(resolve, 100));
        }

        // Stage 3: Initializing simulation
        setStage(3);
        setProgress(0);
        for (let i = 0; i <= 100; i += 10) {
          setProgress(i);
          await new Promise(resolve => setTimeout(resolve, 100));
        }
      } catch (err) {
        console.error('Initialization error:', err);
        setError(err as Error);
      }
    };

    initializeResources();
  }, []);

  if (error) {
    return (
      <div className="initialization-error">
        <h3>Initialization Error</h3>
        <p>Failed to initialize: {error.message}</p>
        <button onClick={() => window.location.reload()}>Reload Application</button>
      </div>
    );
  }

  if (stage < stages.length) {
    const overallProgress = calculateOverallProgress(stage, progress);

    return (
      <div className="initialization">
        <h3>Initializing Application</h3>
        <p>{stages[stage].name}...</p>
        <ProgressBar progress={overallProgress} />
      </div>
    );
  }

  return <Application />;
};
```

## Error Logging

Implement error logging to track and diagnose errors:

```typescript
// Error logging service
class ErrorLogger {
  private static instance: ErrorLogger;
  private errors: Array<{ error: Error; timestamp: number; context?: any }> = [];

  private constructor() {
    // Private constructor for singleton pattern
    window.addEventListener('error', this.handleGlobalError.bind(this));
    window.addEventListener('unhandledrejection', this.handleUnhandledRejection.bind(this));
  }

  public static getInstance(): ErrorLogger {
    if (!ErrorLogger.instance) {
      ErrorLogger.instance = new ErrorLogger();
    }
    return ErrorLogger.instance;
  }

  public logError(error: Error, context?: any): void {
    const errorEntry = {
      error,
      timestamp: Date.now(),
      context
    };

    this.errors.push(errorEntry);
    console.error('Logged error:', errorEntry);

    // In development, store in local storage
    if (process.env.NODE_ENV === 'development') {
      this.storeErrorsInLocalStorage();
    }
  }

  private handleGlobalError(event: ErrorEvent): void {
    this.logError(new Error(event.message), {
      filename: event.filename,
      lineno: event.lineno,
      colno: event.colno
    });
  }

  private handleUnhandledRejection(event: PromiseRejectionEvent): void {
    this.logError(
      event.reason instanceof Error ? event.reason : new Error(String(event.reason)),
      { type: 'unhandledRejection' }
    );
  }

  private storeErrorsInLocalStorage(): void {
    try {
      localStorage.setItem('errorLog', JSON.stringify(this.errors));
    } catch (err) {
      console.error('Failed to store errors in localStorage:', err);
    }
  }

  public getErrors(): Array<{ error: Error; timestamp: number; context?: any }> {
    return [...this.errors];
  }

  public clearErrors(): void {
    this.errors = [];
    localStorage.removeItem('errorLog');
  }
}

// Usage
const errorLogger = ErrorLogger.getInstance();

try {
  // Some operation that might fail
  throw new Error('Test error');
} catch (error) {
  errorLogger.logError(error as Error, { component: 'TestComponent' });
}
```

## Implementation Plan

1. **Set Up Error Boundaries**:
   - Create ErrorBoundary component
   - Place error boundaries strategically in the component tree

2. **Implement Recovery Strategies**:
   - Component reset mechanism
   - State rollback system
   - Feature degradation approach

3. **Add Async Error Handling**:
   - Promise error handling
   - React Query setup
   - Web Worker error handling

4. **Create User Feedback Components**:
   - Error message components
   - Loading state components
   - Progress indicators

5. **Implement Error Logging**:
   - Development logging
   - Production logging to local storage

6. **Test Error Scenarios**:
   - Component errors
   - API errors
   - Resource loading errors
   - Worker errors

## Related Documents

- [Testing Strategy](01_testing_strategy.md) - For details on testing approach
- [Development Workflow](../deployment/01_development_workflow.md) - For details on the development process
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on the deployment pipeline
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
 
``` 
 
--- 
 
### 03_technical_implementation.md 
 
```.md 
# Technical Implementation

This document outlines the technical implementation details for testing the Bitcoin Protozoa project, focusing on code organization, performance considerations, security testing, and deployment verification.

## Table of Contents

1. [Introduction](#introduction) [Line 10]
2. [Code Organization](#code-organization) [Line 30]
3. [Performance Considerations](#performance-considerations) [Line 100]
4. [Security Considerations](#security-considerations) [Line 170]
5. [Deployment Considerations](#deployment-considerations) [Line 240]
6. [Implementation Examples](#implementation-examples) [Line 310]
7. [Related Documents](#related-documents) [Line 380]

## Introduction

The technical implementation of testing for Bitcoin Protozoa follows a structured approach to ensure comprehensive coverage, efficient execution, and reliable results. This document provides detailed information on how tests are organized, implemented, and executed within the project.

Key principles guiding our testing implementation:

1. **Deterministic Testing**: Tests must produce consistent results for the same inputs
2. **Isolation**: Tests should be isolated from each other to prevent interdependencies
3. **Performance Awareness**: Tests should be optimized for execution speed
4. **Comprehensive Coverage**: Tests should cover all critical aspects of the application
5. **Maintainability**: Test code should be well-organized and easy to maintain

Our testing implementation is designed to work seamlessly with the project's development workflow, providing immediate feedback during development while ensuring thorough validation before deployment to the Bitcoin blockchain.

## Code Organization

The testing code is organized following a structured approach that mirrors the application's architecture while maintaining clear separation between test code and application code.

### Directory Structure

```
src/
├── __tests__/                  # Root test directory
│   ├── unit/                   # Unit tests
│   │   ├── core/               # Core functionality tests
│   │   ├── particle/           # Particle system tests
│   │   ├── forcefield/         # Force field tests
│   │   ├── physics/            # Physics engine tests
│   │   ├── rng/                # RNG system tests
│   │   └── bitcoin/            # Bitcoin integration tests
│   │
│   ├── integration/            # Integration tests
│   │   ├── particle-physics/   # Particle-physics integration
│   │   ├── forcefield-particle/# Force field-particle integration
│   │   └── bitcoin-rng/        # Bitcoin-RNG integration
│   │
│   ├── performance/            # Performance tests
│   │   ├── rendering/          # Rendering performance
│   │   ├── physics/            # Physics calculation performance
│   │   └── memory/             # Memory usage tests
│   │
│   ├── visual/                 # Visual tests
│   │   ├── components/         # Component visual tests
│   │   ├── animations/         # Animation visual tests
│   │   └── effects/            # Visual effects tests
│   │
│   └── e2e/                    # End-to-end tests
│       ├── user-interactions/  # User interaction flows
│       └── bitcoin-flows/      # Bitcoin integration flows
│
├── __mocks__/                  # Mock implementations
│   ├── bitcoin-api/            # Bitcoin API mocks
│   ├── three/                  # Three.js mocks
│   └── workers/                # Web Worker mocks
│
└── __test-utils__/             # Test utilities
    ├── renderers/              # Test renderers
    ├── fixtures/               # Test fixtures
    ├── helpers/                # Test helper functions
    └── performance/            # Performance measurement tools
```

### Test File Naming Conventions

- Unit tests: `[component-name].test.ts`
- Integration tests: `[component-a]-[component-b].test.ts`
- Performance tests: `[component-name].perf.test.ts`
- Visual tests: `[component-name].visual.test.ts`
- End-to-end tests: `[flow-name].e2e.test.ts`

### Test Organization Patterns

Each test file follows a consistent organization pattern:

```typescript
// Import test utilities
import { render, screen, fireEvent } from '@testing-library/react';
import { createTestParticle, createTestForceField } from '../../__test-utils__/fixtures';

// Import components/functions to test
import { ParticleSystem } from '../../../src/domains/particle/ParticleSystem';

// Mock dependencies
jest.mock('../../../src/domains/physics/PhysicsEngine');

describe('ParticleSystem', () => {
  // Setup and teardown
  beforeEach(() => {
    // Common setup
  });

  afterEach(() => {
    // Common teardown
  });

  // Test groups
  describe('initialization', () => {
    test('initializes with correct default values', () => {
      // Test implementation
    });

    test('applies configuration options correctly', () => {
      // Test implementation
    });
  });

  describe('particle management', () => {
    test('adds particles correctly', () => {
      // Test implementation
    });

    test('removes particles correctly', () => {
      // Test implementation
    });
  });

  // More test groups...
});
```

## Performance Considerations

Performance testing is critical for Bitcoin Protozoa, as the application must maintain a smooth 60 FPS experience with 500 particles. Our performance testing implementation focuses on measuring, analyzing, and optimizing various aspects of the application's performance.

### Performance Metrics

We track the following key performance metrics:

1. **Frame Rate (FPS)**: The primary performance metric, targeting 60 FPS
2. **Frame Time**: Time taken to render each frame (target: <16.7ms)
3. **CPU Usage**: Percentage of CPU resources used
4. **Memory Usage**: Amount of memory consumed
5. **Garbage Collection**: Frequency and duration of garbage collection pauses
6. **Load Time**: Time taken to initialize the application

### Performance Monitoring Implementation

We've implemented a custom performance monitoring system that collects and analyzes performance data during testing:

```typescript
// Performance monitoring class
class PerformanceMonitor {
  private frameRates: number[] = [];
  private frameTimes: number[] = [];
  private memoryUsage: number[] = [];
  private lastFrameTime: number = 0;
  private isRunning: boolean = false;
  private rafId: number | null = null;

  // Start monitoring
  public start(): void {
    this.isRunning = true;
    this.lastFrameTime = performance.now();
    this.rafId = requestAnimationFrame(this.measure.bind(this));
  }

  // Stop monitoring and return results
  public stop(): PerformanceMetrics {
    this.isRunning = false;
    if (this.rafId !== null) {
      cancelAnimationFrame(this.rafId);
      this.rafId = null;
    }

    return this.calculateMetrics();
  }

  // Measure performance for each frame
  private measure(timestamp: number): void {
    if (!this.isRunning) return;

    // Calculate frame time
    const frameTime = timestamp - this.lastFrameTime;
    this.frameTimes.push(frameTime);

    // Calculate FPS
    const fps = 1000 / frameTime;
    this.frameRates.push(fps);

    // Measure memory usage if available
    if (performance.memory) {
      this.memoryUsage.push(performance.memory.usedJSHeapSize);
    }

    // Update last frame time
    this.lastFrameTime = timestamp;

    // Continue monitoring
    this.rafId = requestAnimationFrame(this.measure.bind(this));
  }

  // Calculate performance metrics
  private calculateMetrics(): PerformanceMetrics {
    const avgFPS = this.calculateAverage(this.frameRates);
    const minFPS = Math.min(...this.frameRates);
    const maxFPS = Math.max(...this.frameRates);

    const avgFrameTime = this.calculateAverage(this.frameTimes);
    const maxFrameTime = Math.max(...this.frameTimes);

    let avgMemory = 0;
    let peakMemory = 0;

    if (this.memoryUsage.length > 0) {
      avgMemory = this.calculateAverage(this.memoryUsage);
      peakMemory = Math.max(...this.memoryUsage);
    }

    return {
      averageFPS: avgFPS,
      minFPS,
      maxFPS,
      averageFrameTime: avgFrameTime,
      maxFrameTime,
      averageMemoryUsage: avgMemory,
      peakMemoryUsage: peakMemory,
      sampleCount: this.frameRates.length
    };
  }

  // Helper to calculate average
  private calculateAverage(values: number[]): number {
    if (values.length === 0) return 0;
    const sum = values.reduce((acc, val) => acc + val, 0);
    return sum / values.length;
  }
}
```

### Performance Test Implementation

Performance tests are implemented using the performance monitoring system and run under various conditions:

```typescript
// Performance test for particle system
describe('ParticleSystem Performance', () => {
  // Create a performance monitor
  let monitor: PerformanceMonitor;

  beforeEach(() => {
    monitor = new PerformanceMonitor();
  });

  test('maintains 60 FPS with 500 particles', async () => {
    // Create a test renderer
    const renderer = new TestRenderer();

    // Create a particle system with 500 particles
    const system = new ParticleSystem({
      particleCount: 500,
      renderer
    });

    // Initialize the system
    await system.initialize();

    // Start performance monitoring
    monitor.start();

    // Run the system for 5 seconds
    await runForDuration(5000, () => {
      system.update();
      renderer.render();
    });

    // Stop monitoring and get metrics
    const metrics = monitor.stop();

    // Assert performance requirements
    expect(metrics.averageFPS).toBeGreaterThanOrEqual(58);
    expect(metrics.minFPS).toBeGreaterThanOrEqual(55);
    expect(metrics.maxFrameTime).toBeLessThanOrEqual(20); // ms
  });

  test('scales linearly with particle count', async () => {
    const particleCounts = [100, 200, 300, 400, 500];
    const results = [];

    for (const count of particleCounts) {
      const renderer = new TestRenderer();
      const system = new ParticleSystem({ particleCount: count, renderer });
      await system.initialize();

      monitor.start();
      await runForDuration(2000, () => {
        system.update();
        renderer.render();
      });

      results.push({
        particleCount: count,
        metrics: monitor.stop()
      });
    }

    // Verify linear scaling
    const fpsRatios = [];
    for (let i = 1; i < results.length; i++) {
      const prevFPS = results[i-1].metrics.averageFPS;
      const currentFPS = results[i].metrics.averageFPS;
      const ratio = prevFPS / currentFPS;
      fpsRatios.push(ratio);
    }

    // Calculate average ratio (should be close to 1 for linear scaling)
    const avgRatio = fpsRatios.reduce((sum, ratio) => sum + ratio, 0) / fpsRatios.length;
    expect(avgRatio).toBeLessThanOrEqual(1.2); // Allow 20% deviation from linear
  });
});
```

## Security Considerations

Security testing is an important aspect of the Bitcoin Protozoa project, especially given its integration with the Bitcoin blockchain. Our security testing implementation focuses on identifying and mitigating potential security risks.

### Security Testing Areas

Our security testing covers the following key areas:

1. **Input Validation**: Testing for proper validation of all inputs, especially Bitcoin block data
2. **Resource Loading**: Testing for secure loading of resources from inscriptions
3. **Cross-Site Scripting (XSS)**: Testing for XSS vulnerabilities in user interfaces
4. **Dependency Security**: Testing for vulnerabilities in dependencies
5. **Data Integrity**: Testing for data integrity throughout the application

### Security Test Implementation

Security tests are implemented using a combination of automated and manual testing techniques:

```typescript
// Input validation security test
describe('Bitcoin Data Security', () => {
  test('validates block data structure', () => {
    const bitcoinService = new BitcoinService();

    // Test with valid data
    const validData = {
      nonce: 12345,
      confirmations: 1000
    };

    expect(() => bitcoinService.validateBlockData(validData)).not.toThrow();

    // Test with invalid data types
    const invalidTypeData = {
      nonce: 'not-a-number',
      confirmations: 1000
    };

    expect(() => bitcoinService.validateBlockData(invalidTypeData)).toThrow();

    // Test with missing fields
    const missingFieldData = {
      confirmations: 1000
    };

    expect(() => bitcoinService.validateBlockData(missingFieldData)).toThrow();

    // Test with out-of-range values
    const outOfRangeData = {
      nonce: -1,
      confirmations: 1000
    };

    expect(() => bitcoinService.validateBlockData(outOfRangeData)).toThrow();
  });

  test('sanitizes block data', () => {
    const bitcoinService = new BitcoinService();

    // Test with potentially malicious data
    const maliciousData = {
      nonce: 12345,
      confirmations: 1000,
      maliciousField: '<script>alert("XSS")</script>'
    };

    const sanitizedData = bitcoinService.sanitizeBlockData(maliciousData);

    // Verify that only expected fields are present
    expect(Object.keys(sanitizedData)).toEqual(['nonce', 'confirmations']);

    // Verify that values are of expected types
    expect(typeof sanitizedData.nonce).toBe('number');
    expect(typeof sanitizedData.confirmations).toBe('number');
  });
});
```

### Resource Loading Security

Testing for secure resource loading from inscriptions:

```typescript
// Resource loading security test
describe('Inscription Resource Loading', () => {
  test('validates resource integrity', async () => {
    const resourceLoader = new ResourceLoader();

    // Mock a resource with integrity hash
    const resourceWithIntegrity = {
      url: '/content/abc123',
      integrity: 'sha256-e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    };

    // Mock fetch to return a valid resource
    global.fetch = jest.fn().mockImplementation(() => {
      return Promise.resolve({
        ok: true,
        text: () => Promise.resolve('valid resource content')
      });
    });

    // Should not throw for valid integrity
    await expect(resourceLoader.loadWithIntegrity(resourceWithIntegrity))
      .resolves.not.toThrow();

    // Mock fetch to return a tampered resource
    global.fetch = jest.fn().mockImplementation(() => {
      return Promise.resolve({
        ok: true,
        text: () => Promise.resolve('tampered resource content')
      });
    });

    // Should throw for invalid integrity
    await expect(resourceLoader.loadWithIntegrity(resourceWithIntegrity))
      .rejects.toThrow();
  });

  test('handles malformed resources gracefully', async () => {
    const resourceLoader = new ResourceLoader();

    // Mock fetch to return malformed JSON
    global.fetch = jest.fn().mockImplementation(() => {
      return Promise.resolve({
        ok: true,
        json: () => Promise.reject(new Error('Invalid JSON'))
      });
    });

    // Should handle error gracefully
    await expect(resourceLoader.loadJSON('/content/abc123'))
      .rejects.toThrow();

    // Verify error is logged
    expect(console.error).toHaveBeenCalled();
  });
});
```

### Dependency Security

We implement automated dependency scanning as part of our security testing process:

```typescript
// This test runs as part of the CI pipeline
describe('Dependency Security', () => {
  test('no known vulnerabilities in dependencies', async () => {
    // This test uses a custom test runner that integrates with dependency scanning tools
    // such as npm audit or Snyk

    const vulnerabilities = await scanDependencies();

    // Fail the test if any high or critical vulnerabilities are found
    expect(vulnerabilities.filter(v => v.severity === 'high' || v.severity === 'critical'))
      .toHaveLength(0);
  });
});
```

## Deployment Considerations

Deployment testing is crucial for Bitcoin Protozoa, as the application will be deployed as immutable inscriptions on the Bitcoin blockchain. Our deployment testing implementation focuses on ensuring the application works correctly in the inscription environment.

### Deployment Testing Areas

Our deployment testing covers the following key areas:

1. **Resource Loading**: Testing that resources are correctly loaded from inscriptions
2. **Dependency Resolution**: Testing that dependencies are correctly resolved
3. **Size Optimization**: Testing that the application meets size constraints
4. **Immutability Handling**: Testing that the application works correctly with immutable resources
5. **Fallback Mechanisms**: Testing that fallback mechanisms work correctly

### Deployment Test Implementation

Deployment tests are implemented using a simulated inscription environment:

```typescript
// Simulated inscription environment
class InscriptionEnvironment {
  private resources: Map<string, string> = new Map();
  private originalFetch: typeof fetch;

  constructor() {
    // Save original fetch
    this.originalFetch = window.fetch;

    // Mock fetch to intercept inscription requests
    window.fetch = this.mockFetch.bind(this);
  }

  // Add a resource to the environment
  public addResource(inscriptionId: string, content: string): void {
    this.resources.set(inscriptionId, content);
  }

  // Mock fetch implementation
  private async mockFetch(url: string, options?: RequestInit): Promise<Response> {
    // Check if this is an inscription request
    const inscriptionMatch = url.match(/\/content\/([a-f0-9]+)/);
    if (inscriptionMatch) {
      const inscriptionId = inscriptionMatch[1];

      // Check if we have this resource
      if (this.resources.has(inscriptionId)) {
        const content = this.resources.get(inscriptionId);
        return new Response(content, {
          status: 200,
          headers: new Headers({
            'Content-Type': 'application/json'
          })
        });
      }

      // Resource not found
      return new Response('Not found', { status: 404 });
    }

    // Not an inscription request, use original fetch
    return this.originalFetch(url, options);
  }

  // Clean up
  public cleanup(): void {
    window.fetch = this.originalFetch;
  }
}
```

### Resource Loading Tests

Testing resource loading from inscriptions:

```typescript
describe('Inscription Resource Loading', () => {
  let environment: InscriptionEnvironment;

  beforeEach(() => {
    environment = new InscriptionEnvironment();

    // Add test resources
    environment.addResource('abc123', JSON.stringify({
      name: 'Test Resource',
      data: [1, 2, 3]
    }));
  });

  afterEach(() => {
    environment.cleanup();
  });

  test('loads resources from inscriptions', async () => {
    const resourceLoader = new ResourceLoader();

    // Load resource from inscription
    const resource = await resourceLoader.loadJSON('/content/abc123');

    // Verify resource content
    expect(resource).toEqual({
      name: 'Test Resource',
      data: [1, 2, 3]
    });
  });

  test('handles missing resources gracefully', async () => {
    const resourceLoader = new ResourceLoader();

    // Try to load non-existent resource
    await expect(resourceLoader.loadJSON('/content/nonexistent'))
      .rejects.toThrow();

    // Verify fallback is attempted
    expect(resourceLoader.attemptedFallback).toBe(true);
  });
});
```

### Size Optimization Tests

Testing that the application meets size constraints:

```typescript
describe('Size Optimization', () => {
  test('bundle size is within limits', async () => {
    // Get bundle size information
    const bundleStats = await getBundleStats();

    // Verify total bundle size
    expect(bundleStats.totalSize).toBeLessThanOrEqual(350 * 1024); // 350 KB max

    // Verify individual chunk sizes
    for (const chunk of bundleStats.chunks) {
      expect(chunk.size).toBeLessThanOrEqual(100 * 1024); // 100 KB max per chunk
    }
  });

  test('resources are optimized', async () => {
    // Get resource size information
    const resourceStats = await getResourceStats();

    // Verify total resource size
    expect(resourceStats.totalSize).toBeLessThanOrEqual(150 * 1024); // 150 KB max

    // Verify individual resource sizes
    for (const resource of resourceStats.resources) {
      expect(resource.size).toBeLessThanOrEqual(50 * 1024); // 50 KB max per resource
    }
  });
});
```

## Implementation Examples

This section provides practical implementation examples for common testing scenarios in the Bitcoin Protozoa project.

### Unit Testing Example

Unit test for the RNG system using Bitcoin nonce:

```typescript
// RNG system unit test
import { createRNG } from '../../../src/domains/rng/RNGSystem';

describe('RNG System', () => {
  test('creates deterministic sequence from Bitcoin nonce', () => {
    // Create RNG with specific nonce
    const nonce = 123456789;
    const rng = createRNG(nonce);

    // Generate sequence of random numbers
    const sequence1 = [];
    for (let i = 0; i < 10; i++) {
      sequence1.push(rng());
    }

    // Create new RNG with same nonce
    const rng2 = createRNG(nonce);

    // Generate second sequence
    const sequence2 = [];
    for (let i = 0; i < 10; i++) {
      sequence2.push(rng2());
    }

    // Sequences should be identical
    expect(sequence1).toEqual(sequence2);

    // Create RNG with different nonce
    const rng3 = createRNG(nonce + 1);

    // Generate third sequence
    const sequence3 = [];
    for (let i = 0; i < 10; i++) {
      sequence3.push(rng3());
    }

    // Sequence should be different
    expect(sequence1).not.toEqual(sequence3);
  });

  test('generates values in expected range', () => {
    const rng = createRNG(123456789);

    // Generate 1000 values
    const values = [];
    for (let i = 0; i < 1000; i++) {
      values.push(rng());
    }

    // All values should be in range [0, 1)
    expect(values.every(v => v >= 0 && v < 1)).toBe(true);

    // Mean should be approximately 0.5
    const mean = values.reduce((sum, v) => sum + v, 0) / values.length;
    expect(mean).toBeCloseTo(0.5, 1);
  });
});
```

### Integration Testing Example

Integration test for particle-physics interaction:

```typescript
// Particle-physics integration test
import { ParticleSystem } from '../../../src/domains/particle/ParticleSystem';
import { PhysicsEngine } from '../../../src/domains/physics/PhysicsEngine';

describe('Particle-Physics Integration', () => {
  test('particles respond to physics forces', () => {
    // Create physics engine
    const physics = new PhysicsEngine();

    // Create particle system with physics
    const particles = new ParticleSystem({
      physics,
      particleCount: 10
    });

    // Get initial positions
    const initialPositions = particles.getParticles().map(p => ({
      x: p.position.x,
      y: p.position.y,
      z: p.position.z
    }));

    // Add gravity force
    physics.addForce({
      type: 'gravity',
      direction: { x: 0, y: -1, z: 0 },
      strength: 9.8
    });

    // Update system
    particles.update(1.0); // 1 second

    // Get new positions
    const newPositions = particles.getParticles().map(p => ({
      x: p.position.x,
      y: p.position.y,
      z: p.position.z
    }));

    // Positions should have changed
    expect(newPositions).not.toEqual(initialPositions);

    // Y positions should have decreased (gravity)
    for (let i = 0; i < newPositions.length; i++) {
      expect(newPositions[i].y).toBeLessThan(initialPositions[i].y);
    }
  });
});
```

### End-to-End Testing Example

End-to-end test for Bitcoin integration flow:

```typescript
// Bitcoin integration E2E test
import { screen, fireEvent, waitFor } from '@testing-library/react';
import { render } from '../../../__test-utils__/test-renderer';
import { App } from '../../../src/App';
import { mockBitcoinAPI } from '../../../__mocks__/bitcoin-api';

describe('Bitcoin Integration Flow', () => {
  beforeEach(() => {
    // Mock Bitcoin API
    mockBitcoinAPI.getBlockInfo.mockResolvedValue({
      nonce: 123456789,
      confirmations: 10000
    });
  });

  test('loads and displays Bitcoin data', async () => {
    // Render app
    render(<App />);

    // Wait for loading to complete
    await waitFor(() => {
      expect(screen.queryByText('Loading...')).not.toBeInTheDocument();
    });

    // Bitcoin data should be displayed
    expect(screen.getByText('Block Nonce: 123456789')).toBeInTheDocument();
    expect(screen.getByText('Confirmations: 10,000')).toBeInTheDocument();

    // Creature should be rendered
    expect(screen.getByTestId('creature-container')).toBeInTheDocument();

    // Particle count should match requirements
    const particleElements = screen.getAllByTestId('particle');
    expect(particleElements.length).toBe(500);
  });

  test('handles Bitcoin API errors gracefully', async () => {
    // Mock API error
    mockBitcoinAPI.getBlockInfo.mockRejectedValue(new Error('API Error'));

    // Render app
    render(<App />);

    // Wait for error to be displayed
    await waitFor(() => {
      expect(screen.getByText('Error loading Bitcoin data')).toBeInTheDocument();
    });

    // Retry button should be displayed
    const retryButton = screen.getByText('Retry');
    expect(retryButton).toBeInTheDocument();

    // Mock successful response for retry
    mockBitcoinAPI.getBlockInfo.mockResolvedValue({
      nonce: 123456789,
      confirmations: 10000
    });

    // Click retry
    fireEvent.click(retryButton);

    // Wait for loading to complete
    await waitFor(() => {
      expect(screen.queryByText('Loading...')).not.toBeInTheDocument();
    });

    // Bitcoin data should now be displayed
    expect(screen.getByText('Block Nonce: 123456789')).toBeInTheDocument();
  });
});
```

## Related Documents

- [Testing Strategy](01_testing_strategy.md) - Overall testing strategy and approach
- [Error Handling Strategy](02_error_handling_strategy.md) - Error handling approach
- [Development UI](04_development_ui.md) - Development UI for testing
- [Bitcoin Integration](../bitcoin/05_bitcoin_integration_details_part1.md) - Bitcoin integration details
- [Particle System](../engine/03_particle_system.md) - Particle system implementation
- [Physics System](../engine/02_physics_system.md) - Physics system implementation 
``` 
 
--- 
 
