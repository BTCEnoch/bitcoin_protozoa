# Role Implementation Template
# This template is used to generate scripts for implementing particle roles

param (
    [Parameter(Mandatory=$true)]
    [string]$roleName,
    [string]$outputDir = "src/domains/particle/roles",
    [string]$description = "Implements the $roleName role for particles"
)

# Configuration
$roleNameLower = $roleName.ToLower()
$roleNameUpper = $roleName.ToUpper()
$roleDir = "$outputDir/$roleNameLower"
$indexPath = "$roleDir/index.ts"
$typesPath = "$roleDir/types.ts"
$behaviorPath = "$roleDir/behavior.ts"
$forcesPath = "$roleDir/forces.ts"
$visualPath = "$roleDir/visual.ts"
$testPath = "src/domains/particle/roles/$roleNameLower/$roleNameLower.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $roleDir)) {
    New-Item -ItemType Directory -Path $roleDir -Force | Out-Null
    Write-Host "Created directory: $roleDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * $roleNameUpper Role Types
 * 
 * @description Type definitions for the $roleNameUpper particle role
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';

/**
 * Properties specific to $roleNameUpper role particles
 */
export interface ${roleNameUpper}Properties {
  /**
   * Influence factor for this role
   */
  influenceFactor: number;
  
  /**
   * Variance factor for this role
   */
  varianceFactor: number;
  
  /**
   * Role-specific behavior parameters
   */
  behaviorParams: {
    // Add role-specific behavior parameters here
  };
}

/**
 * $roleNameUpper role particle type
 */
export interface ${roleNameUpper}Particle extends Particle {
  role: '$roleNameUpper';
  roleProperties: ${roleNameUpper}Properties;
}

/**
 * Type guard to check if a particle is a $roleNameUpper particle
 */
export function is${roleNameUpper}Particle(particle: Particle): particle is ${roleNameUpper}Particle {
  return particle.role === '$roleNameUpper';
}
"@

# Create behavior file
$behaviorContent = @"
/**
 * $roleNameUpper Role Behavior
 * 
 * @description Behavior implementation for the $roleNameUpper particle role
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';
import { is${roleNameUpper}Particle } from './types';

/**
 * Apply $roleNameUpper role behavior to a particle
 * 
 * @param particle The particle to update
 * @param particles All particles in the system
 * @param deltaTime Time since last update
 */
export function apply${roleNameUpper}Behavior(
  particle: Particle,
  particles: Particle[],
  deltaTime: number
): void {
  // Only apply to $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) return;
  
  // Implement role-specific behavior here
  // ...
}

/**
 * Initialize $roleNameUpper role behavior parameters
 * 
 * @param particle The particle to initialize
 * @param blockNonce Bitcoin block nonce for deterministic initialization
 */
export function initialize${roleNameUpper}Behavior(
  particle: Particle,
  blockNonce: number
): void {
  // Only initialize $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) return;
  
  // Initialize role-specific behavior parameters here
  // ...
}
"@

# Create forces file
$forcesContent = @"
/**
 * $roleNameUpper Role Forces
 * 
 * @description Force calculations for the $roleNameUpper particle role
 */
import { Particle } from '../../types';
import { Vector3 } from 'three';
import { is${roleNameUpper}Particle } from './types';

/**
 * Calculate forces between a $roleNameUpper particle and another particle
 * 
 * @param particle The $roleNameUpper particle
 * @param otherParticle The other particle
 * @param forceAccumulator Vector to accumulate forces
 */
export function calculate${roleNameUpper}Forces(
  particle: Particle,
  otherParticle: Particle,
  forceAccumulator: Vector3
): void {
  // Only calculate for $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) return;
  
  // Calculate role-specific forces here
  // ...
}

/**
 * Apply force field influences to a $roleNameUpper particle
 * 
 * @param particle The $roleNameUpper particle
 * @param forceFields Array of force fields
 * @param forceAccumulator Vector to accumulate forces
 */
export function apply${roleNameUpper}FieldForces(
  particle: Particle,
  forceFields: any[],
  forceAccumulator: Vector3
): void {
  // Only apply to $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) return;
  
  // Apply force field influences here
  // ...
}
"@

# Create visual file
$visualContent = @"
/**
 * $roleNameUpper Role Visual
 * 
 * @description Visual properties for the $roleNameUpper particle role
 */
import { Particle } from '../../types';
import { Color } from 'three';
import { is${roleNameUpper}Particle } from './types';

/**
 * Apply visual properties to a $roleNameUpper particle
 * 
 * @param particle The particle to update
 * @param blockNonce Bitcoin block nonce for deterministic visualization
 */
