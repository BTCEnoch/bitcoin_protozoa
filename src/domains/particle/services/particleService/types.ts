/**
 * Particle Service Types
 *
 * @description Type definitions for the particle service
 */

import { Particle, ParticleConfig, ParticleGroup } from '../../types';

/**
 * Particle Service Configuration
 */
export interface ParticleServiceConfig extends ParticleConfig {
  // Additional service-specific configuration
  initialNonce?: number;
  useVerletIntegration?: boolean;
}

/**
 * Particle Service State
 */
export interface ParticleServiceState {
  particles: Particle[];
  groups: ParticleGroup[];
  activeParticleCount: number;
  totalEnergyLevel: number;
  isPaused: boolean;
}

/**
 * Particle Creation Options
 */
export interface ParticleCreationOptions {
  nonce: number;
  initialPositionRadius?: number;
  initialVelocityScale?: number;
}

/**
 * Particle Update Options
 */
export interface ParticleUpdateOptions {
  deltaTime: number;
  applyForces?: boolean;
  applyBoundaries?: boolean;
}
