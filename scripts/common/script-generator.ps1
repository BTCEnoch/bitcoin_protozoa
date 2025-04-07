# Script Generator
# This script generates scripts for a specific phase of the Bitcoin Protozoa project

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

# Extract phase-specific tasks from the project checklist
Write-Host "Analyzing project documentation for $phase..." -ForegroundColor Cyan

# Use regex to find phase-specific sections in the documentation
$phasePattern = "### $($phase.Replace('phase_', 'Phase ')) Tasks"
if ($config -match $phasePattern) {
    Write-Host "Found $phase section in project checklist." -ForegroundColor Green

    # Extract tasks from the phase section
    $taskMatches = [regex]::Matches($config, "- \[[ x]\] ([^\n]+)")
    $tasks = $taskMatches | ForEach-Object { $_.Groups[1].Value.Trim() }

    Write-Host "Identified $($tasks.Count) tasks for $phase." -ForegroundColor Green

    # Log the tasks for debugging
    foreach ($task in $tasks) {
        Write-Host "  - $task" -ForegroundColor Gray
    }
}

# Extract implementation items from the project inventory
$inventoryPattern = "### [^\n]+\n\n\| Item \| Status \| Priority \| Documentation References \| Notes \|\n\|------|--------|----------|--------------------------|-------|\n((?:\|[^\n]+\n)+)"
if ($inventory -match $inventoryPattern) {
    Write-Host "Found implementation items in project inventory." -ForegroundColor Green

    # Extract items from the inventory section
    $itemMatches = [regex]::Matches($inventory, "\| ([^|]+) \| [^|]+ \| [^|]+ \| [^|]+ \| [^|]+ \|")
    $items = $itemMatches | ForEach-Object { $_.Groups[1].Value.Trim() }

    Write-Host "Identified $($items.Count) implementation items." -ForegroundColor Green

    # Log the items for debugging
    foreach ($item in $items) {
        Write-Host "  - $item" -ForegroundColor Gray
    }
}

# Add scripts based on the phase and the extracted tasks/items
Write-Host "Determining required scripts for $phase..." -ForegroundColor Cyan
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
    "phase_5" {
        # Force Fields scripts
        $requiredScripts += @(
            "force-field-definition-generator.ps1",
            "force-field-behavior-generator.ps1",
            "force-field-interaction-generator.ps1",
            "force-field-visualization-generator.ps1",
            "force-field-state-management-generator.ps1",
            "force-field-testing-generator.ps1",
            "force-field-documentation-generator.ps1",
            "implement-attraction-field.ps1",
            "implement-repulsion-field.ps1",
            "implement-vortex-field.ps1",
            "implement-boundary-field.ps1",
            "implement-noise-field.ps1",
            "implement-field-combination.ps1",
            "implement-field-visualization.ps1",
            "implement-field-tests.ps1"
        )
    }
    "phase_6" {
        # UI Implementation scripts
        $requiredScripts += @(
            "ui-component-generator.ps1",
            "ui-layout-generator.ps1",
            "ui-state-management-generator.ps1",
            "ui-interaction-generator.ps1",
            "ui-testing-generator.ps1",
            "ui-documentation-generator.ps1",
            "implement-main-interface.ps1",
            "implement-control-panel.ps1",
            "implement-stats-display.ps1",
            "implement-visualization-controls.ps1",
            "implement-settings-panel.ps1",
            "implement-help-system.ps1",
            "implement-responsive-layout.ps1",
            "implement-theme-system.ps1",
            "implement-ui-tests.ps1"
        )
    }
    "phase_7" {
        # Advanced Behaviors scripts
        $requiredScripts += @(
            "behavior-definition-generator.ps1",
            "behavior-implementation-generator.ps1",
            "behavior-interaction-generator.ps1",
            "behavior-visualization-generator.ps1",
            "behavior-state-management-generator.ps1",
            "behavior-testing-generator.ps1",
            "behavior-documentation-generator.ps1",
            "implement-flocking-behavior.ps1",
            "implement-predator-prey-behavior.ps1",
            "implement-pathfinding-behavior.ps1",
            "implement-obstacle-avoidance-behavior.ps1",
            "implement-goal-seeking-behavior.ps1",
            "implement-behavior-combination.ps1",
            "implement-behavior-visualization.ps1",
            "implement-behavior-tests.ps1"
        )
    }
    default {
        Write-Host "Unknown phase: $phase" -ForegroundColor Red
        exit 1
    }
}

