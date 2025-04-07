# Role Force Matrix Template
# This template is used to generate the role force matrix implementation

param (
    [string]$outputDir = "src/domains/particle/roles",
    [string]$description = "Implements the force calculation matrix for particle roles"
)

# Configuration
$forceMatrixDir = "$outputDir/forceMatrix"
$indexPath = "$forceMatrixDir/index.ts"
$typesPath = "$forceMatrixDir/types.ts"
$matrixPath = "$forceMatrixDir/matrix.ts"
$calculatorPath = "$forceMatrixDir/calculator.ts"
$testPath = "$forceMatrixDir/forceMatrix.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $forceMatrixDir)) {
    New-Item -ItemType Directory -Path $forceMatrixDir -Force | Out-Null
    Write-Host "Created directory: $forceMatrixDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * Force Matrix Types
 * 
 * @description Type definitions for the role force matrix
 */
import { ParticleRole } from '../types';

/**
 * Force matrix entry type
 */
export interface ForceMatrixEntry {
  sourceRole: ParticleRole;
  targetRole: ParticleRole;
  forceFactor: number;
}

/**
 * Force matrix type
 */
export type ForceMatrix = ForceMatrixEntry[];

/**
 * Role influence modifiers
 */
export interface RoleInfluenceModifiers {
  [key: string]: number;
}
"@

# Create matrix file
$matrixContent = @"
/**
 * Force Matrix
 * 
 * @description Force calculation matrix for particle roles
 */
import { ParticleRole } from '../types';
import { ForceMatrix, RoleInfluenceModifiers } from './types';

/**
 * Role influence modifiers
 * These values modify the influence of each role in force calculations
 */
export const ROLE_INFLUENCE_MODIFIERS: RoleInfluenceModifiers = {
  CORE: 1.5,     // Core particles have 50% more influence
  CONTROL: 1.2,  // Control particles have 20% more influence
  MOVEMENT: 0.8, // Movement particles have 20% less influence
  DEFENSE: 1.0,  // Defense particles have normal influence
  ATTACK: 0.7    // Attack particles have 30% less influence
};

/**
 * Force calculation matrix
 * This matrix defines the attraction/repulsion between different particle roles
 * Positive values indicate attraction, negative values indicate repulsion
 * 
 * The matrix is defined as a list of entries for better maintainability
 */
