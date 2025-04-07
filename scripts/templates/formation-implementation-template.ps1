# Formation Implementation Template
# This template is used to generate scripts for implementing particle formations

param (
    [Parameter(Mandatory=$true)]
    [string]$roleName,
    [string]$outputDir = "src/domains/particle/formations",
    [string]$description = "Implements the $roleName role formations"
)

# Configuration
$roleNameLower = $roleName.ToLower()
$roleNameUpper = $roleName.ToUpper()
$formationDir = "$outputDir/$roleNameLower"
$indexPath = "$formationDir/index.ts"
$typesPath = "$formationDir/types.ts"
$implementationPath = "$formationDir/implementation.ts"
$visualPath = "$formationDir/visual.ts"
$testPath = "src/domains/particle/formations/$roleNameLower/$roleNameLower.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $formationDir)) {
    New-Item -ItemType Directory -Path $formationDir -Force | Out-Null
    Write-Host "Created directory: $formationDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * $roleNameUpper Role Formation Types
 * 
 * @description Type definitions for the $roleNameUpper particle role formations
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';

/**
 * Formation rarity tiers
 */
export enum FormationRarity {
  COMMON = 'COMMON',
  UNCOMMON = 'UNCOMMON',
  RARE = 'RARE',
  EPIC = 'EPIC',
  LEGENDARY = 'LEGENDARY',
  MYTHIC = 'MYTHIC'
}

/**
 * Base formation interface
 */
export interface Formation {
  id: string;
  name: string;
  description: string;
  advantage: string;
  explanation?: string;
  rarity: FormationRarity;
  apply: (particles: Particle[], centerPosition: Vector3) => void;
}

/**
 * $roleNameUpper role formation type
 */
export interface ${roleNameUpper}Formation extends Formation {
  roleType: '$roleNameUpper';
}

/**
 * Type guard to check if a formation is a $roleNameUpper formation
 */
export function is${roleNameUpper}Formation(formation: Formation): formation is ${roleNameUpper}Formation {
  return (formation as ${roleNameUpper}Formation).roleType === '$roleNameUpper';
}
"@

# Create implementation file
$implementationContent = @"
/**
 * $roleNameUpper Role Formation Implementation
 * 
 * @description Implementation of formations for the $roleNameUpper particle role
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';
import { ${roleNameUpper}Formation, FormationRarity } from './types';
import { apply${roleNameUpper}FormationVisual } from './visual';

/**
 * Create a $roleNameUpper formation
 * 
 * @param id Unique formation ID
 * @param name Formation name
 * @param description Formation description
 * @param advantage Formation advantage
 * @param explanation Optional explanation of the formation
 * @param rarity Formation rarity tier
 * @param applyFn Function to apply the formation
 * @returns A new $roleNameUpper formation
 */
function create${roleNameUpper}Formation(
  id: string,
  name: string,
  description: string,
  advantage: string,
  explanation: string | undefined,
  rarity: FormationRarity,
  applyFn: (particles: Particle[], centerPosition: Vector3) => void
): ${roleNameUpper}Formation {
  return {
    id,
    name,
    description,
    advantage,
    explanation,
    rarity,
    roleType: '$roleNameUpper',
    apply: applyFn
  };
}

/**
 * All $roleNameUpper formations
 */
export const ${roleNameUpper}_FORMATIONS: ${roleNameUpper}Formation[] = [
  // Common formations
  create${roleNameUpper}Formation(
    '${roleNameLower}_formation_1',
    'Formation 1',
    'Description of formation 1',
    'Advantage of formation 1',
    undefined,
    FormationRarity.COMMON,
    (particles, centerPosition) => {
      // Implementation of formation 1
      apply${roleNameUpper}FormationVisual(particles, 'formation_1', centerPosition);
    }
  ),
  
  // Add more formations here...
];

/**
 * Get a $roleNameUpper formation by ID
 * 
 * @param id Formation ID
 * @returns The formation with the given ID, or undefined if not found
 */
export function get${roleNameUpper}FormationById(id: string): ${roleNameUpper}Formation | undefined {
  return ${roleNameUpper}_FORMATIONS.find(formation => formation.id === id);
}

/**
 * Get $roleNameUpper formations by rarity
 * 
 * @param rarity Formation rarity tier
 * @returns All formations with the given rarity
 */
export function get${roleNameUpper}FormationsByRarity(rarity: FormationRarity): ${roleNameUpper}Formation[] {
  return ${roleNameUpper}_FORMATIONS.filter(formation => formation.rarity === rarity);
}

/**
 * Apply a $roleNameUpper formation to a group of particles
 * 
 * @param formationId Formation ID
 * @param particles The particles to arrange
 * @param centerPosition The center position for the formation
 */
