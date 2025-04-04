# Fix Domain Exports Script
# This script fixes domain exports by commenting out exports for empty files

Write-Host "Fixing Domain Exports..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define domains to fix
$domains = @(
    "bitcoin",
    "core",
    "forcefield",
    "mutation",
    "particle",
    "physics",
    "rng",
    "trait",
    "ui"
)

foreach ($domain in $domains) {
    Write-Host "Checking domain: $domain" -ForegroundColor Yellow
    
    $domainDir = "src\domains\$domain"
    $indexFile = "$domainDir\index.ts"
    
    if (Test-Path $indexFile) {
        Write-Host "  Fixing index file: $indexFile" -ForegroundColor Yellow
        
        # Read the current index file
        $indexContent = Get-Content $indexFile -Raw
        $newIndexContent = $indexContent
        
        # Check types.ts
        $typesFile = "$domainDir\types.ts"
        if (Test-Path $typesFile) {
            $typesContent = Get-Content $typesFile -Raw
            if (-not ($typesContent -match "export ")) {
                Write-Host "    Commenting out types export (no exports found)" -ForegroundColor Yellow
                $newIndexContent = $newIndexContent -replace "export \* from './types';", "// export * from './types';"
            }
        } else {
            Write-Host "    Commenting out types export (file not found)" -ForegroundColor Yellow
            $newIndexContent = $newIndexContent -replace "export \* from './types';", "// export * from './types';"
        }
        
        # Check constants.ts
        $constantsFile = "$domainDir\constants.ts"
        if (Test-Path $constantsFile) {
            $constantsContent = Get-Content $constantsFile -Raw
            if (-not ($constantsContent -match "export ")) {
                Write-Host "    Commenting out constants export (no exports found)" -ForegroundColor Yellow
                $newIndexContent = $newIndexContent -replace "export \* from './constants';", "// export * from './constants';"
            }
        } else {
            Write-Host "    Commenting out constants export (file not found)" -ForegroundColor Yellow
            $newIndexContent = $newIndexContent -replace "export \* from './constants';", "// export * from './constants';"
        }
        
        # Check components directory
        $componentsDir = "$domainDir\components"
        $componentsIndexFile = "$componentsDir\index.ts"
        if (-not (Test-Path $componentsIndexFile) -or -not ((Get-Content $componentsIndexFile -Raw) -match "export ")) {
            Write-Host "    Commenting out components export (no exports found)" -ForegroundColor Yellow
            $newIndexContent = $newIndexContent -replace "export \* from './components';", "// export * from './components';"
        }
        
        # Check hooks directory
        $hooksDir = "$domainDir\hooks"
        $hooksIndexFile = "$hooksDir\index.ts"
        if (-not (Test-Path $hooksIndexFile) -or -not ((Get-Content $hooksIndexFile -Raw) -match "export ")) {
            Write-Host "    Commenting out hooks export (no exports found)" -ForegroundColor Yellow
            $newIndexContent = $newIndexContent -replace "export \* from './hooks';", "// export * from './hooks';"
        }
        
        # Check services directory
        $servicesDir = "$domainDir\services"
        $servicesIndexFile = "$servicesDir\index.ts"
        if (-not (Test-Path $servicesIndexFile) -or -not ((Get-Content $servicesIndexFile -Raw) -match "export ")) {
            Write-Host "    Commenting out services export (no exports found)" -ForegroundColor Yellow
            $newIndexContent = $newIndexContent -replace "export \* from './services';", "// export * from './services';"
        }
        
        # Check utils directory
        $utilsDir = "$domainDir\utils"
        $utilsIndexFile = "$utilsDir\index.ts"
        if (-not (Test-Path $utilsIndexFile) -or -not ((Get-Content $utilsIndexFile -Raw) -match "export ")) {
            Write-Host "    Commenting out utils export (no exports found)" -ForegroundColor Yellow
            $newIndexContent = $newIndexContent -replace "export \* from './utils';", "// export * from './utils';"
        }
        
        # Write the updated index file
        if ($newIndexContent -ne $indexContent) {
            Write-Host "    Writing updated index file" -ForegroundColor Green
            Set-Content -Path $indexFile -Value $newIndexContent -Force
        } else {
            Write-Host "    No changes needed" -ForegroundColor Green
        }
    }
    
    # Fix empty types.ts files
    $typesFile = "$domainDir\types.ts"
    if (Test-Path $typesFile) {
        $typesContent = Get-Content $typesFile -Raw
        if (-not ($typesContent -match "export ")) {
            Write-Host "  Adding placeholder export to types.ts" -ForegroundColor Yellow
            $newTypesContent = @"
/**
 * $domain Types
 *
 * @description Type definitions for the $domain domain
 */

/**
 * Placeholder interface for $domain domain
 * TODO: Replace with actual types
 */
export interface ${domain}Config {
  // Add configuration properties here
  version: string;
}
"@
            Set-Content -Path $typesFile -Value $newTypesContent -Force
        }
    }
    
    # Fix empty constants.ts files
    $constantsFile = "$domainDir\constants.ts"
    if (Test-Path $constantsFile) {
        $constantsContent = Get-Content $constantsFile -Raw
        if (-not ($constantsContent -match "export ")) {
            Write-Host "  Adding placeholder export to constants.ts" -ForegroundColor Yellow
            $newConstantsContent = @"
/**
 * $domain Constants
 *
 * @description Constants for the $domain domain
 */

/**
 * $domain version
 */
export const ${domain.ToUpper()}_VERSION = '0.1.0';
"@
            Set-Content -Path $constantsFile -Value $newConstantsContent -Force
        }
    }
}

Write-Host "Domain exports fixed!" -ForegroundColor Green
