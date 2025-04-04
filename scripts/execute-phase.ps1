# Execute Phase
# This script orchestrates the entire process for a phase of the Bitcoin Protozoa project

param (
    [Parameter(Mandatory=$true)]
    [string]$phase,
    [switch]$generateOnly = $false,
    [switch]$dryRun = $false
)

# Configuration
$scriptsDir = "scripts/$phase"

# Function to ensure a directory exists
function New-DirectoryIfNotExists {
    param (
        [string]$path
    )

    if (-not (Test-Path -Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created directory: $path"
    }
}

# Main script
Write-Host "Bitcoin Protozoa - Execute Phase" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan
Write-Host ""

# Ensure the scripts directory exists
New-DirectoryIfNotExists -path $scriptsDir

# Step 1: Generate scripts for the phase
Write-Host "Step 1: Generate scripts for $phase" -ForegroundColor Cyan
Write-Host "--------------------------------" -ForegroundColor Cyan
Write-Host ""

& "$PSScriptRoot\common\script-generator.ps1" -phase $phase

Write-Host ""
Write-Host "Scripts generated successfully!" -ForegroundColor Green
Write-Host ""

if ($generateOnly) {
    Write-Host "Generate-only mode enabled. Skipping execution and documentation update." -ForegroundColor Yellow
    exit 0
}

# Step 2: Execute the scripts for the phase
Write-Host "Step 2: Execute scripts for $phase" -ForegroundColor Cyan
Write-Host "--------------------------------" -ForegroundColor Cyan
Write-Host ""

& "$PSScriptRoot\execute-phase-scripts.ps1" -phase $phase -dryRun:$dryRun

Write-Host ""
Write-Host "Scripts executed successfully!" -ForegroundColor Green
Write-Host ""

# Step 3: Update the project documentation
Write-Host "Step 3: Update project documentation for $phase" -ForegroundColor Cyan
Write-Host "-------------------------------------------" -ForegroundColor Cyan
Write-Host ""

& "$PSScriptRoot\update-project-docs.ps1" -phase $phase -dryRun:$dryRun

Write-Host ""
Write-Host "Project documentation updated successfully!" -ForegroundColor Green
Write-Host ""

Write-Host "Phase $phase completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review the implementation" -ForegroundColor Yellow
Write-Host "2. Run tests to verify the implementation" -ForegroundColor Yellow
Write-Host "3. Commit the changes" -ForegroundColor Yellow
Write-Host "4. Move on to the next phase" -ForegroundColor Yellow
Write-Host ""
