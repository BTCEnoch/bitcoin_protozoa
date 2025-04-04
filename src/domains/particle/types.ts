/**
 * Particle Domain Types
 *
 * @description Type definitions for the particle domain
 */

import { Vector3 } from 'three';

/**
 * Particle Role Enum
 * Defines the different roles a particle can have in the system
 */
export enum ParticleRole {
  CORE = 'CORE',
  CONTROL = 'CONTROL',
  MOVEMENT = 'MOVEMENT',
  DEFENSE = 'DEFENSE',
  ATTACK = 'ATTACK'
}

/**
 * Particle Group
 * Represents a group of particles with the same role
 */
export interface ParticleGroup {
  id: string;
  role: ParticleRole;
  particleCount: number;
  color: { r: number; g: number; b: number };
  size?: number;
  mass?: number;
}

/**
 * Particle Interface
 * Defines the properties of a particle in the system
 */
export interface Particle {
  id: number;
  groupId: string;
  role: ParticleRole;

  // Physical properties
  position: Vector3;
  oldPosition: Vector3; // For Verlet integration
  velocity: Vector3;
  acceleration: Vector3;
  mass: number;
  size: number;

  // Visual properties
  color: { r: number; g: number; b: number };
  glowIntensity: number;
  trailLength: number;
  pulseRate: number;
  scale: number;

  // Behavioral properties
  energyLevel: number;
  lifetime: number;
  interactionRadius: number;
  forceFieldInfluence: number;

  // State
  isActive: boolean;
}


/**
 * Force Rule Matrix
 * Defines the attraction/repulsion forces between different particle groups
 */
export interface ForceRuleMatrix {
  [sourceGroupId: string]: {
    [targetGroupId: string]: number;
  };
}

/**
 * Particle Configuration
 */
export interface ParticleConfig {
  // Configuration options for particles
  totalParticles: number;
  baseParticlesPerRole: number;
  maxParticleSize: number;
  minParticleSize: number;
  maxParticleMass: number;
  minParticleMass: number;
  initialEnergy: number;
  maxLifetime: number;
  defaultInteractionRadius: number;
}

/**
 * Particle State
 */
export interface ParticleState {
  // State properties for particles
  particles: Particle[];
  groups: ParticleGroup[];
  forceRules: ForceRuleMatrix;
  activeParticleCount: number;
  totalEnergyLevel: number;
}

