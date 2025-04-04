# Core Concepts Summary

This directory contains documentation on the core concepts and fundamental architecture of the Bitcoin Protozoa project.

## Key Documents

- [Project Overview](01_project_overview.md) - Project vision, objectives, and unique value proposition
- [System Architecture](02_system_architecture.md) - High-level architecture and core components
- [Module Structure](03_module_structure.md) - Module organization and domain-based structure

## Core Concepts Overview

The Bitcoin Protozoa project is a particle-based life simulation that runs on the Bitcoin blockchain. The core architecture follows these principles:

1. **Domain-Based Organization**: The system is organized into clear domains (particles, physics, rendering, etc.)
2. **Immutable Resources**: All resources are designed to be immutable for Bitcoin Ordinals inscription
3. **Deterministic Behavior**: Particle behavior is deterministically generated from Bitcoin block data
4. **Performance Optimization**: The system is optimized for 60fps performance with 500 particles
5. **Modular Design**: Components are designed to be modular and independently testable

## Key Architectural Components

- **Particle System**: Manages particle creation, properties, and lifecycle
- **Physics Engine**: Handles force calculations and particle movement
- **RNG System**: Provides deterministic random number generation based on Bitcoin data
- **Rendering Pipeline**: Efficiently renders particles using Three.js
- **Bitcoin Integration**: Connects to Bitcoin blockchain for data and evolution triggers
- **State Management**: Manages application state using Zustand

## Technology Stack

- **Language**: TypeScript
- **Rendering**: Three.js with React Three Fiber
- **State Management**: Zustand
- **Build System**: Vite
- **Testing**: Vitest with React Testing Library

## Related Documentation

- [Particle System](../particles/00_summary.md) - For details on particle implementation
- [Physics Engine](../physics/00_summary.md) - For details on physics simulation
- [Bitcoin Integration](../bitcoin/00_summary.md) - For details on blockchain integration
