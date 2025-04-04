/**
 * Vector Utilities
 *
 * @description Utilities for vector operations and force calculations
 */

import { Vector3 } from 'three';
import { Particle } from '../../particle/types';

/**
 * Force calculation result
 */
export interface ForceCalculationResult {
  fx: number;
  fy: number;
  fz: number;
  collisionCount: number;
}

/**
 * Apply forces to a particle
 * @param particle - Particle to apply forces to
 * @param fx - Force in x direction
 * @param fy - Force in y direction
 * @param fz - Force in z direction
 * @param viscosity - Viscosity coefficient for damping
 * @param deltaTime - Time step
 */
export const applyForces = (
  particle: Particle,
  fx: number,
  fy: number,
  fz: number,
  viscosity: number,
  deltaTime: number
): void => {
  // Calculate acceleration from force (F = ma, so a = F/m)
  particle.acceleration.x = fx / particle.mass;
  particle.acceleration.y = fy / particle.mass;
  particle.acceleration.z = fz / particle.mass;
  
  // Apply viscosity (damping)
  particle.velocity.x *= (1 - viscosity * deltaTime);
  particle.velocity.y *= (1 - viscosity * deltaTime);
  particle.velocity.z *= (1 - viscosity * deltaTime);
};

/**
 * Limit particle velocity to prevent instability
 * @param particle - Particle to limit velocity
 * @param maxSpeed - Maximum speed
 */
export const limitVelocity = (particle: Particle, maxSpeed: number): void => {
  const speedSquared = 
    particle.velocity.x * particle.velocity.x + 
    particle.velocity.y * particle.velocity.y + 
    particle.velocity.z * particle.velocity.z;
  
  if (speedSquared > maxSpeed * maxSpeed) {
    const speed = Math.sqrt(speedSquared);
    const scale = maxSpeed / speed;
    
    particle.velocity.x *= scale;
    particle.velocity.y *= scale;
    particle.velocity.z *= scale;
  }
};
