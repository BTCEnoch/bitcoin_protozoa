# Bitcoin Protozoa: Architecture Documentation

## AI Assistant Limitations and Working Guidelines

> **Note to AI Assistant**: When working with this codebase, operate within these constraints to avoid timeouts and truncated responses:
>
> **Content Size Limitations**:
> - Keep responses under 2,000 words or 10-15KB of text
> - Limit code examples to 200-300 lines per response
> - Keep file generations under 500 lines of code
>
> **Processing Limitations**:
> - View files in chunks of 1,000 lines maximum using view_range
> - Break complex operations into multiple steps
> - Avoid analyzing multiple large files simultaneously
>
> **Working Strategy**:
> - Split large documents into logical parts with clear naming (e.g., part1, part2)
> - Implement features incrementally, one component at a time
> - Use cross-references between documents rather than duplicating information
> - Test each component individually before integration
> - Break web searches into specific, targeted queries
>
> Following these guidelines will ensure effective collaboration without technical disruptions.

## Directory Structure

This architecture documentation is organized into domain-specific directories:

```
bitcoin_protozoa/
├── 00_index.md                # This main index file
├── core/                      # Core concepts and fundamentals
│   ├── 01_project_overview.md # Project vision and objectives
│   ├── 02_system_architecture.md # High-level architecture
│   └── 03_module_structure.md # Module organization
├── particles/                 # Particle system documentation
│   ├── 01_particle_system.md  # Particle system design
│   ├── 02_particle_types.md   # Particle types and roles
│   └── 03_particle_lifecycle.md # Particle lifecycle management
├── physics/                   # Physics engine documentation
│   ├── 01_physics_engine.md   # Physics engine overview
│   ├── 02_force_calculations.md # Force calculation details
│   └── 03_force_field_system.md # Force field implementation
├── bitcoin/                   # Bitcoin integration documentation
│   ├── 01_blockchain_integration.md # Blockchain integration overview
│   ├── 02_evolution_mechanics.md # Evolution and mutation system
│   └── 03_deployment_pipeline.md # Ordinals deployment process
├── ui/                        # User interface documentation
│   ├── 01_user_experience.md  # User experience approach
│   ├── 02_visual_design.md    # Visual design system
│   └── 03_color_themes.md     # Color palettes and themes
├── deployment/                # Deployment documentation
│   ├── 01_development_workflow.md # Development workflow
│   ├── 02_deployment_pipeline.md # Deployment pipeline
│   └── 03_asset_management.md # Asset management strategy
├── testing/                   # Testing documentation
│   ├── 01_testing_strategy.md # Testing approach
│   ├── 02_error_handling.md   # Error handling strategy
│   ├── 03_technical_implementation.md # Technical implementation details
│   └── 04_development_ui.md   # Development UI for testing
├── traits/                    # Trait system documentation
│   ├── 00_summary.md          # Traits overview
│   ├── 01_color_palettes.md   # Color palettes for particle groups
│   ├── 02_particle_shapes.md  # Particle shape traits
│   ├── 03_formation_patterns.md # Formation pattern traits
│   ├── 04_behavior_traits.md  # Behavior traits
│   ├── 05_force_field_traits.md # Force field traits
│   ├── 06_trait_system.md     # Comprehensive trait system
│   ├── 07_role_formation_traits.md # Role-based formation traits
│   ├── 08_role_behavior_traits.md # Role-based behavior traits
│   └── 09_mutation_traits.md # Mutation traits
└── project/                   # Project management documentation
    ├── 01_project_checklist.md # Project requirements checklist
    ├── 02_project_inventory.md # Documentation inventory
    ├── 03_roadmap_and_questions.md # Development roadmap and key questions
    └── 04_ai_rules.md         # AI rules and best practices
```

## Quick Navigation

