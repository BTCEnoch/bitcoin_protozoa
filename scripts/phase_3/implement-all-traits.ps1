# implement-all-traits.ps1
# This script runs all the formation and behavior implementation scripts for Phase 3

Write-Host "Implementing all formation and behavior traits..." -ForegroundColor Cyan

# Implement formations
Write-Host "Implementing formations..." -ForegroundColor Cyan
& 'scripts\phase_3\implement-core-formations.ps1'
& 'scripts\phase_3\implement-control-formations.ps1'
& 'scripts\phase_3\implement-movement-formations.ps1'
& 'scripts\phase_3\implement-defense-formations.ps1'
& 'scripts\phase_3\implement-attack-formations.ps1'

# Implement behaviors
Write-Host "Implementing behaviors..." -ForegroundColor Cyan
& 'scripts\phase_3\implement-core-behaviors.ps1'
& 'scripts\phase_3\implement-control-behaviors.ps1'
& 'scripts\phase_3\implement-movement-behaviors.ps1'
& 'scripts\phase_3\implement-defense-behaviors.ps1'
& 'scripts\phase_3\implement-attack-behaviors.ps1'

Write-Host "All formation and behavior traits implemented successfully!" -ForegroundColor Green
