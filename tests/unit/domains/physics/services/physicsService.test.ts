/**
 * Physics Service Tests
 *
 * @description Tests for the Physics Service
 */

import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { PhysicsService } from '../../../../../src/domains/physics/services/physicsService';
import { Particle, ParticleRole } from '../../../../../src/domains/particle/types';
import { expectVectorToBeCloseTo } from '../../../../utils/assertions';

describe('PhysicsService', () => {
  let physicsService: PhysicsService;
  let testParticles: Particle[];

  // Helper function to create a test particle
  const createTestParticle = (id: number, position: Vector3): Particle => {
    return {
      id,
      groupId: 'test-group',
      role: ParticleRole.CORE,
      position: position.clone(),
      oldPosition: position.clone(),
      velocity: new Vector3(0, 0, 0),
      acceleration: new Vector3(0, 0, 0),
      mass: 1.0,
      size: 1.0,
      color: { r: 1, g: 1, b: 1 },
      glowIntensity: 0.0,
      trailLength: 0.0,
      pulseRate: 0.0,
      scale: 1.0,
      energyLevel: 100.0,
      lifetime: 0.0,
      interactionRadius: 10.0,
      forceFieldInfluence: 1.0,
      isActive: true
    };
  };

  beforeEach(() => {
    physicsService = new PhysicsService();

    // Create test particles
    testParticles = [
      createTestParticle(1, new Vector3(0, 0, 0)),
      createTestParticle(2, new Vector3(5, 0, 0)),
      createTestParticle(3, new Vector3(0, 5, 0)),
      createTestParticle(4, new Vector3(0, 0, 5))
    ];

    physicsService.setParticles(testParticles);
  });

  describe('initialization', () => {
    it('should initialize with default configuration', () => {
      expect(physicsService).toBeDefined();
    });

    it('should set particles correctly', () => {
      const newParticles = [
        createTestParticle(5, new Vector3(10, 10, 10))
      ];

      physicsService.setParticles(newParticles);

      // Update physics to verify particles are set
      physicsService.update({ deltaTime: 1 });

      // The particle should have been affected by gravity
      expect(newParticles[0].velocity.y).toBeLessThan(0);
    });
  });

  describe('physics updates', () => {
    it('should apply gravity to particles', () => {
      // Initial velocity is zero
      expect(testParticles[0].velocity.y).toBe(0);

      // Update physics with a delta time of 1 second
      physicsService.update({ deltaTime: 1 });

      // Particle should accelerate downward due to gravity
      expect(testParticles[0].velocity.y).toBeLessThan(0);
    });

    it('should update particle positions using Verlet integration', () => {
      // Set initial velocity and old position
      const particle = testParticles[0];
      particle.velocity.set(1, 0, 0);
      particle.oldPosition.copy(particle.position);
      particle.position.x += particle.velocity.x; // Move forward one step

      // Update physics with a delta time of 1 second
      physicsService.update({
        deltaTime: 1,
        useVerletIntegration: true
      });

      // Position should be updated using Verlet integration
      // New position should be approximately: 2*current - old + acceleration*dt^2
      // Since acceleration.x is 0, it should be approximately 2*x - old_x
      expect(particle.position.x).toBeGreaterThan(particle.oldPosition.x);
    });

    it('should limit particle velocity to prevent instability', () => {
      // Set a very high velocity
      const particle = testParticles[0];
      particle.velocity.set(1000, 1000, 1000);

      // Update physics
      physicsService.update({ deltaTime: 1 });

      // Velocity should be limited
      const speed = Math.sqrt(
        particle.velocity.x * particle.velocity.x +
        particle.velocity.y * particle.velocity.y +
        particle.velocity.z * particle.velocity.z
      );

      expect(speed).toBeLessThan(1000);
    });

    it('should apply viscosity to slow particles over time', () => {
      // Set initial velocity
      const particle = testParticles[0];
      particle.velocity.set(10, 10, 10);
      const initialSpeed = Math.sqrt(
        particle.velocity.x * particle.velocity.x +
        particle.velocity.y * particle.velocity.y +
        particle.velocity.z * particle.velocity.z
      );

      // Update physics with a delta time of 1 second
      physicsService.update({ deltaTime: 1 });

      // Calculate new speed
      const newSpeed = Math.sqrt(
        particle.velocity.x * particle.velocity.x +
        particle.velocity.y * particle.velocity.y +
        particle.velocity.z * particle.velocity.z
      );

      // Speed should decrease due to viscosity
      expect(newSpeed).toBeLessThan(initialSpeed);
    });

    it('should not update physics when paused', () => {
      // Set initial velocity
      const particle = testParticles[0];
      particle.velocity.set(1, 0, 0);
      const initialPosition = particle.position.clone();

      // Pause physics
      physicsService.pause();

      // Update physics
      physicsService.update({ deltaTime: 1 });

      // Position should not change
      expectVectorToBeCloseTo(particle.position, initialPosition);

      // Resume physics
      physicsService.resume();

      // Update physics
      physicsService.update({ deltaTime: 1 });

      // Position should now change
      // We need to check if any component has changed
      const positionChanged =
        particle.position.x !== initialPosition.x ||
        particle.position.y !== initialPosition.y ||
        particle.position.z !== initialPosition.z;

      expect(positionChanged).toBe(true);
    });
  });

  describe('physics configuration', () => {
    it('should use custom configuration when provided', () => {
      // Create physics service with custom config
      const customPhysicsService = new PhysicsService({
        viscosity: 0.5, // Higher viscosity
        useVerletIntegration: false // Use Euler integration
      });

      // Set particles
      const particle = createTestParticle(10, new Vector3(0, 0, 0));
      particle.velocity.set(10, 0, 0);
      customPhysicsService.setParticles([particle]);

      // Update physics
      customPhysicsService.update({ deltaTime: 1 });

      // With higher viscosity, velocity should decrease more rapidly
      expect(Math.abs(particle.velocity.x)).toBeLessThan(7);
    });
  });
});
