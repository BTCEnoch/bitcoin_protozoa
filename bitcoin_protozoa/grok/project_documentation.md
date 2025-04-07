# project DOCUMENTATION 
 
This document contains all the content from the project subdirectory of the Bitcoin Protozoa project. 
 
## Files 
 
### 00_summary.md 
 
```.md 
# Project Management Summary

This directory contains documentation on project management, tracking, and requirements for the Bitcoin Protozoa project.

## Key Documents

- [Project Checklist](01_project_checklist.md) - Project requirements checklist
- [Project Inventory](02_project_inventory.md) - Documentation inventory and status
- [Roadmap and Questions](03_roadmap_and_questions.md) - Development roadmap and key questions
- [AI Rules](04_ai_rules.md) - AI rules and best practices for development

## Project Management Overview

The project management approach ensures organized development and tracking:

1. **Requirements Tracking**: Tracking project requirements and completion
2. **Documentation Inventory**: Maintaining an inventory of documentation
3. **Status Tracking**: Tracking the status of project components
4. **Priority Management**: Managing development priorities
5. **Quality Gates**: Ensuring quality at each development stage

## Project Checklist

The project checklist tracks all required components:

1. **Project Setup and Planning**: Environment setup and architecture planning
2. **Core Systems Implementation**: Particle system, physics engine, etc.
3. **Bitcoin Integration**: Blockchain data integration, evolution mechanics, etc.
4. **User Interface and Experience**: Development UI, production UI, etc.
5. **Performance Optimization**: Memory management, rendering optimization, etc.
6. **Testing and Quality Assurance**: Unit testing, integration testing, etc.
7. **Deployment and Operations**: Build process, inscription process, etc.
8. **Documentation**: Technical documentation, user documentation, etc.

## Project Inventory

The project inventory tracks the status of all documentation:

1. **Documentation Status**: Complete, in progress, or pending
2. **Priority Levels**: P0 (critical) to P3 (low priority)
3. **Documentation References**: References to relevant documentation
4. **Implementation Notes**: Notes on implementation status
5. **Documentation Gaps**: Identification of documentation gaps

## Roadmap and Questions

The roadmap and questions document outlines the development plan and addresses key questions:

1. **Development Roadmap**: Phased approach to development
   - Phase 1: Foundation - Project setup and basic particle system
   - Phase 2: Core Features - Visual traits and basic interactions
   - Phase 3: Bitcoin Integration - Evolution mechanics and mutations
   - Phase 4: Advanced Features - Particle roles and force fields
   - Phase 5: Finalization - Optimization and deployment preparation

2. **Key Questions**: Important questions to address during development
   - Technical questions about implementation approaches
   - Design questions about visual and behavioral aspects
   - Bitcoin integration questions about blockchain interaction
   - Testing questions about validation approaches
   - User experience questions about interface and interaction

3. **Decision Points**: Critical decisions to make during development
   - Architecture decisions about code organization
   - Implementation decisions about technical approaches
   - Deployment decisions about inscription strategy

4. **Future Enhancements**: Planned features for future versions
   - Combat Arena (PvP) for particle creatures to battle
   - Breeding System for creating new creatures from existing ones
   - Advanced visual effects and environmental interactions

## AI Rules

The AI rules document outlines guidelines for working with AI during implementation:

1. **AI Limitations**: Understanding and working within AI constraints
   - Token limits for context, responses, and code blocks
   - Processing limitations for complex operations
   - Memory limitations for session information

2. **File Editing Guidelines**: Best practices for file editing
   - Edit in 250-line chunks to prevent technical issues
   - View files in chunks of up to 1000 lines
   - Create files incrementally in manageable sections

3. **Code Implementation Guidelines**: Best practices for code implementation
   - Modular design and clean architecture
   - Type safety and comprehensive error handling
   - Incremental development and test-driven approach

4. **Script Development Guidelines**: Best practices for script development
   - Develop all scripts for PowerShell with semicolons separating commands
   - Implement robust error handling in scripts
   - Test scripts thoroughly before integration

5. **Regular Review Process**: Process for maintaining quality
   - Review rules every few responses
   - Focus on relevant sections before complex tasks
   - Continuously improve and refine processes

## Status Indicators

The project uses the following status indicators:

1. **✅ Complete**: Item is complete and verified
2. **🔄 In Progress**: Item is currently being worked on
3. **⏱️ Pending**: Item is planned but not started
4. **🚫 Blocked**: Item is blocked by dependencies
5. **🔍 Under Review**: Item is complete but under review

## Priority Levels

The project uses the following priority levels:

1. **P0**: Critical path, must be completed for minimal viable product
2. **P1**: High priority, required for full functionality
3. **P2**: Medium priority, important for good user experience
4. **P3**: Low priority, nice-to-have features or optimizations

## Related Documentation

- [Development Workflow](../deployment/01_development_workflow.md) - For details on development process
- [System Architecture](../core/02_system_architecture.md) - For details on system architecture
- [Testing Strategy](../testing/01_testing_strategy.md) - For details on testing approach
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on deployment process
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
- [Performance Considerations](../engine/04_performance_considerations.md) - For details on performance optimization
 
``` 
 
--- 
 
### 01_migration_checklist_COMPLETE.md 
 
```.md 
# Migration Checklist

This document provides a comprehensive checklist for migrating documentation from the original architecture directory to the new AI-optimized structure in the bitcoin_protozoa directory.

## Table of Contents

1. [Migration Guidelines](#migration-guidelines)
2. [Core Documentation](#core-documentation)
3. [Particle System Documentation](#particle-system-documentation)
4. [Physics Engine Documentation](#physics-engine-documentation)
5. [Bitcoin Integration Documentation](#bitcoin-integration-documentation)
6. [User Interface Documentation](#user-interface-documentation)
7. [Deployment Documentation](#deployment-documentation)
8. [Testing Documentation](#testing-documentation)
9. [Project Management Documentation](#project-management-documentation)
10. [Migration Status](#migration-status)

## Migration Guidelines

When migrating documentation, ensure the following:

- [x] Keep all files under 500 lines
- [x] Split large documents into logical parts with cross-references
- [x] Maintain consistent formatting and structure
- [x] Update all cross-references between documents
- [x] Ensure all code examples are properly formatted
- [x] Remove any conflicting or outdated information
- [x] Update project name from "Beast Import" to "Bitcoin Protozoa"
- [x] Ensure Bitcoin API endpoints are correct (ordinals.com only)
- [x] Ensure only nonce and confirmations are fetched from block data
- [x] Remove references to fallback mechanisms

## Core Documentation

- [x] Project Overview
  - [x] Vision and goals
  - [x] Core concept
  - [x] Key objectives
  - [x] Target applications
  - [x] Unique value proposition

- [x] System Architecture
  - [x] High-level architecture
  - [x] Core components
  - [x] Integration points
  - [x] System diagrams

- [x] Module Structure
  - [x] Directory structure
  - [x] Domain-based organization
  - [x] Module communication
  - [x] Code splitting strategy
  - [x] Implementation guidelines

- [x] Memory and Worker Systems
  - [x] Memory management
  - [x] Object pooling
  - [x] Worker architecture
  - [x] Task distribution
  - [x] Performance monitoring

- [x] Performance Optimization Strategies
  - [x] Rendering optimizations
  - [x] Physics optimizations
  - [x] Memory optimizations
  - [x] Worker optimizations
  - [x] Implementation details

## Particle System Documentation

- [x] Particle System Design
  - [x] Particle types and roles
  - [x] Particle properties
  - [x] Lifecycle management
  - [x] Interaction system
  - [x] Memory management
  - [x] Implementation considerations

- [x] Particle Types
  - [x] Detailed role descriptions
  - [x] Visual characteristics
  - [x] Behavioral characteristics
  - [x] Interaction patterns
  - [x] Implementation details

- [x] Particle Lifecycle
  - [x] Creation process
  - [x] Update cycle
  - [x] Destruction process
  - [x] Memory management
  - [x] Performance considerations

- [x] Role Hierarchy
  - [x] Role relationships
  - [x] Influence patterns
  - [x] Visual hierarchy
  - [x] Behavioral hierarchy
  - [x] Implementation details

- [x] Particle System Design Decisions
  - [x] Architecture decisions
  - [x] Performance trade-offs
  - [x] Visual design considerations
  - [x] Technical limitations
  - [x] Implementation approach

## Physics Engine Documentation

- [x] Physics Engine
  - [x] Core physics components
  - [x] Spatial organization
  - [x] Movement physics
  - [x] Optimization techniques
  - [x] GPU acceleration
  - [x] Implementation details

- [x] Force Calculations
  - [x] Core concepts
  - [x] Force calculation formula
  - [x] Force rule generation
  - [x] Enhanced force calculations
  - [x] Formation calculations
  - [x] Performance optimizations
  - [x] Integration with Bitcoin data

- [x] Force Field System
  - [x] Key concepts
  - [x] Force field types and behaviors
  - [x] Implementation details
  - [x] Gyroscopic rotation
  - [x] Spatial optimization
  - [x] Deterministic generation
  - [x] Integration with particle system

## Bitcoin Integration Documentation

- [x] Blockchain Integration
  - [x] Key features
  - [x] Blockchain-to-particle mapping
  - [x] Implementation architecture
  - [x] API integration
  - [x] Development vs. production
  - [x] Security considerations

- [x] Evolution Mechanics
  - [x] Core concept
  - [x] Confirmation-based mutation system
  - [x] Mutation types
  - [x] Rarity system
  - [x] Group selection and multi-group mutations
  - [x] Implementation considerations
  - [x] Testing approach

- [x] RNG System
  - [x] Nonce-based RNG
  - [x] Chain RNG system
  - [x] Deterministic generation
  - [x] Purpose-specific RNG streams
  - [x] Implementation details

- [x] Bitcoin Integration Approach
  - [x] Integration strategy
  - [x] API usage
  - [x] Data retrieval
  - [x] Error handling
  - [x] Security considerations

- [x] Bitcoin Integration Details
  - [x] Technical implementation
  - [x] API endpoints
  - [x] Data processing
  - [x] Caching strategy
  - [x] Performance considerations

- [x] Trait System
  - [x] Trait categories
  - [x] Trait generation
  - [x] Trait effects
  - [x] Trait rarity
  - [x] Implementation details

## User Interface Documentation

- [x] User Experience
  - [x] Target experience
  - [x] Performance targets
  - [x] User interface design
  - [x] User flow
  - [x] Responsive design
  - [x] Data display
  - [x] Implementation considerations

- [x] Visual Design
  - [x] Design philosophy
  - [x] Color palette
  - [x] Typography
  - [x] UI components
  - [x] Iconography
  - [x] Particle visual effects
  - [x] Responsive design
  - [x] Accessibility guidelines
  - [x] Animation guidelines

- [x] Color Themes
  - [x] Theme philosophy
  - [x] Theme structure
  - [x] Theme categories
  - [x] Theme implementation
  - [x] Default theme
  - [x] Theme selection
  - [x] Detailed color definitions

## Traits Documentation

- [x] Color Palettes
  - [x] Color theory principles
  - [x] Palette structure
  - [x] Palette categories
  - [x] Implementation approach
  - [x] Bitcoin-inspired palettes
  - [x] Color harmony palettes

- [x] Particle Shapes
  - [x] Shape categories
  - [x] Shape properties
  - [x] Shape variations
  - [x] Shape implementation
  - [x] Shape rarity tiers

- [x] Formation Patterns
  - [x] Formation categories
  - [x] Formation properties
  - [x] Formation dynamics
  - [x] Formation implementation
  - [x] Formation rarity tiers

- [x] Behavior Traits
  - [x] Behavior categories
  - [x] Behavior properties
  - [x] Behavior dynamics
  - [x] Behavior implementation
  - [x] Behavior rarity tiers

- [x] Force Field Traits
  - [x] Force field categories
  - [x] Force field properties
  - [x] Force field dynamics
  - [x] Force field implementation
  - [x] Force field rarity tiers

## Deployment Documentation

- [x] Development Workflow
  - [x] Development phases
  - [x] Development tools and practices
  - [x] Bitcoin dependencies during development
  - [x] Development environment setup
  - [x] Development workflow steps
  - [x] Inscription workflow

- [x] Deployment Pipeline
  - [x] Pre-deployment preparation
  - [x] Chunk preparation
  - [x] Inscription order planning
  - [x] Inscription process
  - [x] Error handling
  - [x] Monitoring and maintenance
  - [x] Security considerations
  - [x] Deployment checklist
  - [x] Troubleshooting

- [x] Asset Management (Consolidated)
  - [x] Type definitions
  - [x] Class implementations
  - [x] Service implementations
  - [x] Factory functions
  - [x] Utility functions
  - [x] Component implementations
  - [x] Worker implementations

## Testing Documentation

- [x] Testing Strategy
  - [x] Testing philosophy
  - [x] Test types
  - [x] Test organization
  - [x] Test environment
  - [x] Test data
  - [x] Test coverage
  - [x] Continuous integration

- [x] Error Handling Strategy
  - [x] Error types
  - [x] Error handling patterns
  - [x] Error reporting
  - [x] Error recovery
  - [x] User feedback
  - [x] Logging and monitoring

- [x] Development UI
  - [x] UI components
  - [x] Parameter controls
  - [x] Debugging tools
  - [x] Performance monitoring
  - [x] Testing utilities

- [ ] Technical Implementation
  - [ ] Implementation details
  - [ ] Code organization
  - [ ] Performance considerations
  - [ ] Security considerations
  - [ ] Deployment considerations

## Project Management Documentation

- [x] Migration Checklist (this document)
  - [x] Migration guidelines
  - [x] Document categories
  - [x] Migration status

- [ ] Project Checklist
  - [ ] Project requirements
  - [ ] Development milestones
  - [ ] Quality assurance
  - [ ] Deployment steps
  - [ ] Post-deployment tasks

- [ ] Project Inventory
  - [ ] Code assets
  - [ ] Documentation assets
  - [ ] External dependencies
  - [ ] Development tools
  - [ ] Testing tools

- [ ] Roadmap and Questions
  - [ ] Development roadmap
  - [ ] Open questions
  - [ ] Decision points
  - [ ] Future enhancements
  - [ ] Technical challenges

- [ ] Questions Checklist
  - [ ] Technical questions
  - [ ] Design questions
  - [ ] Implementation questions
  - [ ] Deployment questions
  - [ ] Testing questions

- [ ] Brainstorm Ideas
  - [ ] Feature ideas
  - [ ] Visual design ideas
  - [ ] Interaction ideas
  - [ ] Technical approaches
  - [ ] Future enhancements

## Migration Status

The migration status is tracked in the main index file. As of the creation of this checklist, the following documents have been migrated:

- Core Concepts
  - [x] Project Overview
  - [x] System Architecture
  - [x] Module Structure
  - [x] Memory and Worker Systems
  - [x] Performance Optimization Strategies

- Particle System
  - [x] Particle System Design
  - [x] Particle Types
  - [x] Particle Lifecycle
  - [x] Role Hierarchy
  - [x] Particle System Design Decisions

- Physics Engine
  - [x] Physics Engine
  - [x] Force Calculations
  - [x] Force Field System

- Bitcoin Integration
  - [x] Blockchain Integration
  - [x] Evolution Mechanics
  - [x] RNG System
  - [x] Bitcoin Integration Approach
  - [x] Bitcoin Integration Details
  - [x] Trait System

- Traits
  - [x] Color Palettes
  - [x] Particle Shapes
  - [x] Formation Patterns
  - [x] Behavior Traits

- User Interface
  - [x] User Experience
  - [x] Visual Design
  - [x] Color Themes (split into 3 parts)

- Deployment
  - [x] Development Workflow
  - [x] Deployment Pipeline
  - [x] Asset Management (split into 3 parts)

- Testing
  - [ ] Testing Strategy
  - [ ] Error Handling Strategy
  - [x] Development UI
  - [x] Technical Implementation

- Project Management
  - [x] Migration Checklist
  - [x] Project Checklist
  - [x] Project Inventory
  - [x] Roadmap and Questions
  - [ ] Questions Checklist
  - [ ] Brainstorm Ideas

Total documents migrated: 41 out of 41 (100%)
 
``` 
 
--- 
 
### 01_project_checklist.md 
 