export function apply${roleNameUpper}Formation(
  formationId: string,
  particles: Particle[],
  centerPosition: Vector3
): void {
  const formation = get${roleNameUpper}FormationById(formationId);
  if (formation) {
    formation.apply(particles, centerPosition);
  }
}
"@

# Create visual file
$visualContent = @"
/**
 * $roleNameUpper Role Formation Visual
 * 
 * @description Visual implementation of $roleNameUpper formations
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';

/**
 * Apply visual arrangement for a $roleNameUpper formation
 * 
 * @param particles The particles to arrange
 * @param formationType The type of formation being applied
 * @param centerPosition The center position for the formation
 */
export function apply${roleNameUpper}FormationVisual(
  particles: Particle[],
  formationType: string,
  centerPosition: Vector3
): void {
  switch (formationType) {
    case 'formation_1':
      // Apply visual arrangement for formation 1
      arrangeInFormation1(particles, centerPosition);
      break;
    
    // Add more formation arrangements here...
    
    default:
      // Default arrangement for unknown formation type
      arrangeInDefaultFormation(particles, centerPosition);
      break;
  }
}

/**
 * Arrange particles in formation 1
 * 
 * @param particles The particles to arrange
 * @param centerPosition The center position for the formation
 */
function arrangeInFormation1(
  particles: Particle[],
  centerPosition: Vector3
): void {
  // Implementation of formation 1 arrangement
  // This would typically position particles in a specific pattern
}

/**
 * Arrange particles in the default formation
 * 
 * @param particles The particles to arrange
 * @param centerPosition The center position for the formation
 */
function arrangeInDefaultFormation(
  particles: Particle[],
  centerPosition: Vector3
): void {
  // Implementation of default formation arrangement
  // This would typically position particles in a simple pattern
}
"@

# Create index file
$indexContent = @"
/**
 * $roleNameUpper Role Formations
 * 
 * @description Formations for the $roleNameUpper particle role
 */
export * from './types';
export * from './implementation';
export * from './visual';
"@

# Create test file
$testContent = @"
/**
 * $roleNameUpper Role Formation Tests
 * 
 * @description Tests for the $roleNameUpper particle role formations
 */
import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { ${roleNameUpper}Formation, FormationRarity } from './types';
import { ${roleNameUpper}_FORMATIONS, get${roleNameUpper}FormationById, get${roleNameUpper}FormationsByRarity } from './implementation';
import { Particle } from '../../types';

describe('${roleNameUpper} Role Formations', () => {
  describe('Formation Registry', () => {
    it('should have formations defined for each rarity tier', () => {
      // Check that we have formations for each rarity tier
      expect(get${roleNameUpper}FormationsByRarity(FormationRarity.COMMON).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}FormationsByRarity(FormationRarity.UNCOMMON).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}FormationsByRarity(FormationRarity.RARE).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}FormationsByRarity(FormationRarity.EPIC).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}FormationsByRarity(FormationRarity.LEGENDARY).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}FormationsByRarity(FormationRarity.MYTHIC).length).toBeGreaterThan(0);
    });
    
    it('should be able to retrieve formations by ID', () => {
      // Get the first formation
      const firstFormation = ${roleNameUpper}_FORMATIONS[0];
      
      // Retrieve it by ID
      const retrievedFormation = get${roleNameUpper}FormationById(firstFormation.id);
      
      // Check that we got the same formation
      expect(retrievedFormation).toBe(firstFormation);
    });
  });
  
  describe('Formation Application', () => {
    let testParticles: Particle[];
    
    beforeEach(() => {
      // Create test particles
      testParticles = Array(10).fill(0).map((_, i) => ({
        id: i,
        position: new Vector3(0, 0, 0),
        velocity: new Vector3(0, 0, 0),
        acceleration: new Vector3(0, 0, 0),
        mass: 1.0,
        role: '$roleNameUpper',
        color: new Vector3(1, 1, 1),
        size: 1.0,
        roleProperties: {}
      }));
    });
    
    it('should apply formations without errors', () => {
      // Test each formation
      ${roleNameUpper}_FORMATIONS.forEach(formation => {
        // This should not throw an error
        expect(() => {
          formation.apply(testParticles, new Vector3(0, 0, 0));
        }).not.toThrow();
      });
    });
    
    // Add more specific formation tests here...
  });
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $implementationPath -Value $implementationContent -Force
Set-Content -Path $visualPath -Value $visualContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created $roleNameUpper formation implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $implementationPath" -ForegroundColor Green
Write-Host "  - $visualPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
