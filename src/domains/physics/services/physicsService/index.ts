/**
 * Physics Service
 *
 * @description Service for physics simulation and force calculations
 */

import { Particle } from '../../../particle/types';
import { PhysicsServiceConfig, PhysicsUpdateOptions } from './types';
import { PHYSICS_DEFAULT_CONFIG } from '../../constants';
import { eulerIntegration, verletIntegration, initializeVerlet } from '../../utils/integrationUtils';
import { applyForces, limitVelocity } from '../../utils/vectorUtils';

/**
 * Physics Service class
 * Manages physics simulation for particles
 */
export class PhysicsService {
  private config: PhysicsServiceConfig;
  private particles: Particle[] = [];
  private isPaused: boolean = false;

  /**
   * Constructor
   * @param config - Service configuration
   */
  constructor(config: Partial<PhysicsServiceConfig> = {}) {
    // Initialize configuration with defaults
    this.config = {
      ...PHYSICS_DEFAULT_CONFIG,
      ...config
    };
  }

  /**
   * Set particles to be simulated
   * @param particles - Array of particles
   */
  public setParticles(particles: Particle[]): void {
    this.particles = particles;
  }

  /**
   * Update physics for particles
   * @param options - Update options
   */
  public update(options: PhysicsUpdateOptions): void {
    if (this.isPaused) return;

    const {
      deltaTime,
      useVerletIntegration = this.config.useVerletIntegration
    } = options;

    // Process each active particle
    this.particles.forEach(particle => {
      if (!particle.isActive) return;

      // Initialize for Verlet integration if needed
      if (useVerletIntegration && !particle.oldPosition) {
        initializeVerlet(particle);
      }

      // Apply simple gravity force
      const fx = 0;
      const fy = -9.8 * particle.mass; // Simple gravity
      const fz = 0;

      // Apply forces
      applyForces(
        particle,
        fx,
        fy,
        fz,
        this.config.viscosity,
        deltaTime
      );

      // Update position using integration method
      if (useVerletIntegration) {
        verletIntegration(particle, deltaTime);
      } else {
        eulerIntegration(particle, deltaTime);
      }

      // Limit velocity to prevent instability
      limitVelocity(particle, 100.0);
    });
  }

  /**
   * Pause physics simulation
   */
  public pause(): void {
    this.isPaused = true;
  }

  /**
   * Resume physics simulation
   */
  public resume(): void {
    this.isPaused = false;
  }

  /**
   * Reset physics simulation
   */
  public reset(): void {
    this.particles.forEach(particle => {
      particle.velocity.set(0, 0, 0);
      particle.acceleration.set(0, 0, 0);
    });
  }
}
