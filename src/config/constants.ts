/**
 * Application constants
 */

// Particle system constants
export const PARTICLE_COUNT = 500;
export const BASE_PARTICLES_PER_ROLE = 40;

// Role constants
export enum ParticleRole {
  CORE = 'CORE',
  CONTROL = 'CONTROL',
  MOVEMENT = 'MOVEMENT',
  DEFENSE = 'DEFENSE',
  ATTACK = 'ATTACK',
}

// Bitcoin constants
export const CONFIRMATION_MILESTONES = {
  MILESTONE_1: 10000,  // 10k confirmations - 1% mutation chance
  MILESTONE_2: 50000,  // 50k confirmations - 5% mutation chance
  MILESTONE_3: 100000, // 100k confirmations - 10% mutation chance
  MILESTONE_4: 250000, // 250k confirmations - 25% mutation chance
  MILESTONE_5: 500000, // 500k confirmations - 50% mutation chance
  MILESTONE_6: 1000000, // 1M confirmations - 100% mutation chance
};

// API endpoints
export const API = {
  DEV: {
    BLOCK_INFO: 'ordinals.com/r/blockinfo',
    CONTENT: 'ordinals.com/content',
  },
  PROD: {
    BLOCK_INFO: '/r/blockinfo',
    CONTENT: '/content',
  },
};

// Performance constants
export const TARGET_FPS = 60;
export const PHYSICS_STEP = 1 / 60; // Fixed physics step at 60 FPS
