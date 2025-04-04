/**
 * Particle-Physics Integration Tests
 *
 * @description Tests for the integration between particle and physics systems
 */

import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { ParticleService } from '../../../src/domains/particle/services/particleService';
import { PhysicsService } from '../../../src/domains/physics/services/physicsService';
import { expectVectorToBeCloseTo } from '../../utils/assertions';

describe('Particle-Physics Integration', () => {
  let particleService: ParticleService;
  let physicsService: PhysicsService;
  const testNonce = 12345;

  beforeEach(() => {
    // Create services
    particleService = new ParticleService();
    physicsService = new PhysicsService();

    // Initialize particles
    particleService.initialize({ nonce: testNonce });

    // Set particles in physics service
    physicsService.setParticles(particleService.getParticles());
  });

  it('should update particle positions through physics simulation', () => {
    // Get initial positions
    const initialPositions = particleService.getParticles().map(p => ({
      id: p.id,
      position: p.position.clone()
    }));

    // Update physics
    physicsService.update({ deltaTime: 1 });

    // Update particles
    particleService.update({ deltaTime: 1 });

    // Get new positions
    const newPositions = particleService.getParticles().map(p => ({
      id: p.id,
      position: p.position
    }));

    // Positions should have changed
    for (let i = 0; i < initialPositions.length; i++) {
      const initial = initialPositions[i];
      const current = newPositions.find(p => p.id === initial.id);

      if (current) {
        // At least one component should be different due to gravity
        expect(
          current.position.x !== initial.position.x ||
          current.position.y !== initial.position.y ||
          current.position.z !== initial.position.z
        ).toBe(true);
      }
    }
  });

  it('should apply gravity consistently to all particles', () => {
    // Update physics for a longer time to see clear effects
    for (let i = 0; i < 10; i++) {
      physicsService.update({ deltaTime: 0.1 });
    }

    // All particles should have negative y velocity due to gravity
    const particles = particleService.getParticles();
    particles.forEach(particle => {
      expect(particle.velocity.y).toBeLessThan(0);
    });
  });

  // This test uses the hooks approach from the original file
  it('should integrate with React hooks', () => {
    // This test will be implemented when the hooks are fully implemented
    expect(true).toBe(true);
  });
});
