# Roadmap and Questions

This document outlines the development roadmap for the Bitcoin Protozoa project and addresses key questions and considerations for implementation.

## Table of Contents

1. [Introduction](#introduction) [Line 10]
2. [Development Roadmap](#development-roadmap) [Line 20]
   - [Phase 1: Foundation](#phase-1-foundation) [Line 30]
   - [Phase 2: Core Features](#phase-2-core-features) [Line 60]
   - [Phase 3: Bitcoin Integration](#phase-3-bitcoin-integration) [Line 90]
   - [Phase 4: Advanced Features](#phase-4-advanced-features) [Line 120]
   - [Phase 5: Finalization](#phase-5-finalization) [Line 150]
3. [Open Questions and Considerations](#open-questions-and-considerations) [Line 180]
   - [Technical Questions](#technical-questions) [Line 190]
   - [Design Questions](#design-questions) [Line 220]
   - [Bitcoin Integration Questions](#bitcoin-integration-questions) [Line 250]
   - [Testing Questions](#testing-questions) [Line 280]
   - [User Experience Questions](#user-experience-questions) [Line 310]
4. [Decision Points](#decision-points) [Line 340]
5. [Future Enhancements](#future-enhancements) [Line 400]
6. [Technical Challenges](#technical-challenges) [Line 450]
7. [Related Documents](#related-documents) [Line 500]

## Introduction

The Bitcoin Protozoa project requires careful planning and consideration of various technical and design aspects. This document serves as a roadmap for development and a collection of key questions that need to be addressed throughout the implementation process.

The roadmap is organized into phases, each building upon the previous one to create a complete, functional application. The questions are organized by category to help focus discussions and decision-making.

## Development Roadmap

The development roadmap is divided into five phases, each with specific goals and deliverables. The phases are designed to build upon each other, with each phase resulting in a working implementation before moving to the next phase.

### Phase 1: Foundation

**Goal**: Establish the core architecture and basic particle system with Bitcoin integration.

**Key Deliverables**:
- Project structure and development environment setup
- Basic particle system implementation with simple physics
- Bitcoin API integration for block data
- RNG system implementation using Bitcoin nonce
- Basic rendering system with Three.js/React Three Fiber
- State management setup with Zustand
- Testing infrastructure with Vitest

**Tasks**:
- [ ] Initialize project with Vite and TypeScript
- [ ] Set up directory structure following domain-based approach
- [ ] Create placeholder files and directories for future implementation
- [ ] Implement basic particle class with position, velocity, and acceleration
- [ ] Implement particle renderer using Three.js
- [ ] Implement basic physics engine for particle movement
- [ ] Implement Bitcoin API service for fetching block data
- [ ] Implement Mulberry32 RNG algorithm seeded with Bitcoin nonce
- [ ] Set up Zustand store for application state
- [ ] Set up Vitest for unit testing
- [ ] Implement basic tests for particle system and Bitcoin integration

**Success Criteria**:
- Basic particle system renders and moves on screen
- Particles are generated deterministically based on Bitcoin nonce
- Basic physics engine applies forces to particles
- Application state is managed properly with Zustand
- Tests pass for all implemented components

### Phase 2: Core Features

**Goal**: Implement core features of the particle system, including visual traits and basic interactions.

**Key Deliverables**:
- Color palette system for particle groups
- Particle shape system with various shapes
- Basic particle group formation patterns
- Improved physics engine with more realistic behavior
- Enhanced rendering with better visual effects
- Expanded Bitcoin integration with confirmation tracking

**Tasks**:
- [ ] Implement color palette system for particle groups
- [ ] Implement particle shape system with various shapes
- [ ] Implement basic formation patterns for particle groups
- [ ] Enhance physics engine with improved collision detection
- [ ] Implement particle group management
- [ ] Enhance rendering with better visual effects
- [ ] Implement confirmation tracking for Bitcoin blocks
- [ ] Implement basic milestone detection for evolution mechanics
- [ ] Expand testing coverage for new features
- [ ] Optimize performance for basic implementation

**Success Criteria**:
- Particles have distinct colors based on their group
- Particles have various shapes based on deterministic generation
- Particle groups form basic patterns
- Physics engine handles collisions and interactions realistically
- Rendering is visually appealing with basic effects
- Bitcoin confirmation tracking works correctly
- Tests pass for all implemented components

### Phase 3: Bitcoin Integration

**Goal**: Fully integrate with Bitcoin blockchain for data, evolution mechanics, and prepare for inscription.

**Key Deliverables**:
- Complete Bitcoin integration with robust error handling
- Evolution mechanics based on confirmation milestones
- Mutation system for particle traits
- Rarity system for traits based on confirmations
- Fallback mechanisms for offline operation
- Caching system for Bitcoin data

**Tasks**:
- [ ] Enhance Bitcoin API service with robust error handling
- [ ] Implement fallback mechanisms for API failures
- [ ] Create caching system for Bitcoin data
- [ ] Implement offline mode for development and testing
- [ ] Implement complete evolution mechanics based on confirmation milestones
- [ ] Create mutation system for particle traits
- [ ] Implement rarity system for traits based on confirmations
- [ ] Enhance testing for Bitcoin integration and evolution mechanics
- [ ] Create visualization tools for evolution and mutations
- [ ] Implement inscription content loading system

**Success Criteria**:
- Bitcoin integration works reliably with proper error handling
- Evolution mechanics trigger correctly at confirmation milestones
- Mutations apply correctly to particle traits
- Rarity system works as expected based on confirmations
- Fallback mechanisms work correctly for offline operation
- Caching system reduces API calls and improves performance
- Tests pass for all implemented components

### Phase 4: Advanced Features

**Goal**: Implement advanced features including particle roles, force fields, and complex behaviors.

**Key Deliverables**:
- Particle role system with five distinct roles
- Force field system for particle interactions
- Complex behaviors based on roles and force fields
- Advanced visual effects for particles and interactions
- Enhanced performance optimization
- Comprehensive UI for information display

**Tasks**:
- [ ] Implement CORE role with central, stabilizing behavior
- [ ] Implement CONTROL role with directive, coordinating behavior
- [ ] Implement MOVEMENT role with propulsive, navigational behavior
- [ ] Implement DEFENSE role with protective, responsive behavior
- [ ] Implement ATTACK role with offensive, tactical behavior
- [ ] Create force field system for particle interactions
- [ ] Implement role-specific force fields
- [ ] Implement complex behaviors based on roles and force fields
- [ ] Enhance visual effects for particles and interactions
- [ ] Optimize performance for complex interactions
- [ ] Create comprehensive UI for information display
- [ ] Implement advanced testing for roles, force fields, and behaviors

**Success Criteria**:
- Particle roles function correctly with distinct behaviors
- Force fields create meaningful interactions between particles
- Complex behaviors emerge from role and force field interactions
- Visual effects enhance the understanding of interactions
- Performance remains good even with complex interactions
- UI provides clear information about the particle system
- Tests pass for all implemented components

### Phase 5: Finalization

**Goal**: Finalize the application for deployment on Bitcoin blockchain with optimizations and comprehensive testing.

**Key Deliverables**:
- Comprehensive performance optimization
- Complete testing coverage
- Deployment preparation for Bitcoin inscription
- Final documentation
- User guides and tutorials

**Tasks**:
- [ ] Implement comprehensive performance optimization
- [ ] Optimize memory usage with object pooling and efficient data structures
- [ ] Optimize rendering with instanced rendering and frustum culling
- [ ] Optimize physics calculations with spatial partitioning
- [ ] Implement final testing for all components
- [ ] Create end-to-end tests for complete application
- [ ] Prepare deployment package for Bitcoin inscription
- [ ] Create final documentation for codebase
- [ ] Create user guides and tutorials
- [ ] Perform final review and validation

**Success Criteria**:
- Application performs well with 500 particles at 60 FPS
- All tests pass with high coverage
- Deployment package is ready for Bitcoin inscription
- Documentation is complete and accurate
- User guides and tutorials are clear and helpful
- Final review confirms all requirements are met

## Open Questions and Considerations

Throughout the development process, various questions and considerations will need to be addressed. These are organized by category to help focus discussions and decision-making.

### Technical Questions

1. **Bitcoin Block Data**: How should we handle potential API limitations or failures when fetching block data from ordinals.com?
   - **Current Approach**: Implement robust error handling with retry mechanisms, caching, and fallback to offline mode.
   - **Alternatives**: Consider using multiple API endpoints or implementing a proxy service.
   - **Decision Criteria**: Reliability, performance, and compatibility with Bitcoin blockchain.

2. **Web Rendering Performance**: What optimizations are needed to ensure smooth rendering of 500 particles per creature in web browsers?
   - **Current Approach**: Use instanced rendering, frustum culling, and level-of-detail techniques.
   - **Alternatives**: Consider using WebGL2 features, worker threads for physics calculations, or reducing visual fidelity.
   - **Decision Criteria**: Target 60 FPS on standard PC hardware.

3. **Memory Optimization**: What are the specific memory usage patterns we expect, and how should we optimize for them?
   - **Current Approach**: Implement object pooling, efficient data structures, and proper cleanup strategies.
   - **Alternatives**: Consider using typed arrays, shared memory, or more aggressive garbage collection.
   - **Decision Criteria**: Minimize memory usage and garbage collection pauses.

4. **Worker Distribution**: How should we balance work between main thread and web workers?
   - **Current Approach**: Use web workers for physics calculations, data processing, and non-UI tasks.
   - **Alternatives**: Consider using shared workers, service workers, or offloading more work to GPU.
   - **Decision Criteria**: Maintain responsive UI while maximizing performance.

5. **Force Field Complexity**: What is the optimal number and complexity of force fields to balance visual interest and performance?
   - **Current Approach**: Implement role-specific force fields with varying complexity based on distance and importance.
   - **Alternatives**: Consider using simplified force fields, pre-computed force fields, or adaptive complexity.
   - **Decision Criteria**: Visual interest, performance impact, and emergent behaviors.

### Design Questions

1. **Role Balance**: What is the optimal distribution of the five particle roles (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)?
   - **Current Approach**: 40 base particles per role + 300 distributed via normalized RNG (10-30% per role).
   - **Alternatives**: Consider fixed distributions, dynamic distributions based on traits, or user-configurable distributions.
   - **Decision Criteria**: Visual appeal, emergent behaviors, and performance.

2. **Visual Design**: What additional visual effects would enhance the particle ecosystem while maintaining performance?
   - **Current Approach**: Implement glow effects, trails, and interaction effects with performance considerations.
   - **Alternatives**: Consider post-processing effects, shader-based effects, or simplified effects.
   - **Decision Criteria**: Visual appeal, performance impact, and information conveyance.

3. **Development UI**: What specific controls and visualizations are most important for the development UI?
   - **Current Approach**: Implement debug overlay, parameter controls, and visualization tools for development.
   - **Alternatives**: Consider separate development tools, in-browser debugging, or minimal UI.
   - **Decision Criteria**: Development efficiency, debugging capabilities, and ease of use.

4. **Force Field Visualization**: How should we visualize the different force fields to make their roles clear?
   - **Current Approach**: Implement debug visualization for force fields with role-specific colors and shapes.
   - **Alternatives**: Consider permanent visualization, interactive visualization, or minimal visualization.
   - **Decision Criteria**: Information conveyance, visual appeal, and performance impact.

5. **Creature Differentiation**: How can we ensure each Bitcoin block produces a visually distinct and interesting creature?
   - **Current Approach**: Use nonce-based RNG for varied traits (color, shape, formation, effects).
   - **Alternatives**: Consider more trait variations, dynamic traits, or user-configurable traits.
   - **Decision Criteria**: Visual diversity, deterministic generation, and performance impact.

### Bitcoin Integration Questions

1. **Inscription Size**: How can we minimize the size of our code for Bitcoin inscription while maintaining functionality?
   - **Current Approach**: Implement code splitting, tree shaking, and aggressive optimization for size.
   - **Alternatives**: Consider simplified functionality, external dependencies, or multiple inscriptions.
   - **Decision Criteria**: Maintain core functionality while minimizing inscription size.

2. **Dependency Management**: What is the optimal strategy for loading and managing on-chain dependencies?
   - **Current Approach**: Load dependencies via script tags with appropriate sequencing.
   - **Alternatives**: Consider bundling dependencies, lazy loading, or external dependencies.
   - **Decision Criteria**: Reliability, performance, and compatibility with Bitcoin blockchain.

3. **Fallback Mechanisms**: What fallbacks should we implement if certain inscribed resources are slow to load?
   - **Current Approach**: Implement loading indicators, timeout handling, and graceful degradation.
   - **Alternatives**: Consider local caching, progressive enhancement, or simplified fallbacks.
   - **Decision Criteria**: User experience, reliability, and performance.

4. **Testing Strategy**: How can we effectively test the application as it would run from Bitcoin inscriptions?
   - **Current Approach**: Implement a simulated inscription environment for testing.
   - **Alternatives**: Consider testing with actual inscriptions, mock inscriptions, or hybrid approaches.
   - **Decision Criteria**: Test coverage, reliability, and development efficiency.

5. **Versioning Strategy**: Since the code will be immutable once inscribed, how should we approach the final version?
   - **Current Approach**: Build base engine first, design for future extensibility (combat, breeding, etc.).
   - **Alternatives**: Consider multiple inscriptions, versioned inscriptions, or minimal initial version.
   - **Decision Criteria**: Future-proofing, maintainability, and user experience.

### Testing Questions

1. **Unit Testing Approach**: What specific components and functions should have unit tests?
   - **Current Approach**: Implement unit tests for all core components and critical functions.
   - **Alternatives**: Consider risk-based testing, coverage-based testing, or behavior-driven testing.
   - **Decision Criteria**: Test coverage, development efficiency, and reliability.

2. **Integration Testing**: How should we test the integration between different systems?
   - **Current Approach**: Implement integration tests for key system interactions.
   - **Alternatives**: Consider end-to-end testing, component testing, or contract testing.
   - **Decision Criteria**: Test coverage, reliability, and development efficiency.

3. **Visual Testing**: How should we test the visual appearance of creatures?
   - **Current Approach**: Implement visual regression testing with screenshot comparisons.
   - **Alternatives**: Consider manual visual testing, automated visual testing, or hybrid approaches.
   - **Decision Criteria**: Visual consistency, development efficiency, and test reliability.

4. **Performance Testing**: What performance metrics should we test?
   - **Current Approach**: Test FPS, memory usage, CPU usage, and load times.
   - **Alternatives**: Consider user-perceived performance, specific scenario testing, or stress testing.
   - **Decision Criteria**: User experience, reliability, and development efficiency.

5. **Cross-Browser Testing**: What browsers should we support and test?
   - **Current Approach**: Test on major browsers (Chrome, Firefox, Safari, Edge).
   - **Alternatives**: Consider browser-specific optimizations, progressive enhancement, or limited browser support.
   - **Decision Criteria**: User reach, development efficiency, and maintenance burden.

### User Experience Questions

1. **Target Devices**: What hardware and software configurations should we target?
   - **Current Approach**: Target standard PC hardware with optimization for current average specs.
   - **Alternatives**: Consider mobile optimization, high-end optimization, or minimal requirements.
   - **Decision Criteria**: User reach, performance, and development efficiency.

2. **Performance Expectations**: What performance targets should we set for different devices?
   - **Current Approach**: Target 60 FPS on standard PC hardware.
   - **Alternatives**: Consider adaptive performance, reduced particle count, or simplified visuals.
   - **Decision Criteria**: User experience, visual appeal, and development efficiency.

3. **Loading Experience**: How should we handle the initial loading experience?
   - **Current Approach**: Implement loading screen with progress indicators and background loading.
   - **Alternatives**: Consider progressive loading, minimal initial load, or interactive loading.
   - **Decision Criteria**: User experience, perceived performance, and development efficiency.

4. **Interaction Model**: What interactions should users have with the particle creatures?
   - **Current Approach**: Initially observation only (like an aquarium), with possible interactions later.
   - **Alternatives**: Consider direct manipulation, parameter adjustment, or guided interactions.
   - **Decision Criteria**: User engagement, development complexity, and performance impact.

5. **Data Display**: How should we display information about the creatures and their traits?
   - **Current Approach**: Implement stats for creature and particle groups, trait listings, and data overlays.
   - **Alternatives**: Consider minimal UI, interactive exploration, or detailed analytics.
   - **Decision Criteria**: Information clarity, visual appeal, and user engagement.

## Decision Points

Throughout the development process, several key decisions will need to be made. These decision points are critical for the success of the project and should be carefully considered.

### Architecture Decisions

1. **Component Structure**: How should we organize the codebase for maintainability and performance?
   - **Options**: Domain-driven design, feature-based organization, or layered architecture.
   - **Considerations**: Maintainability, testability, and development efficiency.
   - **Timeline**: Phase 1 (Foundation)

2. **State Management**: What state management approach should we use?
   - **Options**: Zustand, Redux, Context API, or custom solution.
   - **Considerations**: Performance, complexity, and development efficiency.
   - **Timeline**: Phase 1 (Foundation)

3. **Rendering Approach**: What rendering approach should we use for particles?
   - **Options**: Instanced rendering, individual meshes, or hybrid approach.
   - **Considerations**: Performance, visual quality, and development complexity.
   - **Timeline**: Phase 1 (Foundation)

### Implementation Decisions

1. **Physics Implementation**: What physics implementation approach should we use?
   - **Options**: Custom physics, physics library, or simplified physics.
   - **Considerations**: Performance, accuracy, and development complexity.
   - **Timeline**: Phase 1 (Foundation)

2. **Particle Grouping**: How should we organize particles into groups?
   - **Options**: Role-based groups, visual trait groups, or dynamic grouping.
   - **Considerations**: Visual appeal, performance, and emergent behaviors.
   - **Timeline**: Phase 2 (Core Features)

3. **Force Field Implementation**: How should we implement force fields?
   - **Options**: Vector fields, influence maps, or simplified forces.
   - **Considerations**: Performance, visual appeal, and emergent behaviors.
   - **Timeline**: Phase 4 (Advanced Features)

### Deployment Decisions

1. **Inscription Strategy**: How should we inscribe the application on Bitcoin?
   - **Options**: Single inscription, multiple inscriptions, or layered inscriptions.
   - **Considerations**: Size constraints, loading performance, and future extensibility.
   - **Timeline**: Phase 5 (Finalization)

2. **Dependency Management**: How should we manage dependencies in the inscription?
   - **Options**: Bundle dependencies, separate inscriptions, or external dependencies.
   - **Considerations**: Size constraints, loading performance, and reliability.
   - **Timeline**: Phase 5 (Finalization)

3. **Versioning Strategy**: How should we handle versioning for immutable inscriptions?
   - **Options**: Design for extensibility, multiple versions, or minimal initial version.
   - **Considerations**: Future-proofing, maintenance burden, and user experience.
   - **Timeline**: Phase 5 (Finalization)

## Future Enhancements

While the initial implementation will focus on the core functionality, several enhancements are planned for future versions after the initial particle creature engine is built and distributed to the community.

### Gameplay Enhancements

1. **Combat Arena (PvP)**: Implement a combat arena for particle creatures to battle each other in player-versus-player matches.
   - **Potential Features**:
     - Attack and defense mechanics based on particle roles and traits
     - Strategic battle system leveraging creature strengths and weaknesses
     - Tournament system with rankings and rewards
     - Battle history and statistics tracking
     - Special abilities triggered during combat
   - **Considerations**:
     - Balance between different creature types
     - Performance optimization for battle animations
     - Fair matchmaking system
     - Engaging battle mechanics that leverage the particle system

2. **Breeding System**: Implement a breeding system for particle creatures to create new creatures by combining the DNA (blockdata) of two parent creatures.
   - **Potential Features**:
     - Genetic inheritance of traits from both parents
     - Mutation chances based on parent traits and Bitcoin confirmations
     - Lineage tracking and family trees
     - Breeding cooldowns and limitations
     - Trait dominance and recessive traits
     - Specialized breeding outcomes based on parent compatibility
   - **Considerations**:
     - Deterministic breeding algorithm using both parents' block data
     - Balance between predictability and surprise in offspring
     - Preventing exploitation of the breeding system
     - Managing the population of creatures

3. **Evolution System**: Enhance the evolution system with more complex mutations and adaptations.
   - **Potential Features**:
     - Environmental adaptation based on usage patterns
     - Specialized traits that develop over time
     - Evolution history and milestone achievements
     - Rare evolutionary events triggered by specific Bitcoin block conditions
   - **Considerations**:
     - Maintaining deterministic nature while allowing for evolution
     - Performance impact of more complex traits
     - User engagement with long-term evolution

### Visual Enhancements

1. **Advanced Visual Effects**: Implement more advanced visual effects for particles and interactions.
   - **Potential Features**: Shader-based effects, post-processing, and particle trails.
   - **Considerations**: Performance impact, visual appeal, and development complexity.

2. **Environmental Effects**: Implement environmental effects that influence particle behavior.
   - **Potential Features**: Weather effects, terrain influence, and time-based changes.
   - **Considerations**: Performance impact, visual appeal, and development complexity.

3. **Customization Options**: Implement options for users to customize the appearance of their creatures.
   - **Potential Features**: Color schemes, visual themes, and display options.
   - **Considerations**: User engagement, development complexity, and performance impact.

### Technical Enhancements

1. **Performance Optimizations**: Implement additional performance optimizations for larger particle counts.
   - **Potential Features**: GPU acceleration, advanced culling, and adaptive detail.
   - **Considerations**: Development complexity, browser compatibility, and user reach.

2. **Mobile Support**: Enhance the application to work well on mobile devices.
   - **Potential Features**: Touch controls, responsive design, and performance optimizations.
   - **Considerations**: User reach, development complexity, and performance constraints.

3. **Analytics and Insights**: Implement analytics to track creature traits and behaviors.
   - **Potential Features**: Trait distribution, behavior patterns, and evolution trends.
   - **Considerations**: User engagement, development complexity, and privacy concerns.

## Technical Challenges

The Bitcoin Protozoa project faces several technical challenges that will need to be addressed during development.

### Performance Challenges

1. **Particle Rendering**: Rendering 500 particles with unique properties at 60 FPS.
   - **Impact**: Core functionality and user experience.
   - **Potential Solutions**: Instanced rendering, level-of-detail techniques, and frustum culling.
   - **Mitigation Strategy**: Implement performance monitoring and optimization from the beginning.

2. **Physics Calculations**: Performing physics calculations for 500 particles with complex interactions.
   - **Impact**: Core functionality and emergent behaviors.
   - **Potential Solutions**: Spatial partitioning, simplified physics, and worker threads.
   - **Mitigation Strategy**: Implement physics optimization techniques and adaptive complexity.

3. **Memory Management**: Managing memory efficiently to prevent leaks and garbage collection pauses.
   - **Impact**: Performance and stability.
   - **Potential Solutions**: Object pooling, efficient data structures, and proper cleanup.
   - **Mitigation Strategy**: Implement memory monitoring and optimization from the beginning.

### Bitcoin Integration Challenges

1. **API Reliability**: Ensuring reliable access to Bitcoin block data from ordinals.com.
   - **Impact**: Core functionality and user experience.
   - **Potential Solutions**: Robust error handling, caching, and fallback mechanisms.
   - **Mitigation Strategy**: Implement comprehensive error handling and testing.

2. **Inscription Size**: Keeping the application size within inscription constraints.
   - **Impact**: Deployment feasibility and loading performance.
   - **Potential Solutions**: Code splitting, tree shaking, and aggressive optimization.
   - **Mitigation Strategy**: Monitor bundle size from the beginning and optimize continuously.

3. **Immutable Code**: Dealing with the immutability of inscribed code.
   - **Impact**: Maintenance and future enhancements.
   - **Potential Solutions**: Design for extensibility, thorough testing, and careful planning.
   - **Mitigation Strategy**: Implement comprehensive testing and validation before inscription.

### Browser Compatibility Challenges

1. **WebGL Support**: Ensuring consistent WebGL support across browsers.
   - **Impact**: Core functionality and user reach.
   - **Potential Solutions**: Feature detection, fallbacks, and simplified rendering.
   - **Mitigation Strategy**: Test across browsers from the beginning and implement graceful degradation.

2. **Worker Thread Support**: Ensuring consistent worker thread support across browsers.
   - **Impact**: Performance and user reach.
   - **Potential Solutions**: Feature detection, fallbacks, and main thread processing.
   - **Mitigation Strategy**: Test across browsers from the beginning and implement graceful degradation.

3. **Mobile Support**: Ensuring acceptable performance on mobile devices.
   - **Impact**: User reach and experience.
   - **Potential Solutions**: Simplified rendering, reduced particle count, and touch controls.
   - **Mitigation Strategy**: Test on mobile devices from the beginning and implement adaptive features.

## Related Documents

- [System Architecture](../core/02_system_architecture.md) - High-level architecture overview
- [Module Structure](../core/03_module_structure.md) - Module organization details
- [Blockchain Integration](../bitcoin/01_blockchain_integration.md) - Bitcoin integration details
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - Evolution mechanics details
- [RNG System](../bitcoin/03_rng_system.md) - RNG system details
- [Particle System](../engine/03_particle_system.md) - Particle system details
- [Physics System](../engine/02_physics_system.md) - Physics system details
- [Performance Considerations](../engine/04_performance_considerations.md) - Performance optimization guidelines
- [Testing Strategy](../testing/01_testing_strategy.md) - Testing approach
- [Error Handling](../testing/02_error_handling.md) - Error handling strategy
- [Technical Implementation](../testing/03_technical_implementation.md) - Technical implementation details
- [Development UI](../testing/04_development_ui.md) - Development UI for testing
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - Deployment pipeline details
- [Development Workflow](../deployment/01_development_workflow.md) - Development workflow details
- [Asset Management](../deployment/03_asset_management.md) - Asset management details
- [Project Checklist](../project/01_project_checklist.md) - Project requirements checklist
- [Project Inventory](../project/02_project_inventory.md) - Project inventory details