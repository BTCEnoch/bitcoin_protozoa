# Behavior Implementation Template
# This template is used to generate scripts for implementing particle behaviors

param (
    [Parameter(Mandatory=$true)]
    [string]$roleName,
    [string]$outputDir = "src/domains/particle/behaviors",
    [string]$description = "Implements the $roleName role behaviors"
)

# Configuration
$roleNameLower = $roleName.ToLower()
$roleNameUpper = $roleName.ToUpper()
$behaviorDir = "$outputDir/$roleNameLower"
$indexPath = "$behaviorDir/index.ts"
$typesPath = "$behaviorDir/types.ts"
$implementationPath = "$behaviorDir/implementation.ts"
$effectsPath = "$behaviorDir/effects.ts"
$testPath = "src/domains/particle/behaviors/$roleNameLower/$roleNameLower.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $behaviorDir)) {
    New-Item -ItemType Directory -Path $behaviorDir -Force | Out-Null
    Write-Host "Created directory: $behaviorDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * $roleNameUpper Role Behavior Types
 * 
 * @description Type definitions for the $roleNameUpper particle role behaviors
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';

/**
 * Behavior rarity tiers
 */
export enum BehaviorRarity {
  COMMON = 'COMMON',
  UNCOMMON = 'UNCOMMON',
  RARE = 'RARE',
  EPIC = 'EPIC',
  LEGENDARY = 'LEGENDARY',
  MYTHIC = 'MYTHIC'
}

/**
 * Base behavior interface
 */
export interface Behavior {
  id: string;
  name: string;
  description: string;
  advantage: string;
  explanation?: string;
  rarity: BehaviorRarity;
  apply: (particle: Particle, particles: Particle[], deltaTime: number) => void;
}

/**
 * $roleNameUpper role behavior type
 */
export interface ${roleNameUpper}Behavior extends Behavior {
  roleType: '$roleNameUpper';
}

/**
 * Type guard to check if a behavior is a $roleNameUpper behavior
 */
export function is${roleNameUpper}Behavior(behavior: Behavior): behavior is ${roleNameUpper}Behavior {
  return (behavior as ${roleNameUpper}Behavior).roleType === '$roleNameUpper';
}
"@

# Create implementation file
$implementationContent = @"
/**
 * $roleNameUpper Role Behavior Implementation
 * 
 * @description Implementation of behaviors for the $roleNameUpper particle role
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';
import { ${roleNameUpper}Behavior, BehaviorRarity } from './types';
import { apply${roleNameUpper}BehaviorEffects } from './effects';

/**
 * Create a $roleNameUpper behavior
 * 
 * @param id Unique behavior ID
 * @param name Behavior name
 * @param description Behavior description
 * @param advantage Behavior advantage
 * @param explanation Optional explanation of the behavior
 * @param rarity Behavior rarity tier
 * @param applyFn Function to apply the behavior
 * @returns A new $roleNameUpper behavior
 */
