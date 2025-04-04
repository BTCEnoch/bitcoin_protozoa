/**
 * Particle Creation Functions
 *
 * @description Functions for creating particles and particle groups
 */

import { Vector3 } from 'three';
import { Particle, ParticleGroup, ParticleRole } from '../../types';
import { DEFAULT_PARTICLE_MASSES, DEFAULT_PARTICLE_SIZES } from '../../constants';

/**
 * Create a new particle
 * @param id - Unique identifier for the particle
 * @param groupId - Group identifier for the particle
 * @param role - Role of the particle
 * @param position - Initial position
 * @returns New particle instance
 */
export const createParticle = (
  id: number,
  groupId: string,
  role: ParticleRole,
  position: Vector3 = new Vector3(0, 0, 0)
): Particle => {
  return {
    id,
    groupId,
    role,

    // Physical properties
    position: position.clone(),
    oldPosition: position.clone(),
    velocity: new Vector3(0, 0, 0),
    acceleration: new Vector3(0, 0, 0),
    mass: DEFAULT_PARTICLE_MASSES[role],
    size: DEFAULT_PARTICLE_SIZES[role],

    // Visual properties
    color: { r: 1, g: 1, b: 1 }, // Default white, will be set based on group
    glowIntensity: 0.0,
    trailLength: 0.0,
    pulseRate: 0.0,
    scale: 1.0,

    // Behavioral properties
    energyLevel: 100.0,
    lifetime: 0.0,
    interactionRadius: 10.0,
    forceFieldInfluence: 1.0,

    // State
    isActive: true
  };
};

/**
 * Mulberry32 RNG function
 * @param seed - Seed value
 * @returns Random number generator function
 */
export const mulberry32 = (seed: number) => {
  return () => {
    let t = seed += 0x6D2B79F5;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
};

/**
 * Create particle groups
 * @param nonce - Bitcoin block nonce for deterministic generation
 * @returns Array of particle groups
 */
export const createParticleGroups = (nonce: number): ParticleGroup[] => {
  const random = mulberry32(nonce);
  const groups: ParticleGroup[] = [];

  // Create 5 groups (one for each role)
  for (let i = 0; i < 5; i++) {
    const role = Object.values(ParticleRole)[i];
    groups.push({
      id: `group_${role}_${i}`,
      role,
      color: {
        r: random(),
        g: random(),
        b: random()
      },
      particleCount: 0
    });
  }

  return groups;
};

/**
 * Create particles for groups
 * @param groups - Particle groups
 * @param nonce - Bitcoin block nonce for deterministic generation
 * @returns Array of particles
 */
export const createParticlesForGroups = (groups: ParticleGroup[], nonce: number): Particle[] => {
  const random = mulberry32(nonce);
  const particles: Particle[] = [];
  let particleId = 0;

  // Create particles for each group
  groups.forEach(group => {
    const baseCount = 40; // Base particles per role
    const count = baseCount;

    for (let i = 0; i < count; i++) {
      // Create random position within a sphere
      const radius = 10.0;
      const theta = random() * Math.PI * 2;
      const phi = Math.acos(2 * random() - 1);
      const x = radius * Math.sin(phi) * Math.cos(theta);
      const y = radius * Math.sin(phi) * Math.sin(theta);
      const z = radius * Math.cos(phi);

      const position = new Vector3(x, y, z);

      // Create particle
      const particle = createParticle(particleId++, group.id, group.role, position);

      // Set color based on group
      particle.color = { ...group.color };

      // Add to array
      particles.push(particle);
    }

    // Update group particle count
    group.particleCount = count;
  });

  return particles;
};