export const FORCE_MATRIX: ForceMatrix = [
  // CORE particle forces
  { sourceRole: 'CORE', targetRole: 'CORE', forceFactor: 0.5 },    // Moderate self-attraction
  { sourceRole: 'CORE', targetRole: 'CONTROL', forceFactor: 0.8 }, // Strong attraction to CONTROL
  { sourceRole: 'CORE', targetRole: 'MOVEMENT', forceFactor: 0.3 }, // Weak attraction to MOVEMENT
  { sourceRole: 'CORE', targetRole: 'DEFENSE', forceFactor: 0.2 }, // Weak attraction to DEFENSE
  { sourceRole: 'CORE', targetRole: 'ATTACK', forceFactor: -0.1 }, // Slight repulsion from ATTACK
  
  // CONTROL particle forces
  { sourceRole: 'CONTROL', targetRole: 'CORE', forceFactor: 0.8 },    // Strong attraction to CORE
  { sourceRole: 'CONTROL', targetRole: 'CONTROL', forceFactor: 0.3 }, // Moderate self-attraction
  { sourceRole: 'CONTROL', targetRole: 'MOVEMENT', forceFactor: 0.6 }, // Strong attraction to MOVEMENT
  { sourceRole: 'CONTROL', targetRole: 'DEFENSE', forceFactor: 0.4 }, // Moderate attraction to DEFENSE
  { sourceRole: 'CONTROL', targetRole: 'ATTACK', forceFactor: 0.2 },  // Weak attraction to ATTACK
  
  // MOVEMENT particle forces
  { sourceRole: 'MOVEMENT', targetRole: 'CORE', forceFactor: 0.3 },    // Weak attraction to CORE
  { sourceRole: 'MOVEMENT', targetRole: 'CONTROL', forceFactor: 0.6 }, // Strong attraction to CONTROL
  { sourceRole: 'MOVEMENT', targetRole: 'MOVEMENT', forceFactor: 0.2 }, // Weak self-attraction
  { sourceRole: 'MOVEMENT', targetRole: 'DEFENSE', forceFactor: 0.3 }, // Weak attraction to DEFENSE
  { sourceRole: 'MOVEMENT', targetRole: 'ATTACK', forceFactor: 0.5 },  // Moderate attraction to ATTACK
  
  // DEFENSE particle forces
  { sourceRole: 'DEFENSE', targetRole: 'CORE', forceFactor: 0.2 },    // Weak attraction to CORE
  { sourceRole: 'DEFENSE', targetRole: 'CONTROL', forceFactor: 0.4 }, // Moderate attraction to CONTROL
  { sourceRole: 'DEFENSE', targetRole: 'MOVEMENT', forceFactor: 0.3 }, // Weak attraction to MOVEMENT
  { sourceRole: 'DEFENSE', targetRole: 'DEFENSE', forceFactor: 0.4 }, // Moderate self-attraction
  { sourceRole: 'DEFENSE', targetRole: 'ATTACK', forceFactor: 0.7 },  // Strong attraction to ATTACK
  
  // ATTACK particle forces
  { sourceRole: 'ATTACK', targetRole: 'CORE', forceFactor: -0.1 },    // Slight repulsion from CORE
  { sourceRole: 'ATTACK', targetRole: 'CONTROL', forceFactor: 0.2 }, // Weak attraction to CONTROL
  { sourceRole: 'ATTACK', targetRole: 'MOVEMENT', forceFactor: 0.5 }, // Moderate attraction to MOVEMENT
  { sourceRole: 'ATTACK', targetRole: 'DEFENSE', forceFactor: 0.7 }, // Strong attraction to DEFENSE
  { sourceRole: 'ATTACK', targetRole: 'ATTACK', forceFactor: 0.3 }   // Moderate self-attraction
];
"@

# Create calculator file
$calculatorContent = @"
/**
 * Force Calculator
 * 
 * @description Functions for calculating forces between particles based on the force matrix
 */
import { Particle } from '../types';
import { Vector3 } from 'three';
import { FORCE_MATRIX, ROLE_INFLUENCE_MODIFIERS } from './matrix';

/**
 * Base force factor used in calculations
 */
const BASE_FORCE_FACTOR = 0.5;

/**
 * Distance cutoff for force calculations
 * Forces beyond this distance are ignored for performance
 */
const FORCE_DISTANCE_CUTOFF = 10.0;

/**
 * Get the force factor between two particles based on their roles
 * 
 * @param sourceRole The role of the source particle
 * @param targetRole The role of the target particle
 * @returns The force factor from the matrix, or 0 if not found
 */
export function getForceFactor(sourceRole: string, targetRole: string): number {
  const entry = FORCE_MATRIX.find(
    e => e.sourceRole === sourceRole && e.targetRole === targetRole
  );
  
  return entry ? entry.forceFactor : 0;
}

/**
 * Get the influence modifier for a particle role
 * 
 * @param role The particle role
 * @returns The influence modifier, or 1.0 if not found
 */
export function getInfluenceModifier(role: string): number {
  return ROLE_INFLUENCE_MODIFIERS[role] || 1.0;
}

/**
 * Calculate the force between two particles based on the force matrix
 * 
 * @param source The source particle
 * @param target The target particle
 * @param forceAccumulator Vector to accumulate the calculated force
 */
export function calculateForce(
  source: Particle,
  target: Particle,
  forceAccumulator: Vector3
): void {
  // Skip self-interaction
  if (source.id === target.id) return;
  
  // Calculate distance between particles
  const distance = source.position.distanceTo(target.position);
  
  // Skip if beyond cutoff distance
  if (distance > FORCE_DISTANCE_CUTOFF) return;
  
  // Get force factor from matrix
  const forceFactor = getForceFactor(source.role, target.role);
  
  // Get influence modifier for source role
  const influenceModifier = getInfluenceModifier(source.role);
  
  // Calculate force magnitude (inverse square law)
  const forceMagnitude = (BASE_FORCE_FACTOR * forceFactor * influenceModifier) / (distance * distance);
  
  // Calculate force direction (from source to target)
  const forceDirection = new Vector3().subVectors(target.position, source.position).normalize();
  
  // Apply force to accumulator
  forceAccumulator.add(forceDirection.multiplyScalar(forceMagnitude));
}
"@

