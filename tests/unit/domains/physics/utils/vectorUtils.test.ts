/**
 * Vector Utilities Tests
 *
 * @description Tests for the physics vector utilities
 */

import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { 
  applyForces, 
  limitVelocity 
} from '../../../../../src/domains/physics/utils/vectorUtils';
import { Particle, ParticleRole } from '../../../../../src/domains/particle/types';
import { expectVectorToBeCloseTo } from '../../../../utils/assertions';

describe('Vector Utilities', () => {
  let testParticle: Particle;

  // Helper function to create a test particle
  const createTestParticle = (): Particle => {
    return {
      id: 1,
      groupId: 'test-group',
      role: ParticleRole.CORE,
      position: new Vector3(0, 0, 0),
      oldPosition: new Vector3(0, 0, 0),
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
    testParticle = createTestParticle();
  });

  describe('applyForces', () => {
    it('should apply forces to acceleration', () => {
      // Initial acceleration is zero
      expect(testParticle.acceleration.x).toBe(0);
      expect(testParticle.acceleration.y).toBe(0);
      expect(testParticle.acceleration.z).toBe(0);
      
      // Apply forces
      applyForces(
        testParticle,
        10, // fx
        -20, // fy
        5, // fz
        0, // viscosity
        1 // deltaTime
      );
      
      // Acceleration should be force / mass
      // Since mass is 1.0, acceleration equals force
      expectVectorToBeCloseTo(
        testParticle.acceleration,
        { x: 10, y: -20, z: 5 }
      );
    });

    it('should apply viscosity to velocity', () => {
      // Set initial velocity
      testParticle.velocity.set(10, 10, 10);
      
      // Apply forces with viscosity
      applyForces(
        testParticle,
        0, // fx
        0, // fy
        0, // fz
        0.5, // viscosity
        1 // deltaTime
      );
      
      // Velocity should be reduced by viscosity
      // v = v * (1 - viscosity * dt)
      // v = 10 * (1 - 0.5 * 1) = 10 * 0.5 = 5
      expectVectorToBeCloseTo(
        testParticle.velocity,
        { x: 5, y: 5, z: 5 }
      );
    });

    it('should handle different masses', () => {
      // Set mass to 2.0
      testParticle.mass = 2.0;
      
      // Apply forces
      applyForces(
        testParticle,
        10, // fx
        -20, // fy
        5, // fz
        0, // viscosity
        1 // deltaTime
      );
      
      // Acceleration should be force / mass
      // a = F / m = F / 2
      expectVectorToBeCloseTo(
        testParticle.acceleration,
        { x: 5, y: -10, z: 2.5 }
      );
    });

    it('should handle different time steps', () => {
      // Set initial velocity
      testParticle.velocity.set(10, 10, 10);
      
      // Apply forces with viscosity and smaller time step
      applyForces(
        testParticle,
        10, // fx
        -20, // fy
        5, // fz
        0.5, // viscosity
        0.5 // deltaTime
      );
      
      // Acceleration should be force / mass
      expectVectorToBeCloseTo(
        testParticle.acceleration,
        { x: 10, y: -20, z: 5 }
      );
      
      // Velocity should be reduced by viscosity
      // v = v * (1 - viscosity * dt)
      // v = 10 * (1 - 0.5 * 0.5) = 10 * 0.75 = 7.5
      expectVectorToBeCloseTo(
        testParticle.velocity,
        { x: 7.5, y: 7.5, z: 7.5 }
      );
    });
  });

  describe('limitVelocity', () => {
    it('should limit velocity when it exceeds maximum', () => {
      // Set velocity to exceed maximum
      testParticle.velocity.set(100, 0, 0);
      
      // Limit velocity to 10
      limitVelocity(testParticle, 10);
      
      // Velocity should be scaled down to maximum
      expect(testParticle.velocity.length()).toBeCloseTo(10);
      expect(testParticle.velocity.x).toBeCloseTo(10);
    });

    it('should not change velocity when below maximum', () => {
      // Set velocity below maximum
      testParticle.velocity.set(5, 0, 0);
      
      // Limit velocity to 10
      limitVelocity(testParticle, 10);
      
      // Velocity should remain unchanged
      expect(testParticle.velocity.x).toBe(5);
    });

    it('should maintain velocity direction when limiting', () => {
      // Set velocity in a specific direction
      testParticle.velocity.set(30, 40, 0);
      const originalDirection = testParticle.velocity.clone().normalize();
      
      // Limit velocity to 10
      limitVelocity(testParticle, 10);
      
      // Velocity should be scaled down to maximum
      expect(testParticle.velocity.length()).toBeCloseTo(10);
      
      // Direction should be preserved
      const newDirection = testParticle.velocity.clone().normalize();
      expectVectorToBeCloseTo(newDirection, originalDirection);
    });
  });
});
