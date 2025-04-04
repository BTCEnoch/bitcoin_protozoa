# Directory Structure Map

This document outlines the complete directory structure for the Bitcoin Protozoa project, including all domains and components. It serves as a blueprint for the project structure, with placeholders for future implementation.

## Table of Contents

1. [Root Structure](#root-structure) [Line 20]
2. [Source Directory Structure](#source-directory-structure) [Line 40]
3. [Domain Structure](#domain-structure) [Line 100]
4. [Test Directory Structure](#test-directory-structure) [Line 800]
5. [Public Directory Structure](#public-directory-structure) [Line 900]
6. [Phase 1 Implementation](#phase-1-implementation) [Line 950]
7. [Directory Creation Script](#directory-creation-script) [Line 1000]

## Root Structure

```
/
├── src/                      # Source code
├── public/                   # Static assets
├── tests/                    # Test files
├── scripts/                  # Build and utility scripts
│   ├── setup.ps1             # Project setup script
│   ├── build.ps1             # Build script
│   └── deploy.ps1            # Deployment script
├── vite.config.ts            # Vite configuration
├── tsconfig.json             # TypeScript configuration
├── package.json              # Dependencies and scripts
├── .eslintrc.js              # ESLint configuration
├── .prettierrc               # Prettier configuration
├── .gitignore                # Git ignore file
├── jest.config.js            # Jest configuration
├── .github/                  # GitHub configuration
│   └── workflows/            # GitHub Actions workflows
│       └── ci.yml            # CI workflow
└── README.md                 # Project documentation
```

## Source Directory Structure

```
src/
├── main.tsx                  # Application entry point
├── App.tsx                   # Root component
├── vite-env.d.ts             # Vite type declarations
├── config/                   # Application configuration
│   ├── index.ts              # Configuration exports
│   ├── constants.ts          # Global constants
│   ├── environment.ts        # Environment configuration
│   └── features.ts           # Feature flags
├── assets/                   # Static assets (images, fonts, etc.)
│   ├── images/               # Image assets
│   │   ├── icons/           # Icon assets
│   │   ├── backgrounds/     # Background images
│   │   └── textures/        # Texture images
│   ├── fonts/                # Font assets
│   ├── models/               # 3D model assets
│   └── shaders/              # Shader assets
├── components/               # Shared UI components
│   ├── common/               # Common UI components
│   │   ├── Button.tsx       # Button component
│   │   ├── Slider.tsx       # Slider component
│   │   ├── Toggle.tsx       # Toggle component
│   │   └── Panel.tsx        # Panel component
│   ├── layout/               # Layout components
│   │   ├── Container.tsx    # Container component
│   │   ├── Grid.tsx         # Grid component
│   │   └── Sidebar.tsx      # Sidebar component
│   └── visualization/        # Visualization components
│       ├── Canvas.tsx       # Canvas component
│       ├── Graph.tsx        # Graph component
│       └── Chart.tsx        # Chart component
├── hooks/                    # Custom React hooks
│   ├── useAnimationFrame.ts  # Animation frame hook
│   ├── useResizeObserver.ts  # Resize observer hook
│   ├── useThree.ts           # Three.js hook
│   ├── useEventListener.ts    # Event listener hook
│   └── useLocalStorage.ts    # Local storage hook
├── store/                    # Global state management
│   ├── index.ts              # Store exports
│   ├── types.ts              # Store types
│   ├── slices/               # Store slices
│   │   ├── appSlice.ts      # Application state slice
│   │   ├── particleSlice.ts  # Particle state slice
│   │   ├── bitcoinSlice.ts   # Bitcoin state slice
│   │   └── uiSlice.ts       # UI state slice
│   └── middleware/          # Store middleware
│       ├── logger.ts        # Logging middleware
│       └── persistence.ts   # Persistence middleware
├── types/                    # TypeScript type definitions
│   ├── index.ts              # Type exports
│   ├── global.d.ts           # Global type declarations
│   ├── particle.ts           # Particle type definitions
│   ├── bitcoin.ts            # Bitcoin type definitions
│   └── three-extensions.d.ts # Three.js extension types
├── utils/                    # Utility functions
│   ├── math/                 # Math utilities
│   │   ├── index.ts         # Math utility exports
│   │   ├── vector.ts        # Vector math utilities
│   │   ├── matrix.ts        # Matrix math utilities
│   │   └── random.ts        # Random number utilities
│   ├── color/                # Color utilities
│   │   ├── index.ts         # Color utility exports
│   │   ├── conversion.ts    # Color conversion utilities
│   │   └── palette.ts       # Color palette utilities
│   ├── eventBus.ts           # Event bus for communication
│   ├── logger.ts             # Logging utility
│   ├── performance.ts        # Performance monitoring utilities
│   └── validation.ts         # Data validation utilities
├── workers/                  # Web Workers
│   ├── physics.worker.ts     # Physics calculations worker
│   ├── rng.worker.ts         # RNG calculations worker
│   ├── bitcoin.worker.ts     # Bitcoin data worker
│   └── shared/               # Shared worker utilities
│       ├── types.ts         # Worker type definitions
│       └── utils.ts         # Worker utility functions
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

## Domain Structure

Each domain follows a consistent structure:

### Core Domain

```
domains/core/
├── index.ts                  # Public API
├── types.ts                  # Core types
├── constants.ts              # Core constants
├── components/               # Core components
│   ├── ParticleCreature/      # Main creature component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   ├── CreatureContainer/    # Container for creature
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── CreatureStats/        # Stats display for creature
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Core hooks
│   ├── useCreature.ts        # Hook for creature management
│   ├── useCreatureLifecycle.ts # Hook for creature lifecycle
│   ├── useBlockData.ts       # Hook for block data
│   └── useCreatureStats.ts   # Hook for creature statistics
├── services/                 # Core services
│   ├── creatureService/      # Creature management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── creation.ts      # Creature creation logic
│   │   └── management.ts    # Creature management logic
│   ├── blockService/        # Block data service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── fetching.ts      # Block data fetching logic
│   │   └── processing.ts    # Block data processing logic
│   └── statsService/        # Statistics service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       └── calculations.ts   # Statistics calculation logic
├── utils/                    # Core utilities
│   ├── initialization.ts     # Initialization utilities
│   ├── validation.ts        # Validation utilities
│   └── transformation.ts    # Data transformation utilities
└── tests/                    # Core tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### Particle Domain

```
domains/particle/
├── index.ts                  # Public API
├── types.ts                  # Particle types
├── constants.ts              # Particle constants
├── components/               # Particle components
│   ├── ParticleGroup/        # Particle group component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   ├── ParticleRenderer/     # Particle rendering component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   ├── types.ts         # Component types
│   │   └── shaders/         # Custom shaders
│   │       ├── vertex.glsl    # Vertex shader
│   │       └── fragment.glsl  # Fragment shader
│   ├── ParticleEffects/      # Particle effects component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── ParticleDebug/        # Particle debug component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Particle hooks
│   ├── useParticles.ts       # Hook for particle management
│   ├── useParticleEffects.ts # Hook for particle effects
│   ├── useParticleGroups.ts  # Hook for particle groups
│   └── useParticleRoles.ts   # Hook for particle roles
├── services/                 # Particle services
│   ├── particleService/      # Particle management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── creation.ts      # Particle creation logic
│   │   ├── update.ts        # Particle update logic
│   │   └── lifecycle.ts     # Particle lifecycle logic
│   ├── groupService/        # Group management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── creation.ts      # Group creation logic
│   │   └── management.ts    # Group management logic
│   └── roleService/         # Role management service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── assignment.ts    # Role assignment logic
│       └── behavior.ts      # Role behavior logic
├── utils/                    # Particle utilities
│   ├── particleUtils.ts      # Particle utility functions
│   ├── groupUtils.ts         # Group utility functions
│   ├── roleUtils.ts         # Role utility functions
│   └── effectUtils.ts       # Effect utility functions
├── workers/                  # Particle workers
│   ├── particleWorker.ts     # Worker for particle calculations
│   ├── groupWorker.ts        # Worker for group calculations
│   └── shared/               # Shared worker utilities
│       ├── types.ts         # Worker type definitions
│       └── utils.ts         # Worker utility functions
└── tests/                    # Particle tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### Force Field Domain

```
domains/forcefield/
├── index.ts                  # Public API
├── types.ts                  # Force field types
├── constants.ts              # Force field constants
├── components/               # Force field components
│   ├── ForceFieldRenderer/    # Force field rendering component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   ├── types.ts         # Component types
│   │   └── shaders/         # Custom shaders
│   │       ├── vertex.glsl    # Vertex shader
│   │       └── fragment.glsl  # Fragment shader
│   ├── ForceFieldVisualizer/ # Force field visualization component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── ForceFieldDebug/      # Force field debug component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Force field hooks
│   ├── useForceFields.ts     # Hook for force field management
│   ├── useForceFieldEffects.ts # Hook for force field effects
│   └── useForceFieldInteractions.ts # Hook for force field interactions
├── services/                 # Force field services
│   ├── forceFieldService/    # Force field management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── creation.ts      # Force field creation logic
│   │   ├── update.ts        # Force field update logic
│   │   └── interaction.ts    # Force field interaction logic
│   └── geometryService/      # Geometry service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── generation.ts     # Geometry generation logic
│       └── transformation.ts # Geometry transformation logic
├── utils/                    # Force field utilities
│   ├── forceFieldUtils.ts    # Force field utility functions
│   ├── geometryUtils.ts      # Geometry utility functions
│   ├── vectorFieldUtils.ts   # Vector field utility functions
│   └── influenceUtils.ts    # Influence map utility functions
├── workers/                  # Force field workers
│   ├── forceFieldWorker.ts   # Worker for force field calculations
│   ├── geometryWorker.ts     # Worker for geometry calculations
│   └── shared/               # Shared worker utilities
│       ├── types.ts         # Worker type definitions
│       └── utils.ts         # Worker utility functions
└── tests/                    # Force field tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### Physics Domain

```
domains/physics/
├── index.ts                  # Public API
├── types.ts                  # Physics types
├── constants.ts              # Physics constants
├── components/               # Physics components
│   ├── PhysicsDebugger/       # Physics debugger component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   ├── CollisionVisualizer/  # Collision visualization component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── SpatialGrid/          # Spatial grid visualization component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Physics hooks
│   ├── usePhysics.ts         # Hook for physics management
│   ├── useCollision.ts       # Hook for collision detection
│   ├── useSpatialGrid.ts     # Hook for spatial grid management
│   └── useVerletIntegration.ts # Hook for Verlet integration
├── services/                 # Physics services
│   ├── physicsService/       # Physics management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── integration.ts    # Integration methods
│   │   ├── forces.ts        # Force calculation logic
│   │   └── constraints.ts    # Constraint solving logic
│   ├── collisionService/     # Collision detection service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── broadPhase.ts     # Broad phase collision detection
│   │   ├── narrowPhase.ts    # Narrow phase collision detection
│   │   └── response.ts      # Collision response logic
│   └── spatialService/       # Spatial partitioning service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── grid.ts          # Grid-based spatial partitioning
│       ├── quadtree.ts      # Quadtree spatial partitioning
│       └── octree.ts        # Octree spatial partitioning
├── utils/                    # Physics utilities
│   ├── vectorUtils.ts        # Vector utility functions
│   ├── mathUtils.ts          # Math utility functions
│   ├── integrationUtils.ts   # Integration utility functions
│   ├── collisionUtils.ts     # Collision utility functions
│   └── boundaryUtils.ts      # Boundary utility functions
├── workers/                  # Physics workers
│   ├── physicsWorker.ts      # Worker for physics calculations
│   ├── collisionWorker.ts    # Worker for collision calculations
│   ├── spatialWorker.ts      # Worker for spatial partitioning
│   └── shared/               # Shared worker utilities
│       ├── types.ts         # Worker type definitions
│       └── utils.ts         # Worker utility functions
└── tests/                    # Physics tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### RNG Domain

```
domains/rng/
├── index.ts                  # Public API
├── types.ts                  # RNG types
├── constants.ts              # RNG constants
├── components/               # RNG components
│   ├── RNGDebugger/          # RNG debugger component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── RNGVisualizer/        # RNG visualization component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # RNG hooks
│   ├── useRNG.ts             # Hook for RNG management
│   ├── useChainRNG.ts        # Hook for chain RNG management
│   └── usePurposeRNG.ts      # Hook for purpose-specific RNG
├── services/                 # RNG services
│   ├── rngService/           # RNG management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── initialization.ts # RNG initialization logic
│   │   └── generation.ts    # RNG generation logic
│   ├── chainRngService/      # Chain RNG service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   └── chainLogic.ts    # Chain RNG logic
│   └── purposeRngService/    # Purpose-specific RNG service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       └── purposeLogic.ts   # Purpose-specific RNG logic
├── utils/                    # RNG utilities
│   ├── mulberry32.ts         # Mulberry32 implementation
│   ├── chainRng.ts           # Chain RNG implementation
│   ├── seedUtils.ts          # Seed utility functions
│   ├── distributionUtils.ts  # Distribution utility functions
│   └── validationUtils.ts    # Validation utility functions
├── workers/                  # RNG workers
│   ├── rngWorker.ts          # Worker for RNG calculations
│   ├── chainRngWorker.ts     # Worker for chain RNG calculations
│   └── shared/               # Shared worker utilities
│       ├── types.ts         # Worker type definitions
│       └── utils.ts         # Worker utility functions
└── tests/                    # RNG tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### Trait Domain

```
domains/trait/
├── index.ts                  # Public API
├── types.ts                  # Trait types
├── constants.ts              # Trait constants
├── components/               # Trait components
│   ├── TraitVisualizer/       # Trait visualization component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   ├── TraitPanel/            # Trait panel component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── TraitDebugger/         # Trait debugger component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Trait hooks
│   ├── useTraits.ts          # Hook for trait management
│   ├── useRaritySystem.ts    # Hook for rarity system
│   ├── useTraitGeneration.ts # Hook for trait generation
│   └── useTraitEffects.ts    # Hook for trait effects
├── services/                 # Trait services
│   ├── traitService/         # Trait management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── generation.ts    # Trait generation logic
│   │   ├── application.ts   # Trait application logic
│   │   └── validation.ts    # Trait validation logic
│   ├── rarityService/        # Rarity management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── distribution.ts   # Rarity distribution logic
│   │   └── calculation.ts   # Rarity calculation logic
│   └── traitCategoryService/ # Trait category service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── visual.ts        # Visual trait logic
│       ├── behavioral.ts    # Behavioral trait logic
│       └── physical.ts      # Physical trait logic
├── utils/                    # Trait utilities
│   ├── traitUtils.ts         # Trait utility functions
│   ├── rarityUtils.ts        # Rarity utility functions
│   ├── distributionUtils.ts  # Distribution utility functions
│   └── validationUtils.ts    # Validation utility functions
├── data/                     # Trait data
│   ├── visualTraits.ts       # Visual trait definitions
│   ├── behavioralTraits.ts   # Behavioral trait definitions
│   └── physicalTraits.ts     # Physical trait definitions
└── tests/                    # Trait tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### Mutation Domain

```
domains/mutation/
├── index.ts                  # Public API
├── types.ts                  # Mutation types
├── constants.ts              # Mutation constants
├── components/               # Mutation components
│   ├── MutationVisualizer/    # Mutation visualization component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   ├── MutationPanel/         # Mutation panel component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── MutationDebugger/      # Mutation debugger component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Mutation hooks
│   ├── useMutations.ts       # Hook for mutation management
│   ├── useMilestones.ts      # Hook for milestone management
│   ├── useMutationChance.ts  # Hook for mutation chance calculation
│   └── useMutationEffects.ts # Hook for mutation effects
├── services/                 # Mutation services
│   ├── mutationService/      # Mutation management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── detection.ts     # Mutation detection logic
│   │   ├── application.ts   # Mutation application logic
│   │   └── validation.ts    # Mutation validation logic
│   ├── milestoneService/     # Milestone management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── detection.ts     # Milestone detection logic
│   │   └── calculation.ts   # Milestone calculation logic
│   └── mutationTypeService/  # Mutation type service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── visual.ts        # Visual mutation logic
│       ├── behavioral.ts    # Behavioral mutation logic
│       └── physical.ts      # Physical mutation logic
├── utils/                    # Mutation utilities
│   ├── mutationUtils.ts      # Mutation utility functions
│   ├── milestoneUtils.ts     # Milestone utility functions
│   ├── chanceUtils.ts        # Chance calculation utility functions
│   └── validationUtils.ts    # Validation utility functions
├── data/                     # Mutation data
│   ├── milestones.ts         # Milestone definitions
│   ├── mutationTypes.ts      # Mutation type definitions
│   └── mutationEffects.ts    # Mutation effect definitions
└── tests/                    # Mutation tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### Bitcoin Domain

```
domains/bitcoin/
├── index.ts                  # Public API
├── types.ts                  # Bitcoin types
├── constants.ts              # Bitcoin constants
├── components/               # Bitcoin components
│   ├── BlockDataVisualizer/   # Block data visualization component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   ├── BlockInfoPanel/        # Block info panel component
│   │   ├── index.tsx        # Component export
│   │   ├── styles.ts        # Component styles
│   │   └── types.ts         # Component types
│   └── InscriptionLoader/     # Inscription loader component
│       ├── index.tsx        # Component export
│       ├── styles.ts        # Component styles
│       └── types.ts         # Component types
├── hooks/                    # Bitcoin hooks
│   ├── useBlockData.ts       # Hook for block data
│   ├── useInscriptions.ts    # Hook for inscriptions
│   ├── useConfirmations.ts   # Hook for confirmations
│   └── useBlockchainSync.ts  # Hook for blockchain synchronization
├── services/                 # Bitcoin services
│   ├── blockService/         # Block data service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── fetching.ts      # Block data fetching logic
│   │   ├── processing.ts    # Block data processing logic
│   │   └── caching.ts       # Block data caching logic
│   ├── inscriptionService/    # Inscription service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── loading.ts       # Inscription loading logic
│   │   ├── parsing.ts       # Inscription parsing logic
│   │   └── caching.ts       # Inscription caching logic
│   └── confirmationService/   # Confirmation service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── tracking.ts      # Confirmation tracking logic
│       └── calculation.ts   # Confirmation calculation logic
├── utils/                    # Bitcoin utilities
│   ├── bitcoinUtils.ts       # Bitcoin utility functions
│   ├── apiUtils.ts           # API utility functions
│   ├── inscriptionUtils.ts    # Inscription utility functions
│   ├── nonceUtils.ts         # Nonce utility functions
│   └── errorHandlingUtils.ts # Error handling utility functions
├── api/                      # Bitcoin API
│   ├── index.ts              # API exports
│   ├── types.ts              # API types
│   ├── endpoints.ts          # API endpoints
│   ├── client.ts             # API client
│   └── mocks/                # API mocks
│       ├── blockData.ts      # Mock block data
│       └── inscriptions.ts   # Mock inscriptions
├── docs/                     # Bitcoin documentation
│   ├── 01_blockchain_integration.md  # Blockchain integration documentation
│   ├── 02_evolution_mechanics.md     # Evolution mechanics documentation
│   ├── 03_rng_system.md              # RNG system documentation
│   ├── 04_bitcoin_integration_approach.md  # Bitcoin integration approach
│   ├── 05_bitcoin_integration_details_part1.md  # Bitcoin integration details
│   └── 06_bitcoin_onchain_resources.md  # Bitcoin on-chain resources
├── workers/                  # Bitcoin workers
│   ├── blockWorker.ts        # Worker for block data processing
│   ├── inscriptionWorker.ts  # Worker for inscription processing
│   └── shared/               # Shared worker utilities
│       ├── types.ts         # Worker type definitions
│       └── utils.ts         # Worker utility functions
└── tests/                    # Bitcoin tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

### UI Domain

```
domains/ui/
├── index.ts                  # Public API
├── types.ts                  # UI types
├── constants.ts              # UI constants
├── components/               # UI components
│   ├── layout/                # Layout components
│   │   ├── MainLayout/       # Main layout component
│   │   │   ├── index.tsx     # Component export
│   │   │   ├── styles.ts     # Component styles
│   │   │   └── types.ts      # Component types
│   │   ├── Header/           # Header component
│   │   │   ├── index.tsx     # Component export
│   │   │   ├── styles.ts     # Component styles
│   │   │   └── types.ts      # Component types
│   │   └── Footer/           # Footer component
│   │       ├── index.tsx     # Component export
│   │       ├── styles.ts     # Component styles
│   │       └── types.ts      # Component types
│   ├── controls/              # Control components
│   │   ├── ControlPanel/      # Control panel component
│   │   │   ├── index.tsx     # Component export
│   │   │   ├── styles.ts     # Component styles
│   │   │   └── types.ts      # Component types
│   │   ├── SettingsPanel/     # Settings panel component
│   │   │   ├── index.tsx     # Component export
│   │   │   ├── styles.ts     # Component styles
│   │   │   └── types.ts      # Component types
│   │   └── ParticleControls/  # Particle controls component
│   │       ├── index.tsx     # Component export
│   │       ├── styles.ts     # Component styles
│   │       └── types.ts      # Component types
│   ├── display/               # Display components
│   │   ├── StatsDisplay/      # Stats display component
│   │   │   ├── index.tsx     # Component export
│   │   │   ├── styles.ts     # Component styles
│   │   │   └── types.ts      # Component types
│   │   ├── InfoPanel/         # Info panel component
│   │   │   ├── index.tsx     # Component export
│   │   │   ├── styles.ts     # Component styles
│   │   │   └── types.ts      # Component types
│   │   └── Notifications/     # Notifications component
│   │       ├── index.tsx     # Component export
│   │       ├── styles.ts     # Component styles
│   │       └── types.ts      # Component types
│   └── debug/                 # Debug components
│       ├── DebugOverlay/       # Debug overlay component
│       │   ├── index.tsx     # Component export
│       │   ├── styles.ts     # Component styles
│       │   └── types.ts      # Component types
│       ├── PerformanceMonitor/ # Performance monitor component
│       │   ├── index.tsx     # Component export
│       │   ├── styles.ts     # Component styles
│       │   └── types.ts      # Component types
│       └── LogViewer/         # Log viewer component
│           ├── index.tsx     # Component export
│           ├── styles.ts     # Component styles
│           └── types.ts      # Component types
├── hooks/                    # UI hooks
│   ├── useUI.ts              # Hook for UI management
│   ├── useTheme.ts           # Hook for theme management
│   ├── useControls.ts         # Hook for controls management
│   ├── useNotifications.ts    # Hook for notifications management
│   └── useDebugMode.ts        # Hook for debug mode management
├── services/                 # UI services
│   ├── uiService/             # UI management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── layout.ts        # Layout management logic
│   │   └── interaction.ts    # Interaction management logic
│   ├── themeService/          # Theme management service
│   │   ├── index.ts         # Service export
│   │   ├── types.ts         # Service types
│   │   ├── themes.ts        # Theme definitions
│   │   └── preferences.ts   # Theme preferences logic
│   └── notificationService/   # Notification service
│       ├── index.ts         # Service export
│       ├── types.ts         # Service types
│       ├── queue.ts         # Notification queue logic
│       └── display.ts       # Notification display logic
├── utils/                    # UI utilities
│   ├── uiUtils.ts            # UI utility functions
│   ├── themeUtils.ts          # Theme utility functions
│   ├── responsiveUtils.ts     # Responsive design utility functions
│   ├── accessibilityUtils.ts  # Accessibility utility functions
│   └── animationUtils.ts      # Animation utility functions
├── styles/                   # UI styles
│   ├── index.ts              # Style exports
│   ├── theme.ts              # Theme definitions
│   ├── colors.ts             # Color definitions
│   ├── typography.ts         # Typography definitions
│   ├── spacing.ts            # Spacing definitions
│   └── animations.ts         # Animation definitions
└── tests/                    # UI tests
    ├── components/           # Component tests
    ├── hooks/                # Hook tests
    ├── services/             # Service tests
    └── utils/                # Utility tests
```

## Test Directory Structure

```
tests/
├── unit/                     # Unit tests
│   ├── domains/               # Domain unit tests
│   │   ├── core/             # Core domain tests
│   │   ├── particle/         # Particle domain tests
│   │   ├── forcefield/       # Force field domain tests
│   │   ├── physics/          # Physics domain tests
│   │   ├── rng/              # RNG domain tests
│   │   ├── trait/            # Trait domain tests
│   │   ├── mutation/         # Mutation domain tests
│   │   ├── bitcoin/          # Bitcoin domain tests
│   │   └── ui/               # UI domain tests
│   ├── utils/                # Utility unit tests
│   ├── hooks/                # Hook unit tests
│   └── components/           # Component unit tests
├── integration/              # Integration tests
│   ├── particle-physics/      # Particle-physics integration tests
│   ├── rng-trait/             # RNG-trait integration tests
│   ├── bitcoin-rng/           # Bitcoin-RNG integration tests
│   ├── trait-mutation/        # Trait-mutation integration tests
│   └── ui-core/               # UI-core integration tests
├── visual/                   # Visual tests
│   ├── particle/             # Particle visual tests
│   ├── forcefield/           # Force field visual tests
│   ├── ui/                   # UI visual tests
│   └── snapshots/            # Visual test snapshots
├── performance/              # Performance tests
│   ├── particle/             # Particle performance tests
│   ├── physics/              # Physics performance tests
│   ├── rendering/            # Rendering performance tests
│   └── metrics/              # Performance metrics
├── e2e/                      # End-to-end tests
│   ├── scenarios/            # E2E test scenarios
│   └── fixtures/             # E2E test fixtures
├── mocks/                    # Test mocks
│   ├── bitcoin/              # Bitcoin API mocks
│   ├── services/             # Service mocks
│   └── data/                 # Mock data
└── utils/                    # Test utilities
    ├── setup.ts              # Test setup utilities
    ├── fixtures.ts           # Test fixture utilities
    ├── assertions.ts         # Custom test assertions
    └── helpers.ts            # Test helper functions
```

## Public Directory Structure

```
public/
├── index.html               # Main HTML file
├── favicon.ico              # Favicon
├── manifest.json            # Web app manifest
├── robots.txt               # Robots file
├── assets/                  # Static assets
│   ├── images/              # Image assets
│   │   ├── icons/          # Icon assets
│   │   ├── backgrounds/    # Background images
│   │   └── textures/       # Texture images
│   ├── fonts/               # Font assets
│   ├── models/              # 3D model assets
│   └── shaders/             # Shader assets
├── data/                    # Static data files
│   ├── mock/                # Mock data for development
│   ├── presets/             # Preset configurations
│   └── examples/            # Example data
└── dependencies/            # External dependencies
    ├── three/                # Three.js dependencies
    ├── react/                # React dependencies
    └── other/                # Other dependencies
```

## Phase 1 Implementation

For Phase 1, we will focus on implementing these core components:

### Core Components for Phase 1

- **Core Domain**:
  - `domains/core/components/ParticleCreature` - Main creature component
  - `domains/core/components/CreatureContainer` - Container for creature
  - `domains/core/hooks/useCreature.ts` - Hook for creature management
  - `domains/core/services/creatureService` - Creature management service

- **Particle Domain**:
  - `domains/particle/types.ts` - Particle type definitions
  - `domains/particle/components/ParticleRenderer` - Particle rendering component
  - `domains/particle/hooks/useParticles.ts` - Hook for particle management
  - `domains/particle/services/particleService` - Particle management service
  - `domains/particle/utils/particleUtils.ts` - Particle utility functions

- **Physics Domain**:
  - `domains/physics/services/physicsService` - Physics service with Verlet integration
  - `domains/physics/services/collisionService` - Simple collision detection
  - `domains/physics/services/spatialService` - Basic spatial partitioning
  - `domains/physics/hooks/usePhysics.ts` - Hook for physics management
  - `domains/physics/utils/vectorUtils.ts` - Vector utility functions

- **RNG Domain**:
  - `domains/rng/utils/mulberry32.ts` - Mulberry32 implementation for deterministic RNG
  - `domains/rng/services/rngService` - Basic RNG service
  - `domains/rng/hooks/useRNG.ts` - Hook for RNG management

- **Bitcoin Domain**:
  - `domains/bitcoin/services/blockService` - Block data fetching service
  - `domains/bitcoin/hooks/useBlockData.ts` - Hook for block data
  - `domains/bitcoin/utils/nonceUtils.ts` - Nonce processing utilities
  - `domains/bitcoin/api/client.ts` - API client for ordinals.com

### Shared Components for Phase 1

- **Store**:
  - `store/index.ts` - Zustand store setup
  - `store/slices/particleSlice.ts` - Particle state slice
  - `store/slices/bitcoinSlice.ts` - Bitcoin state slice

- **Utils**:
  - `utils/math/vector.ts` - Vector math utilities
  - `utils/math/random.ts` - Random number utilities
  - `utils/performance.ts` - Performance monitoring utilities

- **Hooks**:
  - `hooks/useAnimationFrame.ts` - Animation frame hook
  - `hooks/useResizeObserver.ts` - Resize observer hook

- **Components**:
  - `components/visualization/Canvas.tsx` - Canvas component for rendering

### Testing for Phase 1

- **Unit Tests**:
  - `tests/unit/domains/particle` - Particle domain tests
  - `tests/unit/domains/physics` - Physics domain tests
  - `tests/unit/domains/rng` - RNG domain tests
  - `tests/unit/domains/bitcoin` - Bitcoin domain tests

- **Integration Tests**:
  - `tests/integration/particle-physics` - Particle-physics integration tests
  - `tests/integration/bitcoin-rng` - Bitcoin-RNG integration tests

- **Performance Tests**:
  - `tests/performance/particle` - Particle performance tests
  - `tests/performance/physics` - Physics performance tests

All other domains and components will have placeholder files created but will not be implemented until later phases.

## Directory Creation Script

A PowerShell script will be created to generate this directory structure with placeholder files. The script will be stored in the `scripts` directory and can be run to initialize the project structure.

### Script Features

1. **Directory Creation**:
   - Create all directories in the structure
   - Create nested subdirectories
   - Handle special characters in paths

2. **File Generation**:
   - Create placeholder files with appropriate content
   - Add proper imports and exports
   - Include TypeScript types and interfaces
   - Add JSDoc comments for documentation

3. **Phase 1 Implementation**:
   - Add special comments to files that are part of Phase 1
   - Include more detailed content in Phase 1 files
   - Set up proper imports for Phase 1 components

4. **Configuration Files**:
   - Generate configuration files (tsconfig.json, vite.config.ts, etc.)
   - Set up ESLint and Prettier configurations
   - Create package.json with required dependencies

5. **Testing Setup**:
   - Create test files for Phase 1 components
   - Set up test utilities and mocks
   - Configure Vitest for testing

### Script Implementation

The script will be implemented in PowerShell with the following structure:

```powershell
# setup-project.ps1

# Configuration
$rootDir = "."
$srcDir = "$rootDir/src"
$testsDir = "$rootDir/tests"
$publicDir = "$rootDir/public"
$scriptsDir = "$rootDir/scripts"

# Function to create directory if it doesn't exist
function EnsureDirectory($path) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created directory: $path"
    }
}

# Function to create a placeholder file with content
function CreatePlaceholderFile($path, $content) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path -Force | Out-Null
        Set-Content -Path $path -Value $content
        Write-Host "Created file: $path"
    }
}

# Create root directories
EnsureDirectory $srcDir
EnsureDirectory $testsDir
EnsureDirectory $publicDir
EnsureDirectory $scriptsDir

# Create source subdirectories
# ... (code to create all subdirectories)

# Create placeholder files
# ... (code to create all placeholder files)

# Create configuration files
# ... (code to create configuration files)

# Create test files
# ... (code to create test files)

Write-Host "Project structure setup complete!"
```

### Usage

The script can be run from the project root directory:

```
./scripts/setup-project.ps1
```

This will create the entire directory structure with placeholder files, ready for development to begin on Phase 1 components.
