# Module Structure

This document outlines the detailed module structure for the Bitcoin Protozoa project, organizing the codebase for maintainability, performance, and clean architecture.

## Table of Contents

1. [Domain-Based Structure](#domain-based-structure)
2. [Directory Structure](#directory-structure)
3. [Domain Module Structure](#domain-module-structure)
4. [Detailed Module Breakdown](#detailed-module-breakdown)
5. [Module Communication](#module-communication)
6. [Code Splitting Strategy](#code-splitting-strategy)
7. [Implementation Guidelines](#implementation-guidelines)
8. [Related Documents](#related-documents)

## Domain-Based Structure

The project follows a domain-based structure, organizing code by feature rather than by type. This approach improves maintainability and makes it easier to understand the codebase.

## Directory Structure

### Root Directory Structure

```
/
├── src/                      # Source code
├── public/                   # Static assets
├── tests/                    # Test files
├── vite.config.ts            # Vite configuration
├── tsconfig.json             # TypeScript configuration
├── package.json              # Dependencies and scripts
└── README.md                 # Project documentation
```

### Source Directory Structure

```
src/
├── main.tsx                  # Application entry point
├── App.tsx                   # Root component
├── vite-env.d.ts             # Vite type declarations
├── assets/                   # Static assets (images, fonts, etc.)
├── components/               # Shared UI components
├── hooks/                    # Custom React hooks
├── store/                    # Global state management
├── types/                    # TypeScript type definitions
├── utils/                    # Utility functions
├── workers/                  # Web Workers
└── domains/                  # Domain-specific modules
    ├── core/                 # Core application logic
    ├── particle/             # Particle system
    ├── forcefield/           # Force field system
    ├── physics/              # Physics engine
    ├── rng/                  # Random number generation
    ├── trait/                # Trait system
    ├── mutation/             # Mutation system
    ├── bitcoin/              # Bitcoin integration
    └── ui/                   # User interface
```

## Domain Module Structure

Each domain module follows a consistent structure:

```
domains/[domain]/
├── index.ts                  # Public API
├── types.ts                  # Domain-specific types
├── constants.ts              # Domain-specific constants
├── hooks/                    # Domain-specific hooks
├── components/               # Domain-specific components
├── services/                 # Domain-specific services
├── utils/                    # Domain-specific utilities
└── workers/                  # Domain-specific workers
```

## Detailed Module Breakdown

### Core Domain

```
domains/core/
├── index.ts                  # Public API
├── types.ts                  # Core types
├── constants.ts              # Core constants
├── components/               # Core components
│   ├── ParticleCreature.tsx  # Main creature component
│   └── CreatureContainer.tsx # Container for creature
├── hooks/                    # Core hooks
│   ├── useCreature.ts        # Hook for creature management
│   └── useBlockData.ts       # Hook for block data
├── services/                 # Core services
│   ├── creatureService.ts    # Creature management service
│   └── blockService.ts       # Block data service
└── utils/                    # Core utilities
    └── initialization.ts     # Initialization utilities
```

### Particle Domain

```
domains/particle/
├── index.ts                  # Public API
├── types.ts                  # Particle types
├── constants.ts              # Particle constants
├── components/               # Particle components
│   ├── ParticleGroup.tsx     # Particle group component
│   └── ParticleRenderer.tsx  # Particle rendering component
├── hooks/                    # Particle hooks
│   ├── useParticles.ts       # Hook for particle management
│   └── useParticleEffects.ts # Hook for particle effects
├── services/                 # Particle services
│   ├── particleService.ts    # Particle management service
│   └── groupService.ts       # Group management service
├── utils/                    # Particle utilities
│   ├── particleUtils.ts      # Particle utility functions
│   └── groupUtils.ts         # Group utility functions
└── workers/                  # Particle workers
    └── particleWorker.ts     # Worker for particle calculations
```

### Force Field Domain

```
domains/forcefield/
├── index.ts                  # Public API
├── types.ts                  # Force field types
├── constants.ts              # Force field constants
├── components/               # Force field components
│   └── ForceFieldRenderer.tsx # Force field rendering component
├── hooks/                    # Force field hooks
│   └── useForceFields.ts     # Hook for force field management
├── services/                 # Force field services
│   └── forceFieldService.ts  # Force field management service
├── utils/                    # Force field utilities
│   ├── forceFieldUtils.ts    # Force field utility functions
│   └── geometryUtils.ts      # Geometry utility functions
└── workers/                  # Force field workers
    └── forceFieldWorker.ts   # Worker for force field calculations
```

### Physics Domain

```
domains/physics/
├── index.ts                  # Public API
├── types.ts                  # Physics types
├── constants.ts              # Physics constants
├── hooks/                    # Physics hooks
│   └── usePhysics.ts         # Hook for physics management
├── services/                 # Physics services
│   ├── physicsService.ts     # Physics management service
│   ├── collisionService.ts   # Collision detection service
│   └── spatialService.ts     # Spatial partitioning service
├── utils/                    # Physics utilities
│   ├── vectorUtils.ts        # Vector utility functions
│   └── mathUtils.ts          # Math utility functions
└── workers/                  # Physics workers
    └── physicsWorker.ts      # Worker for physics calculations
```

### RNG Domain

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

### Bitcoin Domain

```
domains/bitcoin/
├── index.ts                  # Public API
├── types.ts                  # Bitcoin types
├── constants.ts              # Bitcoin constants
├── hooks/                    # Bitcoin hooks
│   └── useBlockData.ts       # Hook for block data
├── services/                 # Bitcoin services
│   ├── blockService.ts       # Block data service
│   └── inscriptionService.ts # Inscription service
└── utils/                    # Bitcoin utilities
    └── bitcoinUtils.ts       # Bitcoin utility functions
```

## Module Communication

### Service-Based Communication

Services are the primary means of communication between modules:

```typescript
// Example of service-based communication
import { particleService } from '@domains/particle';
import { forceFieldService } from '@domains/forcefield';
import { physicsService } from '@domains/physics';

// Physics service uses particle and force field services
physicsService.update = (deltaTime: number) => {
  const particles = particleService.getParticles();
  const forceFields = forceFieldService.getForceFields();
  
  // Update physics based on particles and force fields
  // ...
  
  // Update particle positions
  particles.forEach(particle => {
    // Update position
    // ...
    
    // Update particle in service
    particleService.updateParticle(particle.id, particle);
  });
};
```

### Event-Based Communication

For looser coupling, events can be used:

```typescript
// Event system
import { eventBus } from '@utils/eventBus';

// Physics service subscribes to events
physicsService.initialize = () => {
  eventBus.on('particles:updated', (particles) => {
    // Handle updated particles
  });
  
  eventBus.on('forceFields:updated', (forceFields) => {
    // Handle updated force fields
  });
};

// Particle service publishes events
particleService.updateParticles = (particles) => {
  // Update particles
  // ...
  
  // Publish event
  eventBus.emit('particles:updated', particles);
};
```

### Hook-Based Communication

For React components, hooks provide a clean API:

```typescript
// Example of hook-based communication
import { useParticles } from '@domains/particle';
import { useForceFields } from '@domains/forcefield';
import { usePhysics } from '@domains/physics';

const ParticleSimulation = () => {
  const { particles } = useParticles();
  const { forceFields } = useForceFields();
  const { update } = usePhysics();
  
  useAnimationFrame(() => {
    update(particles, forceFields);
  });
  
  return (
    // Render particles
  );
};
```

## Code Splitting Strategy

Code is split along domain boundaries to optimize loading:

```typescript
// Example of code splitting
import { lazy } from 'react';

// Lazy load the particle domain
const ParticleSimulation = lazy(() => import('@domains/particle/components/ParticleSimulation'));

// Lazy load the UI domain
const ControlPanel = lazy(() => import('@domains/ui/components/ControlPanel'));

// Use in a component
const App = () => {
  return (
    <Suspense fallback={<LoadingScreen />}>
      <ParticleSimulation />
      <Suspense fallback={<div>Loading controls...</div>}>
        <ControlPanel />
      </Suspense>
    </Suspense>
  );
};
```

## Implementation Guidelines

1. **Domain Isolation**: Each domain should be self-contained with a clear public API
2. **Service Ownership**: Each service should have a single responsibility
3. **Type Safety**: Use TypeScript interfaces and types for all domain objects
4. **Consistent Naming**: Follow consistent naming conventions across the codebase
5. **Documentation**: Document all public APIs and complex implementations
6. **Testing**: Write tests for each domain module
7. **Performance**: Consider performance implications of all design decisions

## Related Documents

- [System Architecture](02_system_architecture.md) - For details on the system architecture
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Physics Engine](../physics/01_physics_engine.md) - For details on the physics engine
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
