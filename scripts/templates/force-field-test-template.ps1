# Force Field Test Template
# This template is used to generate test scripts for force fields

param (
    [Parameter(Mandatory=$true)]
    [string]$fieldType,
    [string]$outputDir = "src/domains/physics/forceFields",
    [string]$description = "Tests for the $fieldType force field"
)

# Configuration
$fieldTypeLower = $fieldType.ToLower()
$fieldTypeUpper = $fieldType.ToUpper()
$testPath = "$outputDir/$fieldTypeLower/$fieldTypeLower.test.ts"

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
import { Particle } from '../../../particle/types';

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
  
  describe('Creation and Type Checking', () => {
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
    
    it('should correctly identify non-$fieldTypeUpper fields', () => {
      const otherField: ForceField = {
        id: 2,
        type: 'OTHER',
        position: new Vector3(),
        role: 'CORE',
        properties: {
          strength: 1.0,
          range: 5.0,
          shape: {},
          rotation: {
            speed: 0,
            axis: new Vector3(0, 1, 0)
          }
        },
        calculateInfluence: () => {},
        getVisualization: () => ({ color: null, opacity: 0, vertices: [] })
      };
      
      expect(is${fieldTypeUpper}Field(otherField)).toBe(false);
    });
  });
  
  describe('Geometry', () => {
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
  });
  
  describe('Influence', () => {
    it('should calculate influence on particles', () => {
      // Create a test particle
      const particle: Particle = {
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
    
    it('should apply containment forces to particles outside the field', () => {
      // Create a test particle outside the field
      const particle: Particle = {
        id: 1,
        position: new Vector3(field.properties.range * 1.2, 0, 0), // Outside the field
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
      
      // Force should be non-zero and directed inward
      expect(forceAccumulator.length()).toBeGreaterThan(0);
      expect(forceAccumulator.x).toBeLessThan(0); // Force should pull toward center
    });
    
    it('should apply directional forces to particles inside the field', () => {
      // Create a test particle inside the field
      const particle: Particle = {
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
      
      // Check for specific directional forces based on field type
      // This will depend on the specific field type being tested
      // ...
    });
  });
  
  describe('Visualization', () => {
    it('should provide visualization data', () => {
      const visualization = field.getVisualization();
      
      expect(visualization).toBeDefined();
      expect(visualization.color).toBeDefined();
      expect(visualization.opacity).toBeDefined();
      expect(visualization.vertices).toBeDefined();
      expect(visualization.vertices.length).toBeGreaterThan(0);
    });
    
    it('should generate deterministic visualization from the same nonce', () => {
      // Create two fields with the same nonce
      const field1 = create${fieldTypeUpper}Field(
        1, 
        new Vector3(0, 0, 0), 
        'CORE', 
        { nonce: 12345, merkleRoot: 'test' }
      );
      
      const field2 = create${fieldTypeUpper}Field(
        2, 
        new Vector3(1, 1, 1), 
        'CORE', 
        { nonce: 12345, merkleRoot: 'test' }
      );
      
      // Visual properties should be similar despite different positions and IDs
      const vis1 = field1.getVisualization();
      const vis2 = field2.getVisualization();
      
      // Check that colors are the same
      expect(vis1.color.equals(vis2.color)).toBe(true);
      
      // Check that opacity is the same
      expect(vis1.opacity).toBe(vis2.opacity);
      
      // Check that vertex counts are the same
      expect(vis1.vertices.length).toBe(vis2.vertices.length);
    });
  });
  
  describe('Bitcoin Data Integration', () => {
    it('should generate different fields from different nonces', () => {
      // Create two fields with different nonces
      const field1 = create${fieldTypeUpper}Field(
        1, 
        new Vector3(0, 0, 0), 
        'CORE', 
        { nonce: 12345, merkleRoot: 'test' }
      );
      
      const field2 = create${fieldTypeUpper}Field(
        1, 
        new Vector3(0, 0, 0), 
        'CORE', 
        { nonce: 67890, merkleRoot: 'test' }
      );
      
      // Fields should have different properties
      expect(field1.properties.strength).not.toBe(field2.properties.strength);
      expect(field1.properties.range).not.toBe(field2.properties.range);
      expect(field1.properties.rotation.speed).not.toBe(field2.properties.rotation.speed);
    });
    
    it('should generate the same field from the same nonce', () => {
      // Create two fields with the same nonce
      const field1 = create${fieldTypeUpper}Field(
        1, 
        new Vector3(0, 0, 0), 
        'CORE', 
        { nonce: 12345, merkleRoot: 'test' }
      );
      
      const field2 = create${fieldTypeUpper}Field(
        1, 
        new Vector3(0, 0, 0), 
        'CORE', 
        { nonce: 12345, merkleRoot: 'test' }
      );
      
      // Fields should have the same properties
      expect(field1.properties.strength).toBe(field2.properties.strength);
      expect(field1.properties.range).toBe(field2.properties.range);
      expect(field1.properties.rotation.speed).toBe(field2.properties.rotation.speed);
    });
  });
});
"@

# Save the file
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created $fieldTypeUpper force field test file:" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
