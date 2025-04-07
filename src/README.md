# Source Code

This directory will contain the source code for Bitcoin Protozoa. The implementation is in progress and will follow the architecture and design outlined in the documentation.

## Planned Directory Structure

```
src/
├── domains/                  # Domain-specific code
│   ├── particle/             # Particle domain
│   │   ├── data/             # Particle data
│   │   ├── services/         # Particle services
│   │   ├── hooks/            # React hooks for particles
│   │   └── tests/            # Tests for particle domain
│   ├── trait/                # Trait domain
│   │   ├── data/             # Trait data
│   │   ├── services/         # Trait services
│   │   ├── hooks/            # React hooks for traits
│   │   └── tests/            # Tests for trait domain
│   ├── class/                # Class domain
│   │   ├── data/             # Class data
│   │   ├── services/         # Class services
│   │   ├── hooks/            # React hooks for classes
│   │   └── tests/            # Tests for class domain
│   ├── physics/              # Physics domain
│   │   ├── services/         # Physics services
│   │   ├── hooks/            # React hooks for physics
│   │   └── tests/            # Tests for physics domain
│   ├── bitcoin/              # Bitcoin domain
│   │   ├── services/         # Bitcoin services
│   │   ├── hooks/            # React hooks for Bitcoin
│   │   └── tests/            # Tests for Bitcoin domain
│   └── ui/                   # UI domain
│       ├── components/       # UI components
│       ├── hooks/            # React hooks for UI
│       └── tests/            # Tests for UI domain
├── shared/                   # Shared code
│   ├── utils/                # Utility functions
│   ├── types/                # TypeScript types
│   ├── constants/            # Constants
│   └── hooks/                # Shared React hooks
├── app/                      # Application code
│   ├── routes/               # React Router routes
│   ├── layouts/              # Layout components
│   ├── pages/                # Page components
│   └── store/                # Zustand store
└── tests/                    # Integration and end-to-end tests
    ├── integration/          # Integration tests
    └── e2e/                  # End-to-end tests
```

## Technology Stack

- **Frontend**: React, TypeScript, Vite
- **3D Rendering**: Three.js, React Three Fiber
- **State Management**: Zustand
- **Styling**: @emotion/react
- **Testing**: Vitest, React Testing Library

## Implementation Plan

The source code will be implemented in phases, following the plan outlined in the [Implementation Plan](../bitcoin_protozoa/trait_balance_structure/12_implementation_plan.md) document.

## Development Guidelines

1. **Domain-Driven Design**: Code is organized by domain
2. **Clean Architecture**: Separation of concerns between data, services, and UI
3. **Test-Driven Development**: Tests are written before implementation
4. **Type Safety**: TypeScript is used throughout the codebase
5. **Performance Optimization**: Instanced meshes, efficient animation loops, geometry merging