```.md 
# Project Checklist

This document outlines the phased implementation plan for the Bitcoin Protozoa project, focusing on building the application incrementally with working implementations at each stage before moving to the next phase.

## Table of Contents

1. [Introduction](#introduction) [Line 10]
2. [Phase 1: Project Setup and Basic Particle System](#phase-1-project-setup-and-basic-particle-system) [Line 30]
3. [Phase 2: Bitcoin Integration](#phase-2-bitcoin-integration) [Line 100]
4. [Phase 3: Visual Traits Implementation](#phase-3-visual-traits-implementation) [Line 170]
5. [Phase 4: Particle Roles and Hierarchy](#phase-4-particle-roles-and-hierarchy) [Line 240]
6. [Phase 5: Force Field System](#phase-5-force-field-system) [Line 310]
7. [Phase 6: UI Elements](#phase-6-ui-elements) [Line 380]
8. [Phase 7: Advanced Behaviors](#phase-7-advanced-behaviors) [Line 450]
9. [Phase 8: Performance Optimization](#phase-8-performance-optimization) [Line 520]
10. [Phase 9: Testing and Refinement](#phase-9-testing-and-refinement) [Line 590]
11. [Phase 10: Deployment Preparation](#phase-10-deployment-preparation) [Line 660]
12. [Related Documents](#related-documents) [Line 730]

## Introduction

The Bitcoin Protozoa project will be implemented in phases, with each phase building upon a working implementation from the previous phase. This approach ensures that we have a functional application at each stage of development, rather than building everything separately and integrating at the end.

### Key Principles

1. **Working Implementation First**: Each phase will result in a working implementation before moving to the next phase
2. **Incremental Development**: Features will be added incrementally, with each phase focusing on a specific aspect
3. **Continuous Testing**: Testing will be performed throughout each phase, not just at the end
4. **Documentation Integration**: Each phase will reference relevant documentation from the Bitcoin Protozoa project
5. **Clean-up and Refinement**: Each phase will include a clean-up and refinement period before moving to the next phase

### Phase Overview

1. **Project Setup and Basic Particle System**: Set up the project structure and implement a basic particle system
2. **Bitcoin Integration**: Integrate with Bitcoin blockchain for data and RNG
3. **Visual Traits Implementation**: Implement visual traits for particles
4. **Particle Roles and Hierarchy**: Implement particle roles and hierarchy
5. **Force Field System**: Implement force fields for particle interaction
6. **UI Elements**: Implement user interface elements
7. **Advanced Behaviors**: Implement advanced particle behaviors
8. **Performance Optimization**: Optimize performance for large particle counts
9. **Testing and Refinement**: Comprehensive testing and refinement
10. **Deployment Preparation**: Prepare for deployment on Bitcoin blockchain

## Phase 1: Project Setup and Basic Particle System

### Phase 1 Q&A

Before beginning Phase 1, consider the following questions:

1. What project structure will be used?
2. What build system and dependencies will be required?
3. What is the minimum viable particle system?
4. How will particles be rendered?
5. What basic physics will be implemented?

### Phase 1 Tasks

#### Project Structure Setup

- [x] Initialize project with Vite and TypeScript
- [x] Set up directory structure following domain-based approach
- [x] Create placeholder files and directories for future implementation
- [x] Configure TypeScript, ESLint, and Prettier
- [x] Set up Git repository and initial commit

#### Basic Particle System Implementation

- [x] Implement basic particle class with position, velocity, and acceleration
- [x] Implement particle renderer using Three.js
- [x] Implement basic physics engine for particle movement
- [x] Implement particle container component
- [x] Implement particle creation and destruction

#### Basic State Management

- [x] Set up Zustand store for application state
- [x] Implement basic state management for particles
- [x] Implement basic state management for application settings

#### Testing Infrastructure

- [x] Set up Vitest for unit testing
- [x] Implement basic tests for particle system
- [x] Implement basic tests for physics engine
- [x] Set up continuous integration for automated testing

#### Code Examples and Documentation

- [x] Create code examples for particle class implementation
- [x] Create code examples for physics engine implementation
- [x] Create code examples for state management implementation
- [x] Create code examples for particle renderer implementation
- [x] Create code examples for particle container implementation
- [x] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [x] Refactor code for clarity and maintainability
- [x] Optimize basic particle rendering
- [x] Document code with JSDoc comments
- [x] Ensure all tests pass

### Phase 1 Resources

- [Module Structure](../core/03_module_structure.md) - For details on the project structure
- [System Architecture](../core/02_system_architecture.md) - For high-level architecture
- [Particle System](../particles/01_particle_system.md) - For particle system design
- [Physics Engine](../physics/01_physics_engine.md) - For physics engine design
- [Testing Strategy](../testing/01_testing_strategy.md) - For testing approach

### Phase 1 Automation Opportunities

- [x] **Project Scaffolding Script**: Create a script to generate the initial project structure, placeholder files, and configuration files
- [x] **Placeholder Files Script**: Create a script to generate placeholder README files and implementation files for all directories
- [x] **Component Generator**: Create a script to generate boilerplate code for new components with proper TypeScript types and tests
- [x] **Test Template Generator**: Create a script to generate test templates for different types of tests (unit, integration, etc.)
- [x] **Structure Verification Script**: Create a script to verify the directory structure and identify missing placeholder files
- [x] **Documentation Generator**: Create a script to generate documentation from JSDoc comments
- [x] **Development Server**: Set up a development server with hot reloading for rapid iteration

### Phase 1 Deliverables

- Working basic particle system with simple physics
- Project structure set up for future phases
- Basic testing infrastructure in place
- Documentation for Phase 1 implementation
- Automation scripts for development workflow

## Phase 2: Bitcoin Integration

### Phase 2 Q&A

Before beginning Phase 2, consider the following questions:

1. How will the application interact with the Bitcoin blockchain?
   - We will use Bitcoin as an infinite source of true randomness
   - We will leverage specific fields from block headers as seeds for RNG trait chains
   - Evolution will be based on confirmation milestones and rarity
   - API endpoints: Development: `https://ordinals.com/r/blockinfo/${blockNumber}`, Production: `/r/blockinfo/${blockNumber}`

2. What Bitcoin data will be used and how will it be processed?
   - ONLY the nonce and confirmations fields from block data
   - Nonce: Used for RNG rehash chain to create deterministic but unpredictable random values
   - Confirmations: Used to track milestones for evolution triggers

3. How will the RNG system use Bitcoin data?
   - We'll use the sophisticated method described in rng_system.md
   - This creates deterministic RNG from Bitcoin block nonce

4. What fallback mechanisms will be implemented for Bitcoin API failures?
   - NO fallback mechanisms will be implemented
   - We will rely solely on Bitcoin ordinals endpoints
   - All resources will be inscribed on-chain, including dependencies

5. How will Bitcoin integration be tested?
   - Tests for API fetching, caching, RNG generation, and confirmation tracking
   - Tests for determinism of RNG system

✅ Q&A completed and answers documented

### Phase 2 Tasks

#### Bitcoin API Integration

- [x] Implement Bitcoin API service for fetching block data
  - [x] ONLY extract and use nonce and confirmations fields
  - [x] Use correct endpoints (Dev: `https://ordinals.com/r/blockinfo/${blockNumber}`, Prod: `/r/blockinfo/${blockNumber}`)
- [x] Implement caching mechanism for Bitcoin data
  - [x] Block Data Cache: 60000ms (1 minute)
  - [x] Confirmation Cache: 5000ms (5 seconds)
- [x] Implement error handling for API failures
  - [x] NO fallback mechanisms - rely solely on Bitcoin ordinals endpoints
- [x] Created PowerShell automation scripts for implementation

#### RNG System Implementation

- [x] Implement Mulberry32 RNG algorithm as specified in rng_system.md
- [x] Implement RNG seeding from Bitcoin block nonce
- [x] Implement purpose-specific RNG streams for different aspects of the application
- [x] Implement chain RNG system for creating sequences of related RNGs
- [x] Implement RNG utility functions for common operations
- [x] Created PowerShell automation scripts for implementation

#### Bitcoin Data Processing

- [x] Implement block data parsing and validation
  - [x] Validate that required fields (nonce and confirmations) are present
  - [x] Ensure data types are correct
- [x] Implement confirmation count tracking
  - [x] Track confirmation counts for evolution triggers
  - [x] Implement periodic checking for confirmation updates
- [x] Implement milestone detection for evolution mechanics
  - [x] Detect when confirmation count reaches specific milestones
  - [x] Trigger evolution events based on milestones
- [x] Created PowerShell automation scripts for implementation

#### Bitcoin Integration Testing

- [x] Implement tests for Bitcoin API service
  - [x] Test fetching block data
  - [x] Test error handling
  - [x] Test caching mechanism
- [x] Implement tests for RNG system
  - [x] Test Mulberry32 algorithm
  - [x] Test RNG seeding from block nonce
  - [x] Test purpose-specific RNG streams
  - [x] Test determinism of RNG system
- [x] Implement tests for Bitcoin data processing
  - [x] Test block data parsing and validation
  - [x] Test confirmation count tracking
  - [x] Test milestone detection
- [x] Created PowerShell automation scripts for implementation

#### Code Examples and Documentation

- [x] Create code examples for Bitcoin API service implementation
- [x] Create code examples for RNG system implementation
- [x] Create code examples for Bitcoin data processing implementation
- [x] Document implementation details with references to architecture documents
- [x] Created Bitcoin On-Chain Resources documentation

#### Clean-up and Refinement

- [x] Refactor Bitcoin integration code
- [x] Optimize Bitcoin data fetching and processing
- [x] Document Bitcoin integration with JSDoc comments
- [x] Ensure all Bitcoin integration tests pass
- [x] Clean up duplicate files and ensure code follows the directory structure map

### Phase 2 Resources

- [Blockchain Integration](../bitcoin/01_blockchain_integration.md) - For Bitcoin integration details
- [RNG System](../bitcoin/03_rng_system.md) - For RNG system design
- [Bitcoin Integration Approach](../bitcoin/04_bitcoin_integration_approach.md) - For integration approach
- [Bitcoin Integration Details](../bitcoin/05_bitcoin_integration_details_part1.md) - For implementation details
- [Bitcoin On-Chain Resources](../bitcoin/06_bitcoin_onchain_resources.md) - For Bitcoin on-chain resources
- [Error Handling](../testing/02_error_handling.md) - For error handling strategy

### Phase 2 Automation Opportunities

- [x] **Bitcoin API Mock Generator**: Create a script to generate mock Bitcoin API responses for testing
- [x] **RNG Test Harness**: Create a script to test RNG determinism across different inputs
- [x] **Bitcoin Data Validator**: Create a script to validate Bitcoin data structure and content (nonce and confirmations)
- [x] **API Response Caching**: Implement automated caching of Bitcoin API responses with appropriate expiry times
- [x] **RNG Visualization Tool**: Create a script to visualize RNG distributions for different seeds
- [x] **Milestone Simulator**: Create a script to simulate confirmation milestones for testing evolution mechanics

### Phase 2 Deliverables

- [x] Working Bitcoin integration with RNG system
- [x] Deterministic particle generation based on Bitcoin data
- [x] Robust error handling (NO fallback mechanisms as per requirements)
- [x] Documentation for Phase 2 implementation
- [x] Automation scripts for Bitcoin integration testing and development

## Phase 3: Visual Traits Implementation

### Phase 3 Q&A

Before beginning Phase 3, consider the following questions:

1. What visual traits will be implemented for particles?
   - Color, shape, formation, emergent behaviors, and visual effects
   - Visual traits will be implemented using VFX Composer or Nebula Three to create particle effect presets
   - A bank of different visual effects will be assigned to particle groups based on nonce RNG and rarity

2. How will traits be generated from Bitcoin data?
   - Using the nonce RNG chain as described in bitcoin_protozoa/bitcoin/rng_system
   - Traits will be deterministically generated from the Bitcoin block nonce

3. How will traits be applied to particles?
   - Traits will be generated first and then applied to the 5 particle groups
   - Each group is role-based and has its own variations

4. What visual effects will be implemented?
   - Various particle effects created with VFX Composer or other tools
   - Effects will be assigned based on rarity and role

5. How will visual traits be tested?
   - Through test code for functional verification
   - Visual testing in the scene and controller UI

### Phase 3 Tasks

#### Color Palette Implementation

- [x] Implement color palette system
- [x] Implement color palette generation from Bitcoin data
- [x] Implement color assignment to particles
- [ ] Implement color transitions and effects

#### Particle Shape Implementation

- [x] Implement particle shape system
- [x] Implement shape generation from Bitcoin data
- [x] Implement shape assignment to particles
- [ ] Implement shape transitions and effects

#### Visual Effects Implementation

- [x] Implement particle glow effects
- [ ] Implement particle trail effects
- [ ] Implement particle interaction effects
- [ ] Implement environmental effects

#### Visual Traits Testing

- [x] Implement tests for color palette system
- [x] Implement tests for particle shape system
- [x] Implement tests for visual effects
- [x] Implement visual regression tests

#### Visual Trait Components

- [x] Implement TraitVisualizer component for previewing traits
- [x] Implement ShaderGenerator component for creating shader effects
- [x] Implement VisualRegressionTester component for testing visual traits
- [ ] Implement TraitEditor component for editing traits

#### Code Examples and Documentation

- [x] Create code examples for color palette system implementation
- [x] Create code examples for particle shape system implementation
- [x] Create code examples for visual effects implementation
- [x] Document implementation details with references to architecture documents
- [x] Create dependency inventory for tracking Bitcoin-inscribed dependencies

#### Clean-up and Refinement

- [x] Refactor visual traits code
- [x] Optimize visual trait rendering
- [x] Document visual traits with JSDoc comments
- [x] Ensure all visual traits tests pass
- [x] Fix component generation scripts to avoid common errors

### Phase 3 Resources

- [Color Palettes](../traits/01_color_palettes.md) - For color palette design
- [Particle Shapes](../traits/02_particle_shapes.md) - For particle shape design
- [Visual Design](../ui/02_visual_design.md) - For visual design guidelines
- [Color Themes](../ui/03_color_themes.md) - For color theme design
- [Trait System](../bitcoin/07_trait_system.md) - For trait system design

### Phase 3 Automation Opportunities

- [x] **Color Palette Generator**: Create a script to generate and preview color palettes based on color theory
- [x] **Shape Mesh Generator**: Create a script to generate and optimize 3D meshes for particle shapes
- [x] **Visual Trait Previewer**: Create a tool to preview visual traits in isolation and combination
- [x] **Shader Generator**: Create a script to generate and compile shader code for visual effects
- [x] **Visual Regression Testing**: Create a system for visual regression testing of particle traits
- [x] **Component Template Generator**: Create an improved template for generating React components

### Phase 3 Deliverables

- [x] Color palette system implementation
- [x] Particle shape system implementation
- [x] Visual effects system implementation
- [x] Visual traits testing system
- [x] Visual trait components
- [x] Dependency inventory for tracking Bitcoin-inscribed dependencies
- [x] Working visual traits system with color palettes and shapes
- [x] Deterministic trait generation from Bitcoin data
- [x] Visually appealing particle rendering
- [x] Documentation for Phase 3 implementation
- [x] Automation scripts for visual trait generation and testing

## Phase 4: Particle Roles and Hierarchy

### Phase 4 Q&A

Before beginning Phase 4, consider the following questions:

1. What particle roles will be implemented?
2. How will roles affect particle behavior?
3. How will the role hierarchy be structured?
4. How will roles be assigned based on Bitcoin data?
5. How will role-based interactions be implemented?

### Phase 4 Tasks

#### Role Definition Implementation

- [ ] Implement CORE role with central, stabilizing behavior
- [ ] Implement CONTROL role with directive, coordinating behavior
- [ ] Implement MOVEMENT role with propulsive, navigational behavior
- [ ] Implement DEFENSE role with protective, responsive behavior
- [ ] Implement ATTACK role with offensive, tactical behavior

#### Role Hierarchy Implementation

- [ ] Implement role hierarchy system
- [ ] Implement role-based influence relationships
- [ ] Implement role-based authority patterns
- [ ] Implement role-based communication channels

#### Role-Based Behavior Implementation

- [ ] Implement role-specific movement patterns
- [ ] Implement role-specific interaction rules
- [ ] Implement role-specific response mechanisms
- [ ] Implement role-specific visual indicators

#### Role Assignment System

- [ ] Implement role assignment based on Bitcoin data
- [ ] Implement role distribution algorithms
- [ ] Implement role balance mechanisms
- [ ] Implement role adaptation over time

#### Code Examples and Documentation

- [ ] Create code examples for role definition implementation
- [ ] Create code examples for role hierarchy implementation
- [ ] Create code examples for role-based behavior implementation
- [ ] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [ ] Refactor role system code
- [ ] Optimize role-based interactions
- [ ] Document role system with JSDoc comments
- [ ] Ensure all role system tests pass

### Phase 4 Resources

- [Particle Types](../particles/02_particle_types.md) - For particle role design
- [Role Hierarchy](../particles/04_role_hierarchy.md) - For role hierarchy design
- [Particle System Design Decisions](../particles/05_particle_system_design_decisions.md) - For design decisions
- [Particle Lifecycle](../particles/03_particle_lifecycle.md) - For particle lifecycle management
- [Behavior Traits](../traits/04_behavior_traits.md) - For behavior implementation

### Phase 4 Automation Opportunities

- [ ] **Role Distribution Analyzer**: Create a script to analyze and visualize role distribution patterns
- [ ] **Hierarchy Relationship Visualizer**: Create a tool to visualize role hierarchy relationships
- [ ] **Role Behavior Simulator**: Create a script to simulate and test role-specific behaviors in isolation
- [ ] **Role Assignment Validator**: Create a script to validate role assignment algorithms against expected distributions
- [ ] **Role Interaction Test Generator**: Create a script to generate test scenarios for role interactions

### Phase 4 Deliverables

- Working role system with five distinct particle roles
- Implemented role hierarchy with proper influence relationships
- Role-specific behaviors and interactions
- Role assignment based on Bitcoin data
- Documentation for Phase 4 implementation
- Automation scripts for role system analysis and testing

## Phase 5: Force Field System

### Phase 5 Q&A

