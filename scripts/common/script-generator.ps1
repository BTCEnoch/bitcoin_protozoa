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
    "role definition" = "role-definition-generator.ps1";
    "role behavior" = "role-behavior-generator.ps1";
    "role hierarchy" = "role-hierarchy-generator.ps1";
    "role interaction" = "role-interaction-generator.ps1";
    "role visualization" = "role-visualization-generator.ps1";
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
    "force field definition" = "force-field-definition-generator.ps1";
    "force field behavior" = "force-field-behavior-generator.ps1";
    # Add more mappings as needed
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

# Generate each script
Write-Host "Generating scripts..." -ForegroundColor Cyan
foreach ($script in $requiredScripts) {
    $scriptPath = Join-Path -Path $outputDir -ChildPath $script

    # Generate the script content based on the script name
    $scriptContent = "# $script`n# Generated by the Script Generator`n`n"
    $scriptContent += "# This script is part of the $phase implementation`n`n"

    # Add specific content based on the script name
    if ($script -like "*-generator.ps1") {
        $scriptContent += "# This script generates code for the $phase`n`n"
        $scriptContent += "# Configuration`n"
        $scriptContent += '$outputDir = "src/domains"' + "`n`n"
        $scriptContent += "# Ensure the output directory exists`n"
        $scriptContent += 'if (-not (Test-Path -Path $outputDir)) {' + "`n"
        $scriptContent += '    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null' + "`n"
        $scriptContent += '    Write-Host "Created directory: $outputDir"' + "`n"
        $scriptContent += "}`n`n"
        $scriptContent += "# Generate code here`n"
        $scriptContent += "# ..."
    }
    elseif ($script -like "implement-*.ps1") {
        $scriptContent += "# This script implements functionality for the $phase`n`n"
        $scriptContent += "# Configuration`n"
        $scriptContent += '$domainPath = "src/domains"' + "`n`n"
        $scriptContent += "# Ensure the domain directory exists`n"
        $scriptContent += 'if (-not (Test-Path -Path $domainPath)) {' + "`n"
        $scriptContent += '    New-Item -ItemType Directory -Path $domainPath -Force | Out-Null' + "`n"
        $scriptContent += '    Write-Host "Created directory: $domainPath"' + "`n"
        $scriptContent += "}`n`n"
        $scriptContent += "# Implementation code here`n"
        $scriptContent += "# ..."
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
