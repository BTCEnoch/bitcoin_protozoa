/**
 * Physics Service Types
 *
 * @description Type definitions for the physics service
 */

/**
 * Physics Service Configuration
 */
export interface PhysicsServiceConfig {
  /**
   * Time step for physics simulation
   */
  timeStep: number;
  
  /**
   * Number of iterations per update
   */
  iterations: number;
  
  /**
   * Damping coefficient
   */
  damping: number;
  
  /**
   * Elasticity coefficient for collisions
   */
  collisionElasticity: number;
  
  /**
   * Viscosity coefficient for fluid-like damping
   */
  viscosity: number;
  
  /**
   * Whether to use Verlet integration
   */
  useVerletIntegration: boolean;
}

/**
 * Physics Update Options
 */
export interface PhysicsUpdateOptions {
  /**
   * Time step for the update
   */
  deltaTime: number;
  
  /**
   * Whether to use Verlet integration
   */
  useVerletIntegration?: boolean;
}
