/**
 * Particle Service Tests
 *
 * @description Tests for the Particle Service
 */

import { describe, it, expect, beforeEach } from 'vitest';
import { Vector3 } from 'three';
import { ParticleService } from '../../../../../src/domains/particle/services/particleService';
import { ParticleRole } from '../../../../../src/domains/particle/types';
import { expectVectorToBeCloseTo } from '../../../../utils/assertions';

describe('ParticleService', () => {
  let particleService: ParticleService;
  const testNonce = 12345;

  beforeEach(() => {
    particleService = new ParticleService();
  });

  describe('initialization', () => {
    it('should initialize with default configuration', () => {
      expect(particleService).toBeDefined();
      expect(particleService.getParticles()).toEqual([]);
      expect(particleService.getGroups()).toEqual([]);
    });

    it('should initialize particles with a specific nonce', () => {
      particleService.initialize({ nonce: testNonce });
      
      // Check if particles were created
      const particles = particleService.getParticles();
      expect(particles.length).toBeGreaterThan(0);
      
      // Check if groups were created
      const groups = particleService.getGroups();
      expect(groups.length).toBe(5); // One for each role
      
      // Check if particles have the correct properties
      const firstParticle = particles[0];
      expect(firstParticle.id).toBeDefined();
      expect(firstParticle.groupId).toBeDefined();
      expect(firstParticle.role).toBeDefined();
      expect(firstParticle.isActive).toBe(true);
      expect(firstParticle.energyLevel).toBeGreaterThan(0);
    });

    it('should create deterministic particles based on nonce', () => {
      // Initialize with the same nonce twice
      particleService.initialize({ nonce: testNonce });
      const firstRun = particleService.getParticles().map(p => ({ 
        x: p.position.x, 
        y: p.position.y, 
        z: p.position.z 
      }));
      
      particleService.reset();
      particleService.initialize({ nonce: testNonce });
      const secondRun = particleService.getParticles().map(p => ({ 
        x: p.position.x, 
        y: p.position.y, 
        z: p.position.z 
      }));
      
      // Positions should be identical for the same nonce
      expect(firstRun).toEqual(secondRun);
      
      // Initialize with a different nonce
      particleService.reset();
      particleService.initialize({ nonce: testNonce + 1 });
      const thirdRun = particleService.getParticles().map(p => ({ 
        x: p.position.x, 
        y: p.position.y, 
        z: p.position.z 
      }));
      
      // Positions should be different for a different nonce
      expect(firstRun).not.toEqual(thirdRun);
    });
  });

  describe('particle management', () => {
    beforeEach(() => {
      particleService.initialize({ nonce: testNonce });
    });

    it('should get all particles', () => {
      const particles = particleService.getParticles();
      expect(particles.length).toBeGreaterThan(0);
    });

    it('should get active particles', () => {
      const activeParticles = particleService.getActiveParticles();
      expect(activeParticles.length).toBeGreaterThan(0);
      expect(activeParticles.every(p => p.isActive)).toBe(true);
    });

    it('should get particles by role', () => {
      const coreParticles = particleService.getParticlesByRole(ParticleRole.CORE);
      expect(coreParticles.length).toBeGreaterThan(0);
      expect(coreParticles.every(p => p.role === ParticleRole.CORE)).toBe(true);
    });

    it('should get particles by group', () => {
      const groups = particleService.getGroups();
      const firstGroup = groups[0];
      const groupParticles = particleService.getParticlesByGroup(firstGroup.id);
      expect(groupParticles.length).toBeGreaterThan(0);
      expect(groupParticles.every(p => p.groupId === firstGroup.id)).toBe(true);
    });
  });

  describe('particle updates', () => {
    beforeEach(() => {
      particleService.initialize({ nonce: testNonce });
    });

    it('should update particle positions based on velocity', () => {
      // Get a particle and set its velocity
      const particles = particleService.getParticles();
      const testParticle = particles[0];
      const initialPosition = testParticle.position.clone();
      
      testParticle.velocity.set(1, 2, 3);
      
      // Update with a delta time of 1 second
      particleService.update({ deltaTime: 1 });
      
      // Position should be updated based on velocity
      expectVectorToBeCloseTo(
        testParticle.position,
        {
          x: initialPosition.x + 1,
          y: initialPosition.y + 2,
          z: initialPosition.z + 3
        }
      );
    });

    it('should update particle lifetime', () => {
      const particles = particleService.getParticles();
      const testParticle = particles[0];
      const initialLifetime = testParticle.lifetime;
      
      // Update with a delta time of 2 seconds
      particleService.update({ deltaTime: 2 });
      
      // Lifetime should increase by delta time
      expect(testParticle.lifetime).toBe(initialLifetime + 2);
    });

    it('should decrease particle energy over time', () => {
      const particles = particleService.getParticles();
      const testParticle = particles[0];
      const initialEnergy = testParticle.energyLevel;
      
      // Update with a delta time of 10 seconds
      particleService.update({ deltaTime: 10 });
      
      // Energy should decrease
      expect(testParticle.energyLevel).toBeLessThan(initialEnergy);
    });

    it('should deactivate particles when energy is depleted', () => {
      const particles = particleService.getParticles();
      const testParticle = particles[0];
      
      // Set energy to a very low value
      testParticle.energyLevel = 0.005;
      
      // Update with a delta time of 1 second
      particleService.update({ deltaTime: 1 });
      
      // Particle should be deactivated
      expect(testParticle.isActive).toBe(false);
    });

    it('should not update particles when paused', () => {
      const particles = particleService.getParticles();
      const testParticle = particles[0];
      const initialPosition = testParticle.position.clone();
      
      testParticle.velocity.set(1, 2, 3);
      
      // Pause the service
      particleService.pause();
      
      // Update with a delta time of 1 second
      particleService.update({ deltaTime: 1 });
      
      // Position should not change
      expectVectorToBeCloseTo(testParticle.position, initialPosition);
      
      // Resume the service
      particleService.resume();
      
      // Update with a delta time of 1 second
      particleService.update({ deltaTime: 1 });
      
      // Position should now be updated
      expectVectorToBeCloseTo(
        testParticle.position,
        {
          x: initialPosition.x + 1,
          y: initialPosition.y + 2,
          z: initialPosition.z + 3
        }
      );
    });
  });

  describe('service state', () => {
    beforeEach(() => {
      particleService.initialize({ nonce: testNonce });
    });

    it('should get the current service state', () => {
      const state = particleService.getState();
      expect(state.particles.length).toBeGreaterThan(0);
      expect(state.groups.length).toBe(5);
      expect(state.activeParticleCount).toBeGreaterThan(0);
      expect(state.totalEnergyLevel).toBeGreaterThan(0);
      expect(state.isPaused).toBe(false);
    });

    it('should reset the service state', () => {
      particleService.reset();
      const state = particleService.getState();
      expect(state.particles.length).toBe(0);
      expect(state.groups.length).toBe(0);
      expect(state.activeParticleCount).toBe(0);
      expect(state.totalEnergyLevel).toBe(0);
      expect(state.isPaused).toBe(false);
    });

    it('should pause and resume the service', () => {
      particleService.pause();
      expect(particleService.getState().isPaused).toBe(true);
      
      particleService.resume();
      expect(particleService.getState().isPaused).toBe(false);
    });
  });
});
