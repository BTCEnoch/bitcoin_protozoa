# generate-trait-data.ps1
# This script generates trait data from the documentation

# Configuration
$projectRoot = (Resolve-Path -Path ".").Path -replace "\\", "/"
$docsDir = "$projectRoot/bitcoin_protozoa"
$outputDir = "$projectRoot/src/domains/particle/traits"

# Ensure the output directory exists
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "Created directory: $outputDir" -ForegroundColor Green
}

# Function to extract formation traits from documentation
function Extract-FormationTraits {
    param (
        [string]$roleName,
        [string]$docPath
    )
    
    Write-Host "Extracting $roleName formation traits from $docPath..." -ForegroundColor Cyan
    
    # Read the documentation file
    $content = Get-Content -Path $docPath -Raw
    
    # Extract the section for the specified role
    $rolePattern = "## $roleName Formations[\s\S]*?(?=## |$)"
    if ($content -match $rolePattern) {
        $roleSection = $matches[0]
        
        # Extract formations by rarity
        $formations = @{
            "COMMON" = @()
            "UNCOMMON" = @()
            "RARE" = @()
            "EPIC" = @()
            "LEGENDARY" = @()
            "MYTHIC" = @()
        }
        
        # Process each rarity tier
        foreach ($rarity in $formations.Keys) {
            $rarityPattern = "### $rarity Formations[\s\S]*?(?=### |$)"
            if ($roleSection -match $rarityPattern) {
                $raritySection = $matches[0]
                
                # Extract individual formations
                $formationPattern = "\d+\.\s+\*\*([^*]+)\*\*\s+[\s\S]*?- \*\*Description\*\*:\s+([^\n]+)[\s\S]*?- \*\*Advantage\*\*:\s+([^\n]+)(?:[\s\S]*?- \*\*Explanation\*\*:\s+([^\n]+))?"
                $formationMatches = [regex]::Matches($raritySection, $formationPattern)
                
                foreach ($match in $formationMatches) {
                    $name = $match.Groups[1].Value.Trim()
                    $description = $match.Groups[2].Value.Trim()
                    $advantage = $match.Groups[3].Value.Trim()
                    $explanation = if ($match.Groups[4].Success) { $match.Groups[4].Value.Trim() } else { $null }
                    
                    $formations[$rarity] += @{
                        "name" = $name
                        "description" = $description
                        "advantage" = $advantage
                        "explanation" = $explanation
                    }
                }
            }
        }
        
        return $formations
    }
    
    Write-Host "Could not find $roleName section in documentation." -ForegroundColor Red
    return $null
}

# Function to extract behavior traits from documentation
function Extract-BehaviorTraits {
    param (
        [string]$roleName,
        [string]$docPath
    )
    
    Write-Host "Extracting $roleName behavior traits from $docPath..." -ForegroundColor Cyan
    
    # Read the documentation file
    $content = Get-Content -Path $docPath -Raw
    
    # Extract the section for the specified role
    $rolePattern = "## $roleName Behaviors[\s\S]*?(?=## |$)"
    if ($content -match $rolePattern) {
        $roleSection = $matches[0]
        
        # Extract behaviors by rarity
        $behaviors = @{
            "COMMON" = @()
            "UNCOMMON" = @()
            "RARE" = @()
            "EPIC" = @()
            "LEGENDARY" = @()
            "MYTHIC" = @()
        }
        
        # Process each rarity tier
        foreach ($rarity in $behaviors.Keys) {
            $rarityPattern = "### $rarity Behaviors[\s\S]*?(?=### |$)"
            if ($roleSection -match $rarityPattern) {
                $raritySection = $matches[0]
                
                # Extract individual behaviors
                $behaviorPattern = "\d+\.\s+\*\*([^*]+)\*\*\s+[\s\S]*?- \*\*Description\*\*:\s+([^\n]+)[\s\S]*?- \*\*Advantage\*\*:\s+([^\n]+)(?:[\s\S]*?- \*\*Explanation\*\*:\s+([^\n]+))?"
                $behaviorMatches = [regex]::Matches($raritySection, $behaviorPattern)
                
                foreach ($match in $behaviorMatches) {
                    $name = $match.Groups[1].Value.Trim()
                    $description = $match.Groups[2].Value.Trim()
                    $advantage = $match.Groups[3].Value.Trim()
                    $explanation = if ($match.Groups[4].Success) { $match.Groups[4].Value.Trim() } else { $null }
                    
                    $behaviors[$rarity] += @{
                        "name" = $name
                        "description" = $description
                        "advantage" = $advantage
                        "explanation" = $explanation
                    }
                }
            }
        }
        
        return $behaviors
    }
    
    Write-Host "Could not find $roleName section in documentation." -ForegroundColor Red
    return $null
}

