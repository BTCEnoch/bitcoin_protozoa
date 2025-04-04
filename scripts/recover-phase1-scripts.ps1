# Script to recover Phase 1 scripts
# This script copies the original Phase 1 scripts from Phase 2 back to Phase 1

Write-Host "Recovering Phase 1 scripts..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Create directory if it doesn't exist
if (-not (Test-Path "scripts\phase_1")) {
    New-Item -ItemType Directory -Path "scripts\phase_1" -Force | Out-Null
}

# Copy the scripts that were moved to Phase 2 back to Phase 1
Copy-Item -Path "scripts\phase_2\implement-bitcoin-block-fetcher.ps1" -Destination "scripts\phase_1\implement-particle-class.ps1" -Force
Copy-Item -Path "scripts\phase_2\implement-bitcoin-data-visualization.ps1" -Destination "scripts\phase_1\implement-particle-renderer.ps1" -Force
Copy-Item -Path "scripts\phase_2\implement-bitcoin-integration-tests.ps1" -Destination "scripts\phase_1\implement-physics-engine.ps1" -Force
Copy-Item -Path "scripts\phase_2\implement-fallback-mechanisms.ps1" -Destination "scripts\phase_1\implement-particle-container.ps1" -Force
Copy-Item -Path "scripts\phase_2\implement-bitcoin-state-management.ps1" -Destination "scripts\phase_1\implement-state-management.ps1" -Force
Copy-Item -Path "scripts\phase_2\implement-bitcoin-integration.ps1" -Destination "scripts\phase_1\implement-basic-particle-system.ps1" -Force
Copy-Item -Path "scripts\phase_2\fix-domain-exports.ps1" -Destination "scripts\phase_1\fix-domain-exports.ps1" -Force
Copy-Item -Path "scripts\phase_2\fix-imports-comprehensive.ps1" -Destination "scripts\phase_1\fix-imports-comprehensive.ps1" -Force

Write-Host "Phase 1 scripts recovered!" -ForegroundColor Green
