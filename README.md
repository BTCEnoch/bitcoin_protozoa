# Bitcoin Protozoa

![CI Status](https://github.com/username/bitcoin-protozoa/workflows/Bitcoin%20Protozoa%20CI/badge.svg)

<!-- AI-INDEX-START -->
## AI Navigation Guide

This repository contains documentation and code for Bitcoin Protozoa, a particle-based life simulation that evolves with Bitcoin block confirmations.

### Key Entry Points for AI Analysis:
1. **Project Overview**: See [Overview](#overview) section below
2. **Documentation Structure**: See [Project Structure](#project-structure) section
3. **Core Concepts**: Particle roles (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK), class system, trait system
4. **Implementation Details**: See [Key Documents](#key-documents) section

### Important Files for AI Understanding:
- [Project Inventory](bitcoin_protozoa/project/02_project_inventory.md): Complete inventory of project components
- [Trait System Overview](bitcoin_protozoa/traits/00_summary.md): Entry point to trait system documentation
- [Class System Implementation](bitcoin_protozoa/trait_balance_structure/11_class_system_implementation.md): Details on the class system
- [Subclass Documentation](bitcoin_protozoa/traits/): CORE, CONTROL, ATTACK, DEFENSE, and MOVEMENT subclasses
<!-- AI-INDEX-END -->

An immutable application deployed on Bitcoin using the Ordinals protocol as recursive inscriptions, featuring particle-based life forms that evolve with Bitcoin block confirmations.

## Overview

Bitcoin Protozoa creates deterministic particle creatures based on Bitcoin block data. Each creature consists of 500 particles distributed across five roles (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK) with unique behaviors, traits, and abilities. As Bitcoin blocks gain confirmations, creatures evolve and develop mutations, creating a dynamic and ever-changing ecosystem.

## Key Features

- **Particle-Based Creatures**: 500 particles distributed across 5 roles
- **Deterministic Generation**: Uses Bitcoin block data for trait generation
- **Evolution System**: Mutations triggered by confirmation milestones
- **Class System**: 5 main classes with 15 subclasses each (75 total)
- **Trait System**: Formation traits, behavior traits, and mutation traits
- **Visual Representation**: Three.js/React Three Fiber for rendering

## Development

### Prerequisites

- Node.js 16+
- npm or yarn

### Setup

```
npm install
```

### Development Server

```
npm run dev
```

### Build

```
npm run build
```

### Test

```
npm run test
```

## Project Structure

The project is organized into the following main directories:

- [`/bitcoin_protozoa`](bitcoin_protozoa/): Main project documentation
  - [`/traits`](bitcoin_protozoa/traits/): Trait system documentation
  - [`/trait_balance_structure`](bitcoin_protozoa/trait_balance_structure/): Balancing system documentation
  - [`/project`](bitcoin_protozoa/project/): Project management documentation
  - [`/physics`](bitcoin_protozoa/physics/): Physics system documentation
  - [`/ui`](bitcoin_protozoa/ui/): UI design documentation
  - [`/bitcoin`](bitcoin_protozoa/bitcoin/): Bitcoin integration documentation
- [`/scripts`](scripts/): Implementation scripts
  - [`/phase_1`](scripts/phase_1/): Phase 1 implementation scripts
  - [`/phase_2`](scripts/phase_2/): Phase 2 implementation scripts
  - [`/phase_3`](scripts/phase_3/): Phase 3 implementation scripts
  - [`/templates`](scripts/templates/): Script templates
- [`/src`](src/): Source code (to be implemented)

## Documentation

### Key Documents

- [Project Checklist](bitcoin_protozoa/project/01_project_checklist.md): Current status and tasks
- [Project Inventory](bitcoin_protozoa/project/02_project_inventory.md): Comprehensive inventory of project components
- [Trait System Overview](bitcoin_protozoa/traits/00_summary.md): Overview of the trait system
- [Balancing System](bitcoin_protozoa/trait_balance_structure/00_index.md): Details on the balancing system
- [Class System Implementation](bitcoin_protozoa/trait_balance_structure/11_class_system_implementation.md): Class system details
- [Mutation Traits](bitcoin_protozoa/traits/09_mutation_traits.md): Documentation of mutation traits

## Technology Stack

- **Frontend**: React, TypeScript, Vite
- **3D Rendering**: Three.js, React Three Fiber
- **State Management**: Zustand
- **Styling**: @emotion/react
- **Testing**: Vitest, React Testing Library
- **Bitcoin Integration**: Ordinals protocol

## Implementation Phases

1. **Phase 1**: Standardization and foundation
2. **Phase 2**: Core systems and architecture
3. **Phase 3**: Visual traits implementation
4. **Phase 4**: Particle roles and hierarchy
5. **Phase 5**: Physics and force fields
6. **Phase 6**: Evolution and mutation system
7. **Phase 7**: Advanced behaviors and interactions
8. **Phase 8**: Bitcoin integration and deployment

## License

*License information to be added*

## Contact

*Contact information to be added*
