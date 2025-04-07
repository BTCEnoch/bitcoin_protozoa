# Force Field Implementation Template
# This template is used to generate scripts for implementing force fields

param (
    [Parameter(Mandatory=$true)]
    [string]$fieldType,
    [string]$outputDir = "src/domains/physics/forceFields",
    [string]$description = "Implements the $fieldType force field"
)

# Configuration
$fieldTypeLower = $fieldType.ToLower()
$fieldTypeUpper = $fieldType.ToUpper()
$fieldDir = "$outputDir/$fieldTypeLower"
$indexPath = "$fieldDir/index.ts"
$typesPath = "$fieldDir/types.ts"
$geometryPath = "$fieldDir/geometry.ts"
$influencePath = "$fieldDir/influence.ts"
$visualPath = "$fieldDir/visual.ts"
$testPath = "src/domains/physics/forceFields/$fieldTypeLower/$fieldTypeLower.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $fieldDir)) {
    New-Item -ItemType Directory -Path $fieldDir -Force | Out-Null
    Write-Host "Created directory: $fieldDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * $fieldTypeUpper Force Field Types
 * 
 * @description Type definitions for the $fieldTypeUpper force field
 */
import { Vector3 } from 'three';
import { ForceField } from '../../types';
import { ParticleRole } from '../../../particle/types';

/**
 * Properties specific to $fieldTypeUpper force fields
 */
export interface ${fieldTypeUpper}FieldProperties {
  /**
   * Strength of the force field
   */
  strength: number;
  
  /**
   * Range of influence
   */
  range: number;
  
  /**
   * Shape parameters
   */
  shape: {
    // Add shape-specific parameters here
  };
  
  /**
   * Rotation parameters
   */
  rotation: {
    speed: number;
    axis: Vector3;
  };
}

/**
 * $fieldTypeUpper force field type
 */
export interface ${fieldTypeUpper}Field extends ForceField {
  type: '$fieldTypeUpper';
  role: ParticleRole;
  properties: ${fieldTypeUpper}FieldProperties;
}

/**
 * Type guard to check if a force field is a $fieldTypeUpper field
 */
export function is${fieldTypeUpper}Field(field: ForceField): field is ${fieldTypeUpper}Field {
  return field.type === '$fieldTypeUpper';
}
"@

# Create geometry file
$geometryContent = @"
/**
 * $fieldTypeUpper Force Field Geometry
 * 
 * @description Geometry implementation for the $fieldTypeUpper force field
 */
import { Vector3 } from 'three';
import { is${fieldTypeUpper}Field } from './types';
import { ForceField } from '../../types';

/**
 * Check if a point is inside the $fieldTypeUpper force field
 * 
 * @param field The force field
 * @param point The point to check
 * @returns True if the point is inside the field, false otherwise
 */
export function isPointInside${fieldTypeUpper}Field(
  field: ForceField,
  point: Vector3
): boolean {
  // Only check for $fieldTypeUpper fields
  if (!is${fieldTypeUpper}Field(field)) return false;
  
  // Implement field-specific containment check here
  // ...
  
  // Default implementation: spherical field
  const distanceSquared = point.distanceToSquared(field.position);
  return distanceSquared <= field.properties.range * field.properties.range;
}

/**
 * Calculate the distance from a point to the $fieldTypeUpper force field boundary
 * 
 * @param field The force field
 * @param point The point to check
 * @returns The distance to the field boundary (negative if inside)
 */
export function distanceToFieldBoundary(
  field: ForceField,
  point: Vector3
): number {
  // Only calculate for $fieldTypeUpper fields
  if (!is${fieldTypeUpper}Field(field)) return Infinity;
  
  // Implement field-specific distance calculation here
  // ...
  
  // Default implementation: spherical field
  const distance = point.distanceTo(field.position);
  return distance - field.properties.range;
}
"@

# Create influence file
$influenceContent = @"
/**
 * $fieldTypeUpper Force Field Influence
 * 
 * @description Influence calculations for the $fieldTypeUpper force field
 */
