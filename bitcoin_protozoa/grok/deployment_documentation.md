# deployment DOCUMENTATION 
 
This document contains all the content from the deployment subdirectory of the Bitcoin Protozoa project. 
 
## Files 
 
### 00_summary.md 
 
```.md 
# Deployment Summary

This directory contains documentation on the development workflow, deployment pipeline, and asset management for the Bitcoin Protozoa project.

## Key Documents

- [Development Workflow](01_development_workflow.md) - Development process and environment
- [Deployment Pipeline](02_deployment_pipeline.md) - Ordinals inscription pipeline
- [Asset Management](03_asset_management.md) - Asset management strategy

## Development Workflow Overview

The development workflow is designed to ensure efficient development and testing:

1. **Engine First**: Building the particle engine before preparing for inscription
2. **Incremental Testing**: Testing components incrementally
3. **Local Development**: Using local development environment with mock Bitcoin data
4. **Optimization Phase**: Optimizing for performance and size
5. **Inscription Preparation**: Preparing for Ordinals inscription

## Development Phases

The development process is divided into several phases:

1. **Engine Development**: Building the core particle and physics engine
2. **UI Development**: Creating the user interface
3. **Bitcoin Integration**: Implementing Bitcoin data integration
4. **Optimization**: Optimizing for performance and size
5. **Inscription Preparation**: Preparing for Ordinals inscription
6. **Deployment**: Inscribing on Bitcoin

## Deployment Pipeline

The deployment pipeline handles the process of inscribing the application on Bitcoin:

1. **Build Optimization**: Optimizing the build for inscription
2. **Chunk Preparation**: Splitting the application into optimal chunks
3. **Inscription Order Planning**: Planning the order of inscriptions
4. **Inscription Process**: Inscribing chunks on Bitcoin
5. **Verification**: Verifying inscriptions
6. **Monitoring**: Monitoring inscription health

## Asset Management

The asset management strategy ensures efficient organization and loading of assets:

1. **Type Definitions**: Pre-defining all types
2. **Class Definitions**: Pre-defining all classes
3. **Function Definitions**: Pre-defining all functions
4. **Module Structure**: Organizing code into modules
5. **Import/Export Chain**: Managing dependencies
6. **Asset Loading**: Optimizing asset loading
7. **Asset Versioning**: Managing asset versions

## Related Documentation

- [Bitcoin Integration](../bitcoin/00_summary.md) - For details on Bitcoin integration
- [Module Structure](../core/03_module_structure.md) - For details on code organization
- [Performance Optimization](../physics/00_summary.md) - For details on performance strategies
 
``` 
 
--- 
 
### 01_development_workflow.md 
 
```.md 
# Development Workflow

This document outlines the development workflow for the Bitcoin Protozoa project, focusing on building the engine first before preparing for inscription on Bitcoin. The workflow is designed to ensure a smooth development process while keeping the final inscription requirements in mind.

## Table of Contents

1. [Development Phases](#development-phases)
2. [Development Tools and Practices](#development-tools-and-practices)
3. [Bitcoin Dependencies During Development](#bitcoin-dependencies-during-development)
4. [Development Environment Setup](#development-environment-setup)
5. [Development Workflow Steps](#development-workflow-steps)
6. [Inscription Workflow](#inscription-workflow)
7. [Related Documents](#related-documents)

## Development Phases

### Phase 1: Engine Development

The primary focus is on building a fully functional particle simulation engine that meets all the requirements:

1. **Core Engine Components**
   - Particle system
   - Physics engine
   - Force field system
   - Formation calculations
   - RNG system
   - Trait system

2. **Development Environment**
   - Use Vite for fast development and hot module replacement
   - Implement TypeScript for type safety
   - Set up React and React Three Fiber for rendering
   - Configure Zustand for state management

3. **Development Dependencies**
   - During development, use npm/yarn to install all required dependencies
   - Keep track of all dependencies that will need to be inscribed later
   - Use standard development tools without inscription constraints

4. **Testing Environment**
   - Implement browser-based testing
   - Set up Vitest for unit testing
   - Create visual regression tests for particle behaviors
   - Test performance on various devices

### Phase 2: Optimization

Once the engine is functional, focus on optimization:

1. **Performance Optimization**
   - Implement all performance strategies from the optimization document
   - Profile and identify bottlenecks
   - Optimize render loops and physics calculations
   - Implement worker-based processing

2. **Code Size Optimization**
   - Analyze bundle size
   - Remove unused code
   - Implement code splitting strategy
   - Minimize dependencies

3. **Memory Optimization**
   - Implement object pooling
   - Optimize data structures
   - Reduce garbage collection pressure
   - Monitor memory usage

### Phase 3: Inscription Preparation

Prepare the codebase for inscription on Bitcoin:

1. **Dependency Management**
   - Identify all external dependencies
   - Determine which dependencies need to be inscribed
   - Create a dependency loading strategy
   - Test with simulated inscription environment

2. **Code Splitting for Inscription**
   - Implement the code splitting strategy for inscriptions
   - Create optimal chunk sizes for inscription
   - Define loading order for dependencies
   - Test loading sequence

3. **Fallback Mechanisms**
   - Implement fallbacks for failed inscriptions
   - Create retry mechanisms for loading dependencies
   - Add error handling for missing resources
   - Test resilience to network issues

### Phase 4: Deployment and Testing

Final preparation for deployment:

1. **Inscription Testing**
   - Test with actual inscriptions on testnet
   - Verify loading sequence works
   - Confirm all dependencies load correctly
   - Validate performance in real-world conditions

2. **Final Optimization**
   - Make final adjustments based on inscription testing
   - Optimize loading sequence
   - Minimize initial load time
   - Ensure smooth user experience

## Development Tools and Practices

### Version Control

- Use Git for version control
- Implement feature branches for development
- Use pull requests for code review
- Maintain a clean commit history

### Code Quality

- Implement ESLint for code quality
- Use Prettier for code formatting
- Follow TypeScript best practices
- Document code thoroughly

### Testing Strategy

- Write unit tests for core functionality
- Implement integration tests for system components
- Create visual tests for particle behaviors
- Perform performance testing regularly

### Documentation

- Document all components and systems
- Create architecture diagrams
- Maintain up-to-date API documentation
- Document optimization strategies

## Bitcoin Dependencies During Development

During development, we will handle Bitcoin dependencies as follows:

1. **Local Development**
   - Use mock Bitcoin data for local development
   - Create test fixtures for block data
   - Simulate confirmation counts
   - Generate test nonces for deterministic testing

2. **API Integration**
   - Use ordinals.com API for real Bitcoin data
   - Implement caching for API responses
   - Add fallback mechanisms for API failures
   - Create test environments with API mocks

3. **Inscription Testing**
   - Test with small inscriptions first
   - Gradually increase inscription complexity
   - Test loading sequence with actual inscriptions
   - Validate behavior with real Bitcoin data

## Development Environment Setup

### Local Development Environment

```bash
# Clone repository
git clone https://github.com/your-org/bitcoin-protozoa.git
cd bitcoin-protozoa

