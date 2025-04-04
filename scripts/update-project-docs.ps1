# Update Project Documentation
# This script updates the project checklist and inventory after a phase is completed

param (
    [Parameter(Mandatory=$true)]
    [string]$phase,
    [switch]$dryRun = $false
)

# Configuration
$checklistPath = "bitcoin_protozoa/project/01_project_checklist.md"
$inventoryPath = "bitcoin_protozoa/project/02_project_inventory.md"

# Function to update the project checklist
function Update-Checklist {
    param (
        [string]$phase,
        [switch]$dryRun = $false
    )
    
    Write-Host "Updating project checklist for $phase..." -ForegroundColor Cyan
    
    # Read the checklist
    $checklist = Get-Content -Path $checklistPath -Raw
    
    # Find the phase section
    $phasePattern = "### $($phase.Replace('phase_', 'Phase ')) Tasks"
    if ($checklist -match $phasePattern) {
        Write-Host "Found $phase section in project checklist." -ForegroundColor Green
        
        # Update the tasks
        $updatedChecklist = $checklist -replace "- \[ \] ([^\n]+)", "- [x] `$1"
        
        if ($dryRun) {
            Write-Host "Would update project checklist." -ForegroundColor Yellow
        } else {
            # Save the updated checklist
            Set-Content -Path $checklistPath -Value $updatedChecklist -Force
            Write-Host "Project checklist updated successfully." -ForegroundColor Green
        }
    } else {
        Write-Host "Phase section not found in project checklist." -ForegroundColor Red
    }
}

# Function to update the project inventory
function Update-Inventory {
    param (
        [string]$phase,
        [switch]$dryRun = $false
    )
    
    Write-Host "Updating project inventory for $phase..." -ForegroundColor Cyan
    
    # Read the inventory
    $inventory = Get-Content -Path $inventoryPath -Raw
    
    # Find the phase section in the Current Phase Status section
    $phaseStatusPattern = "- \*\*$($phase.Replace('phase_', 'Phase ')).*?\*\*: \\ud83d\\udd04 In Progress \(\d+%\)"
    if ($inventory -match $phaseStatusPattern) {
        Write-Host "Found $phase status in project inventory." -ForegroundColor Green
        
        # Update the phase status
        $updatedInventory = $inventory -replace $phaseStatusPattern, "- **$($phase.Replace('phase_', 'Phase '))**: \u2705 Complete (100%)"
        
        if ($dryRun) {
            Write-Host "Would update project inventory." -ForegroundColor Yellow
        } else {
            # Save the updated inventory
            Set-Content -Path $inventoryPath -Value $updatedInventory -Force
            Write-Host "Project inventory updated successfully." -ForegroundColor Green
        }
    } else {
        Write-Host "Phase status not found in project inventory." -ForegroundColor Red
    }
    
    # Find the implementation items for the phase
    $implementationPattern = "\\| ([^|]+) \\| \\\\u23f1\\\\ufe0f Pending \\| [^|]+ \\| [^|]+ \\| [^|]+ \\|"
    $itemMatches = [regex]::Matches($inventory, $implementationPattern)
    
    if ($itemMatches.Count -gt 0) {
        Write-Host "Found $($itemMatches.Count) implementation items to update." -ForegroundColor Green
        
        # Update the implementation items
        $updatedInventory = $inventory
        foreach ($match in $itemMatches) {
            $item = $match.Groups[1].Value.Trim()
            $itemPattern = "\\| $item \\| \\\\u23f1\\\\ufe0f Pending \\| ([^|]+) \\| ([^|]+) \\| ([^|]+) \\|"
            $updatedInventory = $updatedInventory -replace $itemPattern, "| $item | \u2705 Complete | `$1 | `$2 | `$3 |"
        }
        
        if ($dryRun) {
            Write-Host "Would update implementation items." -ForegroundColor Yellow
        } else {
            # Save the updated inventory
            Set-Content -Path $inventoryPath -Value $updatedInventory -Force
            Write-Host "Implementation items updated successfully." -ForegroundColor Green
        }
    } else {
        Write-Host "No implementation items found to update." -ForegroundColor Red
    }
}

# Main script
Write-Host "Bitcoin Protozoa - Update Project Documentation" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

# Update the project checklist
Update-Checklist -phase $phase -dryRun:$dryRun

Write-Host ""

# Update the project inventory
Update-Inventory -phase $phase -dryRun:$dryRun

Write-Host ""
Write-Host "Project documentation updated successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review the updated documentation" -ForegroundColor Yellow
Write-Host "2. Commit the changes" -ForegroundColor Yellow
Write-Host "3. Move on to the next phase" -ForegroundColor Yellow
Write-Host ""
