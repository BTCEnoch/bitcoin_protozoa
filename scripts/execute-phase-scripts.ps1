# Execute Phase Scripts
# This script executes all the scripts for a specific phase of the Bitcoin Protozoa project

param (
    [Parameter(Mandatory=$true)]
    [string]$phase,
    [switch]$dryRun = $false
)

# Configuration
$scriptsDir = "scripts/$phase"
$executionPlanPath = "$scriptsDir/execution-plan.md"

# Function to execute a script
function Execute-Script {
    param (
        [string]$scriptPath,
        [switch]$dryRun = $false
    )
    
    if ($dryRun) {
        Write-Host "Would execute: $scriptPath" -ForegroundColor Yellow
    } else {
        Write-Host "Executing: $scriptPath" -ForegroundColor Cyan
        & $scriptPath
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Script execution failed with exit code $LASTEXITCODE" -ForegroundColor Red
            exit $LASTEXITCODE
        }
        
        Write-Host "Script executed successfully." -ForegroundColor Green
    }
}

# Main script
Write-Host "Bitcoin Protozoa - Execute Phase Scripts" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""

# Check if the scripts directory exists
if (-not (Test-Path -Path $scriptsDir)) {
    Write-Host "Scripts directory not found: $scriptsDir" -ForegroundColor Red
    Write-Host "Please generate the scripts for $phase first." -ForegroundColor Red
    exit 1
}

# Check if the execution plan exists
if (-not (Test-Path -Path $executionPlanPath)) {
    Write-Host "Execution plan not found: $executionPlanPath" -ForegroundColor Red
    Write-Host "Please generate the scripts for $phase first." -ForegroundColor Red
    exit 1
}

# Read the execution plan
$executionPlan = Get-Content -Path $executionPlanPath -Raw
$scriptMatches = [regex]::Matches($executionPlan, "\d+\. ([^\n]+)")
$scripts = $scriptMatches | ForEach-Object { $_.Groups[1].Value.Trim() }

Write-Host "Found $($scripts.Count) scripts to execute for $phase." -ForegroundColor Cyan
Write-Host ""

# Execute each script
foreach ($script in $scripts) {
    $scriptPath = Join-Path -Path $scriptsDir -ChildPath $script
    
    if (-not (Test-Path -Path $scriptPath)) {
        Write-Host "Script not found: $scriptPath" -ForegroundColor Red
        continue
    }
    
    Execute-Script -scriptPath $scriptPath -dryRun:$dryRun
    
    Write-Host ""
}

Write-Host "All scripts for $phase have been executed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Test the implementation" -ForegroundColor Yellow
Write-Host "2. Update the project checklist and inventory" -ForegroundColor Yellow
Write-Host "3. Move on to the next phase" -ForegroundColor Yellow
Write-Host ""