# Install dependencies
npm install

# Start development server
npm run dev

# Run tests
npm test
```

### Required Tools

- Node.js (v16+)
- npm or yarn
- Git
- Modern web browser with developer tools
- Code editor with TypeScript support

### Recommended Extensions

- ESLint
- Prettier
- TypeScript
- React Developer Tools
- Three.js Editor

## Development Workflow Steps

1. **Feature Development**
   - Create a feature branch
   - Implement the feature
   - Write tests
   - Document the feature
   - Create a pull request

2. **Code Review**
   - Review code for quality and performance
   - Verify tests pass
   - Check documentation
   - Approve or request changes

3. **Integration**
   - Merge feature branch
   - Verify integration tests pass
   - Check for performance regressions
   - Update documentation if needed

4. **Release Preparation**
   - Create a release branch
   - Perform final testing
   - Prepare for inscription
   - Create release notes

## Inscription Workflow

The inscription workflow will be detailed in the deployment pipeline document, but the key steps are:

1. Build optimized production code
2. Split code into inscription chunks
3. Inscribe dependencies in correct order
4. Inscribe application code
5. Test inscribed application
6. Deploy final inscriptions

## Related Documents

- [Deployment Pipeline](02_deployment_pipeline.md) - For details on the deployment pipeline
- [Asset Management](03_asset_management.md) - For details on asset management
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
- [Module Structure](../core/03_module_structure.md) - For details on code organization
 
``` 
 
--- 
 
### 02_deployment_pipeline.md 
 
```.md 
# Deployment Pipeline

This document outlines the deployment pipeline for inscribing the Bitcoin Protozoa project on Bitcoin using the Ordinals protocol. It covers the entire process from pre-deployment preparation to monitoring and maintenance.

## Table of Contents

1. [Overview](#overview)
2. [Pre-Deployment Preparation](#pre-deployment-preparation)
3. [Chunk Preparation](#chunk-preparation)
4. [Inscription Order Planning](#inscription-order-planning)
5. [Inscription Process](#inscription-process)
6. [Fallback Mechanisms](#fallback-mechanisms)
7. [Monitoring and Maintenance](#monitoring-and-maintenance)
8. [Security Considerations](#security-considerations)
9. [Deployment Checklist](#deployment-checklist)
10. [Troubleshooting](#troubleshooting)
11. [Related Documents](#related-documents)

## Overview

The Bitcoin Protozoa project will be deployed on Bitcoin using the Ordinals protocol, which allows for the inscription of arbitrary content on individual satoshis. This deployment approach provides several benefits:

1. **Immutability**: Once inscribed, the code cannot be altered
2. **Permanence**: The code will exist as long as Bitcoin exists
3. **Decentralization**: No reliance on centralized servers
4. **Unique Ownership**: Each inscription has a clear owner
5. **Recursive Loading**: Inscriptions can reference other inscriptions

The deployment pipeline is designed to handle the complexities of inscribing a modern web application on Bitcoin while ensuring reliability, performance, and maintainability.

## Pre-Deployment Preparation

### Build Optimization

Before deployment, optimize the application build:

```bash
# Install dependencies
npm install

# Build with production optimization
npm run build

# Analyze bundle size
npm run analyze
```

Key optimization targets:
- Total bundle size under 4MB (split across multiple inscriptions)
- Individual chunk size under 400KB
- Minimal external dependencies
- Efficient code splitting

### Dependency Analysis

Identify all external dependencies that need to be inscribed:

```bash
# Generate dependency report
npm run analyze:deps

# Output should include:
# - React
# - ReactDOM
# - Three.js
# - Zustand
# - Other core libraries
```

### Deployment Tools

Install and configure the necessary tools:

```bash
# Install ord
git clone https://github.com/casey/ord
cd ord
cargo build --release

# Move binary to path
sudo mv target/release/ord /usr/local/bin/

# Initialize ord wallet
ord wallet create

# Fund wallet for inscriptions
# (Send BTC to the address shown by the command below)
ord wallet receive
```

## Chunk Preparation

### Application Chunking Strategy

Split the application into logical chunks:

1. **Core**: Essential application code and initialization
2. **Particle**: Particle system implementation
3. **Physics**: Physics engine and calculations
4. **UI**: User interface components
5. **Dependencies**: External libraries (React, Three.js, etc.)

### Chunk Creation

Create optimized chunks for inscription:

```bash
# Create inscription directory
mkdir -p inscriptions

# Create chunks using custom build script
node scripts/create-chunks.js

# Verify chunks
ls -la inscriptions/
```

Each chunk should:
- Be self-contained or have clear dependencies
- Include version information
- Have minimal size
- Be properly minified and optimized

## Inscription Order Planning

### Dependency Graph

Create a dependency graph to determine inscription order:

```
1. External Dependencies (React, Three.js, etc.)
2. Core Application
3. Particle System
4. Physics Engine
5. UI Components
6. Main HTML
```

### Recursive Inscriptions

Plan for recursive loading:

```javascript
// Example of recursive loading in main HTML
async function loadDependencies() {
  // Load dependencies in order
  // Use appropriate endpoint based on environment
  const baseUrl = process.env.NODE_ENV === 'development'
    ? 'https://ordinals.com'
    : '';

  // ONLY use ordinals.com API, no fallbacks
  await loadScript(`${baseUrl}/content/REACT_INSCRIPTION_ID`);
  await loadScript(`${baseUrl}/content/THREE_INSCRIPTION_ID`);
  await loadScript(`${baseUrl}/content/CORE_INSCRIPTION_ID`);
  // ...and so on
}
```

## Inscription Process

### Inscribe Dependencies

First, inscribe all external dependencies:

```bash
# Inscribe React
ord wallet inscribe --fee-rate 10 inscriptions/react.js

# Record inscription ID
REACT_INSCRIPTION_ID="<output-inscription-id>"

# Inscribe ReactDOM
ord wallet inscribe --fee-rate 10 inscriptions/react-dom.js

# Record inscription ID
REACT_DOM_INSCRIPTION_ID="<output-inscription-id>"

# Continue for all dependencies...
```

### Inscribe Application Chunks

Next, inscribe the application chunks:

```bash
# Inscribe core chunk
ord wallet inscribe --fee-rate 10 inscriptions/core.js

# Record inscription ID
CORE_INSCRIPTION_ID="<output-inscription-id>"

