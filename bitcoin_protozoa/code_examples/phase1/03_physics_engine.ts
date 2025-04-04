/**
 * Physics Engine Example
 * 
 * This example demonstrates the implementation of a basic physics engine
 * for particle movement, including Verlet integration, force calculations,
 * and collision detection.
 * 
 * @see ../../physics/01_physics_engine.md
 */

import { Vector3 } from 'three';
import { Particle } from '../../../src/domains/particle/types';

/**
 * Physics engine configuration
 */
interface PhysicsConfig {
  // Gravity strength (negative for downward force)
  gravity: number;
  
  // Viscosity/drag coefficient (0-1)
  viscosity: number;
  
  // Whether to use Verlet integration (true) or Euler integration (false)
  useVerletIntegration: boolean;
  
  // Maximum velocity to prevent instability
  maxVelocity: number;
  
  // Bounds of the simulation space
  bounds: {
    minX: number;
    maxX: number;
    minY: number;
    maxY: number;
    minZ: number;
    maxZ: number;
  };
}

/**
 * Default physics configuration
 */
const DEFAULT_PHYSICS_CONFIG: PhysicsConfig = {
  gravity: -9.8,
  viscosity: 0.01,
  useVerletIntegration: true,
  maxVelocity: 100,
  bounds: {
    minX: -50,
    maxX: 50,
    minY: -50,
    maxY: 50,
    minZ: -50,
    maxZ: 50
  }
};

/**
 * Physics engine class for particle simulation
 */
export class PhysicsEngine {
  private config: PhysicsConfig;
  private particles: Particle[] = [];
  private isPaused: boolean = false;
  
  /**
   * Creates a new physics engine with the specified configuration
   */
  constructor(config: Partial<PhysicsConfig> = {}) {
    this.config = { ...DEFAULT_PHYSICS_CONFIG, ...config };
  }
  
  /**
   * Sets the particles to be simulated
   */
  setParticles(particles: Particle[]): void {
    this.particles = particles;
    
    // Initialize Verlet integration if needed
    if (this.config.useVerletIntegration) {
      this.particles.forEach(particle => {
        particle.oldPosition.copy(particle.position);
      });
    }
  }
  
  /**
   * Updates the physics simulation for a single time step
   */
  update(deltaTime: number): void {
    if (this.isPaused) return;
    
    // Apply forces and update positions
    this.particles.forEach(particle => {
      if (!particle.isActive) return;
      
      // Apply gravity
      this.applyGravity(particle);
      
      // Apply viscosity/drag
      this.applyViscosity(particle, deltaTime);
      
      // Update position and velocity
      if (this.config.useVerletIntegration) {
        this.verletIntegration(particle, deltaTime);
      } else {
        this.eulerIntegration(particle, deltaTime);
      }
      
      // Limit velocity to prevent instability
      this.limitVelocity(particle);
      
      // Handle collisions with boundaries
      this.handleBoundaryCollisions(particle);
    });
    
    // Handle collisions between particles
    this.handleParticleCollisions();
  }
  
  /**
   * Applies gravity force to a particle
   */
  private applyGravity(particle: Particle): void {
    // F = m * g
    const gravityForce = this.config.gravity * particle.mass;
    particle.acceleration.y = gravityForce / particle.mass;
  }
  
  /**
   * Applies viscosity/drag to a particle
   */
  private applyViscosity(particle: Particle, deltaTime: number): void {
    // Apply viscosity as a velocity reduction
    const viscosityFactor = 1 - this.config.viscosity * deltaTime;
    particle.velocity.multiplyScalar(viscosityFactor);
  }
  
  /**
   * Updates position and velocity using Verlet integration
   * 
   * Verlet integration is more stable for physics simulations
   * and conserves energy better than Euler integration.
   */
  private verletIntegration(particle: Particle, deltaTime: number): void {
    // Save current position
    const currentPosition = particle.position.clone();
    
    // Calculate new position using Verlet integration
    // x(t+dt) = 2*x(t) - x(t-dt) + a(t)*dt^2
    const dtSquared = deltaTime * deltaTime;
    
    particle.position.x = 2 * particle.position.x - particle.oldPosition.x + particle.acceleration.x * dtSquared;
    particle.position.y = 2 * particle.position.y - particle.oldPosition.y + particle.acceleration.y * dtSquared;
    particle.position.z = 2 * particle.position.z - particle.oldPosition.z + particle.acceleration.z * dtSquared;
    
    // Calculate velocity from position change
    // v(t) = (x(t+dt) - x(t-dt)) / (2*dt)
    particle.velocity.x = (particle.position.x - particle.oldPosition.x) / (2 * deltaTime);
    particle.velocity.y = (particle.position.y - particle.oldPosition.y) / (2 * deltaTime);
    particle.velocity.z = (particle.position.z - particle.oldPosition.z) / (2 * deltaTime);
    
    // Update old position for next step
    particle.oldPosition.copy(currentPosition);
  }
  