import { Vector3 } from 'three';
import { is${fieldTypeUpper}Field } from './types';
import { ForceField } from '../../types';
import { Particle } from '../../../particle/types';
import { isPointInside${fieldTypeUpper}Field, distanceToFieldBoundary } from './geometry';

/**
 * Calculate the influence of a $fieldTypeUpper force field on a particle
 * 
 * @param field The force field
 * @param particle The particle to influence
 * @param forceAccumulator Vector to accumulate the calculated force
 */
export function calculate${fieldTypeUpper}FieldInfluence(
  field: ForceField,
  particle: Particle,
  forceAccumulator: Vector3
): void {
  // Only calculate for $fieldTypeUpper fields
  if (!is${fieldTypeUpper}Field(field)) return;
  
  // Check if the particle is compatible with this field
  if (!isParticleCompatibleWith${fieldTypeUpper}Field(field, particle)) return;
  
  // Calculate containment force
  calculateContainmentForce(field, particle, forceAccumulator);
  
  // Calculate directional influence
  calculateDirectionalInfluence(field, particle, forceAccumulator);
}

/**
 * Check if a particle is compatible with a $fieldTypeUpper force field
 * 
 * @param field The force field
 * @param particle The particle to check
 * @returns True if the particle is compatible with the field
 */
function isParticleCompatibleWith${fieldTypeUpper}Field(
  field: ForceField,
  particle: Particle
): boolean {
  // Implement field-specific compatibility check here
  // ...
  
  // Default implementation: check if particle role matches field role
  return particle.role === field.role;
}

/**
 * Calculate the containment force of a $fieldTypeUpper force field on a particle
 * 
 * @param field The force field
 * @param particle The particle to influence
 * @param forceAccumulator Vector to accumulate the calculated force
 */
function calculateContainmentForce(
  field: ForceField,
  particle: Particle,
  forceAccumulator: Vector3
): void {
  // Only calculate for $fieldTypeUpper fields
  if (!is${fieldTypeUpper}Field(field)) return;
  
  // Get distance to field boundary
  const distance = distanceToFieldBoundary(field, particle.position);
  
  // If outside the field, apply inward force
  if (distance > 0) {
    const direction = new Vector3().subVectors(field.position, particle.position).normalize();
    const forceMagnitude = field.properties.strength * (distance / field.properties.range);
    forceAccumulator.add(direction.multiplyScalar(forceMagnitude));
  }
  // If inside but near the boundary, apply gentle inward force
  else if (distance > -0.2 * field.properties.range) {
    const direction = new Vector3().subVectors(field.position, particle.position).normalize();
    const forceMagnitude = field.properties.strength * 0.2 * (distance / field.properties.range);
    forceAccumulator.add(direction.multiplyScalar(forceMagnitude));
  }
}

/**
 * Calculate the directional influence of a $fieldTypeUpper force field on a particle
 * 
 * @param field The force field
 * @param particle The particle to influence
 * @param forceAccumulator Vector to accumulate the calculated force
 */
function calculateDirectionalInfluence(
  field: ForceField,
  particle: Particle,
  forceAccumulator: Vector3
): void {
  // Only calculate for $fieldTypeUpper fields
  if (!is${fieldTypeUpper}Field(field)) return;
  
  // Implement field-specific directional influence here
  // ...
}
"@

# Create visual file
$visualContent = @"
/**
 * $fieldTypeUpper Force Field Visual
 * 
 * @description Visual properties for the $fieldTypeUpper force field
 */
import { Color, Vector3 } from 'three';
import { is${fieldTypeUpper}Field } from './types';
import { ForceField } from '../../types';

/**
 * Get the visualization data for a $fieldTypeUpper force field
 * 
 * @param field The force field
 * @returns Object containing visualization data
 */
