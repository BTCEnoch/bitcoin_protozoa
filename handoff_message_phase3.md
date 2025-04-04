# Handoff Message for Bitcoin Protozoa Project - Phase 3 Implementation

## Project Status Overview

We are currently implementing Phase 3 (Visual Traits Implementation) of the Bitcoin Protozoa project. This phase focuses on creating visual traits for particles based on Bitcoin block data, including color palettes, particle shapes, and visual effects.

### Progress So Far

1. **Phase 3 Q&A Completed**:
   - Defined what visual traits will be implemented (color, shape, formation, effects)
   - Established that traits will be generated using the nonce RNG chain
   - Determined how traits will be applied to the 5 particle groups
   - Outlined visual effects implementation approach using VFX Composer or Nebula Three
   - Defined testing approach for visual traits

2. **Automation Scripts Created**:
   - Implemented Color Palette Generator script (`scripts/phase_3/color-palette-generator.ps1`)
   - Implemented Shape Mesh Generator script (`scripts/phase_3/shape-mesh-generator.ps1`)
   - Started implementing Visual Trait Previewer script (`scripts/phase_3/visual-trait-previewer.ps1`)

3. **Project Checklist Updated**:
   - Marked completed tasks in the Phase 3 section
   - Updated Phase 3 Q&A with detailed answers

### Next Steps

1. **Complete Visual Trait Previewer Script**:
   - Finish implementing the Visual Trait Previewer script
   - Test the script to ensure it works correctly

2. **Implement Shader Generator Script**:
   - Create a script to generate and compile shader code for visual effects
   - Integrate with the trait system

3. **Implement Visual Regression Testing**:
   - Set up automated visual regression testing for visual traits
   - Create test cases for different trait combinations

4. **Implement Core Visual Trait System**:
   - Create the trait types and interfaces
   - Implement trait generation from Bitcoin block data
   - Create trait application system for particles

5. **Implement Color Palette System**:
   - Create the color palette data structure
   - Implement palette selection based on Bitcoin nonce
   - Implement role-based color assignment

6. **Implement Particle Shape System**:
   - Create the particle shape system
   - Implement shape generation from Bitcoin nonce
   - Implement role-specific shape variations

7. **Implement Visual Effects System**:
   - Create particle glow effects
   - Implement particle trail effects
   - Create interaction effects

## Critical Rules and Guidelines

### Directory Structure

Always adhere strictly to the directory structure map as defined in `bitcoin_protozoa/project/05_directory_structure_map.md`. The project follows a domain-based architecture with clear separation of concerns:

```
src/
└── domains/
    ├── trait/              # Trait system domain
    │   ├── components/     # Trait-related components
    │   ├── hooks/          # Trait-related hooks
    │   ├── services/       # Trait-related services
    │   ├── utils/          # Trait-related utilities
    │   ├── data/           # Trait data definitions
    │   └── tests/          # Trait tests
    ├── particle/           # Particle system domain
    ├── bitcoin/            # Bitcoin integration domain
    └── ...                 # Other domains
```

### Implementation Patterns

1. **Domain-Based Architecture**:
   - Each domain has its own components, hooks, services, and utilities
   - Domains should be loosely coupled and communicate through well-defined interfaces
   - Follow the existing patterns in the codebase

2. **TypeScript Types**:
   - Define clear interfaces for all data structures
   - Use proper typing for all functions and components
   - Follow existing type naming conventions

3. **Component Structure**:
   - Each component should have its own directory with index.tsx, types.ts, and styles.ts files
   - Use emotion/react for styling
   - Follow the existing component patterns

4. **Service Structure**:
   - Services should be organized by functionality
   - Each service should have a clear interface and implementation
   - Follow the existing service patterns

### Bitcoin Integration Rules

1. **Bitcoin Data Usage**:
   - ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
   - Do NOT use other fields like hash, timestamp, or height

2. **API Endpoints**:
   - Development: `https://ordinals.com/r/blockinfo/${blockNumber}`
   - Production: `/r/blockinfo/${blockNumber}`

3. **NO Fallback Mechanisms**:
   - Do NOT implement fallback mechanisms for API failures
   - Rely solely on Bitcoin ordinals endpoints

### Trait System Implementation

1. **Trait Generation**:
   - Use the nonce RNG chain as described in `bitcoin_protozoa/bitcoin/rng_system.md`
   - Traits must be deterministically generated from the Bitcoin block nonce
   - Follow the rarity tier system (Common, Uncommon, Rare, Epic, Legendary, Mythic)

2. **Visual Traits**:
   - Implement 50 different color palettes based on color theory
   - Create a variety of particle shapes with different complexity levels
   - Implement visual effects that vary based on rarity

3. **Trait Application**:
   - Apply traits to the 5 particle groups (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
   - Each group should have role-specific trait variations
   - Traits should be visually distinct based on role and rarity

### Implementation Constraints

1. **Code Size Limitations**:
   - Break large tasks into smaller chunks (max 250 lines per update)
   - View max 1000 lines at a time
   - Documentation under 500 lines
   - Code blocks 200-300 lines

2. **Testing Requirements**:
   - Write comprehensive tests for all implementations
   - Ensure deterministic behavior across all tests
   - Test edge cases and error handling

3. **Documentation Requirements**:
   - Document all functions with JSDoc comments
   - Update the project checklist as tasks are completed
   - Document all Bitcoin on-chain resources

## Resources

1. **Project Documentation**:
   - `bitcoin_protozoa/project/01_project_checklist.md` - Project checklist
   - `bitcoin_protozoa/project/05_directory_structure_map.md` - Directory structure map

2. **Trait System Documentation**:
   - `bitcoin_protozoa/traits/01_color_palettes.md` - Color palette design
   - `bitcoin_protozoa/traits/02_particle_shapes.md` - Particle shape design
   - `bitcoin_protozoa/traits/06_trait_system.md` - Trait system design

3. **Bitcoin Integration Documentation**:
   - `bitcoin_protozoa/bitcoin/03_rng_system.md` - RNG system design
   - `bitcoin_protozoa/bitcoin/04_bitcoin_integration_approach.md` - Integration approach

4. **Visual Design Documentation**:
   - `bitcoin_protozoa/ui/02_visual_design.md` - Visual design guidelines
   - `bitcoin_protozoa/ui/03_color_themes.md` - Color theme design

## Final Notes

The Bitcoin Protozoa project requires strict adherence to the specified architecture and implementation patterns. All code must be error-free and optimized for performance. The application must be 100% immutable and rely solely on Bitcoin ordinals for data and dependencies.

Remember to always check the directory structure map before creating new files, and to break large tasks into smaller chunks to avoid timeouts. The project is highly specific and requires careful attention to detail.

When implementing Phase 3, focus on creating a visually appealing and deterministic trait system that leverages Bitcoin block data to generate unique and interesting visual traits for particles.
