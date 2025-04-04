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
