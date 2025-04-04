/**
 * Integration Utilities Tests
 *
 * @description Tests for the physics integration utilities
 */

import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import {
  initializeVerlet,
  verletIntegration,
  eulerIntegration
} from '../../../../../src/domains/physics/utils/integrationUtils';
import { Particle, ParticleRole } from '../../../../../src/domains/particle/types';
import { expectVectorToBeCloseTo } from '../../../../utils/assertions';

describe('Integration Utilities', () => {
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

  describe('initializeVerlet', () => {
    it('should initialize oldPosition to match current position', () => {
      // Set position
      testParticle.position.set(1, 2, 3);

      // Initialize Verlet
      initializeVerlet(testParticle);

      // Old position should match current position
      expectVectorToBeCloseTo(testParticle.oldPosition, testParticle.position);
    });
  });

  describe('verletIntegration', () => {
    it('should update position using Verlet integration', () => {
      // Set initial state
      testParticle.position.set(1, 2, 3);
      testParticle.oldPosition.set(0, 1, 2); // Previous position
      testParticle.acceleration.set(0, -9.8, 0); // Gravity

      // Apply Verlet integration with dt = 1
      verletIntegration(testParticle, 1);

      // Expected position: 2*current - old + accel*dt^2
      // x: 2*1 - 0 + 0*1 = 2
      // y: 2*2 - 1 + (-9.8)*1 = 3 - 9.8 = -6.8
      // z: 2*3 - 2 + 0*1 = 4
      expectVectorToBeCloseTo(
        testParticle.position,
        { x: 2, y: -6.8, z: 4 }
      );
    });

    it('should handle zero acceleration', () => {
      // Set initial state
      testParticle.position.set(1, 2, 3);
      testParticle.oldPosition.set(0, 1, 2); // Previous position
      testParticle.acceleration.set(0, 0, 0); // No acceleration

      // Apply Verlet integration with dt = 1
      verletIntegration(testParticle, 1);

      // Expected position: 2*current - old
      // x: 2*1 - 0 = 2
      // y: 2*2 - 1 = 3
      // z: 2*3 - 2 = 4
      expectVectorToBeCloseTo(
        testParticle.position,
        { x: 2, y: 3, z: 4 }
      );
    });

    it('should handle different time steps', () => {
      // Set initial state
      testParticle.position.set(1, 2, 3);
      testParticle.oldPosition.set(0.5, 1.5, 2.5); // Previous position
      testParticle.acceleration.set(0, -9.8, 0); // Gravity

      // Apply Verlet integration with dt = 0.5
      verletIntegration(testParticle, 0.5);

      // Expected position: 2*current - old + accel*dt^2
      // x: 2*1 - 0.5 + 0*0.5^2 = 1.5
      // y: 2*2 - 1.5 + (-9.8)*0.5^2 = 2.5 - 2.45 = 0.05
      // z: 2*3 - 2.5 + 0*0.5^2 = 3.5
      expectVectorToBeCloseTo(
        testParticle.position,
        { x: 1.5, y: 0.05, z: 3.5 }
      );
    });
  });

  describe('eulerIntegration', () => {
    it('should update position and velocity using Euler integration', () => {
      // Set initial state
      testParticle.position.set(1, 2, 3);
      testParticle.velocity.set(1, 0, -1);
      testParticle.acceleration.set(0, -9.8, 0); // Gravity

      // Apply Euler integration with dt = 1
      eulerIntegration(testParticle, 1);

      // Expected velocity: v + a*dt
      // x: 1 + 0*1 = 1
      // y: 0 + (-9.8)*1 = -9.8
      // z: -1 + 0*1 = -1
      expectVectorToBeCloseTo(
        testParticle.velocity,
        { x: 1, y: -9.8, z: -1 }
      );

      // Expected position: p + v*dt (using updated velocity)
      // x: 1 + 1*1 = 2
      // y: 2 + (-9.8)*1 = -7.8
      // z: 3 + (-1)*1 = 2
      expectVectorToBeCloseTo(
        testParticle.position,
        { x: 2, y: -7.8, z: 2 }
      );
    });

    it('should handle zero acceleration', () => {
      // Set initial state
      testParticle.position.set(1, 2, 3);
      testParticle.velocity.set(1, 2, 3);
      testParticle.acceleration.set(0, 0, 0); // No acceleration

      // Apply Euler integration with dt = 1
      eulerIntegration(testParticle, 1);

      // Velocity should remain unchanged
      expectVectorToBeCloseTo(
        testParticle.velocity,
        { x: 1, y: 2, z: 3 }
      );

      // Position should update based on velocity
      expectVectorToBeCloseTo(
        testParticle.position,
        { x: 2, y: 4, z: 6 }
      );
    });

    it('should handle different time steps', () => {
      // Set initial state
      testParticle.position.set(1, 2, 3);
      testParticle.velocity.set(1, 0, -1);
      testParticle.acceleration.set(0, -9.8, 0); // Gravity

      // Apply Euler integration with dt = 0.5
      eulerIntegration(testParticle, 0.5);

      // Expected velocity: v + a*dt
      // x: 1 + 0*0.5 = 1
      // y: 0 + (-9.8)*0.5 = -4.9
      // z: -1 + 0*0.5 = -1
      expectVectorToBeCloseTo(
        testParticle.velocity,
        { x: 1, y: -4.9, z: -1 }
      );

      // Expected position: p + v*dt (using updated velocity)
      // x: 1 + 1*0.5 = 1.5
      // y: 2 + (-4.9)*0.5 = -0.45
      // z: 3 + (-1)*0.5 = 2.5
      expectVectorToBeCloseTo(
        testParticle.position,
        { x: 1.5, y: -0.45, z: 2.5 }
      );
    });
  });
});