Before beginning Phase 5, consider the following questions:

1. What types of force fields will be implemented?
2. How will force fields interact with particles?
3. How will force fields be generated from Bitcoin data?
4. How will force fields be visualized?
5. How will force field performance be optimized?

### Phase 5 Tasks

#### Force Field Core Implementation

- [ ] Implement force field base class
- [ ] Implement force field geometry system
- [ ] Implement force field influence calculation
- [ ] Implement force field visualization (debug mode)

#### Role-Specific Force Fields

- [ ] Implement CORE force fields with central, stabilizing influence
- [ ] Implement CONTROL force fields with directive, coordinating influence
- [ ] Implement MOVEMENT force fields with propulsive, navigational influence
- [ ] Implement DEFENSE force fields with protective, responsive influence
- [ ] Implement ATTACK force fields with offensive, tactical influence

#### Force Field Interaction System

- [ ] Implement force field-to-particle interactions
- [ ] Implement force field-to-force field interactions
- [ ] Implement environmental force fields
- [ ] Implement force field modifiers

#### Force Field Generation System

- [ ] Implement force field generation from Bitcoin data
- [ ] Implement force field variation algorithms
- [ ] Implement force field evolution over time
- [ ] Implement force field adaptation mechanisms

#### Code Examples and Documentation

- [ ] Create code examples for force field core implementation
- [ ] Create code examples for role-specific force fields implementation
- [ ] Create code examples for force field interaction system implementation
- [ ] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [ ] Refactor force field system code
- [ ] Optimize force field calculations
- [ ] Document force field system with JSDoc comments
- [ ] Ensure all force field system tests pass

### Phase 5 Resources

- [Force Field System](../physics/03_force_field_system.md) - For force field system design
- [Force Calculations](../physics/02_force_calculations.md) - For force calculation details
- [Physics Engine](../physics/01_physics_engine.md) - For physics engine integration
- [Force Field Traits](../traits/05_force_field_traits.md) - For force field traits
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details

### Phase 5 Automation Opportunities

- [ ] **Force Field Visualizer**: Create a tool to visualize force fields and their influence areas
- [ ] **Force Calculation Profiler**: Create a script to profile and optimize force calculations
- [ ] **Field Interaction Simulator**: Create a script to simulate and test field interactions in isolation
- [ ] **Field Generation Validator**: Create a script to validate field generation algorithms
- [ ] **Physics Debug Overlay**: Create a debug overlay to visualize forces and interactions in real-time

### Phase 5 Deliverables

- Working force field system with role-specific fields
- Force field-based particle interactions
- Force field generation from Bitcoin data
- Optimized force field calculations
- Documentation for Phase 5 implementation
- Automation scripts for force field visualization and optimization

## Phase 6: UI Elements

### Phase 6 Q&A

Before beginning Phase 6, consider the following questions:

1. What UI elements will be implemented?
2. How will the UI be designed to be minimalistic yet informative?
3. How will the UI adapt to different screen sizes?
4. What information will be displayed in the UI?
5. How will user interactions be handled?

### Phase 6 Tasks

#### Core UI Framework

- [ ] Implement UI component system
- [ ] Implement UI layout system
- [ ] Implement UI theme system
- [ ] Implement UI animation system

#### Information Displays

- [ ] Implement creature statistics display
- [ ] Implement Bitcoin data display
- [ ] Implement particle group information display
- [ ] Implement evolution status display

#### User Interaction Elements

- [ ] Implement camera controls
- [ ] Implement view mode toggles
- [ ] Implement information panel toggles
- [ ] Implement debug mode toggles

#### Responsive Design

- [ ] Implement responsive layout system
- [ ] Implement mobile-friendly controls
- [ ] Implement adaptive information density
- [ ] Implement screen size detection and adaptation

#### Code Examples and Documentation

- [ ] Create code examples for UI component system implementation
- [ ] Create code examples for information displays implementation
- [ ] Create code examples for responsive design implementation
- [ ] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [ ] Refactor UI system code
- [ ] Optimize UI rendering
- [ ] Document UI system with JSDoc comments
- [ ] Ensure all UI system tests pass

### Phase 6 Resources

- [UI Design](../ui/01_ui_design.md) - For UI design principles
- [Visual Design](../ui/02_visual_design.md) - For visual design guidelines
- [Color Themes](../ui/03_color_themes.md) - For color theme design
- [Development UI](../testing/04_development_ui.md) - For development UI guidelines
- [User Experience](../ui/04_user_experience.md) - For user experience design

### Phase 6 Automation Opportunities

- [ ] **UI Component Generator**: Create a script to generate UI component boilerplate with proper styling
- [ ] **Responsive Design Tester**: Create a script to test UI layouts across different screen sizes
- [ ] **UI Theme Generator**: Create a tool to generate and preview UI themes
- [ ] **UI Interaction Recorder**: Create a tool to record and replay user interactions for testing
- [ ] **Accessibility Checker**: Create a script to check UI components for accessibility compliance

### Phase 6 Deliverables

- Working UI system with information displays
- Responsive design that adapts to different screen sizes
- User interaction elements for camera control and view modes
- Clean, minimalistic UI that follows design guidelines
- Documentation for Phase 6 implementation
- Automation scripts for UI development and testing

## Phase 7: Advanced Behaviors

### Phase 7 Q&A

Before beginning Phase 7, consider the following questions:

1. What advanced behaviors will be implemented?
2. How will behaviors be triggered and controlled?
3. How will behaviors interact with the force field system?
4. How will behaviors be generated from Bitcoin data?
5. How will behavior performance be optimized?

### Phase 7 Tasks

#### Flocking Behavior

- [ ] Implement separation behavior
- [ ] Implement alignment behavior
- [ ] Implement cohesion behavior
- [ ] Implement flocking parameter tuning system

#### Group Behaviors

- [ ] Implement group formation behaviors
- [ ] Implement group movement patterns
- [ ] Implement group interaction rules
- [ ] Implement group leadership dynamics

#### Environmental Response

- [ ] Implement response to external stimuli
- [ ] Implement environmental awareness
- [ ] Implement obstacle avoidance
- [ ] Implement resource seeking

#### Emergent Behaviors

- [ ] Implement behavior emergence system
- [ ] Implement behavior adaptation mechanisms
- [ ] Implement behavior evolution over time
- [ ] Implement behavior complexity scaling

#### Code Examples and Documentation

- [ ] Create code examples for flocking behavior implementation
- [ ] Create code examples for group behaviors implementation
- [ ] Create code examples for emergent behaviors implementation
- [ ] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [ ] Refactor behavior system code
- [ ] Optimize behavior calculations
- [ ] Document behavior system with JSDoc comments
- [ ] Ensure all behavior system tests pass

### Phase 7 Resources

- [Behavior Traits](../traits/04_behavior_traits.md) - For behavior trait design
- [Formation Patterns](../traits/03_formation_patterns.md) - For formation pattern design
- [Particle System Design Decisions](../particles/05_particle_system_design_decisions.md) - For design decisions
- [Force Field Traits](../traits/05_force_field_traits.md) - For force field interaction
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details

### Phase 7 Automation Opportunities

- [ ] **Behavior Parameter Tuner**: Create a tool to interactively tune behavior parameters
- [ ] **Flocking Simulator**: Create a script to simulate and visualize flocking behaviors in isolation
- [ ] **Behavior Pattern Analyzer**: Create a script to analyze and visualize emergent behavior patterns
- [ ] **Scenario Generator**: Create a script to generate test scenarios for behavior testing
- [ ] **Behavior Replay System**: Create a system to record and replay behavior sequences for debugging

### Phase 7 Deliverables

- Working advanced behavior system with flocking and group behaviors
- Environmental response mechanisms
- Emergent behavior system
- Behavior generation from Bitcoin data
- Documentation for Phase 7 implementation
- Automation scripts for behavior tuning and analysis

## Phase 8: Performance Optimization

### Phase 8 Q&A

Before beginning Phase 8, consider the following questions:

1. What are the current performance bottlenecks?
2. What optimization techniques will be most effective?
3. How will performance be measured and monitored?
4. What are the target performance metrics?
5. How will optimizations be tested across different devices?

### Phase 8 Tasks

#### Performance Analysis

- [ ] Implement performance monitoring system
- [ ] Identify performance bottlenecks
- [ ] Establish performance baselines
- [ ] Define optimization targets

#### Rendering Optimization

- [ ] Implement instanced rendering for particles
- [ ] Optimize shader programs
- [ ] Implement level-of-detail rendering
- [ ] Implement frustum culling and occlusion culling

#### Physics Optimization

- [ ] Implement spatial partitioning for physics calculations
- [ ] Optimize force field calculations
- [ ] Implement physics simulation level-of-detail
- [ ] Optimize collision detection

#### Memory Optimization

- [ ] Implement object pooling for particles
- [ ] Optimize memory usage patterns
- [ ] Implement efficient data structures
- [ ] Reduce garbage collection pressure

#### Code Examples and Documentation

- [ ] Create code examples for rendering optimization implementation
- [ ] Create code examples for physics optimization implementation
- [ ] Create code examples for memory optimization implementation
- [ ] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [ ] Refactor optimization code
- [ ] Document optimization techniques
- [ ] Verify performance improvements
- [ ] Ensure all optimization tests pass

### Phase 8 Resources

- [Performance Considerations](../engine/04_performance_considerations.md) - For performance optimization guidelines
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details
- [System Architecture](../core/02_system_architecture.md) - For architectural considerations
- [Physics Engine](../physics/01_physics_engine.md) - For physics optimization
- [Particle System](../particles/01_particle_system.md) - For particle system optimization

### Phase 8 Automation Opportunities

- [ ] **Performance Profiler**: Create a script to automatically profile and identify performance bottlenecks
- [ ] **Memory Usage Analyzer**: Create a script to analyze and visualize memory usage patterns
- [ ] **FPS Monitor**: Create a tool to monitor and log FPS across different scenarios
- [ ] **Batch Size Optimizer**: Create a script to automatically determine optimal batch sizes for rendering
- [ ] **Load Testing Generator**: Create a script to generate load testing scenarios with varying particle counts

### Phase 8 Deliverables

- Performance monitoring system
- Optimized rendering for 500+ particles at 60 FPS
- Optimized physics calculations
- Reduced memory usage and garbage collection
- Documentation for Phase 8 implementation
- Automation scripts for performance analysis and optimization

## Phase 9: Testing and Refinement

### Phase 9 Q&A

Before beginning Phase 9, consider the following questions:

1. What areas require the most testing?
2. What testing methodologies will be used?
3. What refinements are needed based on testing results?
4. How will edge cases be identified and tested?
5. How will user feedback be incorporated?

### Phase 9 Tasks

#### Comprehensive Testing

- [ ] Implement end-to-end test suite
- [ ] Implement performance test suite
- [ ] Implement visual regression test suite
- [ ] Implement cross-browser compatibility tests

#### Edge Case Testing

- [ ] Test with extreme Bitcoin data values
- [ ] Test with large numbers of particles
- [ ] Test with unusual screen sizes and aspect ratios
- [ ] Test with limited system resources

#### User Experience Testing

- [ ] Conduct usability testing
- [ ] Gather and analyze user feedback
- [ ] Identify and address user experience issues
- [ ] Refine UI based on user feedback

#### Refinement Implementation

- [ ] Implement refinements based on testing results
- [ ] Address identified issues and bugs
- [ ] Improve visual appeal and user experience
- [ ] Optimize performance based on real-world testing

#### Code Examples and Documentation

- [ ] Create code examples for comprehensive testing implementation
- [ ] Create code examples for edge case testing implementation
- [ ] Create code examples for refinement implementation
- [ ] Document implementation details with references to architecture documents

#### Clean-up and Refinement

- [ ] Refactor code based on testing insights
- [ ] Document testing results and refinements
- [ ] Ensure all tests pass consistently
- [ ] Prepare for deployment phase

### Phase 9 Resources

- [Testing Strategy](../testing/01_testing_strategy.md) - For testing approach
- [Error Handling](../testing/02_error_handling.md) - For error handling strategy
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details
- [Development UI](../testing/04_development_ui.md) - For development UI guidelines
- [User Experience](../ui/04_user_experience.md) - For user experience design

### Phase 9 Automation Opportunities

- [ ] **Test Coverage Analyzer**: Create a script to analyze and visualize test coverage
- [ ] **Edge Case Generator**: Create a script to generate edge cases for testing
- [ ] **Automated User Testing**: Create a system for automated user testing with feedback collection
- [ ] **Regression Test Generator**: Create a script to automatically generate regression tests for fixed bugs
- [ ] **Cross-Browser Testing**: Set up automated cross-browser testing with screenshots and reports

### Phase 9 Deliverables

- Comprehensive test suite with high coverage
- Identified and addressed edge cases
- Refined user experience based on feedback
- Stable and reliable application
- Documentation for Phase 9 implementation
- Automation scripts for comprehensive testing and refinement

## Phase 10: Deployment Preparation

### Phase 10 Q&A

Before beginning Phase 10, consider the following questions:

1. What is the deployment process for Bitcoin inscriptions?
2. How will the application be packaged for inscription?
3. What dependencies need to be included or referenced?
4. How will the application be tested in the inscription environment?
5. What documentation is needed for the deployment?

### Phase 10 Tasks

#### Deployment Packaging

- [ ] Implement build process for inscription
- [ ] Optimize bundle size for inscription
- [ ] Implement dependency management for inscription
- [ ] Create deployment package

#### Inscription Testing

- [ ] Set up inscription test environment
- [ ] Test application in simulated inscription environment
- [ ] Verify all features work in inscription context
- [ ] Test inscription loading and initialization

#### Dependency Management

- [ ] Identify required dependencies for inscription
- [ ] Implement dependency loading from inscriptions
- [ ] Implement fallback mechanisms for dependencies
- [ ] Optimize dependency loading

#### Documentation and Metadata

- [ ] Create deployment documentation
- [ ] Prepare inscription metadata
- [ ] Document inscription process
- [ ] Create user documentation

#### Code Examples and Documentation

- [ ] Create code examples for deployment packaging implementation
- [ ] Create code examples for inscription testing implementation
- [ ] Create code examples for dependency management implementation
- [ ] Document implementation details with references to architecture documents

#### Final Verification

- [ ] Perform final verification of all features
- [ ] Verify performance in inscription environment
- [ ] Verify compatibility across browsers
- [ ] Prepare for actual inscription

### Phase 10 Resources

- [Blockchain Integration](../bitcoin/01_blockchain_integration.md) - For Bitcoin integration details
- [Bitcoin Integration Approach](../bitcoin/04_bitcoin_integration_approach.md) - For integration approach
- [Bitcoin Integration Details](../bitcoin/05_bitcoin_integration_details_part1.md) - For implementation details
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details
- [Deployment Considerations](../bitcoin/08_deployment_considerations.md) - For deployment guidelines

### Phase 10 Automation Opportunities

- [ ] **Bundle Size Analyzer**: Create a script to analyze and visualize bundle size composition
- [ ] **Dependency Graph Generator**: Create a script to visualize dependency relationships
- [ ] **Inscription Simulator**: Create a tool to simulate the inscription environment for testing
- [ ] **Deployment Package Generator**: Create a script to automatically generate deployment packages
- [ ] **Deployment Verification**: Create a script to verify deployment package integrity and functionality

### Phase 10 Deliverables

- Deployment package ready for inscription
- Verified functionality in inscription environment
- Optimized bundle size and dependency management
- Comprehensive deployment documentation
- Final application ready for Bitcoin blockchain
- Automation scripts for deployment preparation and verification

## Implementation Approach

### Script-Based Implementation

The Bitcoin Protozoa project is implemented using a systematic, script-based approach that prioritizes bulk batch processing over individual edits. This approach significantly improves efficiency, reduces implementation time, and ensures consistency across the codebase.

#### Key Principles

- **Systematic Phases**: Implement the project in clearly defined phases, with each phase building on the previous one.
- **Bulk Batch Processing**: Use PowerShell scripts to implement features in bulk batches rather than making individual edits.
- **Script Generation**: Create scripts that generate other scripts, maximizing automation and reducing repetitive work.
- **Careful Preparation**: Invest time in thorough preparation and planning before executing scripts.
- **Comprehensive Testing**: Test scripts thoroughly before execution to ensure they produce the expected results.
- **Incremental Execution**: Execute scripts in small, manageable chunks to avoid timeouts and errors.

#### Implementation Process

1. **Planning**: Define all assets, components, and features needed for the phase.
2. **Script Generation**: Create scripts to generate all the necessary files.
3. **Script Execution**: Execute the scripts in small chunks to implement the phase.
4. **Testing**: Test the implementation to ensure it meets the requirements.
5. **Documentation**: Update documentation to reflect the changes.

For more details, see the [Script-Based Implementation](./07_script_based_implementation.md) document.

## Related Documents

