# Master Script Generator
# This script generates all the scripts needed for all phases of the Bitcoin Protozoa project

# Configuration
$phases = @(
    "phase_4", # Particle Roles and Hierarchy
    "phase_5", # Force Fields
    "phase_6", # UI Implementation
    "phase_7"  # Advanced Behaviors
)

$configPath = "bitcoin_protozoa/project/01_project_checklist.md"
$inventoryPath = "bitcoin_protozoa/project/02_project_inventory.md"

# Function to generate scripts for a phase
function Generate-Scripts-For-Phase {
    param (
        [string]$phase
    )
    
    Write-Host "Generating scripts for $phase..." -ForegroundColor Cyan
    
    # Call the script generator for the phase
    & "$PSScriptRoot\common\script-generator.ps1" -phase $phase -configPath $configPath -inventoryPath $inventoryPath
    
    Write-Host "Completed script generation for $phase." -ForegroundColor Green
    Write-Host ""
}

# Main script
Write-Host "Bitcoin Protozoa - Master Script Generator" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Generate scripts for each phase
foreach ($phase in $phases) {
    Generate-Scripts-For-Phase -phase $phase
}

Write-Host "All scripts have been generated successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review the generated scripts" -ForegroundColor Yellow
Write-Host "2. Execute the scripts in the order specified in the execution plans" -ForegroundColor Yellow
Write-Host "3. Test the implementation" -ForegroundColor Yellow
Write-Host "4. Update the project checklist and inventory" -ForegroundColor Yellow
Write-Host ""