export function get${fieldTypeUpper}FieldVisualization(
  field: ForceField
): { color: Color; opacity: number; vertices: Vector3[] } {
  // Only visualize $fieldTypeUpper fields
  if (!is${fieldTypeUpper}Field(field)) {
    return {
      color: new Color(0xffffff),
      opacity: 0.1,
      vertices: []
    };
  }
  
  // Implement field-specific visualization here
  // ...
  
  // Default implementation: simple wireframe sphere
  const color = new Color(0x00ff00); // Replace with field-specific color
  const opacity = 0.2;
  
  // Generate vertices for visualization
  const vertices: Vector3[] = [];
  const segments = 16;
  const radius = field.properties.range;
  
  // Generate a simple wireframe sphere
  for (let i = 0; i <= segments; i++) {
    const theta = (i / segments) * Math.PI * 2;
    for (let j = 0; j <= segments; j++) {
      const phi = (j / segments) * Math.PI;
      const x = radius * Math.sin(phi) * Math.cos(theta);
      const y = radius * Math.sin(phi) * Math.sin(theta);
      const z = radius * Math.cos(phi);
      vertices.push(new Vector3(x, y, z).add(field.position));
    }
  }
  
  return { color, opacity, vertices };
}
"@

# Create index file
$indexContent = @"
/**
 * $fieldTypeUpper Force Field
 * 
 * @description Implementation of the $fieldTypeUpper force field
 */
export * from './types';
export * from './geometry';
export * from './influence';
export * from './visual';

import { Vector3 } from 'three';
import { ForceField } from '../../types';
import { ParticleRole } from '../../../particle/types';
import { ${fieldTypeUpper}Field, ${fieldTypeUpper}FieldProperties } from './types';
import { calculate${fieldTypeUpper}FieldInfluence } from './influence';
import { get${fieldTypeUpper}FieldVisualization } from './visual';

/**
 * Create a new $fieldTypeUpper force field
 * 
 * @param id Unique field ID
 * @param position Field position
 * @param role Particle role this field is associated with
 * @param blockData Bitcoin block data for deterministic initialization
 * @returns A new $fieldTypeUpper force field
 */
export function create${fieldTypeUpper}Field(
  id: number,
  position: Vector3,
  role: ParticleRole,
  blockData: { nonce: number; merkleRoot: string }
): ForceField {
  // Create base field
  const field: ${fieldTypeUpper}Field = {
    id,
    type: '$fieldTypeUpper',
    position: position.clone(),
    role,
    properties: {
      strength: 1.0, // Will be set based on block data
      range: 5.0,    // Will be set based on block data
      shape: {},
      rotation: {
        speed: 0.1,  // Will be set based on block data
        axis: new Vector3(0, 1, 0) // Will be set based on block data
      }
    },
    calculateInfluence: (particle, forceAccumulator) => 
      calculate${fieldTypeUpper}FieldInfluence(field, particle, forceAccumulator),
    getVisualization: () => get${fieldTypeUpper}FieldVisualization(field)
  };
  
  // Initialize field properties based on block data
  initializeFieldProperties(field, blockData);
  
  return field;
}

/**
 * Initialize $fieldTypeUpper force field properties based on Bitcoin block data
 * 
 * @param field The force field to initialize
 * @param blockData Bitcoin block data
 */
function initializeFieldProperties(
  field: ${fieldTypeUpper}Field,
  blockData: { nonce: number; merkleRoot: string }
): void {
  // Create a deterministic RNG based on block data
  const rng = createDeterministicRNG(blockData.nonce, field.id);
  
  // Set field properties based on RNG
  field.properties.strength = 0.5 + rng() * 1.5; // Range: 0.5 - 2.0
  field.properties.range = 3.0 + rng() * 7.0;    // Range: 3.0 - 10.0
  
  // Set rotation properties
  field.properties.rotation.speed = 0.05 + rng() * 0.15; // Range: 0.05 - 0.2
  field.properties.rotation.axis = new Vector3(
    -1 + rng() * 2, // Range: -1 - 1
    -1 + rng() * 2, // Range: -1 - 1
    -1 + rng() * 2  // Range: -1 - 1
  ).normalize();
  
  // Set shape properties based on field type and role
  // ...
}