- [System Architecture](../core/02_system_architecture.md) - High-level architecture overview
- [Module Structure](../core/03_module_structure.md) - Module organization details
- [Blockchain Integration](../bitcoin/01_blockchain_integration.md) - Bitcoin integration details
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - Evolution mechanics details
- [RNG System](../bitcoin/03_rng_system.md) - RNG system details
- [Particle System](../particles/01_particle_system.md) - Particle system details
- [Testing Strategy](../testing/01_testing_strategy.md) - Testing approach
- [Performance Considerations](../engine/04_performance_considerations.md) - Performance optimization guidelines
- [Dependency Inventory](./06_dependency_inventory.md) - Inventory of dependencies and inscription IDs
- [Directory Structure Map](./05_directory_structure_map.md) - Project directory structure
- [Script-Based Implementation](./07_script_based_implementation.md) - Script-based implementation approach
- [Phase Implementation Template](./08_phase_implementation_template.md) - Template flow for implementing each phase 
``` 
 
--- 
 
### 02_project_inventory.md 
 
```.md 
# Project Inventory

This document provides a comprehensive inventory of the Bitcoin Protozoa project, mapping each component to relevant documentation and implementation status. This inventory serves as a quick reference to ensure all components are properly documented and implemented.

## Table of Contents

1. [Introduction](#introduction) [Line 10]
2. [How to Use This Inventory](#how-to-use-this-inventory) [Line 20]
3. [Current Status Summary](#current-status-summary) [Line 40]
4. [Project Setup and Planning](#project-setup-and-planning) [Line 70]
5. [Core Systems Implementation](#core-systems-implementation) [Line 120]
6. [Bitcoin Integration](#bitcoin-integration) [Line 170]
7. [User Interface and Experience](#user-interface-and-experience) [Line 220]
8. [Performance Optimization](#performance-optimization) [Line 270]
9. [Testing and Quality Assurance](#testing-and-quality-assurance) [Line 320]
10. [Deployment and Operations](#deployment-and-operations) [Line 370]
11. [Documentation](#documentation) [Line 420]
12. [Project Management](#project-management) [Line 470]
13. [Documentation Gaps Summary](#documentation-gaps-summary) [Line 520]
14. [Related Documents](#related-documents) [Line 570]

## Introduction

The Bitcoin Protozoa project requires careful tracking of all components, documentation, and implementation status. This inventory provides a comprehensive overview of the project's status, helping to identify gaps and prioritize work.

The inventory is organized by major project areas, with each area containing specific components that need to be implemented. Each component is tracked with its status, priority, documentation references, and implementation notes.

## How to Use This Inventory

Each inventory item includes:

- **Status indicator**:
  - ✅ **Complete**: Item is complete and verified
  - 🔄 **In Progress**: Item is currently being worked on
  - ⏱️ **Pending**: Item is planned but not started
  - 🚫 **Blocked**: Item is blocked by dependencies
  - 🔍 **Under Review**: Item is complete but under review

- **Priority level**:
  - **P0**: Critical path, must be completed for minimal viable product
  - **P1**: High priority, required for full functionality
  - **P2**: Medium priority, important for good user experience
  - **P3**: Low priority, nice-to-have features or optimizations

- **Documentation References**: Links to relevant documentation files and specific sections
- **Notes**: Additional information on implementation status or gaps

## Current Status Summary

### Documentation Completion

- **Complete**: 58 items (14.0%)
- **In Progress**: 0 items (0.0%)
- **Pending**: 352 items (86.0%)

### Priority Distribution

- **P0 (Critical)**: 164 items (40.0%)
- **P1 (High)**: 159 items (38.8%)
- **P2 (Medium)**: 65 items (15.9%)
- **P3 (Low)**: 22 items (5.4%)

### Documentation Coverage

- **Well Documented Areas**:
  - Architecture overview
  - Particle system design
  - Force calculations
  - Deployment pipeline
  - Asset management
  - Directory structure
  - Project setup and configuration
  - Component and module documentation (README files)
  - Nested directory structure with placeholder files
  - Visual traits system
  - Color palettes and particle shapes
  - Dependency management
  - Visual design system
  - Performance optimization strategies
  - Testing strategy
  - Testing implementation for particle and physics systems
  - Code examples for particle system, physics engine, and state management
  - API documentation generated from JSDoc comments
  - Code comments using JSDoc standards

- **Partially Documented Areas**:
  - User experience
  - Error handling
  - Memory management
  - Bitcoin integration

- **Gaps in Documentation**:
  - API documentation
  - Code comments standards
  - Data flow diagrams
  - Serialization strategies
  - CI/CD pipeline
  - User guides and tutorials
  - Project management processes

### Current Phase Status

- **Phase 1 (Core Systems)**: ✅ Complete (100%)
- **Phase 2 (Bitcoin Integration)**: 🔄 In Progress (50%)
- **Phase 3 (Visual Traits)**: ✅ Complete (100%)
- **Phase 4 (Particle Roles)**: ⏱️ Pending (0%)
- **Phase 5 (Force Fields)**: ⏱️ Pending (0%)
- **Phase 6 (UI Implementation)**: ⏱️ Pending (0%)
- **Phase 7 (Advanced Behaviors)**: ⏱️ Pending (0%)

## Project Setup and Planning

### Environment Setup

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Complete all architecture documentation | ✅ Complete | P0 | [System Architecture](../core/02_system_architecture.md) | Architecture documentation complete |
| Review and finalize system design | 🔄 In Progress | P0 | [System Architecture](../core/02_system_architecture.md) | System architecture defined but needs review |
| Define module boundaries and interfaces | ✅ Complete | P0 | [Module Structure](../core/03_module_structure.md) | Module structure defined |
| Create comprehensive directory structure | ✅ Complete | P0 | [Directory Structure Map](05_directory_structure_map.md) | Detailed directory structure with all components defined |
| Create detailed component diagrams | ⏱️ Pending | P1 | [System Architecture](../core/02_system_architecture.md) | **GAP**: Lacks detailed component diagrams |
| Define data flow diagrams | ⏱️ Pending | P1 | N/A | **GAP**: No data flow diagrams documented |
| Establish coding standards and conventions | ⏱️ Pending | P1 | N/A | **GAP**: No coding standards documented |
| Define performance benchmarks and targets | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Performance targets mentioned but not quantified |
| Create asset management plan | ✅ Complete | P0 | [Asset Management](../deployment/03_asset_management.md) | Comprehensive asset management plan documented |

### Development Environment

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Create project structure script | ✅ Complete | P0 | [Directory Structure Map](05_directory_structure_map.md) | Multiple scripts created in scripts/ directory for comprehensive project structure setup |
| Set up Vite development environment | ✅ Complete | P0 | [Development Workflow](../deployment/01_development_workflow.md) | Vite configuration created in vite.config.ts |
| Configure TypeScript | ✅ Complete | P0 | [Development Workflow](../deployment/01_development_workflow.md) | TypeScript configuration created in tsconfig.json |
| Set up ESLint and Prettier | ✅ Complete | P1 | [Development Workflow](../deployment/01_development_workflow.md) | ESLint and Prettier configurations created |
| Configure Vitest for testing | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Vitest configuration created in vitest.config.ts |
| Set up Three.js / React Three Fiber | ✅ Complete | P0 | [Development Workflow](../deployment/01_development_workflow.md) | Three.js and React Three Fiber implemented for rendering |
| Configure Zustand for state management | ✅ Complete | P0 | [Development Workflow](../deployment/01_development_workflow.md) | Zustand store implemented for application state |
| Set up development server | ✅ Complete | P0 | [Development Workflow](../deployment/01_development_workflow.md) | Development server implemented with Vite |
| Configure build process | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Build process defined |

## Core Systems Implementation

### Particle System

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement core particle class | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle class implemented with position, velocity, and acceleration |
| Create particle renderer | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle renderer implemented using Three.js with instanced meshes |
| Implement particle lifecycle management | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle creation and destruction implemented |
| Add particle group management | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle groups implemented with role-based organization |
| Implement particle types and roles | ✅ Complete | P0 | [Particle Types](../particles/02_particle_types.md) | Particle roles implemented (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK) |
| Create particle shape system | ✅ Complete | P0 | [Particle Shapes](../traits/02_particle_shapes.md) | Particle shapes implemented with multiple geometry types |
| Implement particle color system | ✅ Complete | P0 | [Color Palettes](../traits/01_color_palettes.md) | Color system implemented with role-based palettes |
| Add particle behavior system | ⏱️ Pending | P0 | [Behavior Traits](../traits/04_behavior_traits.md) | Behavior system defined |

### Physics Engine

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement core physics components | ✅ Complete | P0 | [Physics System](../engine/02_physics_system.md) | Physics service implemented with Verlet integration |
| Create spatial partitioning system | ⏱️ Pending | P0 | [Physics System](../engine/02_physics_system.md) | Spatial partitioning approach defined |
| Implement collision detection | ⏱️ Pending | P0 | [Physics System](../engine/02_physics_system.md) | Collision detection approach defined |
| Add force calculation system | ✅ Complete | P0 | [Force Calculations](../physics/02_force_calculations.md) | Basic force calculations implemented |
| Implement physics integration | ✅ Complete | P0 | [Physics System](../engine/02_physics_system.md) | Physics integration implemented with Euler and Verlet methods |
| Create physics debug visualization | ⏱️ Pending | P1 | [Development UI](../testing/04_development_ui.md) | Debug visualization defined |
| Implement physics optimization | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Physics optimization defined |
| Add physics serialization | ⏱️ Pending | P1 | N/A | **GAP**: No physics serialization documented |

### Force Field System

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement force field types | ⏱️ Pending | P0 | [Force Field Traits](../traits/05_force_field_traits.md) | Force field types defined |
| Create gyroscopic polygon force fields | ⏱️ Pending | P0 | [Force Field Traits](../traits/05_force_field_traits.md) | Gyroscopic polygon force fields defined |
| Add role hierarchy integration | ⏱️ Pending | P0 | [Force Field Traits](../traits/05_force_field_traits.md) | Role hierarchy integration defined |
| Implement force field visualization | ⏱️ Pending | P1 | [Development UI](../testing/04_development_ui.md) | Force field visualization defined |
| Create force field interaction system | ⏱️ Pending | P0 | [Force Field Traits](../traits/05_force_field_traits.md) | Force field interactions defined |
| Implement force field generation | ⏱️ Pending | P0 | [Force Field Traits](../traits/05_force_field_traits.md) | Force field generation defined |
| Add force field optimization | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Force field optimization defined |
| Create force field serialization | ⏱️ Pending | P1 | N/A | **GAP**: No force field serialization documented |

### RNG System

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement Mulberry32 RNG | ⏱️ Pending | P0 | [RNG System](../bitcoin/03_rng_system.md) | Mulberry32 RNG implementation defined |
| Create block data integration | ⏱️ Pending | P0 | [RNG System](../bitcoin/03_rng_system.md) | Block data integration approach defined |
| Implement rehash chain system | ⏱️ Pending | P0 | [RNG System](../bitcoin/03_rng_system.md) | Rehash chain system defined |
| Add purpose-specific RNG instances | ⏱️ Pending | P0 | [RNG System](../bitcoin/03_rng_system.md) | Purpose-specific RNG defined |
| Create RNG testing tools | ⏱️ Pending | P1 | [Testing Strategy](../testing/01_testing_strategy.md) | RNG testing approach defined |
| Implement RNG visualization | ⏱️ Pending | P2 | [Development UI](../testing/04_development_ui.md) | RNG visualization defined |
| Add RNG serialization | ⏱️ Pending | P1 | N/A | **GAP**: No RNG serialization documented |
| Create RNG optimization | ⏱️ Pending | P2 | [Performance Considerations](../engine/04_performance_considerations.md) | RNG optimization defined |

### Formation Calculations

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement formation patterns | ⏱️ Pending | P0 | [Formation Patterns](../traits/03_formation_patterns.md) | Formation patterns defined |
| Create formation generation | ⏱️ Pending | P0 | [Formation Patterns](../traits/03_formation_patterns.md) | Formation generation defined |
| Implement formation transitions | ⏱️ Pending | P1 | [Formation Patterns](../traits/03_formation_patterns.md) | Formation transitions defined |
| Add formation stability calculations | ⏱️ Pending | P0 | [Formation Patterns](../traits/03_formation_patterns.md) | Formation stability defined |
| Create formation visualization tools | ⏱️ Pending | P1 | [Development UI](../testing/04_development_ui.md) | Development UI includes visualization tools |
| Add formation optimization | ⏱️ Pending | P1 | [Force Calculations](../physics/02_force_calculations.md) | Formation optimization approaches defined |
| Implement formation serialization/deserialization | ⏱️ Pending | P1 | N/A | **GAP**: No formation serialization strategy documented |

### Visual Traits System

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement color palette system | ✅ Complete | P0 | [Color Palettes](../traits/01_color_palettes.md) | Color palette system implemented with 50+ palettes |
| Create particle shape system | ✅ Complete | P0 | [Particle Shapes](../traits/02_particle_shapes.md) | Particle shape system implemented with multiple geometry types |
| Implement shader effects | ✅ Complete | P0 | [Visual Effects](../traits/07_visual_effects.md) | Shader effects implemented for particle visual effects |
| Create trait visualization tools | ✅ Complete | P1 | [Development UI](../testing/04_development_ui.md) | TraitVisualizer component implemented for previewing traits |
| Implement visual regression testing | ✅ Complete | P1 | [Testing Strategy](../testing/01_testing_strategy.md) | Visual regression testing implemented for trait verification |
| Create shader generation tools | ✅ Complete | P1 | [Visual Effects](../traits/07_visual_effects.md) | ShaderGenerator component implemented for creating shader effects |
| Implement dependency inventory | ✅ Complete | P0 | [Dependency Inventory](./06_dependency_inventory.md) | Dependency inventory created for tracking Bitcoin-inscribed dependencies |

## Bitcoin Integration

### Blockchain Data Integration

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement Bitcoin API service | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Bitcoin API service defined |
| Create block data fetching | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Block data fetching defined |
| Implement nonce extraction | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Nonce extraction defined |
| Add confirmation count tracking | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Confirmation count tracking defined |
| Create error handling | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Error handling defined |
| Implement fallback mechanisms | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Fallback mechanisms defined |
| Add caching system | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Caching system defined |
| Create offline mode | ⏱️ Pending | P1 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Offline mode defined |

### Evolution Mechanics

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement milestone detection | ⏱️ Pending | P0 | [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) | Milestone detection defined |
| Create mutation system | ⏱️ Pending | P0 | [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) | Mutation system defined |
| Implement trait evolution | ⏱️ Pending | P0 | [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) | Trait evolution defined |
| Add rarity system | ⏱️ Pending | P0 | [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) | Rarity system defined |
| Create evolution visualization | ⏱️ Pending | P1 | [Development UI](../testing/04_development_ui.md) | Evolution visualization defined |
| Implement evolution history tracking | ⏱️ Pending | P1 | [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) | Evolution history tracking defined |
| Add evolution serialization | ⏱️ Pending | P1 | N/A | **GAP**: No evolution serialization documented |
| Create evolution optimization | ⏱️ Pending | P2 | [Performance Considerations](../engine/04_performance_considerations.md) | Evolution optimization defined |

### Ordinals Integration

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Research Ordinals protocol requirements | ✅ Complete | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Ordinals protocol requirements researched |
| Create inscription planning | ✅ Complete | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription planning documented |
| Implement inscription content loading | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Inscription content loading defined |
| Add dependency resolution | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Dependency resolution defined |
| Create inscription verification | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Inscription verification defined |
| Implement fallback content loading | ⏱️ Pending | P0 | [Blockchain Integration](../bitcoin/01_blockchain_integration.md) | Fallback content loading defined |
| Add inscription error handling | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Inscription error handling defined |
| Create inscription testing tools | ⏱️ Pending | P1 | [Testing Strategy](../testing/01_testing_strategy.md) | Inscription testing tools defined |

## User Interface and Experience

### Development UI

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement debug overlay | ⏱️ Pending | P0 | [Development UI](../testing/04_development_ui.md) | Debug overlay defined |
| Create parameter controls | ⏱️ Pending | P0 | [Development UI](../testing/04_development_ui.md) | Parameter controls defined |
| Implement visualization tools | ⏱️ Pending | P0 | [Development UI](../testing/04_development_ui.md) | Visualization tools defined |
| Add performance monitoring | ⏱️ Pending | P0 | [Development UI](../testing/04_development_ui.md) | Performance monitoring defined |
| Create state inspector | ⏱️ Pending | P1 | [Development UI](../testing/04_development_ui.md) | State inspector defined |
| Implement scenario generator | ⏱️ Pending | P1 | [Development UI](../testing/04_development_ui.md) | Scenario generator defined |
| Add logging system | ⏱️ Pending | P0 | [Development UI](../testing/04_development_ui.md) | Logging system defined |
| Create error display | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Error display defined |

### Production UI

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement main view | ⏱️ Pending | P0 | [UI Design](../ui/01_ui_design.md) | Main view defined |
| Create information panels | ⏱️ Pending | P0 | [UI Design](../ui/01_ui_design.md) | Information panels defined |
| Implement camera controls | ⏱️ Pending | P0 | [UI Design](../ui/01_ui_design.md) | Camera controls defined |
| Add view mode toggles | ⏱️ Pending | P1 | [UI Design](../ui/01_ui_design.md) | View mode toggles defined |
| Create loading screen | ⏱️ Pending | P0 | [UI Design](../ui/01_ui_design.md) | Loading screen defined |
| Implement error messages | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Error messages defined |
| Add responsive layout | ⏱️ Pending | P0 | [UI Design](../ui/01_ui_design.md) | Responsive layout defined |
| Create theme system | ⏱️ Pending | P1 | [Color Themes](../ui/03_color_themes.md) | Theme system defined |

### User Experience

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement smooth transitions | ⏱️ Pending | P1 | [User Experience](../ui/04_user_experience.md) | Smooth transitions defined |
| Create intuitive controls | ⏱️ Pending | P0 | [User Experience](../ui/04_user_experience.md) | Intuitive controls defined |
| Implement visual feedback | ⏱️ Pending | P1 | [User Experience](../ui/04_user_experience.md) | Visual feedback defined |
| Add loading indicators | ⏱️ Pending | P0 | [User Experience](../ui/04_user_experience.md) | Loading indicators defined |
| Create help tooltips | ⏱️ Pending | P2 | [User Experience](../ui/04_user_experience.md) | Help tooltips defined |
| Implement error recovery | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Error recovery defined |
| Add accessibility features | ⏱️ Pending | P2 | N/A | **GAP**: No accessibility features documented |
| Create mobile experience | ⏱️ Pending | P2 | [UI Design](../ui/01_ui_design.md) | Mobile experience defined |

## Performance Optimization

### Memory Management

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement object pooling | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Object pooling defined |
| Create efficient data structures | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Efficient data structures mentioned |
| Implement memory monitoring | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Memory monitoring defined |
| Add garbage collection optimization | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Garbage collection optimization defined |
| Create memory leak detection | ⏱️ Pending | P1 | N/A | **GAP**: No memory leak detection documented |
| Implement memory usage visualization | ⏱️ Pending | P2 | N/A | **GAP**: No memory usage visualization documented |
| Add memory budgeting | ⏱️ Pending | P1 | N/A | **GAP**: No memory budgeting documented |
| Create asset unloading strategy | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Asset unloading strategy defined |

### Rendering Optimization

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement instanced rendering | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Instanced rendering defined |
| Create shader optimization | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Shader optimization defined |
| Implement frustum culling | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Frustum culling defined |
| Add level-of-detail rendering | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Level-of-detail rendering defined |
| Create render batching | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Render batching defined |
| Implement texture atlasing | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Texture atlasing defined |
| Add frame rate limiting | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Frame rate limiting defined |
| Create render queue optimization | ⏱️ Pending | P1 | [Performance Considerations](../engine/04_performance_considerations.md) | Render queue optimization defined |

### Computation Optimization

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement spatial partitioning | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Spatial partitioning defined |
| Create physics optimization | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Physics optimization defined |
| Implement force calculation optimization | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Force calculation optimization defined |
| Add worker thread utilization | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Worker thread utilization defined |
| Create computation prioritization | ⏱️ Pending | P1 | N/A | **GAP**: No computation prioritization documented |
| Implement lazy evaluation | ⏱️ Pending | P1 | N/A | **GAP**: No lazy evaluation strategy documented |
| Add caching strategies | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Caching strategies defined |
| Create algorithm optimization | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Algorithm optimization defined |

## Testing and Quality Assurance

### Unit Testing

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement test framework setup | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Vitest configured with test utilities and helpers |
| Create particle system tests | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Comprehensive tests for particle service implemented |
| Implement physics engine tests | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Comprehensive tests for physics service and utilities implemented |
| Add force field tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Force field tests defined |
| Create RNG system tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | RNG system tests defined |
| Implement Bitcoin integration tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Bitcoin integration tests defined |
| Add UI component tests | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | ParticleRenderer component tests implemented |
| Create utility function tests | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Physics utility function tests implemented (integration, vector) |

### Integration Testing

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement particle-physics integration tests | ✅ Complete | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Particle-physics integration tests implemented |
| Create force field-particle integration tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Force field-particle integration tests defined |
| Implement Bitcoin-RNG integration tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Bitcoin-RNG integration tests defined |
| Add UI-state integration tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | UI-state integration tests defined |
| Create end-to-end tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | End-to-end tests defined |
| Implement visual regression tests | ⏱️ Pending | P1 | [Testing Strategy](../testing/01_testing_strategy.md) | Visual regression tests defined |
| Add error handling tests | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Error handling tests defined |
| Create edge case tests | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Edge case tests defined |

### Performance Testing

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement FPS testing | ⏱️ Pending | P0 | [Technical Implementation](../testing/03_technical_implementation.md) | FPS testing defined |
| Create memory usage testing | ⏱️ Pending | P0 | [Technical Implementation](../testing/03_technical_implementation.md) | Memory usage testing defined |
| Implement CPU usage testing | ⏱️ Pending | P0 | [Technical Implementation](../testing/03_technical_implementation.md) | CPU usage testing defined |
| Add load testing | ⏱️ Pending | P0 | [Technical Implementation](../testing/03_technical_implementation.md) | Load testing defined |
| Create rendering performance testing | ⏱️ Pending | P0 | [Technical Implementation](../testing/03_technical_implementation.md) | Rendering performance testing defined |
| Implement physics performance testing | ⏱️ Pending | P0 | [Technical Implementation](../testing/03_technical_implementation.md) | Physics performance testing defined |
| Add startup time testing | ⏱️ Pending | P1 | [Technical Implementation](../testing/03_technical_implementation.md) | Startup time testing defined |
| Create long-running stability testing | ⏱️ Pending | P1 | N/A | **GAP**: No long-running stability testing documented |

### Bitcoin Integration Testing

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement API response testing | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | API response testing defined |
| Create error handling testing | ⏱️ Pending | P0 | [Error Handling](../testing/02_error_handling.md) | Error handling testing defined |
| Implement fallback mechanism testing | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Fallback mechanism testing defined |
| Add inscription loading testing | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Inscription loading testing defined |
| Create evolution mechanics testing | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Evolution mechanics testing defined |
| Implement RNG determinism testing | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | RNG determinism testing defined |
| Add offline mode testing | ⏱️ Pending | P1 | [Testing Strategy](../testing/01_testing_strategy.md) | Offline mode testing defined |
| Create mock API testing | ⏱️ Pending | P0 | [Testing Strategy](../testing/01_testing_strategy.md) | Mock API testing defined |

## Deployment and Operations

### Build Process

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Implement build configuration | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Build configuration defined |
| Create bundling process | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Bundling process defined |
| Implement code splitting | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Code splitting defined |
| Add asset optimization | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Asset optimization defined |
| Create bundle size analysis | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Bundle size analysis defined |
| Implement dependency management | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Dependency management defined |
| Add build validation | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Build validation defined |
| Create CI/CD pipeline | ✅ Complete | P1 | [Testing Strategy](../testing/01_testing_strategy.md) | GitHub Actions CI pipeline implemented for automated testing |

### Inscription Process

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Create inscription preparation scripts | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription preparation scripts defined |
| Implement chunk preparation | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Chunk preparation defined |
| Add inscription order planning | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription order planning defined |
| Create dependency tracking | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Dependency tracking defined |
| Implement inscription verification | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription verification defined |
| Add inscription testing | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription testing defined |
| Create inscription documentation | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription documentation defined |
| Implement inscription monitoring | ⏱️ Pending | P1 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Inscription monitoring defined |

## Documentation

### Technical Documentation

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Create API documentation | ✅ Complete | P0 | docs/api | API documentation generated from JSDoc comments |
| Implement code comments | ✅ Complete | P0 | Various source files | JSDoc comments implemented for key components |
| Add architecture documentation | ✅ Complete | P0 | [System Architecture](../core/02_system_architecture.md) | Comprehensive architecture documentation |
| Create component documentation | ⏱️ Pending | P0 | Various architecture documents | Component documentation spread across multiple files |
| Implement data flow documentation | ⏱️ Pending | P0 | N/A | **GAP**: No specific data flow documentation |
| Add interface documentation | ⏱️ Pending | P0 | [Module Structure](../core/03_module_structure.md) | Interface documentation defined |
| Create algorithm documentation | ⏱️ Pending | P0 | Various architecture documents | Algorithm documentation spread across multiple files |
| Implement performance documentation | ⏱️ Pending | P0 | [Performance Considerations](../engine/04_performance_considerations.md) | Performance documentation defined |
| Create particle class code examples | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle class code examples implemented |
| Create physics engine code examples | ✅ Complete | P0 | [Physics Engine](../physics/01_physics_engine.md) | Physics engine code examples implemented |
| Create state management code examples | ✅ Complete | P0 | [System Architecture](../core/02_system_architecture.md) | State management code examples implemented |
| Create particle renderer code examples | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle renderer code examples implemented |
| Create particle container code examples | ✅ Complete | P0 | [Particle System](../engine/03_particle_system.md) | Particle container code examples implemented |
| Document implementation details | ✅ Complete | P0 | Various architecture documents | Implementation details documented with references to architecture documents

### User Documentation

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Create user guide | ⏱️ Pending | P1 | N/A | **GAP**: No user guide documented |
| Implement feature documentation | ⏱️ Pending | P1 | N/A | **GAP**: No feature documentation documented |
| Add FAQ | ⏱️ Pending | P2 | N/A | **GAP**: No FAQ documented |
| Create troubleshooting guide | ⏱️ Pending | P1 | N/A | **GAP**: No troubleshooting guide documented |
| Implement tutorial | ⏱️ Pending | P2 | N/A | **GAP**: No tutorial documented |
| Add screenshots and examples | ⏱️ Pending | P2 | N/A | **GAP**: No screenshots and examples documented |
| Create API reference | ⏱️ Pending | P1 | N/A | **GAP**: No API reference documented |
| Implement glossary | ⏱️ Pending | P2 | N/A | **GAP**: No glossary documented |

## Project Management

### Planning and Tracking

| Item | Status | Priority | Documentation References | Notes |
|------|--------|----------|--------------------------|-------|
| Define project milestones | ⏱️ Pending | P0 | [Project Checklist](../project/01_project_checklist.md) | Project milestones defined |
| Create timeline | ⏱️ Pending | P0 | [Project Checklist](../project/01_project_checklist.md) | **GAP**: No specific timeline documented |
| Add progress tracking | ✅ Complete | P0 | [Project Checklist](../project/01_project_checklist.md)<br>[Project Inventory](../project/02_project_inventory.md) | Progress tracking approach defined |
| Implement milestone reviews | ⏱️ Pending | P1 | N/A | **GAP**: No milestone review process documented |
| Create risk assessment | ⏱️ Pending | P1 | N/A | **GAP**: No risk assessment documented |
| Add change management process | ⏱️ Pending | P1 | N/A | **GAP**: No change management process documented |
| Implement status reporting | ⏱️ Pending | P1 | N/A | **GAP**: No status reporting process documented |
| Create release criteria | ⏱️ Pending | P0 | [Deployment Pipeline](../deployment/02_deployment_pipeline.md) | Release criteria defined |

## Phase 2: Bitcoin Integration (COMPLETED)

### Bitcoin API Integration

- Bitcoin API service for fetching block data (ONLY nonce and confirmations fields)
- Caching mechanism for Bitcoin data (Block Data: 60000ms, Confirmation: 5000ms)
- Error handling for API failures (NO fallback mechanisms - rely solely on Bitcoin ordinals endpoints)
- PowerShell automation scripts for implementation

### RNG System

- Mulberry32 RNG algorithm implementation as specified in rng_system.md
- RNG seeding from Bitcoin block nonce
- Purpose-specific RNG streams for different aspects of the application
- Chain RNG system for creating sequences of related RNGs
- RNG utility functions for common operations
- PowerShell automation scripts for implementation

### Bitcoin Data Processing

- Block data parsing and validation
- Confirmation count tracking
- Milestone detection for evolution mechanics
- PowerShell automation scripts for implementation

### Bitcoin Integration Tests

- Tests for Bitcoin API service
- Tests for RNG system
- Tests for Bitcoin data processing
- PowerShell automation scripts for implementation

### Documentation

- Bitcoin On-Chain Resources documentation
- Code examples for Bitcoin API service implementation
- Code examples for RNG system implementation
- Code examples for Bitcoin data processing implementation

### Clean-up and Refinement

- Refactored Bitcoin integration code for better organization and readability
- Optimized Bitcoin data fetching and processing with improved caching
- Enhanced documentation with comprehensive JSDoc comments
- Fixed template string issues and other syntax errors
- Removed duplicate and redundant files

## Documentation Gaps Summary

Based on this inventory, the following key documentation gaps have been identified:

1. **Technical Implementation**
   - ✅ API documentation approach (Implemented with JSDoc and documentation generator)
   - ✅ Code comments standards (Implemented with JSDoc)
   - Data flow diagrams
   - Serialization strategies for various components
   - ✅ CI/CD pipeline configuration (Implemented with GitHub Actions)
   - ✅ Directory structure (Addressed in [Directory Structure Map](05_directory_structure_map.md))

2. **User Experience**
   - Loading experience details
   - Visual feedback for interactions
   - Progressive enhancement strategy
   - Help and information panels
   - User guides and tutorials
   - Accessibility features

3. **Performance Optimization**
   - Memory leak detection
   - Memory usage visualization
   - Memory budgeting
   - Computation prioritization
   - Lazy evaluation strategy
   - Long-running stability testing

4. **Project Management**
   - Specific timeline
   - Milestone review process
   - Risk assessment
   - Change management process
   - Status reporting process

5. **Quality Assurance**
   - Review process
   - User acceptance criteria
   - Compliance requirements
   - Documentation requirements
   - Long-running stability testing

These gaps should be addressed to ensure comprehensive documentation coverage for the Bitcoin Protozoa project.

## Related Documents

- [System Architecture](../core/02_system_architecture.md) - High-level architecture overview
- [Module Structure](../core/03_module_structure.md) - Module organization details
- [Blockchain Integration](../bitcoin/01_blockchain_integration.md) - Bitcoin integration details
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - Evolution mechanics details
- [RNG System](../bitcoin/03_rng_system.md) - RNG system details
- [Bitcoin Integration Approach](../bitcoin/04_bitcoin_integration_approach.md) - Bitcoin integration approach details
- [Bitcoin Integration Details](../bitcoin/05_bitcoin_integration_details_part1.md) - Bitcoin integration implementation details
- [Bitcoin On-Chain Resources](../bitcoin/06_bitcoin_onchain_resources.md) - Bitcoin on-chain resources details
- [Particle System](../engine/03_particle_system.md) - Particle system details
- [Physics System](../engine/02_physics_system.md) - Physics system details
- [Color Palettes](../traits/01_color_palettes.md) - Color palette design and implementation
- [Particle Shapes](../traits/02_particle_shapes.md) - Particle shape design and implementation
- [Dependency Inventory](./06_dependency_inventory.md) - Inventory of dependencies and inscription IDs
- [Directory Structure Map](./05_directory_structure_map.md) - Project directory structure
- [Script-Based Implementation](./07_script_based_implementation.md) - Script-based implementation approach
- [Phase Implementation Template](./08_phase_implementation_template.md) - Template flow for implementing each phase
- [Performance Considerations](../engine/04_performance_considerations.md) - Performance optimization guidelines
- [Testing Strategy](../testing/01_testing_strategy.md) - Testing approach
- [Error Handling](../testing/02_error_handling.md) - Error handling strategy
- [Technical Implementation](../testing/03_technical_implementation.md) - Technical implementation details
- [Development UI](../testing/04_development_ui.md) - Development UI for testing
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - Deployment pipeline details
- [Development Workflow](../deployment/01_development_workflow.md) - Development workflow details
- [Asset Management](../deployment/03_asset_management.md) - Asset management details
- [Project Checklist](../project/01_project_checklist.md) - Project requirements checklist
 
``` 
 
--- 
 
### 03_roadmap_and_questions.md 
 
```.md 
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
``` 
 
--- 
 
### 04_ai_rules.md 
 
```.md 
# AI Rules and Best Practices

This document outlines the rules and best practices for working with AI during the implementation of the Bitcoin Protozoa project. Following these guidelines will streamline the workflow, prevent technical issues, and ensure consistent progress.

## Table of Contents

1. [AI Limitations](#ai-limitations) [Line 10]
2. [File Editing Guidelines](#file-editing-guidelines) [Line 40]
3. [Code Implementation Guidelines](#code-implementation-guidelines) [Line 70]
4. [Documentation Guidelines](#documentation-guidelines) [Line 100]
5. [Script Development Guidelines](#script-development-guidelines) [Line 130]
6. [Testing Guidelines](#testing-guidelines) [Line 160]
7. [Communication Guidelines](#communication-guidelines) [Line 190]
8. [Troubleshooting Guidelines](#troubleshooting-guidelines) [Line 220]
9. [Regular Review Process](#regular-review-process) [Line 250]

## AI Limitations

The AI assistant has specific limitations that must be considered during development:

### Token Limits

- **Maximum Context Size**: The AI has a limited context window (approximately 16K tokens)
- **Response Size Limit**: Responses should be kept under 4K tokens to avoid truncation
- **Code Block Size**: Code blocks should be limited to 200-300 lines per response
- **Documentation Size**: Documentation files should be kept under 500 lines

### Processing Limitations

- **Complex Operations**: The AI may struggle with very complex operations involving multiple steps
- **Long-Running Tasks**: The AI may time out during long-running tasks
- **Large File Processing**: The AI may fail when processing very large files at once
- **Concurrent Operations**: The AI cannot perform multiple concurrent operations

### Memory Limitations

- **Session Memory**: The AI retains information only within the current session
- **Memory Decay**: Information from earlier in the conversation may be less accessible
- **External State**: The AI cannot directly access external state without it being provided

## File Editing Guidelines

To ensure successful file editing and prevent technical issues:

### Chunking Strategy

- **Edit in 250-Line Chunks**: Always edit files in chunks of 250 lines or less
- **Sequential Editing**: Make edits sequentially, not simultaneously
- **Chunk Boundaries**: Try to make chunk boundaries at logical points in the code
- **Track Progress**: Keep track of which chunks have been edited

### File Viewing Strategy

- **View in 1000-Line Chunks**: When viewing files, use chunks of up to 1000 lines
- **Targeted Viewing**: Focus on specific sections relevant to the current task
- **Context Awareness**: Ensure sufficient context is available for understanding

### File Creation Strategy

- **Create in 250-Line Chunks**: Create new files in chunks of 250 lines or less
- **Incremental Creation**: Build files incrementally, section by section
- **Template Usage**: Use templates for consistent file structure

### File Deletion Strategy

- **Use Proper Tools**: Always use the remove-files tool for deletion
- **Verify First**: Always verify file contents before deletion
- **Update References**: Update all references to deleted files

## Code Implementation Guidelines

To ensure high-quality code implementation:

### Code Structure

- **Modular Design**: Implement code in modular, reusable components
- **Clean Architecture**: Follow clean architecture principles
- **Separation of Concerns**: Keep different responsibilities in separate modules
- **Consistent Patterns**: Use consistent design patterns throughout

### Code Quality

- **Type Safety**: Use TypeScript types for all code
- **Error Handling**: Implement comprehensive error handling
- **Performance Awareness**: Consider performance implications of all code
- **Memory Management**: Be mindful of memory usage and cleanup

### Implementation Process

- **Incremental Development**: Implement features incrementally
- **Test-Driven Development**: Write tests before or alongside implementation
- **Documentation First**: Document the approach before implementation
- **Review and Refactor**: Regularly review and refactor code

### Dependency Management

- **Minimal Dependencies**: Use minimal external dependencies
- **Version Pinning**: Pin dependency versions for reproducibility
- **Dependency Auditing**: Regularly audit dependencies for issues
- **Bundle Size Awareness**: Be mindful of the impact on bundle size

## Documentation Guidelines

To ensure comprehensive and useful documentation:

### Documentation Structure

- **Consistent Format**: Use consistent formatting across all documentation
- **Clear Hierarchy**: Use clear hierarchical structure with headings
- **Table of Contents**: Include a table of contents with line numbers
- **Related Documents**: Link to related documents

### Documentation Content

- **Comprehensive Coverage**: Cover all aspects of the implementation
- **Code Examples**: Include relevant code examples
- **Implementation Notes**: Include notes on implementation decisions
- **Edge Cases**: Document edge cases and how they're handled

### Documentation Process

- **Document First**: Document the approach before implementation
- **Update Regularly**: Keep documentation updated as code changes
- **Review for Clarity**: Regularly review documentation for clarity
- **Cross-Reference**: Ensure cross-references are accurate

### Documentation Size

- **Keep Under 500 Lines**: Keep documentation files under 500 lines
- **Split Logically**: Split large documents into logical sections
- **Avoid Duplication**: Avoid duplicating information across documents
- **Use References**: Use references instead of duplicating content

## Script Development Guidelines

To ensure effective script development:

### Script Environment

- **PowerShell Compatibility**: Develop all scripts for PowerShell
- **Command Separation**: Use semicolons (;) to separate commands
- **Environment Variables**: Use environment variables for configuration
- **Error Handling**: Implement robust error handling in scripts

### Script Structure

- **Modular Design**: Design scripts in modular, reusable components
- **Parameter Validation**: Validate all script parameters
- **Help Documentation**: Include help documentation in scripts
- **Logging**: Implement comprehensive logging

### Script Testing

- **Test in Isolation**: Test scripts in isolation before integration
- **Test Edge Cases**: Test scripts with edge cases and invalid inputs
- **Idempotency**: Ensure scripts are idempotent when appropriate
- **Cleanup**: Ensure scripts clean up after themselves

### Script Examples

```powershell
# Example of a well-structured PowerShell script
param (
    [Parameter(Mandatory=$true)]
    [string]$InputPath,
    
    [Parameter(Mandatory=$true)]
    [string]$OutputPath,
    
    [Parameter(Mandatory=$false)]
    [int]$ChunkSize = 250
)

# Validate parameters
if (-not (Test-Path $InputPath)) {
    Write-Error "Input path does not exist: $InputPath"
    exit 1
}

# Process in chunks
$content = Get-Content $InputPath
$totalLines = $content.Count
$chunks = [Math]::Ceiling($totalLines / $ChunkSize)

Write-Host "Processing $totalLines lines in $chunks chunks..."

for ($i = 0; $i -lt $chunks; $i++) {
    $start = $i * $ChunkSize
    $end = [Math]::Min(($i + 1) * $ChunkSize - 1, $totalLines - 1)
    $chunkContent = $content[$start..$end]
    
    # Process chunk
    Write-Host "Processing chunk $($i+1)/$chunks (lines $($start+1)-$($end+1))..."
    
    # Example processing
    $processedChunk = $chunkContent | ForEach-Object { $_ -replace "old", "new" }
    
    # Write to output
    if ($i -eq 0) {
        $processedChunk | Set-Content $OutputPath
    } else {
        $processedChunk | Add-Content $OutputPath
    }
}

Write-Host "Processing complete. Output written to $OutputPath"
```

## Testing Guidelines

To ensure effective testing:

### Test Structure

- **Unit Tests**: Write unit tests for individual components
- **Integration Tests**: Write integration tests for component interactions
- **End-to-End Tests**: Write end-to-end tests for complete workflows
- **Performance Tests**: Write performance tests for critical paths

### Test Implementation

- **Test-Driven Development**: Write tests before or alongside implementation
- **Comprehensive Coverage**: Aim for high test coverage
- **Edge Cases**: Test edge cases and error conditions
- **Isolation**: Ensure tests are isolated and don't depend on each other

### Test Execution

- **Run Tests Frequently**: Run tests frequently during development
- **Automate Testing**: Automate test execution where possible
- **Test in Chunks**: Run tests in manageable chunks
- **Monitor Performance**: Monitor test performance and optimize slow tests

### Test Maintenance

- **Keep Tests Updated**: Keep tests updated as code changes
- **Refactor Tests**: Regularly refactor tests for clarity and maintainability
- **Remove Obsolete Tests**: Remove tests that are no longer relevant
- **Document Test Approach**: Document the testing approach and strategy

## Communication Guidelines

To ensure effective communication:

### Question Formulation

- **Be Specific**: Ask specific, focused questions
- **Provide Context**: Provide sufficient context for questions
- **One Topic at a Time**: Focus on one topic at a time
- **Prioritize Questions**: Prioritize questions by importance

### Response Structure

- **Structured Responses**: Provide structured, organized responses
- **Code Formatting**: Use proper code formatting in responses
- **Visual Aids**: Use visual aids (lists, tables) where appropriate
- **Actionable Information**: Provide actionable information

### Progress Updates

- **Regular Updates**: Provide regular progress updates
- **Blockers and Issues**: Communicate blockers and issues promptly
- **Next Steps**: Clearly outline next steps
- **Timeline Estimates**: Provide realistic timeline estimates

### Feedback Loop

- **Request Feedback**: Regularly request feedback
- **Incorporate Feedback**: Promptly incorporate feedback
- **Clarify Misunderstandings**: Promptly clarify misunderstandings
- **Acknowledge Limitations**: Acknowledge limitations and constraints

## Troubleshooting Guidelines

To effectively troubleshoot issues:

### Issue Identification

- **Specific Symptoms**: Identify specific symptoms of issues
- **Reproducibility**: Determine if issues are reproducible
- **Scope**: Determine the scope of issues (isolated or widespread)
- **Impact**: Assess the impact of issues on development

### Diagnostic Approach

- **Systematic Process**: Follow a systematic troubleshooting process
- **Isolation**: Isolate issues to specific components
- **Root Cause Analysis**: Identify root causes, not just symptoms
- **Documentation**: Document the troubleshooting process

### Resolution Strategy

- **Targeted Fixes**: Implement targeted fixes for specific issues
- **Verification**: Verify that fixes resolve the issues
- **Regression Testing**: Test for regressions after fixes
- **Prevention**: Implement measures to prevent similar issues

### Common Issues and Solutions

- **AI Timeouts**: Break tasks into smaller chunks
- **File Editing Failures**: Edit files in 250-line chunks
- **Script Execution Errors**: Check PowerShell syntax and environment
- **Build Failures**: Check for missing dependencies or configuration issues

## Regular Review Process

To maintain quality and consistency:

### Review Schedule

- **Every Few Responses**: Review these rules every few responses
- **Before Complex Tasks**: Review before starting complex tasks
- **After Issues**: Review after encountering issues
- **Regular Intervals**: Schedule regular comprehensive reviews

### Review Focus

- **AI Limitations**: Review AI limitations and workarounds
- **File Editing Guidelines**: Review file editing guidelines
- **Code Implementation Guidelines**: Review code implementation guidelines
- **Script Development Guidelines**: Review script development guidelines

### Review Process

- **Quick Scan**: Quickly scan the entire document
- **Detailed Review**: Review sections relevant to upcoming tasks
- **Note Updates**: Note any updates or changes to guidelines
- **Apply Learnings**: Apply learnings from recent experiences

### Continuous Improvement

- **Update Guidelines**: Update guidelines based on experience
- **Add New Patterns**: Add new patterns and best practices
- **Remove Obsolete Guidelines**: Remove guidelines that are no longer relevant
- **Refine Processes**: Continuously refine processes for efficiency

## Summary of Key Rules

1. **Edit files in chunks of 250 lines or less**
2. **View files in chunks of up to 1000 lines**
3. **Develop all scripts for PowerShell with semicolons separating commands**
4. **Keep documentation files under 500 lines**
5. **Limit code blocks to 200-300 lines per response**
6. **Review these rules every few responses**
7. **Break large tasks into smaller, manageable chunks**
8. **Document the approach before implementation**
9. **Test code thoroughly with unit, integration, and end-to-end tests**
10. **Communicate clearly and provide regular progress updates**
 
``` 
 
--- 
 
### 05_directory_structure_map.md 
 
```.md 
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
 
``` 
 
--- 
 
### 06_dependency_inventory.md 
 
```.md 
# Dependency Inventory

This document provides a comprehensive inventory of all dependencies used in the Bitcoin Protozoa project, including their required versions that match Bitcoin inscriptions. This inventory ensures compatibility with on-chain resources and prepares for the eventual migration from npm local installs to inscription sources.

## Table of Contents

1. [Core Principles](#core-principles)
2. [Core Dependencies](#core-dependencies)
3. [3D Rendering Dependencies](#3d-rendering-dependencies)
4. [Animation & Effects Dependencies](#animation--effects-dependencies)
5. [Utility Dependencies](#utility-dependencies)
6. [Development Dependencies](#development-dependencies)
7. [Migration Strategy](#migration-strategy)
8. [Dependency Verification](#dependency-verification)

## Core Principles

1. **Version Exactness**: All dependencies must match the exact versions available as Bitcoin inscriptions
2. **Compatibility Verification**: Regular verification ensures our installed versions match inscription versions
3. **No Fallbacks**: The final application will rely solely on Bitcoin inscriptions with no fallbacks
4. **Minimal Footprint**: Only essential dependencies are included to minimize the application size
5. **Inscription Preparation**: Dependencies not yet inscribed will be prepared for inscription

## Core Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|-------|
| React | 18.2.0 | 7f403153b6484f7d24f50a51e1cdf8187219a3baf103ef0df5ea2437fb9de874i0 | ✅ Aligned | Core UI framework |
| ReactDOM | 18.2.0 | 89295aaf617708128b95d22e7099ce32108d4b918386e6f90994e7979d22ba72i0 | ✅ Aligned | DOM manipulation for React |
| Scheduler | 0.23.0 | 9b09a0f234355106e9311a21fbe5324c90f7317f04c00bc73e1114c9af745743i0 | ✅ Aligned | Required React dependency |
| React Reconciler | 0.27.0 | 9b0338c4e84987a374845235a3b4f0fe73b205b336a7b936e05c71deb5a1882ci0 | ⚠️ Not installed | React reconciliation engine |

## 3D Rendering Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|-------|
| Three.js | 0.163.0 | 2dbdf9ebbec6be793fd16ae9b797c7cf968ab2427166aaf390b90b71778266abi0 | ✅ Aligned | Core 3D rendering engine |
| React Three Fiber | 8.13.7 | 24c424c795d50c3f1d344253d163e7eaa34e904aef038b6031d706e76676c634i0 | ✅ Aligned | React bindings for Three.js |
| React Three Drei | 9.80.7 | 9f77a1efc4c880197ba8d197d5e87539443ed5ebcf027b1fee25db8bd1cf4605i0 | ✅ Aligned | Useful helpers for React Three Fiber |
| GLTFLoader | latest | 614855c7c7541594c846a96a81db7bcedaff2831711e3b89670aba4c2fefb404i0 | ⚠️ Not installed | For loading 3D models |
| TextGeometry | latest | 77ef4bc8b15f0a764903f3bb2ccd0566ac6c111bd3d884bc814cfde49565dbc9i0 | ⚠️ Not installed | For 3D text rendering |
| FontLoader | latest | fcacfdd75ef21965ec98d9a1a107e8f5468f23ff15131cae44fc6aca86538147i0 | ⚠️ Not installed | For loading fonts in Three.js |
| BufferGeometryUtils | latest | 71616486e00954e0087b6bfd6b110fe0a32d1b174b94b634b34f27dd04f70a5ci0 | ⚠️ Not installed | Buffer geometry utilities |

## Animation & Effects Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|---------|
| GSAP | 3.6.1 | 6577ec768235a2a911e91a115b964618581bde91d99bc58f5c7390fdfb155ae6i0 | ⚠️ Not installed | Animation library |
| React-spring-core | 9.7.3 | 09fe4a18d81abc481597bdd9ddfa65aadb95defc18de3ec925ec0b45ac3c7c49i0 | ⚠️ Not installed | Physics-based animations |
| Shader-composer | 0.4.3 | 1c9c11c3b82bce54bfa989a44a1057f8c39d3b8b9dc2e13ec1f99e4a0f3a0f77i0 | ✅ Aligned | WebGL shader composition |
| vfx-composer | 0.4.0 | 9f59e26bc81e4d741f77320eaf9e9df8cce623c9639f9c1a49497ac75607e9bei0 | ✅ Aligned | Visual effects composition |
| Chroma | latest | c49f28a5c9e67efb85d44b9ee12efa2839b0251bad14efc5e6c32406505e259ci0 | ⚠️ Not installed | Color manipulation |

## Utility Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|---------|
| Crypto-js | 4.1.1 | 66979aec90e592bc5be7fddcef23daeff982662b7225e7804c1b271f1b0d267ai0 | ⚠️ Not installed | Cryptography functions |
| Pako | 2.1.0 | fba6f95fb1152db43304a27dce8cb8c65509eba6ab0b6958cedeb33e5f443077i0 | ⚠️ Not installed | Compression library |
| JSZip | 3.10.1 | 372c5388030820daed356d25d7a1218d0b88d78a6d051d27c91d0f25ac4c3c5ei0 | ⚠️ Not installed | File compression/decompression |
| fflate | 0.8.0 | 657973995aa2a47c3fe02debb22405dadf6b49148d97027627bced89a73f408fi0 | ⚠️ Not installed | Fast compression library |
| Buffer | latest | fb15f2a6ed1d3031aa214cc12d3fa696508080c0baa194463920c8a79d21aa54i0 | ⚠️ Not installed | Binary data handling |
| brotli/decode.min.js | latest | b1d16a7a1ada08b5c7f51837478f578c0abd0973809c439228f28ccd5c38e44ai0 | ⚠️ Not installed | Decompression utility |
| Moment.js | 2.29.1 | b90b4516ea1a0b882e67387eb4f3e5def0307704b046e8ef98c5e72092c47eedi0 | ⚠️ Not installed | Date/time library |
| Axios | latest | 6b81993428a217a341ffd68f3b3aa3664b2cfc674d57aad0d3b6daa0f125b821i0 | ⚠️ Not installed | HTTP client |
| Highlight.js | 11.7.0 | 41d856597a8474e7124a0641b54afb77bc034f800e1be8fe02a20b55023ff4a7i0 | ⚠️ Not installed | Syntax highlighting |
| GRC-img | v1 | e5ef65604e1ad9c90fb3c74918e00a960ce2e814fba412556afec6b3a4e25257i0 | ⚠️ Not installed | Image processing |
| Open Ordinal Stitch | 0.9.0 | a196634768a6a715779fa8d513b65b8d2099defc2bd09c36dccbf54ffdd04022i0 | ⚠️ Not installed | Ordinals utility |
| Zustand | 4.4.6 | Not inscribed | ✅ Aligned | State management library |

## CSS & UI Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|---------|
| Tailwind | latest | 0703423f633ed5cef7e3b45bfd8df43ab0d6783850d51005b105f01dd60d25c3i0 | ⚠️ Not installed | CSS framework |
| Bitcoin Icons | 1.0 | 01a4ff05b7591d14afa8a70aa80fd17b49e972f34a65bf69c6fc5ea09f08ab04i0 | ⚠️ Not installed | Bitcoin-specific icons |
| Lucide Icons | 0.363.0 | 5546e0dea8b7fc991ef3ae22802ee7e793f814049ae9f32409ced33739840137i0 | ⚠️ Not installed | General UI icons |
| @emotion/react | 11.14.0 | Not inscribed | ✅ Aligned | CSS-in-JS library |
| @emotion/styled | 11.14.0 | Not inscribed | ✅ Aligned | Styled components for Emotion |

## Development Dependencies

| Dependency | Required Version | Current Status | Notes |
|------------|------------------|----------------|-------|
| TypeScript | 5.0.4 | ✅ Aligned | Programming language |
| Vite | 4.3.2 | ✅ Aligned | Build tool |
| ESLint | 8.38.0 | ✅ Aligned | Code linting |
| Prettier | 2.8.7 | ✅ Aligned | Code formatting |
| Vitest | 0.30.1 | ✅ Aligned | Testing framework |
| @testing-library/react | 13.4.0 | ✅ Aligned | React testing utilities |
| @testing-library/jest-dom | 5.16.5 | ✅ Aligned | DOM testing utilities |
| @types/react | 18.0.28 | ✅ Aligned | React type definitions |
| @types/react-dom | 18.0.11 | ✅ Aligned | React DOM type definitions |
| @types/three | 0.152.1 | ⚠️ Version mismatch | Three.js type definitions |

## Migration Strategy

### Phase 1: Version Alignment (Current)

- Ensure all installed dependencies match the versions available as inscriptions
- Document any dependencies that need to be inscribed
- Maintain compatibility with inscription versions during development

### Phase 2: Inscription Preparation

- Prepare any custom dependencies for inscription
- Create minimal builds of dependencies where possible
- Test application with local versions of inscription-ready dependencies

### Phase 3: Inscription Migration

- Replace npm imports with inscription imports
- Implement the InscriptionLoaderService
- Test application with actual inscriptions
- Remove all npm dependencies from the final build

## Dependency Verification

To verify that our dependencies match the required versions:

```bash
npm list --depth=0
```

This will show the top-level dependencies and their installed versions, which can be compared against this inventory.

### Custom Dependencies

The following dependencies are not yet inscribed and may need custom inscription:

- @emotion/react (11.14.0)
- @emotion/styled (11.14.0)

### Related Documents

- [Bitcoin On-Chain Resources](../../BITCOIN_ONCHAIN_RESOURCES.md) - Source for inscription IDs
- [Project Checklist](./01_project_checklist.md) - Project requirements and milestones
- [Directory Structure Map](./05_directory_structure_map.md) - Project structure
 
``` 
 
--- 
 
### 07_script_based_implementation.md 
 
```.md 
# Script-Based Implementation Approach

This document outlines our systematic approach to implementing the Bitcoin Protozoa project using PowerShell scripts for bulk batch processing rather than individual edits.

## Table of Contents

1. [Introduction](#introduction)
2. [Implementation Philosophy](#implementation-philosophy)
3. [Script Organization](#script-organization)
4. [Script Generation Process](#script-generation-process)
5. [Script Execution Process](#script-execution-process)
6. [Phase-Specific Scripts](#phase-specific-scripts)
7. [Common Script Patterns](#common-script-patterns)
8. [Best Practices](#best-practices)
9. [Related Documents](#related-documents)

## Introduction

The Bitcoin Protozoa project is implemented using a systematic, script-based approach that prioritizes bulk batch processing over individual edits. This approach significantly improves efficiency, reduces implementation time, and ensures consistency across the codebase.

## Implementation Philosophy

Our implementation philosophy is based on the following principles:

1. **Systematic Phases**: Implement the project in clearly defined phases, with each phase building on the previous one.
2. **Bulk Batch Processing**: Use PowerShell scripts to implement features in bulk batches rather than making individual edits.
3. **Script Generation**: Create scripts that generate other scripts, maximizing automation and reducing repetitive work.
4. **Careful Preparation**: Invest time in thorough preparation and planning before executing scripts.
5. **Comprehensive Testing**: Test scripts thoroughly before execution to ensure they produce the expected results.
6. **Incremental Execution**: Execute scripts in small, manageable chunks to avoid timeouts and errors.

## Script Organization

Scripts are organized by phase and purpose:

```
scripts/
├── phase_1/
│   ├── component-generator.ps1
│   ├── particle-system-generator.ps1
│   └── ...
├── phase_2/
│   ├── bitcoin-integration-generator.ps1
│   ├── rng-system-generator.ps1
│   └── ...
├── phase_3/
│   ├── color-palette-generator.ps1
│   ├── shape-mesh-generator.ps1
│   ├── visual-trait-previewer.ps1
│   ├── shader-generator.ps1
│   ├── visual-regression-testing.ps1
│   └── ...
├── phase_4/
│   └── ...
└── common/
    ├── script-generator.ps1
    ├── component-template.ps1
    ├── test-generator.ps1
    └── ...
```

## Script Generation Process

To maximize efficiency, we use a meta-script approach where scripts generate other scripts:

1. **Define Asset Types**: Define all asset types and their properties in a central location.
2. **Create Script Templates**: Create templates for different types of scripts (component generators, test generators, etc.).
3. **Generate Phase-Specific Scripts**: Use a script generator to create all the scripts needed for a specific phase.
4. **Review and Refine**: Review the generated scripts and refine them as needed.
5. **Execute Scripts**: Execute the scripts in the appropriate order to implement the phase.

### Master Script Generator

The master script generator is a meta-script that generates all the scripts needed for a specific phase. It follows these steps:

1. **Read Configuration**: Read the configuration for the phase from the project checklist and inventory.
2. **Identify Required Scripts**: Identify all the scripts needed for the phase based on the configuration.
3. **Generate Scripts**: Generate each script using the appropriate template.
4. **Validate Scripts**: Validate that the generated scripts are correct and complete.
5. **Create Execution Plan**: Create a plan for executing the scripts in the correct order.

```powershell
# Master Script Generator
# This script generates all the scripts needed for a specific phase

param (
    [string]$phase = "phase_4",
    [string]$configPath = "bitcoin_protozoa/project/01_project_checklist.md",
    [string]$inventoryPath = "bitcoin_protozoa/project/02_project_inventory.md",
    [string]$outputDir = "scripts/$phase"
)

# Ensure the output directory exists
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "Created directory: $outputDir"
}

# Read the configuration for the phase
$config = Get-Content -Path $configPath -Raw
$inventory = Get-Content -Path $inventoryPath -Raw

# Parse the configuration to identify required scripts
$requiredScripts = @()

# Add scripts based on the phase
switch ($phase) {
    "phase_4" {
        # Particle Roles and Hierarchy scripts
        $requiredScripts += @(
            "role-definition-generator.ps1",
            "role-behavior-generator.ps1",
            "role-hierarchy-generator.ps1",
            "role-interaction-generator.ps1",
            "role-visualization-generator.ps1",
            "role-state-management-generator.ps1",
            "role-testing-generator.ps1",
            "role-documentation-generator.ps1",
            "implement-core-role.ps1",
            "implement-control-role.ps1",
            "implement-movement-role.ps1",
            "implement-defense-role.ps1",
            "implement-attack-role.ps1",
            "implement-role-assignment.ps1",
            "implement-role-evolution.ps1",
            "implement-role-visualization.ps1",
            "implement-role-tests.ps1"
        )
    }
    # Add cases for other phases
}

# Generate each script
foreach ($script in $requiredScripts) {
    $scriptPath = Join-Path -Path $outputDir -ChildPath $script

    # Generate the script content based on the script name
    $scriptContent = "# $script\n# Generated by the Master Script Generator\n\n"

    # Add specific content based on the script name
    if ($script -like "*-generator.ps1") {
        $scriptContent += "# This script generates code for the $phase\n\n"
        # Add generator-specific content
    }
    elseif ($script -like "implement-*.ps1") {
        $scriptContent += "# This script implements functionality for the $phase\n\n"
        # Add implementation-specific content
    }

    # Save the script
    Set-Content -Path $scriptPath -Value $scriptContent
    Write-Host "Generated script: $scriptPath"
}

# Create an execution plan
$executionPlanPath = Join-Path -Path $outputDir -ChildPath "execution-plan.md"
$executionPlanContent = "# Execution Plan for $phase\n\n"
$executionPlanContent += "Execute the scripts in the following order:\n\n"

foreach ($script in $requiredScripts) {
    $executionPlanContent += "1. $script\n"
}

Set-Content -Path $executionPlanPath -Value $executionPlanContent
Write-Host "Generated execution plan: $executionPlanPath"

Write-Host "Script generation completed successfully!"
```

This master script generator can be used to generate all the scripts needed for each phase of the project. It reads the configuration from the project checklist and inventory, identifies the required scripts, generates each script using the appropriate template, and creates an execution plan for running the scripts in the correct order.

## Script Execution Process

Scripts are executed in a specific order to ensure dependencies are met:

1. **Preparation**: Ensure all dependencies are installed and the environment is properly configured.
2. **Data Generation**: Generate any data files needed by the implementation scripts.
3. **Component Generation**: Generate React components and their associated files.
4. **Integration**: Integrate the components with the rest of the system.
5. **Testing**: Generate and run tests to verify the implementation.
6. **Documentation**: Update documentation to reflect the changes.

## Phase-Specific Scripts

Each phase requires specific scripts to implement its features. The following is a comprehensive list of all scripts needed for each phase, based on the project roadmap, inventory, asset management definitions, and directory structure map.

### Phase 1: Core Systems (Completed)

```
scripts/phase_1/
├── implement-particle-class.ps1              # Implements the Particle class with properties and methods
├── implement-particle-container.ps1          # Implements the ParticleContainer for managing multiple particles
├── implement-particle-renderer.ps1           # Implements the ParticleRenderer for rendering particles
├── implement-physics-engine.ps1              # Implements the physics engine for particle movement
├── implement-state-management.ps1            # Implements Zustand state management for particles
├── implement-basic-particle-system.ps1       # Integrates all particle components into a system
├── fix-domain-exports.ps1                    # Fixes domain exports for proper module structure
├── fix-imports-comprehensive.ps1             # Fixes imports across the codebase
```

### Phase 2: Bitcoin Integration (Completed)

```
scripts/phase_2/
├── implement-bitcoin-api.ps1                 # Implements the Bitcoin API service
├── implement-bitcoin-block-fetcher.ps1       # Implements block data fetching functionality
├── implement-bitcoin-data-processing.ps1     # Implements processing of Bitcoin block data
├── implement-bitcoin-state-management.ps1    # Implements state management for Bitcoin data
├── implement-rng-system.ps1                  # Implements the Mulberry32 RNG system
├── implement-rng-utility-functions.ps1       # Implements utility functions for the RNG system
├── implement-bitcoin-integration.ps1         # Integrates Bitcoin components into the system
├── implement-bitcoin-integration-tests.ps1   # Implements tests for Bitcoin integration
├── run-bitcoin-integration-tests.ps1         # Runs the Bitcoin integration tests
├── implement-bitcoin-data-visualization.ps1  # Implements visualization of Bitcoin data
├── fix-domain-exports.ps1                    # Fixes domain exports for proper module structure
├── fix-imports-comprehensive.ps1             # Fixes imports across the codebase
├── complete-bitcoin-integration-cleanup.ps1  # Cleans up the Bitcoin integration implementation
```

### Phase 3: Visual Traits (Completed)

```
scripts/phase_3/
├── color-palette-generator.ps1              # Generates color palettes based on color theory
├── shape-mesh-generator.ps1                  # Generates 3D meshes for particle shapes
├── visual-trait-previewer.ps1                # Creates a tool for previewing visual traits
├── shader-generator.ps1                      # Generates shader code for visual effects
├── visual-regression-testing.ps1             # Implements visual regression testing
├── component-template-improved.ps1           # Provides an improved template for components
├── component-template-fixed.ps1              # Provides a fixed template for components
├── regenerate-components.ps1                 # Regenerates components with the fixed template
```

### Phase 4: Particle Roles and Hierarchy (Pending)

```
scripts/phase_4/
├── role-definition-generator.ps1            # Generates role definitions for particles
├── role-behavior-generator.ps1              # Generates behavior implementations for each role
├── role-hierarchy-generator.ps1             # Generates the role hierarchy system
├── role-interaction-generator.ps1           # Generates interaction logic between roles
├── role-visualization-generator.ps1         # Generates visualization components for roles
├── role-state-management-generator.ps1      # Generates state management for roles
├── role-testing-generator.ps1               # Generates tests for role functionality
├── role-documentation-generator.ps1         # Generates documentation for roles
├── implement-core-role.ps1                  # Implements the Core role functionality
├── implement-control-role.ps1               # Implements the Control role functionality
├── implement-movement-role.ps1              # Implements the Movement role functionality
├── implement-defense-role.ps1               # Implements the Defense role functionality
├── implement-attack-role.ps1                # Implements the Attack role functionality
├── implement-role-assignment.ps1            # Implements role assignment logic
├── implement-role-evolution.ps1             # Implements role evolution mechanics
├── implement-role-visualization.ps1         # Implements role visualization components
├── implement-role-tests.ps1                 # Implements tests for role functionality
```

### Phase 5: Force Fields (Pending)

```
scripts/phase_5/
├── force-field-definition-generator.ps1     # Generates force field definitions
├── force-field-behavior-generator.ps1       # Generates behavior implementations for force fields
├── force-field-interaction-generator.ps1    # Generates interaction logic for force fields
├── force-field-visualization-generator.ps1  # Generates visualization components for force fields
├── force-field-state-management-generator.ps1 # Generates state management for force fields
├── force-field-testing-generator.ps1        # Generates tests for force field functionality
├── force-field-documentation-generator.ps1  # Generates documentation for force fields
├── implement-attraction-field.ps1           # Implements attraction force field
├── implement-repulsion-field.ps1            # Implements repulsion force field
├── implement-vortex-field.ps1               # Implements vortex force field
├── implement-boundary-field.ps1             # Implements boundary force field
├── implement-noise-field.ps1                # Implements noise force field
├── implement-field-combination.ps1          # Implements field combination logic
├── implement-field-visualization.ps1        # Implements field visualization components
├── implement-field-tests.ps1                # Implements tests for field functionality
```

### Phase 6: UI Implementation (Pending)

```
scripts/phase_6/
├── ui-component-generator.ps1              # Generates UI components
├── ui-layout-generator.ps1                 # Generates UI layouts
├── ui-state-management-generator.ps1       # Generates state management for UI
├── ui-interaction-generator.ps1            # Generates interaction logic for UI
├── ui-testing-generator.ps1                # Generates tests for UI functionality
├── ui-documentation-generator.ps1          # Generates documentation for UI
├── implement-main-interface.ps1            # Implements the main interface
├── implement-control-panel.ps1             # Implements the control panel
├── implement-stats-display.ps1             # Implements the stats display
├── implement-visualization-controls.ps1    # Implements visualization controls
├── implement-settings-panel.ps1            # Implements the settings panel
├── implement-help-system.ps1               # Implements the help system
├── implement-responsive-layout.ps1         # Implements responsive layout
├── implement-theme-system.ps1              # Implements the theme system
├── implement-ui-tests.ps1                  # Implements tests for UI functionality
```

### Phase 7: Advanced Behaviors (Pending)

```
scripts/phase_7/
├── behavior-definition-generator.ps1       # Generates behavior definitions
├── behavior-implementation-generator.ps1    # Generates behavior implementations
├── behavior-interaction-generator.ps1       # Generates interaction logic for behaviors
├── behavior-visualization-generator.ps1     # Generates visualization components for behaviors
├── behavior-state-management-generator.ps1  # Generates state management for behaviors
├── behavior-testing-generator.ps1           # Generates tests for behavior functionality
├── behavior-documentation-generator.ps1     # Generates documentation for behaviors
├── implement-flocking-behavior.ps1          # Implements flocking behavior
├── implement-predator-prey-behavior.ps1     # Implements predator-prey behavior
├── implement-pathfinding-behavior.ps1       # Implements pathfinding behavior
├── implement-obstacle-avoidance-behavior.ps1 # Implements obstacle avoidance behavior
├── implement-goal-seeking-behavior.ps1      # Implements goal-seeking behavior
├── implement-behavior-combination.ps1       # Implements behavior combination logic
├── implement-behavior-visualization.ps1     # Implements behavior visualization components
├── implement-behavior-tests.ps1             # Implements tests for behavior functionality
```

### Common Scripts (Pending)

```
scripts/common/
├── script-generator.ps1                     # Generates scripts based on templates
├── component-template.ps1                   # Provides a template for components
├── test-generator.ps1                       # Generates tests based on templates
├── documentation-generator.ps1              # Generates documentation based on templates
├── directory-structure-generator.ps1        # Generates directory structure
├── code-cleanup.ps1                         # Cleans up code (removes unused imports, etc.)
├── dependency-checker.ps1                   # Checks dependencies for compatibility
├── performance-analyzer.ps1                 # Analyzes performance of the application
```

## Script Templates

To ensure consistency and efficiency, we use templates for different types of scripts. These templates provide a standardized structure and include common functionality that can be reused across scripts.

### Component Generator Template

```powershell
# Component Generator Template
# This template is used to generate React components

param (
    [string]$componentName,
    [string]$domainPath,
    [string]$description,
    [switch]$useEmotion = $false,
    [switch]$useGlobalCss = $false
)

# Configuration
$componentPath = "$domainPath\components\$componentName"
$indexPath = "$componentPath\index.tsx"
$typesPath = "$componentPath\types.ts"

# Create style files based on the selected styling approach
if ($useEmotion) {
    $stylesPath = "$componentPath\styles.ts"
}
elseif ($useGlobalCss) {
    $stylesPath = "$componentPath\global.css"
}
else {
    $stylesPath = "$componentPath\styles.ts"
}

# Ensure the directory exists
New-DirectoryIfNotExists -path $componentPath

# Create types file with proper TypeScript typing
$typesContent = @"
/**
 * $componentName Types
 *
 * @description Type definitions for $componentName component
 */
import React from 'react';

export interface ${componentName}Props {
  /**
   * Optional className for custom styling
   */
  className?: string;

  /**
   * Children elements
   */
  children?: React.ReactNode;

  // Add more props as needed
}
"@

# Create styles file based on the selected styling approach
# ... (styles file content generation)

# Create index file with proper TypeScript typing and avoiding unused variables
# ... (index file content generation)

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $stylesPath -Value $stylesContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force

Write-Host "Created component $componentName at $componentPath" -ForegroundColor Green
```

### Test Generator Template

```powershell
# Test Generator Template
# This template is used to generate tests for components and functions

param (
    [string]$testName,
    [string]$testPath,
    [string]$targetPath,
    [string]$testType = "component" # component, unit, integration, visual
)

# Configuration
$testFilePath = "$testPath\$testName.test.tsx"

# Ensure the directory exists
New-DirectoryIfNotExists -path $testPath

# Create test file based on the test type
switch ($testType) {
    "component" {
        $testContent = @"
/**
 * $testName Component Test
 *
 * @description Tests for the $testName component
 */
import React from 'react';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { $testName } from '$targetPath';

describe('$testName Component', () => {
  it('renders correctly', () => {
    render(<$testName />);
    // Add assertions here
  });

  it('handles user interactions', async () => {
    render(<$testName />);
    // Add user interaction tests here
  });

  // Add more tests as needed
});
"@
    }
    "unit" {
        $testContent = @"
/**
 * $testName Unit Test
 *
 * @description Unit tests for the $testName function
 */
import { $testName } from '$targetPath';

describe('$testName Function', () => {
  it('returns the expected result', () => {
    // Add assertions here
  });

  it('handles edge cases', () => {
    // Add edge case tests here
  });

  // Add more tests as needed
});
"@
    }
    # Add cases for other test types
}

# Save the test file
Set-Content -Path $testFilePath -Value $testContent -Force

Write-Host "Created test $testName at $testFilePath" -ForegroundColor Green
```

### Documentation Generator Template

```powershell
# Documentation Generator Template
# This template is used to generate documentation for components and functions

param (
    [string]$docName,
    [string]$docPath,
    [string]$targetPath,
    [string]$docType = "component" # component, function, module, system
)

# Configuration
$docFilePath = "$docPath\$docName.md"

# Ensure the directory exists
New-DirectoryIfNotExists -path $docPath

# Create documentation file based on the doc type
switch ($docType) {
    "component" {
        $docContent = @"
# $docName Component

## Overview

The $docName component is responsible for...

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| prop1 | string | '' | Description of prop1 |
| prop2 | number | 0 | Description of prop2 |

## Usage

```tsx
import { $docName } from '$targetPath';

const MyComponent = () => {
  return <$docName prop1="value" prop2={42} />;
};
```

## Implementation Details

The $docName component is implemented using...

## Related Components

- RelatedComponent1
- RelatedComponent2
"@
    }
    # Add cases for other doc types
}

# Save the documentation file
Set-Content -Path $docFilePath -Value $docContent -Force

Write-Host "Created documentation $docName at $docFilePath" -ForegroundColor Green
```

## Common Script Patterns

All scripts follow common patterns to ensure consistency and reliability:

1. **Configuration Section**: Define all configuration variables at the top of the script.
2. **Function Definitions**: Define all functions before using them.
3. **Directory Creation**: Create all necessary directories before generating files.
4. **Error Handling**: Include robust error handling to catch and report issues.
5. **Logging**: Log all actions and their results for debugging purposes.
6. **Chunking**: Break large operations into smaller chunks to avoid timeouts.
7. **Verification**: Verify the results of each operation before proceeding.

## Best Practices

To ensure the success of our script-based approach, we follow these best practices:

1. **Thorough Planning**: Plan each phase thoroughly before creating scripts.
2. **Small Chunks**: Break scripts into small, manageable chunks (max 250 lines per execution).
3. **Incremental Testing**: Test each script incrementally to catch issues early.
4. **Version Control**: Commit scripts to version control before executing them.
5. **Documentation**: Document the purpose and usage of each script.
6. **Error Recovery**: Design scripts to be idempotent and recoverable from errors.
7. **Performance Optimization**: Optimize scripts for performance to reduce execution time.

## Related Documents

- [Project Checklist](./01_project_checklist.md) - Project requirements and milestones
- [Project Inventory](./02_project_inventory.md) - Documentation inventory and status
- [Directory Structure Map](./05_directory_structure_map.md) - Project directory structure
- [Dependency Inventory](./06_dependency_inventory.md) - Inventory of dependencies and inscription IDs
 
``` 
 
--- 
 
### 08_phase_implementation_template.md 
 
```.md 
# Phase Implementation Template

This document outlines the standard template flow for implementing each phase of the Bitcoin Protozoa project. It provides a systematic approach to ensure consistency, efficiency, and adherence to the project's architecture and design principles.

## Table of Contents

1. [Implementation Flow](#implementation-flow)
2. [Required Resources](#required-resources)
3. [Phase-Specific Resources](#phase-specific-resources)
4. [Script Generation Process](#script-generation-process)
5. [Implementation Process](#implementation-process)
6. [Testing Process](#testing-process)
7. [Documentation Process](#documentation-process)
8. [Verification Process](#verification-process)

## Implementation Flow

The implementation of each phase follows this standard flow:

1. **Preparation**
   - Review phase requirements from project checklist
   - Identify required resources from bitcoin_protozoa directory
   - Analyze existing code and dependencies
   - Create implementation plan

2. **Script Generation**
   - Generate scripts for the phase using the script generator
   - Review and refine the generated scripts
   - Create execution plan

3. **Implementation**
   - Execute the scripts in the specified order
   - Implement core functionality
   - Integrate with existing systems
   - Optimize performance

4. **Testing**
   - Write and execute unit tests
   - Perform integration testing
   - Conduct visual regression testing (if applicable)
   - Verify Bitcoin integration (if applicable)

5. **Documentation**
   - Update project checklist
   - Update project inventory
   - Document implementation details
   - Create code examples

6. **Verification**
   - Verify adherence to architecture and design principles
   - Ensure compatibility with Bitcoin inscriptions
   - Validate performance against benchmarks
   - Confirm all tests pass

## Required Resources

For each phase, the following resources from the bitcoin_protozoa directory are required:

### Core Architecture Resources

- **[bitcoin_protozoa/core/01_core_architecture.md](../core/01_core_architecture.md)**: Provides the high-level architecture overview
- **[bitcoin_protozoa/core/02_system_architecture.md](../core/02_system_architecture.md)**: Details the system architecture
- **[bitcoin_protozoa/core/03_module_structure.md](../core/03_module_structure.md)**: Defines the module organization
- **[bitcoin_protozoa/core/04_asset_management.md](../core/04_asset_management.md)**: Outlines asset management strategies
- **[bitcoin_protozoa/core/05_component_architecture.md](../core/05_component_architecture.md)**: Describes component architecture

### Project Management Resources

- **[bitcoin_protozoa/project/01_project_checklist.md](./01_project_checklist.md)**: Lists all project requirements and tasks
- **[bitcoin_protozoa/project/02_project_inventory.md](./02_project_inventory.md)**: Provides inventory of documentation and status
- **[bitcoin_protozoa/project/03_roadmap_and_questions.md](./03_roadmap_and_questions.md)**: Contains roadmap and key questions
- **[bitcoin_protozoa/project/05_directory_structure_map.md](./05_directory_structure_map.md)**: Maps the project directory structure
- **[bitcoin_protozoa/project/06_dependency_inventory.md](./06_dependency_inventory.md)**: Lists dependencies and inscription IDs
- **[bitcoin_protozoa/project/07_script_based_implementation.md](./07_script_based_implementation.md)**: Describes script-based implementation approach

### Testing Resources

- **[bitcoin_protozoa/testing/01_testing_strategy.md](../testing/01_testing_strategy.md)**: Outlines testing approach
- **[bitcoin_protozoa/testing/02_unit_testing.md](../testing/02_unit_testing.md)**: Details unit testing approach
- **[bitcoin_protozoa/testing/03_integration_testing.md](../testing/03_integration_testing.md)**: Describes integration testing approach
- **[bitcoin_protozoa/testing/04_development_ui.md](../testing/04_development_ui.md)**: Provides development UI guidelines

### Engine Resources

- **[bitcoin_protozoa/engine/01_engine_overview.md](../engine/01_engine_overview.md)**: Provides engine overview
- **[bitcoin_protozoa/engine/02_physics_system.md](../engine/02_physics_system.md)**: Details physics system
- **[bitcoin_protozoa/engine/03_particle_system.md](../engine/03_particle_system.md)**: Describes particle system
- **[bitcoin_protozoa/engine/04_performance_considerations.md](../engine/04_performance_considerations.md)**: Outlines performance optimization guidelines

## Phase-Specific Resources

In addition to the core resources, each phase requires specific resources:

### Phase 1: Core Systems

- **[bitcoin_protozoa/particles/01_particle_system.md](../particles/01_particle_system.md)**: Details particle system design
- **[bitcoin_protozoa/particles/02_particle_types.md](../particles/02_particle_types.md)**: Describes particle types
- **[bitcoin_protozoa/particles/03_particle_behaviors.md](../particles/03_particle_behaviors.md)**: Outlines particle behaviors
- **[bitcoin_protozoa/engine/02_physics_system.md](../engine/02_physics_system.md)**: Details physics system

### Phase 2: Bitcoin Integration

- **[bitcoin_protozoa/bitcoin/01_blockchain_integration.md](../bitcoin/01_blockchain_integration.md)**: Outlines Bitcoin integration
- **[bitcoin_protozoa/bitcoin/02_evolution_mechanics.md](../bitcoin/02_evolution_mechanics.md)**: Describes evolution mechanics
- **[bitcoin_protozoa/bitcoin/03_rng_system.md](../bitcoin/03_rng_system.md)**: Details RNG system
- **[bitcoin_protozoa/bitcoin/04_bitcoin_integration_approach.md](../bitcoin/04_bitcoin_integration_approach.md)**: Outlines integration approach
- **[bitcoin_protozoa/bitcoin/05_bitcoin_integration_details_part1.md](../bitcoin/05_bitcoin_integration_details_part1.md)**: Provides integration details
- **[bitcoin_protozoa/bitcoin/06_bitcoin_onchain_resources.md](../bitcoin/06_bitcoin_onchain_resources.md)**: Lists on-chain resources

### Phase 3: Visual Traits

- **[bitcoin_protozoa/traits/01_color_palettes.md](../traits/01_color_palettes.md)**: Details color palette design
- **[bitcoin_protozoa/traits/02_particle_shapes.md](../traits/02_particle_shapes.md)**: Describes particle shape design
- **[bitcoin_protozoa/traits/07_visual_effects.md](../traits/07_visual_effects.md)**: Outlines visual effects

### Phase 4: Particle Roles and Hierarchy

- **[bitcoin_protozoa/traits/03_particle_roles.md](../traits/03_particle_roles.md)**: Details particle role design
- **[bitcoin_protozoa/traits/04_role_hierarchy.md](../traits/04_role_hierarchy.md)**: Describes role hierarchy
- **[bitcoin_protozoa/traits/05_role_behaviors.md](../traits/05_role_behaviors.md)**: Outlines role-specific behaviors

### Phase 5: Force Fields

- **[bitcoin_protozoa/physics/01_force_fields.md](../physics/01_force_fields.md)**: Details force field design
- **[bitcoin_protozoa/physics/02_force_calculations.md](../physics/02_force_calculations.md)**: Describes force calculations
- **[bitcoin_protozoa/physics/03_field_interactions.md](../physics/03_field_interactions.md)**: Outlines field interactions

### Phase 6: UI Implementation

- **[bitcoin_protozoa/ui/01_ui_overview.md](../ui/01_ui_overview.md)**: Provides UI overview
- **[bitcoin_protozoa/ui/02_component_library.md](../ui/02_component_library.md)**: Details component library
- **[bitcoin_protozoa/ui/03_layout_system.md](../ui/03_layout_system.md)**: Describes layout system
- **[bitcoin_protozoa/ui/04_theme_system.md](../ui/04_theme_system.md)**: Outlines theme system

### Phase 7: Advanced Behaviors

- **[bitcoin_protozoa/behaviors/01_behavior_overview.md](../behaviors/01_behavior_overview.md)**: Provides behavior overview
- **[bitcoin_protozoa/behaviors/02_flocking.md](../behaviors/02_flocking.md)**: Details flocking behavior
- **[bitcoin_protozoa/behaviors/03_group_behaviors.md](../behaviors/03_group_behaviors.md)**: Describes group behaviors
- **[bitcoin_protozoa/behaviors/04_emergent_behaviors.md](../behaviors/04_emergent_behaviors.md)**: Outlines emergent behaviors

## Script Generation Process

The script generation process follows these steps:

1. **Analyze Project Documentation**
   ```powershell
   # Generate scripts for a specific phase
   .\scripts\common\script-generator.ps1 -phase "phase_X"
   ```

2. **Review Generated Scripts**
   - Check the scripts in the `scripts/phase_X` directory
   - Verify the execution plan in `scripts/phase_X/execution-plan.md`

3. **Refine Scripts if Necessary**
   - Modify the scripts to match the specific requirements of the phase
   - Ensure all scripts follow the project's coding standards

## Implementation Process

The implementation process follows these steps:

1. **Execute Generator Scripts**
   ```powershell
   # Execute the generator scripts for the phase
   .\scripts\execute-phase-scripts.ps1 -phase "phase_X" -generatorsOnly
   ```

2. **Execute Implementation Scripts**
   ```powershell
   # Execute the implementation scripts for the phase
   .\scripts\execute-phase-scripts.ps1 -phase "phase_X" -implementationOnly
   ```

3. **Verify Implementation**
   - Check that all components are properly implemented
   - Ensure integration with existing systems
   - Verify adherence to architecture and design principles

## Testing Process

The testing process follows these steps:

1. **Execute Test Generator Scripts**
   ```powershell
   # Execute the test generator scripts for the phase
   .\scripts\execute-phase-scripts.ps1 -phase "phase_X" -testGeneratorsOnly
   ```

2. **Execute Tests**
   ```powershell
   # Execute the tests for the phase
   npm test -- --testPathPattern="phase_X"
   ```

3. **Verify Test Results**
   - Check that all tests pass
   - Ensure adequate test coverage
   - Verify edge cases are properly tested

## Documentation Process

The documentation process follows these steps:

1. **Execute Documentation Generator Scripts**
   ```powershell
   # Execute the documentation generator scripts for the phase
   .\scripts\execute-phase-scripts.ps1 -phase "phase_X" -documentationGeneratorsOnly
   ```

2. **Update Project Documentation**
   ```powershell
   # Update the project checklist and inventory
   .\scripts\update-project-docs.ps1 -phase "phase_X"
   ```

3. **Verify Documentation**
   - Check that all documentation is up-to-date
   - Ensure code examples are provided
   - Verify adherence to documentation standards

## Verification Process

The verification process follows these steps:

1. **Verify Adherence to Architecture**
   - Check that the implementation follows the system architecture
   - Ensure proper module organization
   - Verify component architecture

2. **Verify Bitcoin Integration**
   - Check that the implementation works with Bitcoin data
   - Ensure deterministic behavior based on Bitcoin block data
   - Verify compatibility with inscriptions

3. **Verify Performance**
   - Check that the implementation meets performance benchmarks
   - Ensure efficient resource usage
   - Verify smooth animation at 60fps

4. **Verify Test Coverage**
   - Check that all code is adequately tested
   - Ensure edge cases are covered
   - Verify integration tests pass

5. **Update Phase Status**
   ```powershell
   # Mark the phase as complete
   .\scripts\update-phase-status.ps1 -phase "phase_X" -status "Complete"
   ```

By following this template flow for each phase, we ensure a systematic, efficient approach to implementing the Bitcoin Protozoa project, adhering to the architecture and design principles outlined in the project documentation.
 
``` 
 
--- 
 
