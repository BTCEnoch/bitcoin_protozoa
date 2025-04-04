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