# Map tasks and items to scripts
Write-Host "Mapping tasks and items to scripts..." -ForegroundColor Cyan

# Create a mapping of task/item patterns to script names
$scriptMappings = @{
    # Phase 4: Particle Roles and Hierarchy
    "role definition" = "role-definition-generator.ps1";
    "role behavior" = "role-behavior-generator.ps1";
    "role hierarchy" = "role-hierarchy-generator.ps1";
    "role interaction" = "role-interaction-generator.ps1";
    "role visualization generator" = "role-visualization-generator.ps1";
    "role state management" = "role-state-management-generator.ps1";
    "role testing" = "role-testing-generator.ps1";
    "role documentation" = "role-documentation-generator.ps1";
    "core role" = "implement-core-role.ps1";
    "control role" = "implement-control-role.ps1";
    "movement role" = "implement-movement-role.ps1";
    "defense role" = "implement-defense-role.ps1";
    "attack role" = "implement-attack-role.ps1";
    "role assignment" = "implement-role-assignment.ps1";
    "role evolution" = "implement-role-evolution.ps1";
    "role visualization implementation" = "implement-role-visualization.ps1";
    "role tests" = "implement-role-tests.ps1";
    "role force matrix" = "implement-role-force-matrix.ps1";
    "role influence" = "implement-role-influence.ps1";
    "role containment" = "implement-role-containment.ps1";

    # Phase 5: Force Field System
    "force field definition" = "force-field-definition-generator.ps1";
    "force field behavior" = "force-field-behavior-generator.ps1";
    "force field interaction" = "force-field-interaction-generator.ps1";
    "force field visualization generator" = "force-field-visualization-generator.ps1";
    "force field state management" = "force-field-state-management-generator.ps1";
    "force field testing" = "force-field-testing-generator.ps1";
    "force field documentation" = "force-field-documentation-generator.ps1";
    "core force field" = "implement-core-force-field.ps1";
    "control force field" = "implement-control-force-field.ps1";
    "movement force field" = "implement-movement-force-field.ps1";
    "defense force field" = "implement-defense-force-field.ps1";
    "attack force field" = "implement-attack-force-field.ps1";
    "force field generation" = "implement-force-field-generation.ps1";
    "force field evolution" = "implement-force-field-evolution.ps1";
    "force field visualization implementation" = "implement-force-field-visualization.ps1";
    "force field tests" = "implement-force-field-tests.ps1";
    "field particle interaction" = "implement-field-particle-interaction.ps1";
    "field field interaction" = "implement-field-field-interaction.ps1";
    "hierarchical influence" = "implement-hierarchical-influence.ps1";

    # Phase 6: UI Elements
    "ui component" = "ui-component-generator.ps1";
    "ui layout" = "ui-layout-generator.ps1";
    "ui state management" = "ui-state-management-generator.ps1";
    "ui interaction" = "ui-interaction-generator.ps1";
    "ui testing" = "ui-testing-generator.ps1";
    "ui documentation" = "ui-documentation-generator.ps1";
    "main interface" = "implement-main-interface.ps1";
    "control panel" = "implement-control-panel.ps1";
    "stats display" = "implement-stats-display.ps1";
    "visualization controls" = "implement-visualization-controls.ps1";
    "settings panel" = "implement-settings-panel.ps1";
    "help system" = "implement-help-system.ps1";
    "responsive layout" = "implement-responsive-layout.ps1";
    "theme system" = "implement-theme-system.ps1";
    "ui tests" = "implement-ui-tests.ps1";

    # Phase 7: Advanced Behaviors
    "behavior definition" = "behavior-definition-generator.ps1";
    "behavior implementation" = "behavior-implementation-generator.ps1";
    "behavior interaction" = "behavior-interaction-generator.ps1";
    "behavior visualization generator" = "behavior-visualization-generator.ps1";
    "behavior state management" = "behavior-state-management-generator.ps1";
    "behavior testing" = "behavior-testing-generator.ps1";
    "behavior documentation" = "behavior-documentation-generator.ps1";
    "flocking behavior" = "implement-flocking-behavior.ps1";
    "predator prey behavior" = "implement-predator-prey-behavior.ps1";
    "pathfinding behavior" = "implement-pathfinding-behavior.ps1";
    "obstacle avoidance behavior" = "implement-obstacle-avoidance-behavior.ps1";
    "goal seeking behavior" = "implement-goal-seeking-behavior.ps1";
    "behavior combination" = "implement-behavior-combination.ps1";
    "behavior visualization implementation" = "implement-behavior-visualization.ps1";
    "behavior tests" = "implement-behavior-tests.ps1";
}

