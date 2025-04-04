/**
 * Particle Domain Constants
 *
 * @description Constants for the particle domain
 */

import { ParticleConfig, ParticleRole } from './types';

/**
 * Particle version
 */
export const PARTICLE_VERSION = '0.1.0';

/**
 * Total number of particles per creature
 */
export const TOTAL_PARTICLES = 500;

/**
 * Base particles per role
 */
export const BASE_PARTICLES_PER_ROLE = 40;

/**
 * Default particle configuration
 */
export const PARTICLE_DEFAULT_CONFIG: ParticleConfig = {
  totalParticles: TOTAL_PARTICLES,
  baseParticlesPerRole: BASE_PARTICLES_PER_ROLE,
  maxParticleSize: 5.0,
  minParticleSize: 0.5,
  maxParticleMass: 2.0,
  minParticleMass: 0.5,
  initialEnergy: 100.0,
  maxLifetime: 1000.0,
  defaultInteractionRadius: 10.0
};

/**
 * Default particle colors by role
 */
export const DEFAULT_PARTICLE_COLORS = {
  [ParticleRole.CORE]: { r: 1.0, g: 0.8, b: 0.2 },     // Golden
  [ParticleRole.CONTROL]: { r: 0.2, g: 0.6, b: 1.0 },  // Blue-white
  [ParticleRole.MOVEMENT]: { r: 0.2, g: 0.8, b: 0.5 }, // Green-blue
  [ParticleRole.DEFENSE]: { r: 0.4, g: 0.3, b: 0.8 },  // Blue-purple
  [ParticleRole.ATTACK]: { r: 1.0, g: 0.2, b: 0.2 }    // Red
};

/**
 * Default particle sizes by role
 */
export const DEFAULT_PARTICLE_SIZES = {
  [ParticleRole.CORE]: 1.0,      // Smallest
  [ParticleRole.CONTROL]: 1.5,   // Small
  [ParticleRole.MOVEMENT]: 2.0,  // Medium
  [ParticleRole.DEFENSE]: 2.5,   // Large
  [ParticleRole.ATTACK]: 3.0     // Largest
};

/**
 * Default particle masses by role
 */
export const DEFAULT_PARTICLE_MASSES = {
  [ParticleRole.CORE]: 1.5,      // Higher mass for stability
  [ParticleRole.CONTROL]: 1.2,   // Moderate-high mass
  [ParticleRole.MOVEMENT]: 0.8,  // Lower mass for mobility
  [ParticleRole.DEFENSE]: 1.3,   // Higher mass for stability
  [ParticleRole.ATTACK]: 1.0     // Standard mass
};

/**
 * Default trail lengths by role
 */
export const DEFAULT_TRAIL_LENGTHS = {
  [ParticleRole.CORE]: 5,        // Moderate trail
  [ParticleRole.CONTROL]: 8,     // Medium trail with pattern
  [ParticleRole.MOVEMENT]: 12,   // Long, directional trails
  [ParticleRole.DEFENSE]: 3,     // Short, membrane-like trails
  [ParticleRole.ATTACK]: 10      // Longer trails
};

/**
 * Default force matrix between roles
 * Positive values indicate attraction, negative values indicate repulsion
 */
export const DEFAULT_FORCE_MATRIX = {
  [ParticleRole.CORE]: {
    [ParticleRole.CORE]: 0.5,
    [ParticleRole.CONTROL]: 0.8,
    [ParticleRole.MOVEMENT]: 0.3,
    [ParticleRole.DEFENSE]: 0.2,
    [ParticleRole.ATTACK]: -0.1
  },
  [ParticleRole.CONTROL]: {
    [ParticleRole.CORE]: 0.8,
    [ParticleRole.CONTROL]: 0.3,
    [ParticleRole.MOVEMENT]: 0.6,
    [ParticleRole.DEFENSE]: 0.4,
    [ParticleRole.ATTACK]: 0.2
  },
  [ParticleRole.MOVEMENT]: {
    [ParticleRole.CORE]: 0.3,
    [ParticleRole.CONTROL]: 0.6,
    [ParticleRole.MOVEMENT]: 0.2,
    [ParticleRole.DEFENSE]: 0.3,
    [ParticleRole.ATTACK]: 0.5
  },
  [ParticleRole.DEFENSE]: {
    [ParticleRole.CORE]: 0.2,
    [ParticleRole.CONTROL]: 0.4,
    [ParticleRole.MOVEMENT]: 0.3,
    [ParticleRole.DEFENSE]: 0.4,
    [ParticleRole.ATTACK]: 0.7
  },
  [ParticleRole.ATTACK]: {
    [ParticleRole.CORE]: -0.1,
    [ParticleRole.CONTROL]: 0.2,
    [ParticleRole.MOVEMENT]: 0.5,
    [ParticleRole.DEFENSE]: 0.7,
    [ParticleRole.ATTACK]: 0.3
  }
};

