# Fix Imports Comprehensive Script
# This script fixes import issues in the codebase

Write-Host "Fixing Imports Comprehensively..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Remove the standalone ParticleRenderer.tsx file
$particleRendererFile = "src\domains\particle\components\ParticleRenderer.tsx"
if (Test-Path $particleRendererFile) {
    Write-Host "Removing standalone ParticleRenderer.tsx file..." -ForegroundColor Yellow
    Remove-Item -Path $particleRendererFile -Force
    Write-Host "  Removed $particleRendererFile" -ForegroundColor Green
}

# Update the import in ParticleContainer
$particleContainerFile = "src\domains\particle\components\ParticleContainer\index.tsx"
if (Test-Path $particleContainerFile) {
    Write-Host "Updating import in ParticleContainer..." -ForegroundColor Yellow
    
    $content = Get-Content $particleContainerFile -Raw
    $newContent = $content -replace "import \{ ParticleRenderer \} from '../ParticleRenderer';", "import ParticleRenderer from '../ParticleRenderer/index';"
    
    Set-Content -Path $particleContainerFile -Value $newContent -Force
    Write-Host "  Updated import in $particleContainerFile" -ForegroundColor Green
}

# Update the export in ParticleRenderer
$particleRendererIndexFile = "src\domains\particle\components\ParticleRenderer\index.tsx"
if (Test-Path $particleRendererIndexFile) {
    Write-Host "Updating export in ParticleRenderer..." -ForegroundColor Yellow
    
    $content = Get-Content $particleRendererIndexFile -Raw
    
    # Check if the file already has a default export
    if (-not ($content -match "export default ParticleRenderer;")) {
        # Replace named export with default export
        $newContent = $content -replace "export \{ ParticleRenderer \};", "export default ParticleRenderer;"
        
        Set-Content -Path $particleRendererIndexFile -Value $newContent -Force
        Write-Host "  Updated export in $particleRendererIndexFile" -ForegroundColor Green
    } else {
        Write-Host "  ParticleRenderer already has default export" -ForegroundColor Green
    }
}

# Update the components index file
$componentsIndexFile = "src\domains\particle\components\index.ts"
if (Test-Path $componentsIndexFile) {
    Write-Host "Updating components index file..." -ForegroundColor Yellow
    
    $content = Get-Content $componentsIndexFile -Raw
    
    # Check if the file already has the correct export
    if ($content -match "export \* from './ParticleRenderer';") {
        # Update export
        $newContent = $content -replace "export \* from './ParticleRenderer';", "export { default as ParticleRenderer } from './ParticleRenderer/index';"
        
        Set-Content -Path $componentsIndexFile -Value $newContent -Force
        Write-Host "  Updated export in $componentsIndexFile" -ForegroundColor Green
    } else {
        Write-Host "  Components index file already has correct export" -ForegroundColor Green
    }
}

Write-Host "Imports fixed comprehensively!" -ForegroundColor Green
