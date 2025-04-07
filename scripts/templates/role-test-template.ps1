# Role Test Template
# This template is used to generate test scripts for particle roles

param (
    [Parameter(Mandatory=$true)]
    [string]$roleName,
    [string]$outputDir = "src/domains/particle/roles",
    [string]$description = "Tests for the $roleName role"
)

# Configuration
$roleNameLower = $roleName.ToLower()
$roleNameUpper = $roleName.ToUpper()
$testPath = "$outputDir/$roleNameLower/$roleNameLower.test.ts"

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
import { Particle } from '../../types';

describe('${roleNameUpper} Role', () => {
  let particle: ${roleNameUpper}Particle;
  
  beforeEach(() => {
    // Create a test particle with a fixed nonce for deterministic tests
    particle = create${roleNameUpper}Particle(1, new Vector3(0, 0, 0), 12345) as ${roleNameUpper}Particle;
  });
  
  describe('Creation and Type Checking', () => {
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
    
    it('should correctly identify non-$roleNameUpper particles', () => {
      const otherParticle: Particle = {
        id: 2,
        position: new Vector3(),
        velocity: new Vector3(),
        acceleration: new Vector3(),
        mass: 1.0,
        role: 'OTHER' as any,
        color: new Vector3(),
        size: 1.0,
        roleProperties: {}
      };
      
      expect(is${roleNameUpper}Particle(otherParticle)).toBe(false);
    });
  });
  
  describe('Behavior', () => {
    it('should have role-specific behavior parameters', () => {
      // Test specific behavior parameters for this role
      // ...
    });
    
    it('should update correctly', () => {
      // Create a test environment
      const particles: Particle[] = [particle];
      const deltaTime = 0.016; // ~60fps
      
      // Save initial state
      const initialPosition = particle.position.clone();
      const initialVelocity = particle.velocity.clone();
      
      // Update the particle
      // This would call your update function, e.g.:
      // update${roleNameUpper}Particle(particle, particles, deltaTime);
      
      // Check that the particle was updated
      // This will depend on the specific behavior of the role
      // ...
    });
  });
  
  describe('Forces', () => {
    it('should calculate forces correctly', () => {
      // Create a test environment
      const otherParticle: Particle = {
        id: 2,
        position: new Vector3(1, 0, 0), // 1 unit away in x direction
        velocity: new Vector3(),
        acceleration: new Vector3(),
        mass: 1.0,
        role: 'CONTROL' as any,
        color: new Vector3(),
        size: 1.0,
        roleProperties: {}
      };
      
      // Calculate forces
      const forceAccumulator = new Vector3();
      // This would call your force calculation function, e.g.:
      // calculate${roleNameUpper}Forces(particle, otherParticle, forceAccumulator);
      
      // Check that forces were calculated correctly
      // This will depend on the specific force calculations for the role
      // ...
    });
    
    it('should respond to force fields correctly', () => {
      // Create a test force field
      const forceField = {
        id: 1,
        type: 'TEST',
        position: new Vector3(0, 0, 0),
        role: '$roleNameUpper' as any,
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
      
      // Calculate field forces
      const forceAccumulator = new Vector3();
      // This would call your field force calculation function, e.g.:
      // apply${roleNameUpper}FieldForces(particle, [forceField], forceAccumulator);
      
      // Check that field forces were calculated correctly
      // This will depend on the specific field force calculations for the role
      // ...
    });
  });
  
  describe('Visual Properties', () => {
    it('should have the correct visual properties', () => {
      // Check color
      // This would call your color function, e.g.:
      // const color = get${roleNameUpper}Color(particle);
      // expect(color).toBeDefined();
      
      // Check size
      expect(particle.size).toBeGreaterThan(0);
      
      // Check other visual properties specific to this role
      // ...
    });
    
    it('should generate deterministic visual properties from the same nonce', () => {
      // Create two particles with the same nonce
      const particle1 = create${roleNameUpper}Particle(1, new Vector3(0, 0, 0), 12345) as ${roleNameUpper}Particle;
      const particle2 = create${roleNameUpper}Particle(2, new Vector3(1, 1, 1), 12345) as ${roleNameUpper}Particle;
      
      // Visual properties should be the same despite different positions and IDs
      // This would compare visual properties, e.g.:
      // expect(get${roleNameUpper}Color(particle1).equals(get${roleNameUpper}Color(particle2))).toBe(true);
      
      // Check other deterministic properties
      // ...
    });
  });
});
"@

# Save the file
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created $roleNameUpper role test file:" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