function create${roleNameUpper}Behavior(
  id: string,
  name: string,
  description: string,
  advantage: string,
  explanation: string | undefined,
  rarity: BehaviorRarity,
  applyFn: (particle: Particle, particles: Particle[], deltaTime: number) => void
): ${roleNameUpper}Behavior {
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
 * All $roleNameUpper behaviors
 */
export const ${roleNameUpper}_BEHAVIORS: ${roleNameUpper}Behavior[] = [
  // Common behaviors
  create${roleNameUpper}Behavior(
    '${roleNameLower}_behavior_1',
    'Behavior 1',
    'Description of behavior 1',
    'Advantage of behavior 1',
    undefined,
    BehaviorRarity.COMMON,
    (particle, particles, deltaTime) => {
      // Implementation of behavior 1
      apply${roleNameUpper}BehaviorEffects(particle, 'behavior_1', deltaTime);
    }
  ),
  
  // Add more behaviors here...
];

/**
 * Get a $roleNameUpper behavior by ID
 * 
 * @param id Behavior ID
 * @returns The behavior with the given ID, or undefined if not found
 */
export function get${roleNameUpper}BehaviorById(id: string): ${roleNameUpper}Behavior | undefined {
  return ${roleNameUpper}_BEHAVIORS.find(behavior => behavior.id === id);
}

/**
 * Get $roleNameUpper behaviors by rarity
 * 
 * @param rarity Behavior rarity tier
 * @returns All behaviors with the given rarity
 */
export function get${roleNameUpper}BehaviorsByRarity(rarity: BehaviorRarity): ${roleNameUpper}Behavior[] {
  return ${roleNameUpper}_BEHAVIORS.filter(behavior => behavior.rarity === rarity);
}

/**
 * Apply a $roleNameUpper behavior to a particle
 * 
 * @param behaviorId Behavior ID
 * @param particle The particle to update
 * @param particles All particles in the system
 * @param deltaTime Time since last update
 */
export function apply${roleNameUpper}Behavior(
  behaviorId: string,
  particle: Particle,
  particles: Particle[],
  deltaTime: number
): void {
  const behavior = get${roleNameUpper}BehaviorById(behaviorId);
  if (behavior) {
    behavior.apply(particle, particles, deltaTime);
  }
}
"@

# Create effects file
$effectsContent = @"
/**
 * $roleNameUpper Role Behavior Effects
 * 
 * @description Visual and physical effects for $roleNameUpper behaviors
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';

/**
 * Apply visual and physical effects for a $roleNameUpper behavior
 * 
 * @param particle The particle to update
 * @param behaviorType The type of behavior being applied
 * @param deltaTime Time since last update
 */
export function apply${roleNameUpper}BehaviorEffects(
  particle: Particle,
  behaviorType: string,
  deltaTime: number
): void {
  switch (behaviorType) {
    case 'behavior_1':
      // Apply effects for behavior 1
      break;
    
    // Add more behavior effects here...
    
    default:
      // No effects for unknown behavior type
      break;
  }
}

/**
 * Create a visual effect for a $roleNameUpper behavior
 * 
 * @param particle The particle to update
 * @param effectType The type of effect to create
 * @param duration Duration of the effect in seconds
 */
export function create${roleNameUpper}BehaviorEffect(
  particle: Particle,
  effectType: string,
  duration: number
): void {
  // Implementation of effect creation
  // This would typically add the effect to an effect system
}
"@

# Create index file
$indexContent = @"
/**
 * $roleNameUpper Role Behaviors
 * 
 * @description Behaviors for the $roleNameUpper particle role
 */
export * from './types';
export * from './implementation';
export * from './effects';
"@

# Create test file
$testContent = @"
/**
 * $roleNameUpper Role Behavior Tests
 * 
 * @description Tests for the $roleNameUpper particle role behaviors
 */
import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { ${roleNameUpper}Behavior, BehaviorRarity } from './types';
import { ${roleNameUpper}_BEHAVIORS, get${roleNameUpper}BehaviorById, get${roleNameUpper}BehaviorsByRarity } from './implementation';
import { Particle } from '../../types';

describe('${roleNameUpper} Role Behaviors', () => {
  describe('Behavior Registry', () => {
    it('should have behaviors defined for each rarity tier', () => {
      // Check that we have behaviors for each rarity tier
      expect(get${roleNameUpper}BehaviorsByRarity(BehaviorRarity.COMMON).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}BehaviorsByRarity(BehaviorRarity.UNCOMMON).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}BehaviorsByRarity(BehaviorRarity.RARE).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}BehaviorsByRarity(BehaviorRarity.EPIC).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}BehaviorsByRarity(BehaviorRarity.LEGENDARY).length).toBeGreaterThan(0);
      expect(get${roleNameUpper}BehaviorsByRarity(BehaviorRarity.MYTHIC).length).toBeGreaterThan(0);
    });
    
    it('should be able to retrieve behaviors by ID', () => {
      // Get the first behavior
      const firstBehavior = ${roleNameUpper}_BEHAVIORS[0];
      
      // Retrieve it by ID
      const retrievedBehavior = get${roleNameUpper}BehaviorById(firstBehavior.id);
      
      // Check that we got the same behavior
      expect(retrievedBehavior).toBe(firstBehavior);
    });
  });
  
  describe('Behavior Application', () => {
    let testParticle: Particle;
    
    beforeEach(() => {
      // Create a test particle
      testParticle = {
        id: 1,
        position: new Vector3(0, 0, 0),
        velocity: new Vector3(0, 0, 0),
        acceleration: new Vector3(0, 0, 0),
        mass: 1.0,
        role: '$roleNameUpper',
        color: new Vector3(1, 1, 1),
        size: 1.0,
        roleProperties: {}
      };
    });
    
    it('should apply behaviors without errors', () => {
      // Test each behavior
      ${roleNameUpper}_BEHAVIORS.forEach(behavior => {
        // This should not throw an error
        expect(() => {
          behavior.apply(testParticle, [testParticle], 0.016);
        }).not.toThrow();
      });
    });
    
    // Add more specific behavior tests here...
  });
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $implementationPath -Value $implementationContent -Force
Set-Content -Path $effectsPath -Value $effectsContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created $roleNameUpper behavior implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $implementationPath" -ForegroundColor Green
Write-Host "  - $effectsPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
