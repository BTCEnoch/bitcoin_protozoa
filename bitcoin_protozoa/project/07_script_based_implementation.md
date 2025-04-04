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