  /**
   * Updates position and velocity using Euler integration
   */
  private eulerIntegration(particle: Particle, deltaTime: number): void {
    // Update velocity based on acceleration
    // v(t+dt) = v(t) + a(t)*dt
    particle.velocity.x += particle.acceleration.x * deltaTime;
    particle.velocity.y += particle.acceleration.y * deltaTime;
    particle.velocity.z += particle.acceleration.z * deltaTime;
    
    // Update position based on velocity
    // x(t+dt) = x(t) + v(t+dt)*dt
    particle.position.x += particle.velocity.x * deltaTime;
    particle.position.y += particle.velocity.y * deltaTime;
    particle.position.z += particle.velocity.z * deltaTime;
  }
  
  /**
   * Limits particle velocity to prevent instability
   */
  private limitVelocity(particle: Particle): void {
    const velocitySquared = 
      particle.velocity.x * particle.velocity.x +
      particle.velocity.y * particle.velocity.y +
      particle.velocity.z * particle.velocity.z;
    
    const maxVelocitySquared = this.config.maxVelocity * this.config.maxVelocity;
    
    if (velocitySquared > maxVelocitySquared) {
      // Scale velocity to maximum
      const scaleFactor = this.config.maxVelocity / Math.sqrt(velocitySquared);
      particle.velocity.multiplyScalar(scaleFactor);
    }
  }
  
  /**
   * Handles collisions with boundary walls
   */
  private handleBoundaryCollisions(particle: Particle): void {
    const { bounds } = this.config;
    const radius = particle.size / 2;
    
    // X-axis boundaries
    if (particle.position.x - radius < bounds.minX) {
      particle.position.x = bounds.minX + radius;
      particle.velocity.x = -particle.velocity.x * 0.8; // Bounce with energy loss
    } else if (particle.position.x + radius > bounds.maxX) {
      particle.position.x = bounds.maxX - radius;
      particle.velocity.x = -particle.velocity.x * 0.8;
    }
    
    // Y-axis boundaries
    if (particle.position.y - radius < bounds.minY) {
      particle.position.y = bounds.minY + radius;
      particle.velocity.y = -particle.velocity.y * 0.8;
    } else if (particle.position.y + radius > bounds.maxY) {
      particle.position.y = bounds.maxY - radius;
      particle.velocity.y = -particle.velocity.y * 0.8;
    }
    
    // Z-axis boundaries
    if (particle.position.z - radius < bounds.minZ) {
      particle.position.z = bounds.minZ + radius;
      particle.velocity.z = -particle.velocity.z * 0.8;
    } else if (particle.position.z + radius > bounds.maxZ) {
      particle.position.z = bounds.maxZ - radius;
      particle.velocity.z = -particle.velocity.z * 0.8;
    }
  }
  
  /**
   * Handles collisions between particles
   */
  private handleParticleCollisions(): void {
    // Simple O(n²) collision detection
    // For large numbers of particles, a spatial partitioning system would be more efficient
    for (let i = 0; i < this.particles.length; i++) {
      const particleA = this.particles[i];
      if (!particleA.isActive) continue;
      
      for (let j = i + 1; j < this.particles.length; j++) {
        const particleB = this.particles[j];
        if (!particleB.isActive) continue;
        
        // Calculate distance between particles
        const dx = particleB.position.x - particleA.position.x;
        const dy = particleB.position.y - particleA.position.y;
        const dz = particleB.position.z - particleA.position.z;
        const distanceSquared = dx * dx + dy * dy + dz * dz;
        
        // Calculate minimum distance for collision
        const minDistance = (particleA.size + particleB.size) / 2;
        const minDistanceSquared = minDistance * minDistance;
        
        // Check for collision
        if (distanceSquared < minDistanceSquared) {
          // Calculate collision response
          this.resolveCollision(particleA, particleB, dx, dy, dz, Math.sqrt(distanceSquared));
        }
      }
    }
  }
  
