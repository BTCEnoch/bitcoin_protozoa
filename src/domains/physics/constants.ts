/**
 * Physics Domain Constants
 *
 * @description Constants for the physics domain
 */

import { PhysicsServiceConfig } from './services/physicsService/types';

/**
 * Physics version
 */
export const PHYSICS_VERSION = '0.1.0';

/**
 * Default physics configuration
 */
export const PHYSICS_DEFAULT_CONFIG: PhysicsServiceConfig = {
  timeStep: 0.016, // ~60fps
  iterations: 2,
  damping: 0.98,
  collisionElasticity: 0.5,
  viscosity: 0.05,
  useVerletIntegration: true
};
