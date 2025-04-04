/**
 * Particle Class Implementation Example
 * 
 * This example demonstrates the implementation of the core Particle class
 * with position, velocity, and acceleration properties, as well as methods
 * for updating the particle's state.
 * 
 * @see ../../engine/03_particle_system.md
 */

import { Vector3 } from 'three';
import { ParticleRole } from '../../../src/domains/particle/types';

/**
 * Represents a single particle in the system
 */
export interface Particle {
  // Unique identifier for the particle
  id: number;
  
  // Group identifier for grouping related particles
  groupId: string;
  
  // The role of the particle in the system
  role: ParticleRole;
  
  // Current position in 3D space
  position: Vector3;
  
  // Previous position (used for Verlet integration)
  oldPosition: Vector3;
  
  // Current velocity vector
  velocity: Vector3;
  
  // Current acceleration vector
  acceleration: Vector3;
  
  // Mass of the particle (affects physics calculations)
  mass: number;
  
  // Size of the particle (affects rendering and collisions)
  size: number;
  
  // Color of the particle (RGB values)
  color: { r: number; g: number; b: number };
  
  // Intensity of the glow effect
  glowIntensity: number;
  
  // Length of the trail effect
  trailLength: number;
  
  // Rate of pulsing effect
  pulseRate: number;
  
  // Scale multiplier for the particle
  scale: number;
  
  // Current energy level (affects behavior and lifespan)
  energyLevel: number;
  
  // Time the particle has existed
  lifetime: number;
  
  // Radius for interaction with other particles
  interactionRadius: number;
  
  // How strongly the particle is affected by force fields
  forceFieldInfluence: number;
  
  // Whether the particle is currently active
  isActive: boolean;
}

/**
 * Creates a new particle with the specified properties
 */
export function createParticle(
  id: number,
  groupId: string,
  role: ParticleRole,
  position: Vector3,
  mass: number = 1.0,
  size: number = 1.0,
  color: { r: number; g: number; b: number } = { r: 1, g: 1, b: 1 }
): Particle {
  // Create a new particle with default values
  return {
    id,
    groupId,
    role,
    position: position.clone(),
    oldPosition: position.clone(), // Initialize oldPosition to current position
    velocity: new Vector3(0, 0, 0),
    acceleration: new Vector3(0, 0, 0),
    mass,
    size,
    color,
    glowIntensity: 0.0,
    trailLength: 0.0,
    pulseRate: 0.0,
    scale: 1.0,
    energyLevel: 100.0,
    lifetime: 0.0,
    interactionRadius: size * 10.0,
    forceFieldInfluence: 1.0,
    isActive: true
  };
}

/**
 * Updates a particle's state based on elapsed time
 */
export function updateParticle(particle: Particle, deltaTime: number): void {
  if (!particle.isActive) {
    return; // Skip inactive particles
  }
  
  // Update position based on velocity
  particle.position.x += particle.velocity.x * deltaTime;
  particle.position.y += particle.velocity.y * deltaTime;
  particle.position.z += particle.velocity.z * deltaTime;
  
  // Update velocity based on acceleration
  particle.velocity.x += particle.acceleration.x * deltaTime;
  particle.velocity.y += particle.acceleration.y * deltaTime;
  particle.velocity.z += particle.acceleration.z * deltaTime;
  
  // Update lifetime
  particle.lifetime += deltaTime;
  
  // Decrease energy over time
  particle.energyLevel -= 0.1 * deltaTime;
  
  // Deactivate if energy is depleted
  if (particle.energyLevel <= 0) {
    particle.isActive = false;
    particle.energyLevel = 0;
  }
}

/**
 * Example usage:
 */
function particleExample() {
  // Create a new particle
  const particle = createParticle(
    1,                          // id
    'group1',                   // groupId
    ParticleRole.CORE,          // role
    new Vector3(0, 0, 0),       // position
    1.0,                        // mass
    1.0,                        // size
    { r: 1, g: 0, b: 0 }        // color (red)
  );
  
  // Apply some initial velocity
  particle.velocity.set(1, 2, 0);
  
  // Apply some acceleration (e.g., gravity)
  particle.acceleration.set(0, -9.8, 0);
  
  // Update the particle over time
  const deltaTime = 0.016; // 16ms (approx. 60fps)
  for (let i = 0; i < 10; i++) {
    updateParticle(particle, deltaTime);
    console.log(`Position at step ${i}: (${particle.position.x.toFixed(2)}, ${particle.position.y.toFixed(2)}, ${particle.position.z.toFixed(2)})`);
  }
}

// Uncomment to run the example
// particleExample();