export function apply${roleNameUpper}Visual(
  particle: Particle,
  blockNonce: number
): void {
  // Only apply to $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) return;
  
  // Apply role-specific visual properties here
  // ...
}

/**
 * Get the base color for a $roleNameUpper particle
 * 
 * @param particle The $roleNameUpper particle
 * @returns The base color for the particle
 */
export function get${roleNameUpper}Color(particle: Particle): Color {
  // Only get color for $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) {
    return new Color(0xffffff);
  }
  
  // Return role-specific color
  // ...
  return new Color(0xffffff); // Replace with actual color
}
"@

# Create index file
$indexContent = @"
/**
 * $roleNameUpper Role
 * 
 * @description Implementation of the $roleNameUpper particle role
 */
export * from './types';
export * from './behavior';
export * from './forces';
export * from './visual';

import { Particle } from '../../types';
import { Vector3 } from 'three';
import { is${roleNameUpper}Particle, ${roleNameUpper}Properties } from './types';
import { apply${roleNameUpper}Behavior, initialize${roleNameUpper}Behavior } from './behavior';
import { calculate${roleNameUpper}Forces, apply${roleNameUpper}FieldForces } from './forces';
import { apply${roleNameUpper}Visual, get${roleNameUpper}Color } from './visual';

/**
 * Create a new $roleNameUpper particle
 * 
 * @param id Unique particle ID
 * @param position Initial position
 * @param blockNonce Bitcoin block nonce for deterministic initialization
 * @returns A new $roleNameUpper particle
 */
export function create${roleNameUpper}Particle(
  id: number,
  position: Vector3,
  blockNonce: number
): Particle {
  // Create base particle
  const particle: Particle = {
    id,
    position: position.clone(),
    velocity: new Vector3(),
    acceleration: new Vector3(),
    mass: 1.0,
    role: '$roleNameUpper',
    color: new Vector3(1, 1, 1), // Will be set by apply${roleNameUpper}Visual
    size: 1.0, // Will be adjusted based on role
    roleProperties: {} as ${roleNameUpper}Properties
  };
  
  // Initialize role-specific properties
  (particle.roleProperties as ${roleNameUpper}Properties) = {
    influenceFactor: 1.0, // Will be set based on role
    varianceFactor: 1.0, // Will be set based on role
    behaviorParams: {}
  };
  
  // Initialize behavior and visual properties
  initialize${roleNameUpper}Behavior(particle, blockNonce);
  apply${roleNameUpper}Visual(particle, blockNonce);
  
  return particle;
}

/**
 * Update a $roleNameUpper particle
 * 
 * @param particle The particle to update
 * @param particles All particles in the system
 * @param deltaTime Time since last update
 */
export function update${roleNameUpper}Particle(
  particle: Particle,
  particles: Particle[],
  deltaTime: number
): void {
  // Only update $roleNameUpper particles
  if (!is${roleNameUpper}Particle(particle)) return;
  
  // Apply behavior
  apply${roleNameUpper}Behavior(particle, particles, deltaTime);
}
"@

# Create test file
$testContent = @"
/**
 * $roleNameUpper Role Tests
 * 
 * @description Tests for the $roleNameUpper particle role
 */
import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { create${roleNameUpper}Particle, is${roleNameUpper}Particle } from './index';
import { ${roleNameUpper}Particle } from './types';

describe('${roleNameUpper} Role', () => {
  let particle: ${roleNameUpper}Particle;
  
  beforeEach(() => {
    // Create a test particle with a fixed nonce for deterministic tests
    particle = create${roleNameUpper}Particle(1, new Vector3(0, 0, 0), 12345) as ${roleNameUpper}Particle;
  });
  
  it('should create a $roleNameUpper particle', () => {
    expect(particle).toBeDefined();
    expect(particle.role).toBe('$roleNameUpper');
    expect(is${roleNameUpper}Particle(particle)).toBe(true);
  });
  
  it('should have the correct role properties', () => {
    expect(particle.roleProperties).toBeDefined();
    expect(particle.roleProperties.influenceFactor).toBeDefined();
    expect(particle.roleProperties.varianceFactor).toBeDefined();
    expect(particle.roleProperties.behaviorParams).toBeDefined();
  });
  
  // Add more tests for behavior, forces, and visual properties
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $behaviorPath -Value $behaviorContent -Force
Set-Content -Path $forcesPath -Value $forcesContent -Force
Set-Content -Path $visualPath -Value $visualContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created $roleNameUpper role implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $behaviorPath" -ForegroundColor Green
Write-Host "  - $forcesPath" -ForegroundColor Green
Write-Host "  - $visualPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