  /**
   * Resolves a collision between two particles
   */
  private resolveCollision(
    particleA: Particle,
    particleB: Particle,
    dx: number,
    dy: number,
    dz: number,
    distance: number
  ): void {
    // Calculate minimum distance for collision
    const minDistance = (particleA.size + particleB.size) / 2;
    
    // Calculate overlap
    const overlap = minDistance - distance;
    
    // Calculate unit vector of collision
    const nx = dx / distance;
    const ny = dy / distance;
    const nz = dz / distance;
    
    // Calculate relative velocity
    const vx = particleB.velocity.x - particleA.velocity.x;
    const vy = particleB.velocity.y - particleA.velocity.y;
    const vz = particleB.velocity.z - particleA.velocity.z;
    
    // Calculate relative velocity along normal
    const vn = vx * nx + vy * ny + vz * nz;
    
    // If particles are moving away from each other, no collision response needed
    if (vn > 0) return;
    
    // Calculate impulse scalar
    const restitution = 0.8; // Coefficient of restitution (bounciness)
    const impulseScalar = -(1 + restitution) * vn / (1 / particleA.mass + 1 / particleB.mass);
    
    // Apply impulse
    particleA.velocity.x -= impulseScalar * nx / particleA.mass;
    particleA.velocity.y -= impulseScalar * ny / particleA.mass;
    particleA.velocity.z -= impulseScalar * nz / particleA.mass;
    
    particleB.velocity.x += impulseScalar * nx / particleB.mass;
    particleB.velocity.y += impulseScalar * ny / particleB.mass;
    particleB.velocity.z += impulseScalar * nz / particleB.mass;
    
    // Separate particles to prevent sticking
    const separationFactor = overlap / (particleA.mass + particleB.mass);
    
    particleA.position.x -= nx * separationFactor * particleA.mass;
    particleA.position.y -= ny * separationFactor * particleA.mass;
    particleA.position.z -= nz * separationFactor * particleA.mass;
    
    particleB.position.x += nx * separationFactor * particleB.mass;
    particleB.position.y += ny * separationFactor * particleB.mass;
    particleB.position.z += nz * separationFactor * particleB.mass;
  }
  
  /**
   * Pauses the physics simulation
   */
  pause(): void {
    this.isPaused = true;
  }
  
  /**
   * Resumes the physics simulation
   */
  resume(): void {
    this.isPaused = false;
  }
  
  /**
   * Returns whether the physics simulation is paused
   */
  isPaused(): boolean {
    return this.isPaused;
  }
}

/**
 * Example usage:
 */
function physicsExample() {
  // Create a physics engine with custom configuration
  const physics = new PhysicsEngine({
    gravity: -9.8,
    viscosity: 0.01,
    useVerletIntegration: true,
    maxVelocity: 50,
    bounds: {
      minX: -10,
      maxX: 10,
      minY: -10,
      maxY: 10,
      minZ: -10,
      maxZ: 10
    }
  });
  
  // Create some particles
  const particles: Particle[] = [
    // Particle 1 (falling from above)
    {
      id: 1,
      groupId: 'group1',
      role: 'CORE' as any,
      position: new Vector3(0, 5, 0),
      oldPosition: new Vector3(0, 5, 0),
      velocity: new Vector3(0, 0, 0),
      acceleration: new Vector3(0, 0, 0),
      mass: 1.0,
      size: 1.0,
      color: { r: 1, g: 0, b: 0 },
      glowIntensity: 0.0,
      trailLength: 0.0,
      pulseRate: 0.0,
      scale: 1.0,
      energyLevel: 100.0,
      lifetime: 0.0,
      interactionRadius: 10.0,
      forceFieldInfluence: 1.0,
      isActive: true
    },
    // Particle 2 (stationary on ground)
    {
      id: 2,
      groupId: 'group1',
      role: 'CORE' as any,
      position: new Vector3(0, -5, 0),
      oldPosition: new Vector3(0, -5, 0),
      velocity: new Vector3(0, 0, 0),
      acceleration: new Vector3(0, 0, 0),
      mass: 2.0,
      size: 2.0,
      color: { r: 0, g: 1, b: 0 },
      glowIntensity: 0.0,
      trailLength: 0.0,
      pulseRate: 0.0,
      scale: 1.0,
      energyLevel: 100.0,
      lifetime: 0.0,
      interactionRadius: 10.0,
      forceFieldInfluence: 1.0,
      isActive: true
    }
  ];
  
  // Set particles in the physics engine
  physics.setParticles(particles);
  
  // Simulate for 100 steps
  const deltaTime = 0.016; // 16ms (approx. 60fps)
  for (let i = 0; i < 100; i++) {
    physics.update(deltaTime);
    
    // Log particle positions every 10 steps
    if (i % 10 === 0) {
      console.log(`Step ${i}:`);
      particles.forEach(p => {
        console.log(`  Particle ${p.id}: (${p.position.x.toFixed(2)}, ${p.position.y.toFixed(2)}, ${p.position.z.toFixed(2)})`);
      });
    }
  }
}

// Uncomment to run the example
// physicsExample();