# Add scripts based on tasks and items
if ($null -ne $tasks) {
    foreach ($task in $tasks) {
        foreach ($pattern in $scriptMappings.Keys) {
            if ($task -match $pattern) {
                $script = $scriptMappings[$pattern]
                if (-not $requiredScripts.Contains($script)) {
                    $requiredScripts += $script
                    Write-Host "  Added $script based on task: $task" -ForegroundColor Green
                }
            }
        }
    }
}

if ($null -ne $items) {
    foreach ($item in $items) {
        foreach ($pattern in $scriptMappings.Keys) {
            if ($item -match $pattern) {
                $script = $scriptMappings[$pattern]
                if (-not $requiredScripts.Contains($script)) {
                    $requiredScripts += $script
                    Write-Host "  Added $script based on item: $item" -ForegroundColor Green
                }
            }
        }
    }
}

# If no scripts were added based on tasks/items, use the predefined list
if ($requiredScripts.Count -eq 0) {
    Write-Host "No scripts were determined from tasks/items. Using predefined list." -ForegroundColor Yellow
}

# Function to add default script content
function AddDefaultScriptContent {
    param(
        [string]$script,
        [string]$phase,
        [ref]$scriptContentRef
    )

    if ($script -like "*-generator.ps1") {
        $scriptContentRef.Value += "# This script generates code for the $phase`n`n"
        $scriptContentRef.Value += "# Configuration`n"
        $scriptContentRef.Value += '$outputDir = "src/domains"' + "`n`n"
        $scriptContentRef.Value += "# Ensure the output directory exists`n"
        $scriptContentRef.Value += 'if (-not (Test-Path -Path $outputDir)) {' + "`n"
        $scriptContentRef.Value += '    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null' + "`n"
        $scriptContentRef.Value += '    Write-Host "Created directory: $outputDir"' + "`n"
        $scriptContentRef.Value += "}`n`n"
        $scriptContentRef.Value += "# Generate code here`n"
        $scriptContentRef.Value += "# ..."
    }
    elseif ($script -like "implement-*.ps1") {
        $scriptContentRef.Value += "# This script implements functionality for the $phase`n`n"
        $scriptContentRef.Value += "# Configuration`n"
        $scriptContentRef.Value += '$domainPath = "src/domains"' + "`n`n"
        $scriptContentRef.Value += "# Ensure the domain directory exists`n"
        $scriptContentRef.Value += 'if (-not (Test-Path -Path $domainPath)) {' + "`n"
        $scriptContentRef.Value += '    New-Item -ItemType Directory -Path $domainPath -Force | Out-Null' + "`n"
        $scriptContentRef.Value += '    Write-Host "Created directory: $domainPath"' + "`n"
        $scriptContentRef.Value += "}`n`n"
        $scriptContentRef.Value += "# Implementation code here`n"
        $scriptContentRef.Value += "# ..."
    }
}