# Function to generate TypeScript trait data file
function Generate-TraitDataFile {
    param (
        [string]$roleName,
        [hashtable]$formations,
        [hashtable]$behaviors,
        [string]$outputPath
    )
    
    Write-Host "Generating trait data file for $roleName..." -ForegroundColor Cyan
    
    # Create the TypeScript content
    $content = @"
/**
 * $roleName Role Trait Data
 * 
 * @description Data for $roleName role formations and behaviors
 */
import { FormationRarity } from '../formations/$($roleName.ToLower())/types';
import { BehaviorRarity } from '../behaviors/$($roleName.ToLower())/types';

/**
 * $roleName formation data
 */
export const ${roleName}_FORMATION_DATA = {
"@
    
    # Add formation data
    foreach ($rarity in $formations.Keys) {
        $content += "`n  // $rarity formations`n"
        $content += "  FormationRarity.$rarity: [`n"
        
        foreach ($formation in $formations[$rarity]) {
            $content += "    {`n"
            $content += "      name: '$($formation.name)',`n"
            $content += "      description: '$($formation.description)',`n"
            $content += "      advantage: '$($formation.advantage)',`n"
            if ($formation.explanation) {
                $content += "      explanation: '$($formation.explanation)',`n"
            }
            $content += "    },`n"
        }
        
        $content += "  ],`n"
    }
    
    $content += "};`n`n"
    
    # Add behavior data
    $content += @"
/**
 * $roleName behavior data
 */
export const ${roleName}_BEHAVIOR_DATA = {
"@
    
    foreach ($rarity in $behaviors.Keys) {
        $content += "`n  // $rarity behaviors`n"
        $content += "  BehaviorRarity.$rarity: [`n"
        
        foreach ($behavior in $behaviors[$rarity]) {
            $content += "    {`n"
            $content += "      name: '$($behavior.name)',`n"
            $content += "      description: '$($behavior.description)',`n"
            $content += "      advantage: '$($behavior.advantage)',`n"
            if ($behavior.explanation) {
                $content += "      explanation: '$($behavior.explanation)',`n"
            }
            $content += "    },`n"
        }
        
        $content += "  ],`n"
    }
    
    $content += "};`n"
    
    # Ensure the output directory exists
    $outputDir = Split-Path -Path $outputPath -Parent
    if (-not (Test-Path -Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
        Write-Host "Created directory: $outputDir" -ForegroundColor Green
    }
    
    # Save the file
    Set-Content -Path $outputPath -Value $content -Force
    Write-Host "Generated trait data file: $outputPath" -ForegroundColor Green
}

# Process each role
$roles = @("CORE", "CONTROL", "MOVEMENT", "DEFENSE", "ATTACK")

foreach ($role in $roles) {
    # Extract formation traits
    $formations = Extract-FormationTraits -roleName $role -docPath "$docsDir/traits/07_role_formation_traits.md"
    
    # Extract behavior traits
    $behaviors = Extract-BehaviorTraits -roleName $role -docPath "$docsDir/traits/08_role_behavior_traits.md"
    
    # Generate trait data file
    if ($formations -and $behaviors) {
        Generate-TraitDataFile -roleName $role -formations $formations -behaviors $behaviors -outputPath "$outputDir/$($role.ToLower())_trait_data.ts"
    }
}

Write-Host "Trait data generation complete!" -ForegroundColor Green