# Create index file
$indexContent = @"
/**
 * Force Matrix
 * 
 * @description Force calculation matrix for particle roles
 */
export * from './types';
export * from './matrix';
export * from './calculator';
"@

# Create test file
$testContent = @"
/**
 * Force Matrix Tests
 * 
 * @description Tests for the role force matrix
 */
import { describe, it, expect } from 'vitest';
import { Vector3 } from 'three';
import { Particle } from '../types';
import { getForceFactor, getInfluenceModifier, calculateForce } from './calculator';
import { FORCE_MATRIX, ROLE_INFLUENCE_MODIFIERS } from './matrix';

describe('Force Matrix', () => {
  it('should have entries for all role combinations', () => {
    const roles = ['CORE', 'CONTROL', 'MOVEMENT', 'DEFENSE', 'ATTACK'];
    
    // Check that all role combinations are covered
    roles.forEach(sourceRole => {
      roles.forEach(targetRole => {
        const entry = FORCE_MATRIX.find(
          e => e.sourceRole === sourceRole && e.targetRole === targetRole
        );
        
        expect(entry).toBeDefined();
        expect(typeof entry.forceFactor).toBe('number');
      });
    });
  });
  
  it('should have influence modifiers for all roles', () => {
    const roles = ['CORE', 'CONTROL', 'MOVEMENT', 'DEFENSE', 'ATTACK'];
    
    roles.forEach(role => {
      expect(ROLE_INFLUENCE_MODIFIERS[role]).toBeDefined();
      expect(typeof ROLE_INFLUENCE_MODIFIERS[role]).toBe('number');
    });
  });
  
  it('should correctly retrieve force factors', () => {
    // Test a few specific entries
    expect(getForceFactor('CORE', 'CONTROL')).toBe(0.8);
    expect(getForceFactor('ATTACK', 'CORE')).toBe(-0.1);
    expect(getForceFactor('MOVEMENT', 'MOVEMENT')).toBe(0.2);
  });
  
  it('should correctly retrieve influence modifiers', () => {
    expect(getInfluenceModifier('CORE')).toBe(1.5);
    expect(getInfluenceModifier('ATTACK')).toBe(0.7);
  });
  
  it('should calculate forces correctly', () => {
    // Create test particles
    const source: Particle = {
      id: 1,
      position: new Vector3(0, 0, 0),
      velocity: new Vector3(),
      acceleration: new Vector3(),
      mass: 1.0,
      role: 'CORE',
      color: new Vector3(),
      size: 1.0,
      roleProperties: {}
    };
    
    const target: Particle = {
      id: 2,
      position: new Vector3(1, 0, 0), // 1 unit away in x direction
      velocity: new Vector3(),
      acceleration: new Vector3(),
      mass: 1.0,
      role: 'CONTROL',
      color: new Vector3(),
      size: 1.0,
      roleProperties: {}
    };
    
    // Calculate force
    const forceAccumulator = new Vector3();
    calculateForce(source, target, forceAccumulator);
    
    // Expected force: BASE_FORCE_FACTOR * forceFactor * influenceModifier / distance^2
    // in the direction from source to target
    const expectedForceMagnitude = 0.5 * 0.8 * 1.5 / 1.0; // BASE_FORCE * 0.8 * 1.5 / 1^2
    
    expect(forceAccumulator.x).toBeCloseTo(expectedForceMagnitude);
    expect(forceAccumulator.y).toBeCloseTo(0);
    expect(forceAccumulator.z).toBeCloseTo(0);
  });
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $matrixPath -Value $matrixContent -Force
Set-Content -Path $calculatorPath -Value $calculatorContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created force matrix implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $matrixPath" -ForegroundColor Green
Write-Host "  - $calculatorPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