# Generate each script
Write-Host "Generating scripts..." -ForegroundColor Cyan
foreach ($script in $requiredScripts) {
    $scriptPath = Join-Path -Path $outputDir -ChildPath $script

    # Generate the script content based on the script name
    $scriptContent = "# $script`n# Generated by the Script Generator`n`n"
    $scriptContent += "# This script is part of the $phase implementation`n`n"

    # Define template mappings
    $templateMappings = @{
        "implement-core-role.ps1" = "role-implementation-template.ps1";
        "implement-control-role.ps1" = "role-implementation-template.ps1";
        "implement-movement-role.ps1" = "role-implementation-template.ps1";
        "implement-defense-role.ps1" = "role-implementation-template.ps1";
        "implement-attack-role.ps1" = "role-implementation-template.ps1";
        "implement-role-force-matrix.ps1" = "role-force-matrix-template.ps1";
        "implement-role-tests.ps1" = "role-test-template.ps1";

        "implement-core-force-field.ps1" = "force-field-implementation-template.ps1";
        "implement-control-force-field.ps1" = "force-field-implementation-template.ps1";
        "implement-movement-force-field.ps1" = "force-field-implementation-template.ps1";
        "implement-defense-force-field.ps1" = "force-field-implementation-template.ps1";
        "implement-attack-force-field.ps1" = "force-field-implementation-template.ps1";
        "implement-field-field-interaction.ps1" = "field-interaction-template.ps1";
        "implement-force-field-tests.ps1" = "force-field-test-template.ps1";
    }

    # Define role name mappings
    $roleNameMappings = @{
        "implement-core-role.ps1" = "CORE";
        "implement-control-role.ps1" = "CONTROL";
        "implement-movement-role.ps1" = "MOVEMENT";
        "implement-defense-role.ps1" = "DEFENSE";
        "implement-attack-role.ps1" = "ATTACK";
    }

    # Define force field type mappings
    $fieldTypeMappings = @{
        "implement-core-force-field.ps1" = "CORE";
        "implement-control-force-field.ps1" = "CONTROL";
        "implement-movement-force-field.ps1" = "MOVEMENT";
        "implement-defense-force-field.ps1" = "DEFENSE";
        "implement-attack-force-field.ps1" = "ATTACK";
    }

    # Check if we have a template for this script
    if ($templateMappings.ContainsKey($script)) {
        $templatePath = Join-Path -Path "scripts/templates" -ChildPath $templateMappings[$script]

        if (Test-Path -Path $templatePath) {
            Write-Host "  Using template: $templatePath for $script" -ForegroundColor Green

            # For role implementation scripts
            if ($roleNameMappings.ContainsKey($script)) {
                $roleName = $roleNameMappings[$script]
                $scriptContent += "# Using template: $templatePath`n`n"
                $scriptContent += "# Execute the template with parameters`n"
                $scriptContent += "& '$templatePath' -roleName '$roleName'`n"
            }
            # For force field implementation scripts
            elseif ($fieldTypeMappings.ContainsKey($script)) {
                $fieldType = $fieldTypeMappings[$script]
                $scriptContent += "# Using template: $templatePath`n`n"
                $scriptContent += "# Execute the template with parameters`n"
                $scriptContent += "& '$templatePath' -fieldType '$fieldType'`n"
            }
            # For other template-based scripts
            else {
                $scriptContent += "# Using template: $templatePath`n`n"
                $scriptContent += "# Execute the template`n"
                $scriptContent += "& '$templatePath'`n"
            }
        }
        else {
            Write-Host "  Template not found: $templatePath" -ForegroundColor Red
            # Fall back to default content
            AddDefaultScriptContent -script $script -phase $phase -scriptContentRef ([ref]$scriptContent)
        }
    }
    else {
        # Add default content based on script type
        AddDefaultScriptContent -script $script -phase $phase -scriptContentRef ([ref]$scriptContent)
    }

    # Save the script
    Set-Content -Path $scriptPath -Value $scriptContent
    Write-Host "Generated script: $scriptPath" -ForegroundColor Green
}

# Create an execution plan
$executionPlanPath = Join-Path -Path $outputDir -ChildPath "execution-plan.md"
$executionPlanContent = "# Execution Plan for $phase`n`n"
$executionPlanContent += "Execute the scripts in the following order:`n`n"

foreach ($script in $requiredScripts) {
    $executionPlanContent += "1. $script`n"
}

Set-Content -Path $executionPlanPath -Value $executionPlanContent
Write-Host "Generated execution plan: $executionPlanPath"

Write-Host "Script generation completed successfully!"