- [Core Concepts](#core-concepts)
- [Particle System](#particle-system)
- [Physics Engine](#physics-engine)
- [Bitcoin Integration](#bitcoin-integration)
- [User Interface](#user-interface)
- [Deployment](#deployment)
- [Testing](#testing)
- [Project Management](#project-management)

## Core Concepts

The core concepts section covers the fundamental architecture and design of the Bitcoin Protozoa project:

- [Project Overview](core/01_project_overview.md) - Project vision, objectives, and unique value proposition
- [System Architecture](core/02_system_architecture.md) - High-level architecture and core components
- [Module Structure](core/03_module_structure.md) - Module organization and domain-based structure

## Particle System

The particle system documentation covers the design and implementation of the particle system:

- [Particle System](particles/01_particle_system.md) - Particle system design and overview
- [Particle Types](particles/02_particle_types.md) - Particle types, roles, and properties
- [Particle Lifecycle](particles/03_particle_lifecycle.md) - Particle lifecycle management and memory optimization

## Physics Engine

The physics engine documentation covers the implementation of the physics simulation:

- [Physics Engine](physics/01_physics_engine.md) - Physics engine overview and components
- [Force Calculations](physics/02_force_calculations.md) - Force calculation formulas and algorithms
- [Force Field System](physics/03_force_field_system.md) - Force field implementation and optimization

## Bitcoin Integration

The Bitcoin integration documentation covers the blockchain integration and evolution mechanics:

- [Blockchain Integration](bitcoin/01_blockchain_integration.md) - Bitcoin blockchain integration approach
- [Evolution Mechanics](bitcoin/02_evolution_mechanics.md) - Confirmation-based mutation system
- [RNG System](bitcoin/03_rng_system.md) - Deterministic random number generation
- [Bitcoin Integration Approach](bitcoin/04_bitcoin_integration_approach.md) - Bitcoin integration strategy
- [Bitcoin Integration Details](bitcoin/05_bitcoin_integration_details_part1.md) - Technical implementation details
- [Trait System](bitcoin/07_trait_system.md) - Trait categories and generation

## User Interface

The user interface documentation covers the visual design and user experience:

- [User Experience](ui/01_user_experience.md) - User experience approach and targets
- [Visual Design](ui/02_visual_design.md) - Visual design system and guidelines
- [Color Themes](ui/03_color_themes.md) - Color palettes and themes

## Deployment

The deployment documentation covers the development workflow and deployment process:

- [Development Workflow](deployment/01_development_workflow.md) - Development process and environment
- [Deployment Pipeline](deployment/02_deployment_pipeline.md) - Ordinals inscription pipeline
- [Asset Management](deployment/03_asset_management.md) - Asset management strategy

## Testing

The testing documentation covers the testing strategy and error handling:

- [Testing Strategy](testing/01_testing_strategy.md) - Testing approach and methodology
- [Error Handling](testing/02_error_handling.md) - Error handling strategy and recovery

## Traits

The traits documentation covers the trait system and visual characteristics for particle groups:

- [Color Palettes](traits/01_color_palettes.md) - Color palettes for particle groups
- [Particle Shapes](traits/02_particle_shapes.md) - Particle shape traits
- [Formation Patterns](traits/03_formation_patterns.md) - Formation pattern traits
- [Role Formation Traits](traits/07_role_formation_traits.md) - Role-based formation traits
- [Role Behavior Traits](traits/08_role_behavior_traits.md) - Role-based behavior traits
- [Mutation Traits](traits/09_mutation_traits.md) - Mutation traits across rarity tiers

## Project Management

The project management documentation covers project tracking and requirements:

- [Project Checklist](project/01_project_checklist.md) - Project requirements checklist
- [Project Inventory](project/02_project_inventory.md) - Documentation inventory and status
- [Roadmap and Questions](project/03_roadmap_and_questions.md) - Development roadmap and key questions
- [Directory Structure Map](project/05_directory_structure_map.md) - Project directory structure
- [Dependency Inventory](project/06_dependency_inventory.md) - Inventory of dependencies and inscription IDs
- [Script-Based Implementation](project/07_script_based_implementation.md) - Script-based implementation approach
- [Phase Implementation Template](project/08_phase_implementation_template.md) - Template flow for implementing each phase
- [Phase Q&A Answers](project/09_phase_qa_answers.md) - Answers to phase-specific Q&A questions

## How to Use This Documentation

### For Developers

- Start with the Core Concepts to understand the project vision and architecture
- Explore the Particle System and Physics Engine documentation for technical details
- Refer to the Bitcoin Integration documentation for blockchain-specific implementation
- Use the Deployment documentation for workflow and pipeline information

### For Project Managers

- Review the Project Management documentation for tracking and requirements
- Use the Core Concepts to communicate the project vision
- Monitor the Bitcoin Integration documentation for blockchain-specific considerations

### For Designers

- Focus on the User Interface documentation for visual design guidelines
- Review the Particle System documentation for visual component details
- Refer to the Core Concepts for overall project vision

## Document Conventions

- Each document begins with a brief overview
- Code examples are limited to 200 lines per document
- Large topics are split into multiple documents with cross-references
- References to other documents use relative links
- Each document ends with links to related documents

## Migration Status

This documentation is being migrated from the original architecture directory to this new AI-optimized structure. The following documents have been migrated:

- Core Concepts
  - [Project Overview](core/01_project_overview.md)
  - [System Architecture](core/02_system_architecture.md)
  - [Module Structure](core/03_module_structure.md)
  - [Memory and Worker Systems](core/04_memory_worker_systems.md)
  - [Performance Optimization Strategies](core/05_performance_optimization.md)

- Particle System
  - [Particle System](particles/01_particle_system.md)
  - [Particle Types](particles/02_particle_types.md)
  - [Particle Lifecycle](particles/03_particle_lifecycle.md)
  - [Role Hierarchy](particles/04_role_hierarchy.md)
  - [Particle System Design Decisions](particles/05_particle_system_design_decisions.md)

- Physics Engine
  - [Physics Engine](physics/01_physics_engine.md)
  - [Force Calculations](physics/02_force_calculations.md)
  - [Force Field System](physics/03_force_field_system.md)

- Bitcoin Integration
  - [Blockchain Integration](bitcoin/01_blockchain_integration.md)
  - [Evolution Mechanics](bitcoin/02_evolution_mechanics.md)
  - [RNG System](bitcoin/03_rng_system.md)
  - [Bitcoin Integration Approach](bitcoin/04_bitcoin_integration_approach.md)
  - [Bitcoin Integration Details - Part 1](bitcoin/05_bitcoin_integration_details_part1.md)
  - [Bitcoin Integration Details - Part 2](bitcoin/06_bitcoin_integration_details_part2.md)
  - [Bitcoin Deployment Considerations](bitcoin/08_deployment_considerations.md)

- User Interface
  - [User Experience](ui/01_user_experience.md)
  - [Visual Design](ui/02_visual_design.md)
  - [Color Themes](ui/03_color_themes.md)
  - [Development UI](ui/04_development_ui.md)

- Deployment
  - [Development Workflow](deployment/01_development_workflow.md)
  - [Deployment Pipeline](deployment/02_deployment_pipeline.md)
  - [Asset Management](deployment/03_asset_management.md)

- Testing
  - [Testing Strategy](testing/01_testing_strategy.md)
  - [Error Handling](testing/02_error_handling.md)
  - [Technical Implementation](testing/03_technical_implementation.md)
  - [Development UI](testing/04_development_ui.md)

- Traits
  - [Color Palettes](traits/01_color_palettes.md)
  - [Particle Shapes](traits/02_particle_shapes.md)
  - [Formation Patterns](traits/03_formation_patterns.md)
  - [Behavior Traits](traits/04_behavior_traits.md)
  - [Force Field Traits](traits/05_force_field_traits.md)
  - [Trait System](traits/06_trait_system.md)

- Project Management
  - [Migration Checklist](project/01_migration_checklist.md)
  - [Project Checklist](project/01_project_checklist.md)
  - [Project Inventory](project/02_project_inventory.md)
  - [Roadmap and Questions](project/03_roadmap_and_questions.md)
  - [AI Rules](project/04_ai_rules.md)

For a comprehensive overview of the migration progress, please see the [Migration Checklist](project/01_migration_checklist.md).

Current migration status: 41 out of 41 documents completed (100%).

## Contributing to This Documentation

When updating or adding to this documentation:

1. Follow the established directory structure
2. Keep documents under 500 lines
3. Split large topics into multiple documents
4. Update cross-references when adding new documents
5. Maintain the consistent formatting and style
