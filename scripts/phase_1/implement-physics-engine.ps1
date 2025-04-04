# Implement Physics Engine Script
# This script implements the basic physics engine for particle movement

Write-Host "Implementing Physics Engine..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$physicsDomainDir = "$srcDir\domains\physics"
$servicesDir = "$physicsDomainDir\services"
$physicsServiceDir = "$servicesDir\physicsService"
$utilsDir = "$physicsDomainDir\utils"

# Ensure directories exist
if (-not (Test-Path $physicsServiceDir)) {
    New-Item -ItemType Directory -Path $physicsServiceDir -Force | Out-Null
}

if (-not (Test-Path $utilsDir)) {
    New-Item -ItemType Directory -Path $utilsDir -Force | Out-Null
}

# Create or update the integration utils
$integrationUtilsFile = "$utilsDir\integrationUtils.ts"
Write-Host "Creating integration utilities in $integrationUtilsFile..." -ForegroundColor Yellow

$integrationUtilsContent = @"
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
"@

Set-Content -Path $integrationUtilsFile -Value $integrationUtilsContent

# Create or update the vector utils
$vectorUtilsFile = "$utilsDir\vectorUtils.ts"
Write-Host "Creating vector utilities in $vectorUtilsFile..." -ForegroundColor Yellow

$vectorUtilsContent = @"
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
"@

Set-Content -Path $vectorUtilsFile -Value $vectorUtilsContent

# Create or update the physics service index file
$physicsServiceIndexFile = "$physicsServiceDir\index.ts"
Write-Host "Creating physics service in $physicsServiceIndexFile..." -ForegroundColor Yellow

$physicsServiceContent = @"
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
"@

Set-Content -Path $physicsServiceIndexFile -Value $physicsServiceContent

# Create or update the physics service types file
$physicsServiceTypesFile = "$physicsServiceDir\types.ts"
Write-Host "Creating physics service types in $physicsServiceTypesFile..." -ForegroundColor Yellow

$physicsServiceTypesContent = @"
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
"@

Set-Content -Path $physicsServiceTypesFile -Value $physicsServiceTypesContent

# Create or update the physics constants file
$physicsConstantsFile = "$physicsDomainDir\constants.ts"
Write-Host "Creating physics constants in $physicsConstantsFile..." -ForegroundColor Yellow

$physicsConstantsContent = @"
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
"@

Set-Content -Path $physicsConstantsFile -Value $physicsConstantsContent

Write-Host "Physics engine implementation complete!" -ForegroundColor Green
