# Complete Bitcoin Integration Cleanup Script
# This script runs all the refactoring, optimization, documentation, and testing tasks

Write-Host "Bitcoin Protozoa - Bitcoin Integration Cleanup" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "This script will complete the cleanup tasks for Phase 2." -ForegroundColor Yellow
Write-Host "Press any key to continue or Ctrl+C to cancel..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Define the cleanup tasks
$cleanupTasks = @(
    @{
        Name = "Refactoring"
        Description = "Refactoring Bitcoin integration code"
        Action = {
            Write-Host "Refactoring Bitcoin API Service..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/bitcoin/services/bitcoinApiService.refactored.ts" -Destination "src/domains/bitcoin/services/bitcoinApiService.ts" -Force
            
            Write-Host "Refactoring Confirmation Service..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/bitcoin/services/confirmationService.refactored.ts" -Destination "src/domains/bitcoin/services/confirmationService.ts" -Force
            
            Write-Host "Refactoring Confirmation Tracker..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/bitcoin/services/confirmationTracker.refactored.ts" -Destination "src/domains/bitcoin/services/confirmationTracker.ts" -Force
            
            Write-Host "Refactoring Mulberry32 RNG..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/rng/utils/mulberry32.refactored.ts" -Destination "src/domains/rng/utils/mulberry32.ts" -Force
            
            Write-Host "Refactoring completed!" -ForegroundColor Green
        }
    },
    @{
        Name = "Optimization"
        Description = "Optimizing Bitcoin data fetching and processing"
        Action = {
            Write-Host "Optimizing Block Service..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/bitcoin/services/blockService.optimized.ts" -Destination "src/domains/bitcoin/services/blockService.ts" -Force
            
            Write-Host "Optimizing RNG Service..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/rng/services/rngService.optimized.ts" -Destination "src/domains/rng/services/rngService.ts" -Force
            
            Write-Host "Optimization completed!" -ForegroundColor Green
        }
    },
    @{
        Name = "Documentation"
        Description = "Documenting Bitcoin integration with JSDoc comments"
        Action = {
            Write-Host "Documenting Bitcoin types..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/bitcoin/types.documented.ts" -Destination "src/domains/bitcoin/types.ts" -Force
            
            Write-Host "Documenting RNG types..." -ForegroundColor Yellow
            Copy-Item -Path "src/domains/rng/types.documented.ts" -Destination "src/domains/rng/types.ts" -Force
            
            Write-Host "Documentation completed!" -ForegroundColor Green
        }
    },
    @{
        Name = "Testing"
        Description = "Ensuring all Bitcoin integration tests pass"
        Action = {
            Write-Host "Running Bitcoin integration tests..." -ForegroundColor Yellow
            & "$PSScriptRoot\run-bitcoin-integration-tests.ps1"
            
            Write-Host "Testing completed!" -ForegroundColor Green
        }
    }
)

# Execute each cleanup task
foreach ($task in $cleanupTasks) {
    Write-Host "`nTask: $($task.Name)" -ForegroundColor Green
    Write-Host $task.Description -ForegroundColor Yellow
    
    try {
        & $task.Action
        Write-Host "Completed $($task.Name)" -ForegroundColor Green
    } catch {
        Write-Host "Error executing $($task.Name): $_" -ForegroundColor Red
        Write-Host "Press any key to continue with the next task or Ctrl+C to cancel..." -ForegroundColor Yellow
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

Write-Host "`nBitcoin Integration cleanup complete!" -ForegroundColor Green
Write-Host "All cleanup tasks have been completed." -ForegroundColor Green
