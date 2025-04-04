/**
 * Particle Service
 *
 * @description Service for particle management and lifecycle
 */

import { Vector3 } from 'three';
import { Particle, ParticleGroup, ParticleRole } from '../../types';
import { PARTICLE_DEFAULT_CONFIG } from '../../constants';
import { ParticleServiceConfig, ParticleServiceState, ParticleCreationOptions, ParticleUpdateOptions } from './types';
import { createParticle, createParticleGroups, createParticlesForGroups, mulberry32 } from './creation';

/**
 * Particle Service class
 * Manages particle creation, updates, and lifecycle
 */
export class ParticleService {
  private config: ParticleServiceConfig;
  private state: ParticleServiceState;

  /**
   * Constructor
   * @param config - Service configuration
   */
  constructor(config: Partial<ParticleServiceConfig> = {}) {
    // Initialize configuration with defaults
    this.config = {
      ...PARTICLE_DEFAULT_CONFIG,
      ...config
    };

    // Initialize state
    this.state = {
      particles: [],
      groups: [],
      activeParticleCount: 0,
      totalEnergyLevel: 0,
      isPaused: false
    };
  }

  /**
   * Initialize particles with a specific nonce
   * @param options - Particle creation options
   */
  public initialize(options: ParticleCreationOptions): void {
    const { nonce } = options;

    // Create particle groups
    this.state.groups = createParticleGroups(nonce);

    // Create particles for groups
    this.state.particles = createParticlesForGroups(this.state.groups, nonce);

    // Update active particle count
    this.state.activeParticleCount = this.state.particles.length;

    // Initialize total energy level
    this.state.totalEnergyLevel = this.state.particles.reduce(
      (total, particle) => total + particle.energyLevel,
      0
    );
  }

  /**
   * Update all particles
   * @param options - Update options
   */
  public update(options: ParticleUpdateOptions): void {
    if (this.state.isPaused) return;

    const { deltaTime } = options;

    // Update each particle
    this.state.particles.forEach(particle => {
      if (!particle.isActive) return;

      // Update position based on velocity
      particle.position.x += particle.velocity.x * deltaTime;
      particle.position.y += particle.velocity.y * deltaTime;
      particle.position.z += particle.velocity.z * deltaTime;

      // Update lifetime
      particle.lifetime += deltaTime;

      // Update energy level (simple decay)
      particle.energyLevel -= 0.01 * deltaTime;

      // Deactivate if energy depleted
      if (particle.energyLevel <= 0) {
        particle.isActive = false;
      }
    });

    // Update active particle count
    this.state.activeParticleCount = this.state.particles.filter(p => p.isActive).length;

    // Update total energy level
    this.state.totalEnergyLevel = this.state.particles.reduce(
      (total, particle) => total + (particle.isActive ? particle.energyLevel : 0),
      0
    );
  }

  /**
   * Get all particles
   * @returns Array of particles
   */
  public getParticles(): Particle[] {
    return this.state.particles;
  }

  /**
   * Get active particles
   * @returns Array of active particles
   */
  public getActiveParticles(): Particle[] {
    return this.state.particles.filter(p => p.isActive);
  }

  /**
   * Get particles by role
   * @param role - Particle role to filter by
   * @returns Array of particles with the specified role
   */
  public getParticlesByRole(role: ParticleRole): Particle[] {
    return this.state.particles.filter(p => p.isActive && p.role === role);
  }

  /**
   * Get particles by group
   * @param groupId - Group ID to filter by
   * @returns Array of particles in the specified group
   */
  public getParticlesByGroup(groupId: string): Particle[] {
    return this.state.particles.filter(p => p.isActive && p.groupId === groupId);
  }

  /**
   * Get all particle groups
   * @returns Array of particle groups
   */
  public getGroups(): ParticleGroup[] {
    return this.state.groups;
  }

  /**
   * Get service state
   * @returns Current service state
   */
  public getState(): ParticleServiceState {
    return { ...this.state };
  }

  /**
   * Pause particle updates
   */
  public pause(): void {
    this.state.isPaused = true;
  }

  /**
   * Resume particle updates
   */
  public resume(): void {
    this.state.isPaused = false;
  }

  /**
   * Reset service to initial state
   */
  public reset(): void {
    this.state = {
      particles: [],
      groups: [],
      activeParticleCount: 0,
      totalEnergyLevel: 0,
      isPaused: false
    };
  }
}

// Export types
export * from './types';

// Export creation utilities
export * from './creation';
