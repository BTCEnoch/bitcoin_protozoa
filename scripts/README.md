# Bitcoin Protozoa Scripts

This directory contains scripts for implementing the Bitcoin Protozoa project in systematic phases using PowerShell scripts for bulk batch processing.

## Table of Contents

1. [Overview](#overview)
2. [Script Organization](#script-organization)
3. [Usage](#usage)
4. [Script Descriptions](#script-descriptions)
5. [Examples](#examples)
6. [Troubleshooting](#troubleshooting)

## Overview

The Bitcoin Protozoa project is implemented using a systematic, script-based approach that prioritizes bulk batch processing over individual edits. This approach significantly improves efficiency, reduces implementation time, and ensures consistency across the codebase.

## Script Organization

Scripts are organized by phase and purpose:

```
scripts/
├── phase_1/                      # Core Systems scripts
├── phase_2/                      # Bitcoin Integration scripts
├── phase_3/                      # Visual Traits scripts
├── phase_4/                      # Particle Roles and Hierarchy scripts
├── phase_5/                      # Force Fields scripts
├── phase_6/                      # UI Implementation scripts
├── phase_7/                      # Advanced Behaviors scripts
├── common/                       # Common scripts
│   ├── script-generator.ps1      # Generates scripts for a specific phase
│   └── template-generator.ps1    # Generates templates for different types of scripts
├── templates/                    # Script templates
│   ├── component-generator-template.ps1
│   ├── test-generator-template.ps1
│   └── documentation-generator-template.ps1
├── master-script-generator.ps1   # Generates scripts for all phases
├── execute-phase-scripts.ps1     # Executes scripts for a specific phase
├── update-project-docs.ps1       # Updates project documentation after a phase is completed
└── execute-phase.ps1             # Orchestrates the entire process for a phase
```

## Usage

### Generating Scripts for a Phase

To generate scripts for a specific phase, run:

```powershell
.\scripts\common\script-generator.ps1 -phase "phase_4"
```

### Generating Scripts for All Phases

To generate scripts for all phases, run:

```powershell
.\scripts\master-script-generator.ps1
```

### Executing Scripts for a Phase

To execute scripts for a specific phase, run:

```powershell
.\scripts\execute-phase-scripts.ps1 -phase "phase_4"
```

To perform a dry run without actually executing the scripts, add the `-dryRun` switch:

```powershell
.\scripts\execute-phase-scripts.ps1 -phase "phase_4" -dryRun
```

### Updating Project Documentation

To update the project checklist and inventory after a phase is completed, run:

```powershell
.\scripts\update-project-docs.ps1 -phase "phase_4"
```

To perform a dry run without actually updating the documentation, add the `-dryRun` switch:

```powershell
.\scripts\update-project-docs.ps1 -phase "phase_4" -dryRun
```

### Orchestrating the Entire Process for a Phase

To orchestrate the entire process for a phase (generate scripts, execute them, and update documentation), run:

```powershell
.\scripts\execute-phase.ps1 -phase "phase_4"
```

To generate scripts only without executing them or updating documentation, add the `-generateOnly` switch:

```powershell
.\scripts\execute-phase.ps1 -phase "phase_4" -generateOnly
```

To perform a dry run without actually executing the scripts or updating documentation, add the `-dryRun` switch:

```powershell
.\scripts\execute-phase.ps1 -phase "phase_4" -dryRun
```

## Script Descriptions

### master-script-generator.ps1

This script generates scripts for all phases of the Bitcoin Protozoa project. It calls the script generator for each phase.

### common/script-generator.ps1

This script generates scripts for a specific phase of the Bitcoin Protozoa project. It reads the configuration from the project checklist and inventory, identifies the required scripts, and generates each script using the appropriate template.

### common/template-generator.ps1

This script generates templates for different types of scripts, such as component generators, test generators, and documentation generators.

### execute-phase-scripts.ps1

This script executes all the scripts for a specific phase of the Bitcoin Protozoa project. It reads the execution plan and executes each script in the specified order.

### update-project-docs.ps1

This script updates the project checklist and inventory after a phase is completed. It marks tasks as completed and updates the implementation status.

### execute-phase.ps1

This script orchestrates the entire process for a phase of the Bitcoin Protozoa project. It generates scripts, executes them, and updates the project documentation.

## Examples

### Example 1: Generate and Execute Scripts for Phase 4

```powershell
# Generate scripts for Phase 4
.\scripts\common\script-generator.ps1 -phase "phase_4"

# Execute scripts for Phase 4
.\scripts\execute-phase-scripts.ps1 -phase "phase_4"

# Update project documentation for Phase 4
.\scripts\update-project-docs.ps1 -phase "phase_4"
```

### Example 2: Orchestrate the Entire Process for Phase 4

```powershell
# Orchestrate the entire process for Phase 4
.\scripts\execute-phase.ps1 -phase "phase_4"
```

## Troubleshooting

### Script Generation Issues

If you encounter issues with script generation, check the following:

1. Make sure the project checklist and inventory files exist and are properly formatted
2. Check the script generator for errors
3. Try running the script generator with a different phase

### Script Execution Issues

If you encounter issues with script execution, check the following:

1. Make sure the scripts were generated correctly
2. Check the execution plan for errors
3. Try running the scripts individually to identify the problematic script

### Documentation Update Issues

If you encounter issues with documentation updates, check the following:

1. Make sure the project checklist and inventory files exist and are properly formatted
2. Check the regular expressions in the update-project-docs.ps1 script
3. Try updating the documentation manually