# Continue for all chunks...
```

### Create Main HTML Inscription

Create and inscribe the main HTML file that loads all chunks:

```bash
cat > inscriptions/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bitcoin Protozoa</title>
  <style>
    body { margin: 0; overflow: hidden; background: #1a1a1a; }
    #loading { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: #ff8c00; font-family: sans-serif; }
  </style>
</head>
<body>
  <div id="root"></div>
  <div id="loading">Loading Bitcoin Protozoa...</div>

  <script>
    // Load dependencies in order
    const dependencies = [
      { id: "REACT_INSCRIPTION_ID", name: "react" },
      { id: "REACT_DOM_INSCRIPTION_ID", name: "react-dom" },
      { id: "THREE_INSCRIPTION_ID", name: "three" },
      { id: "ZUSTAND_INSCRIPTION_ID", name: "zustand" },
      { id: "CORE_INSCRIPTION_ID", name: "core" },
      { id: "PARTICLE_INSCRIPTION_ID", name: "particle" },
      { id: "PHYSICS_INSCRIPTION_ID", name: "physics" },
      { id: "UI_INSCRIPTION_ID", name: "ui" }
    ];

    // Load each dependency in sequence
    async function loadDependencies() {
      try {
        for (const dep of dependencies) {
          // Use appropriate endpoint based on environment
          const baseUrl = process.env.NODE_ENV === 'development'
            ? 'https://ordinals.com'
            : '';

          await loadScript(\`${baseUrl}/content/\${dep.id}\`);
          console.log(\`Loaded \${dep.name}\`);
        }

        // Initialize application
        document.getElementById('loading').style.display = 'none';
        window.initializeApplication();
      } catch (error) {
        console.error('Failed to load dependencies:', error);
        document.getElementById('loading').textContent = 'Failed to load. Please try again.';
      }
    }

    // Helper to load a script
    function loadScript(src) {
      return new Promise((resolve, reject) => {
        const script = document.createElement('script');
        script.src = src;
        script.onload = resolve;
        script.onerror = reject;
        document.head.appendChild(script);
      });
    }

    // Start loading
    loadDependencies().catch(err => {
      console.error('Failed to load dependencies:', err);
      document.getElementById('loading').textContent = 'Failed to load. Please try again.';
    });
  </script>
</body>
</html>
EOF

# Inscribe main HTML
ord wallet inscribe --fee-rate 10 inscriptions/index.html

# Record main inscription ID
MAIN_INSCRIPTION_ID="<output-inscription-id>"
```

### Verify Inscriptions

Verify that all inscriptions are accessible and working:

```bash
# Check main inscription
ord explore inscription MAIN_INSCRIPTION_ID

# Test in browser
echo "Open https://ordinals.com/content/MAIN_INSCRIPTION_ID in your browser"
```

## Error Handling

### No External Fallbacks

Important: We do not use any external fallbacks. If an inscription fails to load, the application will display an error message to the user.

```javascript
// Load script without fallbacks - we only use ordinals.com
async function loadScript(inscriptionId) {
  return new Promise((resolve, reject) => {
    const script = document.createElement('script');

    // Use appropriate endpoint based on environment
    const baseUrl = process.env.NODE_ENV === 'development'
      ? 'https://ordinals.com'
      : '';

    script.src = `${baseUrl}/content/${inscriptionId}`;
    script.onload = resolve;
    script.onerror = reject;
    document.head.appendChild(script);
  });
}

// Usage - no fallbacks
try {
  await loadScript('REACT_INSCRIPTION_ID');
  console.log('Loaded React from inscription');
} catch (err) {
  console.error('Failed to load React:', err);
  document.getElementById('loading').textContent = 'Failed to load dependencies. Please try again.';
}
```

### Local Storage Caching

Implement caching to improve loading performance while still using only the ordinals.com API:

```javascript
async function loadWithCache(inscriptionId, expiry = 86400000) { // Default: 1 day
  const cacheKey = `bitcoin-protozoa-${inscriptionId}`;
  const cached = localStorage.getItem(cacheKey);

  if (cached) {
    const { timestamp, content } = JSON.parse(cached);
    if (Date.now() - timestamp < expiry) {
      // Use cached content
      const blob = new Blob([content], { type: 'application/javascript' });
      const url = URL.createObjectURL(blob);
      await loadScript(url);
      return;
    }
  }

  // Fetch and cache - only from ordinals.com API
  try {
    // Use appropriate endpoint based on environment
    const baseUrl = process.env.NODE_ENV === 'development'
      ? 'https://ordinals.com'
      : '';

    const response = await fetch(`${baseUrl}/content/${inscriptionId}`);

    if (!response.ok) {
      throw new Error(`HTTP error ${response.status}`);
    }

    const content = await response.text();

    localStorage.setItem(cacheKey, JSON.stringify({
      timestamp: Date.now(),
      content
    }));

    const blob = new Blob([content], { type: 'application/javascript' });
    const url = URL.createObjectURL(blob);
    await loadScript(url);
  } catch (error) {
    console.error(`Failed to load inscription ${inscriptionId}:`, error);
    throw error; // No fallback - if the API fails, we fail
  }
}
```

## Monitoring and Maintenance

### Inscription Health Checks

Implement health checks to verify inscriptions are accessible:

```javascript
async function checkInscriptionHealth(inscriptionIds) {
  const results = {};

  // Use appropriate endpoint based on environment
  const baseUrl = process.env.NODE_ENV === 'development'
    ? 'https://ordinals.com'
    : '';

  for (const id of inscriptionIds) {
    try {
      const response = await fetch(`${baseUrl}/content/${id}`);
      results[id] = response.ok;
    } catch (err) {
      results[id] = false;
    }
  }

  return results;
}
```

### Update Strategy

For future updates, new inscriptions will be created and the main HTML inscription updated:

1. Inscribe new versions of changed chunks
2. Create a new main HTML inscription with updated references
3. Maintain backward compatibility where possible

## Security Considerations

### Content Security

- Use subresource integrity checks where possible
- Implement content verification before execution
- Validate loaded scripts match expected signatures

### Error Handling

- Implement robust error handling for failed loads
- Provide clear user feedback for loading issues
- Log errors for debugging and monitoring

## Deployment Checklist

Before deploying to Bitcoin, complete this checklist:

1. **Build Verification**
   - [ ] All chunks build successfully
   - [ ] Bundle size is optimized
   - [ ] No unnecessary code or dependencies

2. **Local Testing**
   - [ ] Application works in local environment
   - [ ] All features function correctly
   - [ ] Performance meets requirements

3. **Inscription Preparation**
   - [ ] Chunks are properly split
   - [ ] Dependencies are identified
   - [ ] Loading order is defined

4. **Wallet Preparation**
   - [ ] Wallet has sufficient funds
   - [ ] Private keys are secured
   - [ ] Fee rates are appropriate

5. **Backup**
   - [ ] All source code is backed up
   - [ ] Build artifacts are backed up
   - [ ] Inscription IDs are recorded

6. **Post-Deployment**
   - [ ] Verify all inscriptions are accessible
   - [ ] Test application functionality
   - [ ] Monitor for any issues

## Troubleshooting

### Common Issues

1. **Inscription Not Found**
   - Check inscription ID is correct
   - Verify transaction was confirmed
   - Try accessing through different Ordinals explorers

2. **Loading Failures**
   - Check browser console for errors
   - Verify all dependencies are loaded in correct order
   - Test fallback mechanisms

3. **Performance Issues**
   - Check chunk sizes
   - Verify loading sequence
   - Monitor network requests

### Recovery Procedures

1. **Failed Inscription**
   - Record failed inscription details
   - Retry inscription with higher fee rate
   - Update references if new inscription ID is created

2. **Corrupted Data**
   - Verify source data integrity
   - Re-inscribe from verified source
   - Update references to new inscription

## CI/CD Pipeline

### Continuous Integration

The continuous integration pipeline automates the build, test, and validation process:

```yaml
# .github/workflows/ci.yml
name: Continuous Integration

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Lint
        run: npm run lint

      - name: Type check
        run: npm run type-check

      - name: Test
        run: npm test

      - name: Build
        run: npm run build

      - name: Analyze bundle size
        run: npm run analyze

      - name: Upload build artifacts
        uses: actions/upload-artifact@v3
        with:
          name: build
          path: dist/
```

### Continuous Deployment

The continuous deployment pipeline automates the preparation of inscription-ready artifacts:

```yaml
# .github/workflows/cd.yml
name: Continuous Deployment

on:
  push:
    tags:
      - 'v*'

jobs:
  prepare-inscription:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

      - name: Prepare inscription chunks
        run: node scripts/create-chunks.js

      - name: Validate chunks
        run: node scripts/validate-chunks.js

      - name: Generate inscription manifest
        run: node scripts/generate-manifest.js

      - name: Upload inscription artifacts
        uses: actions/upload-artifact@v3
        with:
          name: inscription-artifacts
          path: inscriptions/
```

### Deployment Workflow

The deployment workflow combines automated and manual steps:

1. **Automated Build and Test**:
   - CI pipeline builds and tests the application
   - Bundle analysis identifies optimization opportunities
   - Test coverage reports highlight areas needing more tests

2. **Automated Artifact Preparation**:
   - CD pipeline prepares inscription-ready chunks
   - Validates chunks for size and content
   - Generates inscription manifest

3. **Manual Review and Approval**:
   - Review build artifacts and test results
   - Verify inscription chunks meet requirements
   - Approve for inscription

4. **Manual Inscription**:
   - Follow inscription process using prepared artifacts
   - Record inscription IDs
   - Update manifest with actual inscription IDs

5. **Automated Verification**:
   - Verify inscriptions are accessible
   - Run tests against inscribed content
   - Generate verification report

### Deployment Environments

The deployment pipeline supports multiple environments:

1. **Development**: Local development environment
   - Uses local development server
   - Simulates inscription loading
   - Fast iteration cycle

2. **Staging**: Pre-inscription testing environment
   - Uses testnet inscriptions
   - Full end-to-end testing
   - Validates inscription process

3. **Production**: Bitcoin mainnet
   - Final inscription on Bitcoin
   - Immutable deployment
   - Production monitoring

## Related Documents

- [Development Workflow](01_development_workflow.md) - For details on the development process
- [Asset Management](03_asset_management.md) - For details on asset management
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
- [Module Structure](../core/03_module_structure.md) - For details on code organization
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details
 
``` 
 
--- 
 
### 03_asset_management.md 
 
```.md 
# Asset Management

This document outlines the asset management strategy for the Bitcoin Protozoa project, focusing on how to organize, load, and manage assets for optimal performance and compatibility with Bitcoin Ordinals inscription.

## Table of Contents

1. [Asset Management Philosophy](#asset-management-philosophy) [Line 20]
2. [Type Definitions](#type-definitions) [Line 30]
   - [Core Types](#core-types) [Line 35]
   - [Particle Types](#particle-types) [Line 107]
   - [Physics Types](#physics-types) [Line 184]
   - [RNG Types](#rng-types) [Line 231]
3. [Asset Organization](#asset-organization) [Line 257]
4. [Class Implementations](#class-implementations) [Line 295]
   - [Core Classes](#core-classes) [Line 305]
   - [Particle Classes](#particle-classes) [Line 519]
   - [Physics Classes](#physics-classes) [Line 650]
5. [Service Implementations](#service-implementations) [Line 865]
   - [Core Services](#core-services) [Line 875]
   - [Particle Services](#particle-services) [Line 1024]
   - [Physics Services](#physics-services) [Line 1202]
   - [Bitcoin Services](#bitcoin-services) [Line 1335]
6. [Related Documents](#related-documents) [Line 1477]

## Asset Management Philosophy

The asset management strategy for Bitcoin Protozoa follows these core principles:

1. **Pre-defined Types**: All types are pre-defined and documented before implementation
2. **Immutable Resources**: Assets are designed to be immutable for Bitcoin Ordinals inscription
3. **Minimal Dependencies**: External dependencies are minimized and carefully managed
4. **Optimized Loading**: Assets are loaded efficiently to minimize initial load time
5. **Versioned Assets**: Assets are versioned to ensure compatibility

The goal is to create a clean, maintainable codebase that can be efficiently inscribed on Bitcoin while providing optimal performance and user experience.

## Type Definitions

All types are pre-defined to ensure consistency and type safety throughout the application. These type definitions serve as the foundation for the entire codebase.

### Core Types

```typescript
// src/types/core.ts

/**
 * Entity interface - base for all entities in the system
 */
export interface Entity {
  id: string;
  type: string;
  created: number;
  updated: number;
}

/**
 * Vector3 interface - represents a 3D vector
 */
export interface Vector3 {
  x: number;
  y: number;
  z: number;
}

/**
 * Color interface - represents an RGB color
 */
export interface Color {
  r: number;
  g: number;
  b: number;
}

/**
 * BlockInfo interface - represents Bitcoin block information
 * Only includes blockNumber (for reference), nonce, and confirmations
 */
export interface BlockInfo {
  blockNumber: number; // Only used for reference/lookup
  nonce: number;       // Used for RNG seed
  confirmations: number; // Used for evolution triggers
}

/**
 * Identifiable interface - base for objects with IDs
 */
export interface Identifiable {
  id: string;
}

/**
 * Named interface - base for objects with names
 */
export interface Named {
  name: string;
}

/**
 * Updateable interface - base for objects that can be updated
 */
export interface Updateable {
  update(deltaTime: number): void;
}

/**
 * Disposable interface - base for objects that need cleanup
 */
export interface Disposable {
  dispose(): void;
}
```

### Particle Types

```typescript
// src/types/particle.ts
import { Entity, Vector3, Color } from './core';

/**
 * Particle roles enum
 */
export enum ParticleRole {
  CORE = 'core',
  CONTROL = 'control',
  MOVEMENT = 'movement',
  DEFENSE = 'defense',
  ATTACK = 'attack'
}

/**
 * Particle interface - represents a single particle
 */
export interface Particle extends Entity {
  position: Vector3;
  velocity: Vector3;
  acceleration: Vector3;
  mass: number;
  radius: number;
  color: Color;
  role: ParticleRole;
  groupId: string;
  active: boolean;
}

/**
 * Particle group interface - represents a group of particles
 */
export interface ParticleGroup extends Entity {
  role: ParticleRole;
  count: number;
  color: Color;
  scale: number;
  center: Vector3;
  particles: string[]; // Array of particle IDs
}

/**
 * Particle system interface - represents the entire particle system
 */
export interface ParticleSystem extends Entity {
  particles: Particle[];
  groups: ParticleGroup[];
  forceRules: ForceRuleMatrix;
  forceFields: ForceField[];
}

/**
 * Force rule matrix - defines attraction/repulsion between particle groups
 */
export interface ForceRuleMatrix {
  [sourceGroupId: string]: {
    [targetGroupId: string]: number;
  };
}

/**
 * Force field interface - represents a force field
 */
export interface ForceField extends Entity {
  center: Vector3;
  radius: number;
  strength: number;
  role: ParticleRole;
  vertices: Vector3[];
  rotation: Vector3;
}
```

### Physics Types

```typescript
// src/types/physics.ts
import { Entity, Vector3 } from './core';
import { Particle, ForceField, ForceRuleMatrix } from './particle';

/**
 * Physics engine interface - handles physics calculations
 */
export interface PhysicsEngine extends Entity {
  cutoffDistance: number;
  timeScale: number;
  viscosity: number;
  collisionRadius: number;

  calculateForces(
    particles: Particle[],
    forceRules: ForceRuleMatrix,
    forceFields: ForceField[]
  ): void;

  applyForceFields(
    particles: Particle[],
    forceFields: ForceField[]
  ): void;

  handleCollisions(
    particles: Particle[]
  ): void;

  update(deltaTime: number): void;
}

/**
 * Spatial grid interface - for efficient spatial partitioning
 */
export interface SpatialGrid {
  cellSize: number;

  addParticle(particle: Particle): void;
  getNeighbors(position: Vector3, radius: number): Particle[];
  update(particles: Particle[]): void;
  clear(): void;
}
```

### RNG Types

```typescript
// src/types/rng.ts

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

## Asset Organization

Assets are organized into logical domains to ensure clean separation of concerns and maintainability:

### Domain-Based Organization

```
src/
├── domains/         # Domain-specific code
├── services/        # Service layer
├── utils/           # Utility functions
├── factories/       # Factory functions
├── types/           # Type definitions
├── constants/       # Constant values
├── hooks/           # React hooks
├── components/      # React components
└── workers/         # Web workers
```

### Asset Sets

Assets are grouped into logical sets:

1. **Type Definitions**: Interfaces, types, and enums
2. **Class Implementations**: Concrete implementations of interfaces
3. **Utility Functions**: Helper functions and utilities
4. **Factory Functions**: Functions for creating instances
5. **Service Implementations**: Service layer implementations
6. **Component Implementations**: React component implementations
7. **Worker Implementations**: Web worker implementations

## Class Implementations

The class implementation strategy for Bitcoin Protozoa follows these core principles:

1. **Interface-First**: All classes implement pre-defined interfaces
2. **Minimal Dependencies**: Classes have minimal dependencies on other classes
3. **Immutable Properties**: Properties are immutable where possible
4. **Memory Efficiency**: Classes are designed for memory efficiency
5. **Performance Optimization**: Classes are optimized for performance

### Core Classes

#### Entity Class

The base class for all entities in the system:

```typescript
// src/domains/core/Entity.ts
import { Entity as IEntity } from '../../types/core';

/**
 * Base entity class
 */
export class Entity implements IEntity {
  public readonly id: string;
  public readonly type: string;
  public readonly created: number;
  public updated: number;

  constructor(id: string, type: string) {
    this.id = id;
    this.type = type;
    this.created = Date.now();
    this.updated = this.created;
  }

  /**
   * Update the entity
   */
  public update(): void {
    this.updated = Date.now();
  }

  /**
   * Create a JSON representation of the entity
   */
  public toJSON(): object {
    return {
      id: this.id,
      type: this.type,
      created: this.created,
      updated: this.updated
    };
  }

  /**
   * Create an entity from a JSON object
   */
  public static fromJSON(json: any): Entity {
    const entity = new Entity(json.id, json.type);
    entity.updated = json.updated;
    return entity;
  }
}
```

#### Vector3 Class

A class for 3D vector operations:

```typescript
// src/domains/core/Vector3.ts
import { Vector3 as IVector3 } from '../../types/core';

/**
 * 3D vector class
 */
export class Vector3 implements IVector3 {
  public x: number;
  public y: number;
  public z: number;

  constructor(x: number = 0, y: number = 0, z: number = 0) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  /**
   * Create a copy of this vector
   */
  public clone(): Vector3 {
    return new Vector3(this.x, this.y, this.z);
  }

  /**
   * Calculate the length of this vector
   */
  public length(): number {
    return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
  }

  /**
   * Calculate the squared length of this vector
   */
  public lengthSquared(): number {
    return this.x * this.x + this.y * this.y + this.z * this.z;
  }

  /**
   * Normalize this vector
   */
  public normalize(): Vector3 {
    const length = this.length();
    if (length > 0) {
      this.x /= length;
      this.y /= length;
      this.z /= length;
    }
    return this;
  }

  /**
   * Add another vector to this vector
   */
  public add(v: Vector3): Vector3 {
    this.x += v.x;
    this.y += v.y;
    this.z += v.z;
    return this;
  }

  /**
   * Subtract another vector from this vector
   */
  public subtract(v: Vector3): Vector3 {
    this.x -= v.x;
    this.y -= v.y;
    this.z -= v.z;
    return this;
  }

  /**
   * Multiply this vector by a scalar
   */
  public multiplyScalar(s: number): Vector3 {
    this.x *= s;
    this.y *= s;
    this.z *= s;
    return this;
  }

  /**
   * Divide this vector by a scalar
   */
  public divideScalar(s: number): Vector3 {
    if (s !== 0) {
      this.x /= s;
      this.y /= s;
      this.z /= s;
    }
    return this;
  }

  /**
   * Calculate the dot product with another vector
   */
  public dot(v: Vector3): number {
    return this.x * v.x + this.y * v.y + this.z * v.z;
  }

  /**
   * Calculate the cross product with another vector
   */
  public cross(v: Vector3): Vector3 {
    const x = this.y * v.z - this.z * v.y;
    const y = this.z * v.x - this.x * v.z;
    const z = this.x * v.y - this.y * v.x;
    this.x = x;
    this.y = y;
    this.z = z;
    return this;
  }

  /**
   * Calculate the distance to another vector
   */
  public distanceTo(v: Vector3): number {
    const dx = this.x - v.x;
    const dy = this.y - v.y;
    const dz = this.z - v.z;
    return Math.sqrt(dx * dx + dy * dy + dz * dz);
  }

  /**
   * Calculate the squared distance to another vector
   */
  public distanceToSquared(v: Vector3): number {
    const dx = this.x - v.x;
    const dy = this.y - v.y;
    const dz = this.z - v.z;
    return dx * dx + dy * dy + dz * dz;
  }

  /**
   * Create a JSON representation of this vector
   */
  public toJSON(): object {
    return {
      x: this.x,
      y: this.y,
      z: this.z
    };
  }

  /**
   * Create a vector from a JSON object
   */
  public static fromJSON(json: any): Vector3 {
    return new Vector3(json.x, json.y, json.z);
  }
}
```

### Particle Classes

#### Particle Class

A class representing a single particle:

```typescript
// src/domains/particle/Particle.ts
import { Entity } from '../core/Entity';
import { Vector3 } from '../core/Vector3';
import { Particle as IParticle, ParticleRole } from '../../types/particle';
import { Color } from '../../types/core';

/**
 * Particle class
 */
export class Particle extends Entity implements IParticle {
  public position: Vector3;
  public velocity: Vector3;
  public acceleration: Vector3;
  public mass: number;
  public radius: number;
  public color: Color;
  public role: ParticleRole;
  public groupId: string;
  public active: boolean;

  constructor(
    id: string,
    position: Vector3,
    velocity: Vector3,
    mass: number,
    radius: number,
    color: Color,
    role: ParticleRole,
    groupId: string
  ) {
    super(id, 'particle');
    this.position = position;
    this.velocity = velocity;
    this.acceleration = new Vector3();
    this.mass = mass;
    this.radius = radius;
    this.color = color;
    this.role = role;
    this.groupId = groupId;
    this.active = true;
  }

  /**
   * Update the particle
   */
  public update(deltaTime: number): void {
    super.update();

    // Update position based on velocity
    this.position.add(
      new Vector3(
        this.velocity.x * deltaTime,
        this.velocity.y * deltaTime,
        this.velocity.z * deltaTime
      )
    );

    // Update velocity based on acceleration
    this.velocity.add(
      new Vector3(
        this.acceleration.x * deltaTime,
        this.acceleration.y * deltaTime,
        this.acceleration.z * deltaTime
      )
    );

    // Reset acceleration
    this.acceleration.x = 0;
    this.acceleration.y = 0;
    this.acceleration.z = 0;
  }

  /**
   * Apply a force to the particle
   */
  public applyForce(force: Vector3): void {
    // F = ma, so a = F/m
    this.acceleration.add(
      new Vector3(
        force.x / this.mass,
        force.y / this.mass,
        force.z / this.mass
      )
    );
  }

  /**
   * Create a JSON representation of the particle
   */
  public toJSON(): object {
    return {
      ...super.toJSON(),
      position: this.position.toJSON(),
      velocity: this.velocity.toJSON(),
      acceleration: this.acceleration.toJSON(),
      mass: this.mass,
      radius: this.radius,
      color: this.color,
      role: this.role,
      groupId: this.groupId,
      active: this.active
    };
  }

  /**
   * Create a particle from a JSON object
   */
  public static fromJSON(json: any): Particle {
    const particle = new Particle(
      json.id,
      Vector3.fromJSON(json.position),
      Vector3.fromJSON(json.velocity),
      json.mass,
      json.radius,
      json.color,
      json.role,
      json.groupId
    );
    particle.active = json.active;
    return particle;
  }
}
```

### Physics Classes

#### PhysicsEngine Class

A class for handling physics calculations:

```typescript
// src/domains/physics/PhysicsEngine.ts
import { Entity } from '../core/Entity';
import { Vector3 } from '../core/Vector3';
import { PhysicsEngine as IPhysicsEngine } from '../../types/physics';
import { Particle, ForceField, ForceRuleMatrix } from '../../types/particle';

/**
 * Physics engine class
 */
export class PhysicsEngine extends Entity implements IPhysicsEngine {
  public cutoffDistance: number;
  public timeScale: number;
  public viscosity: number;
  public collisionRadius: number;

  constructor(
    id: string,
    cutoffDistance: number,
    timeScale: number,
    viscosity: number,
    collisionRadius: number
  ) {
    super(id, 'physics-engine');
    this.cutoffDistance = cutoffDistance;
    this.timeScale = timeScale;
    this.viscosity = viscosity;
    this.collisionRadius = collisionRadius;
  }

  /**
   * Calculate forces between particles
   */
  public calculateForces(
    particles: Particle[],
    forceRules: ForceRuleMatrix,
    forceFields: ForceField[]
  ): void {
    // For each particle
    for (let i = 0; i < particles.length; i++) {
      const a = particles[i];

      // Skip inactive particles
      if (!a.active) continue;

      // Calculate forces from other particles
      for (let j = 0; j < particles.length; j++) {
        // Skip self
        if (i === j) continue;

        const b = particles[j];

        // Skip inactive particles
        if (!b.active) continue;

        // Get force rule between particle groups
        const forceRule = forceRules[a.groupId][b.groupId];

        // Calculate distance vector
        const dx = a.position.x - b.position.x;
        const dy = a.position.y - b.position.y;
        const dz = a.position.z - b.position.z;

        // Calculate squared distance
        const distanceSquared = dx * dx + dy * dy + dz * dz;

        // Skip if beyond cutoff distance
        if (distanceSquared > this.cutoffDistance * this.cutoffDistance) continue;

        // Calculate force magnitude
        const distance = Math.sqrt(distanceSquared);
        const forceMagnitude = forceRule / distance;

        // Apply force
        a.applyForce(
          new Vector3(
            dx * forceMagnitude,
            dy * forceMagnitude,
            dz * forceMagnitude
          )
        );
      }
    }
  }

  /**
   * Apply force fields to particles
   */
  public applyForceFields(
    particles: Particle[],
    forceFields: ForceField[]
  ): void {
    // For each particle
    for (const particle of particles) {
      // Skip inactive particles
      if (!particle.active) continue;

      // For each force field
      for (const field of forceFields) {
        // Calculate distance to field center
        const distance = particle.position.distanceTo(field.center);

        // Skip if beyond field radius
        if (distance > field.radius) continue;

        // Calculate force direction
        const direction = new Vector3(
          field.center.x - particle.position.x,
          field.center.y - particle.position.y,
          field.center.z - particle.position.z
        ).normalize();

        // Calculate force magnitude
        const forceMagnitude = field.strength * (1 - distance / field.radius);

        // Apply force
        particle.applyForce(
          new Vector3(
            direction.x * forceMagnitude,
            direction.y * forceMagnitude,
            direction.z * forceMagnitude
          )
        );
      }
    }
  }

  /**
   * Handle collisions between particles
   */
  public handleCollisions(
    particles: Particle[]
  ): void {
    // For each particle
    for (let i = 0; i < particles.length; i++) {
      const a = particles[i];

      // Skip inactive particles
      if (!a.active) continue;

      // Check collisions with other particles
      for (let j = i + 1; j < particles.length; j++) {
        const b = particles[j];

        // Skip inactive particles
        if (!b.active) continue;

        // Calculate distance vector
        const dx = a.position.x - b.position.x;
        const dy = a.position.y - b.position.y;
        const dz = a.position.z - b.position.z;

        // Calculate squared distance
        const distanceSquared = dx * dx + dy * dy + dz * dz;

        // Check for collision
        const minDistance = a.radius + b.radius;
        if (distanceSquared < minDistance * minDistance) {
          // Calculate collision response
          const distance = Math.sqrt(distanceSquared);
          const overlap = minDistance - distance;

          // Calculate collision normal
          const nx = dx / distance;
          const ny = dy / distance;
          const nz = dz / distance;

          // Calculate collision force
          const forceMagnitude = overlap * this.collisionRadius;

          // Apply collision force
          a.applyForce(
            new Vector3(
              nx * forceMagnitude,
              ny * forceMagnitude,
              nz * forceMagnitude
            )
          );

          b.applyForce(
            new Vector3(
              -nx * forceMagnitude,
              -ny * forceMagnitude,
              -nz * forceMagnitude
            )
          );
        }
      }
    }
  }

  /**
   * Update the physics engine
   */
  public update(deltaTime: number): void {
    super.update();

    // Apply time scale
    const scaledDeltaTime = deltaTime * this.timeScale;

    // Apply viscosity
    const viscosityFactor = 1 - this.viscosity;

    // Update particles
    // Note: This would be done in the particle system, not here
  }
}
```

## Service Implementations

The service implementation strategy for Bitcoin Protozoa follows these core principles:

1. **Singleton Pattern**: Services are implemented as singletons
2. **Dependency Injection**: Services receive dependencies through constructors
3. **Event-Based Communication**: Services communicate through events
4. **Lazy Initialization**: Services are initialized on first use
5. **Clean Separation**: Services have clear responsibilities

### Core Services

#### EntityService

A service for managing entities:

```typescript
// src/services/entityService.ts
import { Entity } from '../domains/core/Entity';

/**
 * Entity service
 */
export class EntityService {
  private static instance: EntityService;
  private entities: Map<string, Entity> = new Map();

  private constructor() {
    // Private constructor for singleton pattern
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): EntityService {
    if (!EntityService.instance) {
      EntityService.instance = new EntityService();
    }
    return EntityService.instance;
  }

  /**
   * Register an entity
   */
  public registerEntity(entity: Entity): void {
    this.entities.set(entity.id, entity);
  }

  /**
   * Unregister an entity
   */
  public unregisterEntity(id: string): void {
    this.entities.delete(id);
  }

  /**
   * Get an entity by ID
   */
  public getEntity(id: string): Entity | undefined {
    return this.entities.get(id);
  }

  /**
   * Get all entities
   */
  public getAllEntities(): Entity[] {
    return Array.from(this.entities.values());
  }

  /**
   * Get entities by type
   */
  public getEntitiesByType(type: string): Entity[] {
    return Array.from(this.entities.values()).filter(entity => entity.type === type);
  }

  /**
   * Clear all entities
   */
  public clearEntities(): void {
    this.entities.clear();
  }
}
```

#### EventService

A service for event-based communication:

```typescript
// src/services/eventService.ts

/**
 * Event service
 */
export class EventService {
  private static instance: EventService;
  private listeners: Map<string, Function[]> = new Map();

  private constructor() {
    // Private constructor for singleton pattern
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): EventService {
    if (!EventService.instance) {
      EventService.instance = new EventService();
    }
    return EventService.instance;
  }

  /**
   * Add an event listener
   */
  public on(event: string, listener: Function): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, []);
    }
    this.listeners.get(event)!.push(listener);
  }

  /**
   * Remove an event listener
   */
  public off(event: string, listener: Function): void {
    if (!this.listeners.has(event)) {
      return;
    }
    const listeners = this.listeners.get(event)!;
    const index = listeners.indexOf(listener);
    if (index !== -1) {
      listeners.splice(index, 1);
    }
  }

  /**
   * Emit an event
   */
  public emit(event: string, ...args: any[]): void {
    if (!this.listeners.has(event)) {
      return;
    }
    const listeners = this.listeners.get(event)!;
    for (const listener of listeners) {
      listener(...args);
    }
  }

  /**
   * Clear all listeners
   */
  public clearListeners(): void {
    this.listeners.clear();
  }
}
```

### Particle Services

#### ParticleService

A service for managing particles:

```typescript
// src/services/particleService.ts
import { EntityService } from './entityService';
import { EventService } from './eventService';
import { Particle } from '../domains/particle/Particle';
import { ParticleGroup } from '../domains/particle/ParticleGroup';
import { Vector3 } from '../domains/core/Vector3';
import { ParticleRole } from '../types/particle';
import { Color } from '../types/core';

/**
 * Particle service
 */
export class ParticleService {
  private static instance: ParticleService;
  private entityService: EntityService;
  private eventService: EventService;

  private constructor() {
    // Private constructor for singleton pattern
    this.entityService = EntityService.getInstance();
    this.eventService = EventService.getInstance();
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): ParticleService {
    if (!ParticleService.instance) {
      ParticleService.instance = new ParticleService();
    }
    return ParticleService.instance;
  }

  /**
   * Create a particle
   */
  public createParticle(
    position: Vector3,
    velocity: Vector3,
    mass: number,
    radius: number,
    color: Color,
    role: ParticleRole,
    groupId: string
  ): Particle {
    // Generate a unique ID
    const id = `particle-${Date.now()}-${Math.floor(Math.random() * 1000000)}`;

    // Create the particle
    const particle = new Particle(
      id,
      position,
      velocity,
      mass,
      radius,
      color,
      role,
      groupId
    );

    // Register the particle
    this.entityService.registerEntity(particle);

    // Emit an event
    this.eventService.emit('particle:created', particle);

    return particle;
  }

  /**
   * Create a particle group
   */
  public createParticleGroup(
    role: ParticleRole,
    count: number,
    color: Color,
    scale: number,
    center: Vector3
  ): ParticleGroup {
    // Generate a unique ID
    const id = `group-${Date.now()}-${Math.floor(Math.random() * 1000000)}`;

    // Create the group
    const group = new ParticleGroup(
      id,
      role,
      count,
      color,
      scale,
      center
    );

    // Register the group
    this.entityService.registerEntity(group);

    // Emit an event
    this.eventService.emit('group:created', group);

    return group;
  }

  /**
   * Get all particles
   */
  public getAllParticles(): Particle[] {
    return this.entityService.getEntitiesByType('particle') as Particle[];
  }

  /**
   * Get all particle groups
   */
  public getAllParticleGroups(): ParticleGroup[] {
    return this.entityService.getEntitiesByType('particle-group') as ParticleGroup[];
  }

  /**
   * Get particles by group
   */
  public getParticlesByGroup(groupId: string): Particle[] {
    return this.getAllParticles().filter(particle => particle.groupId === groupId);
  }

  /**
   * Update a particle
   */
  public updateParticle(particle: Particle, deltaTime: number): void {
    particle.update(deltaTime);
    this.eventService.emit('particle:updated', particle);
  }

  /**
   * Update all particles
   */
  public updateAllParticles(deltaTime: number): void {
    const particles = this.getAllParticles();
    for (const particle of particles) {
      this.updateParticle(particle, deltaTime);
    }
  }

  /**
   * Remove a particle
   */
  public removeParticle(id: string): void {
    const particle = this.entityService.getEntity(id) as Particle;
    if (particle) {
      this.entityService.unregisterEntity(id);
      this.eventService.emit('particle:removed', particle);
    }
  }

  /**
   * Remove a particle group
   */
  public removeParticleGroup(id: string): void {
    const group = this.entityService.getEntity(id) as ParticleGroup;
    if (group) {
      // Remove all particles in the group
      const particles = this.getParticlesByGroup(id);
      for (const particle of particles) {
        this.removeParticle(particle.id);
      }

      // Remove the group
      this.entityService.unregisterEntity(id);
      this.eventService.emit('group:removed', group);
    }
  }
}
```

### Physics Services

#### PhysicsService

A service for physics calculations:

```typescript
// src/services/physicsService.ts
import { EntityService } from './entityService';
import { EventService } from './eventService';
import { ParticleService } from './particleService';
import { PhysicsEngine } from '../domains/physics/PhysicsEngine';
import { ForceField } from '../domains/physics/ForceField';
import { ForceRuleMatrix } from '../types/particle';

/**
 * Physics service
 */
export class PhysicsService {
  private static instance: PhysicsService;
  private entityService: EntityService;
  private eventService: EventService;
  private particleService: ParticleService;
  private physicsEngine: PhysicsEngine | null = null;
  private forceFields: ForceField[] = [];
  private forceRules: ForceRuleMatrix = {};

  private constructor() {
    // Private constructor for singleton pattern
    this.entityService = EntityService.getInstance();
    this.eventService = EventService.getInstance();
    this.particleService = ParticleService.getInstance();
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): PhysicsService {
    if (!PhysicsService.instance) {
      PhysicsService.instance = new PhysicsService();
    }
    return PhysicsService.instance;
  }

  /**
   * Initialize the physics engine
   */
  public initializePhysicsEngine(
    cutoffDistance: number,
    timeScale: number,
    viscosity: number,
    collisionRadius: number
  ): PhysicsEngine {
    // Generate a unique ID
    const id = `physics-engine-${Date.now()}`;

    // Create the physics engine
    this.physicsEngine = new PhysicsEngine(
      id,
      cutoffDistance,
      timeScale,
      viscosity,
      collisionRadius
    );

    // Register the physics engine
    this.entityService.registerEntity(this.physicsEngine);

    // Emit an event
    this.eventService.emit('physics:initialized', this.physicsEngine);

    return this.physicsEngine;
  }

  /**
   * Set force rules
   */
  public setForceRules(forceRules: ForceRuleMatrix): void {
    this.forceRules = forceRules;
    this.eventService.emit('physics:forceRulesUpdated', forceRules);
  }

  /**
   * Add a force field
   */
  public addForceField(forceField: ForceField): void {
    this.forceFields.push(forceField);
    this.entityService.registerEntity(forceField);
    this.eventService.emit('physics:forceFieldAdded', forceField);
  }

  /**
   * Remove a force field
   */
  public removeForceField(id: string): void {
    const index = this.forceFields.findIndex(field => field.id === id);
    if (index !== -1) {
      const forceField = this.forceFields[index];
      this.forceFields.splice(index, 1);
      this.entityService.unregisterEntity(id);
      this.eventService.emit('physics:forceFieldRemoved', forceField);
    }
  }

  /**
   * Update physics
   */
  public update(deltaTime: number): void {
    if (!this.physicsEngine) {
      return;
    }

    // Get all particles
    const particles = this.particleService.getAllParticles();

    // Calculate forces
    this.physicsEngine.calculateForces(particles, this.forceRules, this.forceFields);

    // Apply force fields
    this.physicsEngine.applyForceFields(particles, this.forceFields);

    // Handle collisions
    this.physicsEngine.handleCollisions(particles);

    // Update physics engine
    this.physicsEngine.update(deltaTime);

    // Emit an event
    this.eventService.emit('physics:updated', deltaTime);
  }
}
```

### Bitcoin Services

#### BitcoinService

A service for Bitcoin integration:

```typescript
// src/services/bitcoinService.ts
import { EventService } from './eventService';
import { BlockInfo } from '../types/core';

/**
 * Bitcoin service
 */
export class BitcoinService {
  private static instance: BitcoinService;
  private eventService: EventService;
  private blockCache: Map<number, BlockInfo> = new Map();
  private currentBlockHeight: number = 0;

  private constructor() {
    // Private constructor for singleton pattern
    this.eventService = EventService.getInstance();
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
   * Fetch block info
   */
  public async fetchBlockInfo(blockNumber: number): Promise<BlockInfo> {
    // Check cache
    if (this.blockCache.has(blockNumber)) {
      return this.blockCache.get(blockNumber)!;
    }

    // Fetch from API - ONLY use ordinals.com API, no fallbacks
    try {
      // Use appropriate endpoint based on environment
      const endpoint = process.env.NODE_ENV === 'development'
        ? `https://ordinals.com/r/blockinfo/${blockNumber}`
        : `/r/blockinfo/${blockNumber}`;

      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const data = await response.json();

      // Create block info - ONLY use nonce and confirmations
      const blockInfo: BlockInfo = {
        blockNumber: blockNumber, // We already know this from the input
        nonce: data.nonce,
        confirmations: data.confirmations
      };

      // Cache the result
      this.blockCache.set(blockNumber, blockInfo);

      // Emit an event
      this.eventService.emit('bitcoin:blockFetched', blockInfo);

      return blockInfo;
    } catch (error) {
      // No fallback - if the API fails, we fail
      console.error(`Failed to fetch block ${blockNumber}:`, error);
      throw new Error(`Failed to fetch block ${blockNumber}: ${error.message}`);
    }
  }

  /**
   * Get current block height
   */
  public async getCurrentBlockHeight(): Promise<number> {
    try {
      // Use appropriate endpoint based on environment
      // ONLY use ordinals.com API, no fallbacks
      const endpoint = process.env.NODE_ENV === 'development'
        ? 'https://ordinals.com/r/blockinfo/0'
        : '/r/blockinfo/0';

      // We'll use block 0 and then check the confirmations to determine current height
      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const data = await response.json();
      this.currentBlockHeight = data.confirmations - 1; // Block 0 confirmations minus 1 gives current height

      // Emit an event
      this.eventService.emit('bitcoin:heightUpdated', this.currentBlockHeight);

      return this.currentBlockHeight;
    } catch (error) {
      // No fallback - if the API fails, we fail
      console.error('Failed to fetch current block height:', error);
      throw new Error(`Failed to fetch current block height: ${error.message}`);
    }
  }

  /**
   * Get confirmations for a block
   */
  public async getConfirmations(blockNumber: number): Promise<number> {
    try {
      const currentHeight = await this.getCurrentBlockHeight();
      const confirmations = currentHeight - blockNumber + 1;

      // Emit an event
      this.eventService.emit('bitcoin:confirmationsUpdated', {
        blockNumber,
        confirmations
      });

      return confirmations;
    } catch (error) {
      console.error(`Failed to calculate confirmations for block ${blockNumber}:`, error);
      throw new Error(`Failed to calculate confirmations: ${error.message}`);
    }
  }

  /**
   * Clear cache
   */
  public clearCache(): void {
    this.blockCache.clear();
  }
}
```

## Related Documents

- [Development Workflow](01_development_workflow.md) - For details on the development process
- [Deployment Pipeline](02_deployment_pipeline.md) - For details on the deployment pipeline
- [Module Structure](../core/03_module_structure.md) - For details on module organization
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Physics Engine](../physics/01_physics_engine.md) - For details on the physics engine
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
 
``` 
 
--- 
 
