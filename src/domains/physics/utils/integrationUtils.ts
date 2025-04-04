/**
 * Integration Utilities
 *
 * @description Utilities for physics integration methods
 */

import { Vector3 } from 'three';
import { Particle } from '../../particle/types';

/**
 * Initialize a particle for Verlet integration
 * @param particle - Particle to initialize
 */
export const initializeVerlet = (particle: Particle): void => {
  // Set old position to current position
  particle.oldPosition = particle.position.clone();
};

/**
 * Update particle position using Euler integration
 * @param particle - Particle to update
 * @param deltaTime - Time step
 */
export const eulerIntegration = (particle: Particle, deltaTime: number): void => {
  // Update velocity based on acceleration
  particle.velocity.x += particle.acceleration.x * deltaTime;
  particle.velocity.y += particle.acceleration.y * deltaTime;
  particle.velocity.z += particle.acceleration.z * deltaTime;

  // Update position based on velocity
  particle.position.x += particle.velocity.x * deltaTime;
  particle.position.y += particle.velocity.y * deltaTime;
  particle.position.z += particle.velocity.z * deltaTime;
};

/**
 * Update particle position using Verlet integration
 * @param particle - Particle to update
 * @param deltaTime - Time step
 */
export const verletIntegration = (particle: Particle, deltaTime: number): void => {
  // Store current position
  const currentPosition = particle.position.clone();
  
  // Calculate new position using Verlet integration
  // x(t+dt) = 2*x(t) - x(t-dt) + a(t)*dt^2
  particle.position.x = 2 * particle.position.x - particle.oldPosition.x + particle.acceleration.x * deltaTime * deltaTime;
  particle.position.y = 2 * particle.position.y - particle.oldPosition.y + particle.acceleration.y * deltaTime * deltaTime;
  particle.position.z = 2 * particle.position.z - particle.oldPosition.z + particle.acceleration.z * deltaTime * deltaTime;
  
  // Update velocity (for external use, not used in the integration)
  particle.velocity.x = (particle.position.x - particle.oldPosition.x) / deltaTime;
  particle.velocity.y = (particle.position.y - particle.oldPosition.y) / deltaTime;
  particle.velocity.z = (particle.position.z - particle.oldPosition.z) / deltaTime;
  
  // Update old position for next step
  particle.oldPosition = currentPosition;
};