/**
 * Create a deterministic RNG based on a seed
 * 
 * @param nonce Bitcoin block nonce
 * @param fieldId Field ID for additional entropy
 * @returns A function that returns a deterministic random number between 0 and 1
 */
function createDeterministicRNG(nonce: number, fieldId: number): () => number {
  let seed = nonce + fieldId * 1000;
  
  // Simple mulberry32 implementation
  return function() {
    seed += 0x6D2B79F5;
    let t = seed;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
}
"@

# Create test file
$testContent = @"
/**
 * $fieldTypeUpper Force Field Tests
 * 
 * @description Tests for the $fieldTypeUpper force field
 */
import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { create${fieldTypeUpper}Field, is${fieldTypeUpper}Field } from './index';
import { ${fieldTypeUpper}Field } from './types';
import { isPointInside${fieldTypeUpper}Field } from './geometry';
import { ForceField } from '../../types';

describe('${fieldTypeUpper} Force Field', () => {
  let field: ForceField;
  
  beforeEach(() => {
    // Create a test field with a fixed nonce for deterministic tests
    field = create${fieldTypeUpper}Field(
      1, 
      new Vector3(0, 0, 0), 
      'CORE', 
      { nonce: 12345, merkleRoot: 'test' }
    );
  });
  
  it('should create a $fieldTypeUpper force field', () => {
    expect(field).toBeDefined();
    expect(field.type).toBe('$fieldTypeUpper');
    expect(is${fieldTypeUpper}Field(field)).toBe(true);
  });
  
  it('should have the correct properties', () => {
    expect(field.properties).toBeDefined();
    expect(field.properties.strength).toBeDefined();
    expect(field.properties.range).toBeDefined();
    expect(field.properties.rotation).toBeDefined();
    expect(field.properties.rotation.speed).toBeDefined();
    expect(field.properties.rotation.axis).toBeDefined();
  });
  
  it('should correctly determine if a point is inside the field', () => {
    // Point at the center should be inside
    expect(isPointInside${fieldTypeUpper}Field(field, new Vector3(0, 0, 0))).toBe(true);
    
    // Point far away should be outside
    expect(isPointInside${fieldTypeUpper}Field(field, new Vector3(100, 100, 100))).toBe(false);
    
    // Point at the boundary should be inside
    const boundaryPoint = new Vector3(field.properties.range, 0, 0);
    expect(isPointInside${fieldTypeUpper}Field(field, boundaryPoint)).toBe(true);
    
    // Point just outside the boundary should be outside
    const outsidePoint = new Vector3(field.properties.range + 0.1, 0, 0);
    expect(isPointInside${fieldTypeUpper}Field(field, outsidePoint)).toBe(false);
  });
  
  it('should calculate influence on particles', () => {
    // Create a test particle
    const particle = {
      id: 1,
      position: new Vector3(field.properties.range * 0.5, 0, 0), // Inside the field
      velocity: new Vector3(),
      acceleration: new Vector3(),
      mass: 1.0,
      role: 'CORE',
      color: new Vector3(),
      size: 1.0,
      roleProperties: {}
    };
    
    // Calculate influence
    const forceAccumulator = new Vector3();
    field.calculateInfluence(particle, forceAccumulator);
    
    // Force should be non-zero
    expect(forceAccumulator.length()).toBeGreaterThan(0);
  });
  
  it('should provide visualization data', () => {
    const visualization = field.getVisualization();
    
    expect(visualization).toBeDefined();
    expect(visualization.color).toBeDefined();
    expect(visualization.opacity).toBeDefined();
    expect(visualization.vertices).toBeDefined();
    expect(visualization.vertices.length).toBeGreaterThan(0);
  });
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $geometryPath -Value $geometryContent -Force
Set-Content -Path $influencePath -Value $influenceContent -Force
Set-Content -Path $visualPath -Value $visualContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created $fieldTypeUpper force field implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $geometryPath" -ForegroundColor Green
Write-Host "  - $influencePath" -ForegroundColor Green
Write-Host "  - $visualPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
