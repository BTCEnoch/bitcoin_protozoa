/**
 * State Management Example
 * 
 * This example demonstrates how to implement state management for the particle system
 * using Zustand. It shows how to create stores for particles and physics, and how to
 * connect them together.
 * 
 * @see ../../core/02_system_architecture.md
 */

import create from 'zustand';
import { Vector3 } from 'three';
import { Particle, ParticleRole } from '../../../src/domains/particle/types';
import { PhysicsEngine } from './03_physics_engine';

/**
 * Particle store state interface
 */
interface ParticleState {
  // Array of all particles
  particles: Particle[];
  
  // Array of particle groups
  groups: { id: string; role: ParticleRole }[];
  
  // Whether the simulation is paused
  isPaused: boolean;
  
  // Current nonce for deterministic generation
  nonce: number;
  
  // Actions
  initialize: (options?: { nonce?: number }) => void;
  update: (options: { deltaTime: number }) => void;
  pause: () => void;
  resume: () => void;
  reset: () => void;
  getParticlesByRole: (role: ParticleRole) => Particle[];
  getParticlesByGroup: (groupId: string) => Particle[];
  getActiveParticles: () => Particle[];
}

/**
 * Physics store state interface
 */
interface PhysicsState {
  // Physics engine instance
  engine: PhysicsEngine;
  
  // Whether the physics simulation is paused
  isPaused: boolean;
  
  // Actions
  setParticles: (particles: Particle[]) => void;
  update: (options: { deltaTime: number }) => void;
  pause: () => void;
  resume: () => void;
}

/**
 * Create a particle store using Zustand
 */
export const useParticleStore = create<ParticleState>((set, get) => ({
  particles: [],
  groups: [],
  isPaused: false,
  nonce: 0,
  
  /**
   * Initialize the particle system with a specific nonce
   */
  initialize: (options = {}) => {
    const nonce = options.nonce ?? Math.floor(Math.random() * 1000000);
    
    // Create a deterministic random number generator based on the nonce
    const rng = createRNG(nonce);
    
    // Create particle groups for each role
    const groups = [
      { id: 'core-group', role: ParticleRole.CORE },
      { id: 'control-group', role: ParticleRole.CONTROL },
      { id: 'movement-group', role: ParticleRole.MOVEMENT },
      { id: 'defense-group', role: ParticleRole.DEFENSE },
      { id: 'attack-group', role: ParticleRole.ATTACK }
    ];
    
    // Create particles for each group
    const particles: Particle[] = [];
    let particleId = 0;
    
    groups.forEach(group => {
      // Determine number of particles for this role
      let particleCount: number;
      switch (group.role) {
        case ParticleRole.CORE:
          particleCount = 40; // Base particles for CORE
          break;
        case ParticleRole.CONTROL:
          particleCount = 40; // Base particles for CONTROL
          break;
        case ParticleRole.MOVEMENT:
          particleCount = 40; // Base particles for MOVEMENT
          break;
        case ParticleRole.DEFENSE:
          particleCount = 40; // Base particles for DEFENSE
          break;
        case ParticleRole.ATTACK:
          particleCount = 40; // Base particles for ATTACK
          break;
        default:
          particleCount = 20;
      }
      
      // Add additional particles based on RNG
      particleCount += Math.floor(rng() * 60);
      
      // Create particles for this group
      for (let i = 0; i < particleCount; i++) {
        // Create random position within a sphere
        const theta = rng() * Math.PI * 2;
        const phi = Math.acos(2 * rng() - 1);
        const radius = 5 + rng() * 5;
        
        const x = radius * Math.sin(phi) * Math.cos(theta);
        const y = radius * Math.sin(phi) * Math.sin(theta);
        const z = radius * Math.cos(phi);
        
        // Create random color based on role
        let color: { r: number; g: number; b: number };
        switch (group.role) {
          case ParticleRole.CORE:
            color = { r: 0.8 + rng() * 0.2, g: 0.2 + rng() * 0.2, b: 0.2 + rng() * 0.2 };
            break;
          case ParticleRole.CONTROL:
            color = { r: 0.2 + rng() * 0.2, g: 0.8 + rng() * 0.2, b: 0.2 + rng() * 0.2 };
            break;
          case ParticleRole.MOVEMENT:
            color = { r: 0.2 + rng() * 0.2, g: 0.2 + rng() * 0.2, b: 0.8 + rng() * 0.2 };
            break;
          case ParticleRole.DEFENSE:
            color = { r: 0.8 + rng() * 0.2, g: 0.8 + rng() * 0.2, b: 0.2 + rng() * 0.2 };
            break;
          case ParticleRole.ATTACK:
            color = { r: 0.8 + rng() * 0.2, g: 0.2 + rng() * 0.2, b: 0.8 + rng() * 0.2 };
            break;
          default:
            color = { r: 0.5 + rng() * 0.5, g: 0.5 + rng() * 0.5, b: 0.5 + rng() * 0.5 };
        }
        
        // Create particle
        particles.push({
          id: particleId++,
          groupId: group.id,
          role: group.role,
          position: new Vector3(x, y, z),
          oldPosition: new Vector3(x, y, z),
          velocity: new Vector3(
            (rng() - 0.5) * 0.5,
            (rng() - 0.5) * 0.5,
            (rng() - 0.5) * 0.5
          ),
          acceleration: new Vector3(0, 0, 0),
          mass: 0.5 + rng() * 1.5,
          size: 0.5 + rng() * 0.5,
          color,
          glowIntensity: rng() * 0.5,
          trailLength: rng() * 0.5,
          pulseRate: rng() * 0.5,
          scale: 0.8 + rng() * 0.4,
          energyLevel: 80 + rng() * 40,
          lifetime: 0,
          interactionRadius: 5 + rng() * 5,
          forceFieldInfluence: 0.5 + rng() * 1.0,
          isActive: true
        });
      }
    });
    
    set({ particles, groups, nonce });
  },
  
  /**
   * Update all particles
   */
  update: ({ deltaTime }) => {
    if (get().isPaused) return;
    
    set(state => ({
      particles: state.particles.map(particle => {
        if (!particle.isActive) return particle;
        
        // Clone the particle to avoid mutating the original
        const updatedParticle = { ...particle };
        
        // Update lifetime
        updatedParticle.lifetime += deltaTime;
        
        // Decrease energy over time
        updatedParticle.energyLevel -= 0.1 * deltaTime;
        
        // Deactivate if energy is depleted
        if (updatedParticle.energyLevel <= 0) {
          updatedParticle.isActive = false;
          updatedParticle.energyLevel = 0;
        }
        
        return updatedParticle;
      })
    }));
  },
  
  /**
   * Pause the particle simulation
   */
  pause: () => set({ isPaused: true }),
  
  /**
   * Resume the particle simulation
   */
  resume: () => set({ isPaused: false }),
  
  /**
   * Reset the particle system
   */
  reset: () => set({ particles: [], groups: [], isPaused: false }),
  
  /**
   * Get particles by role
   */
  getParticlesByRole: (role: ParticleRole) => {
    return get().particles.filter(p => p.role === role);
  },
  
  /**
   * Get particles by group
   */
  getParticlesByGroup: (groupId: string) => {
    return get().particles.filter(p => p.groupId === groupId);
  },
  
  /**
   * Get active particles
   */
  getActiveParticles: () => {
    return get().particles.filter(p => p.isActive);
  }
}));

/**
 * Create a physics store using Zustand
 */
export const usePhysicsStore = create<PhysicsState>((set, get) => ({
  engine: new PhysicsEngine(),
  isPaused: false,
  
  /**
   * Set particles in the physics engine
   */
  setParticles: (particles: Particle[]) => {
    get().engine.setParticles(particles);
  },
  
  /**
   * Update physics simulation
   */
  update: ({ deltaTime }) => {
    if (get().isPaused) return;
    get().engine.update(deltaTime);
  },
  
  /**
   * Pause physics simulation
   */
  pause: () => {
    get().engine.pause();
    set({ isPaused: true });
  },
  
  /**
   * Resume physics simulation
   */
  resume: () => {
    get().engine.resume();
    set({ isPaused: false });
  }
}));

/**
 * Create a hook for using particles
 */
export const useParticles = () => {
  const {
    particles,
    initialize,
    update,
    pause,
    resume,
    reset,
    getParticlesByRole,
    getParticlesByGroup,
    getActiveParticles
  } = useParticleStore();
  
  return {
    particles,
    initializeParticles: initialize,
    updateParticles: update,
    pauseParticles: pause,
    resumeParticles: resume,
    resetParticles: reset,
    getParticlesByRole,
    getParticlesByGroup,
    getActiveParticles
  };
};

/**
 * Create a hook for using physics
 */
export const usePhysics = () => {
  const { setParticles, update, pause, resume } = usePhysicsStore();
  const { particles } = useParticleStore();
  
  // Set particles in physics engine when particles change
  React.useEffect(() => {
    setParticles(particles);
  }, [particles, setParticles]);
  
  return {
    updatePhysics: update,
    pausePhysics: pause,
    resumePhysics: resume
  };
};

/**
 * Create a deterministic random number generator based on a seed
 */
function createRNG(seed: number) {
  // Implementation of mulberry32 RNG
  return function() {
    let t = seed += 0x6D2B79F5;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
}

/**
 * Example usage:
 * 
 * ```tsx
 * import { useParticles, usePhysics } from './hooks';
 * 
 * const ParticleComponent = () => {
 *   const { particles, initializeParticles, updateParticles } = useParticles();
 *   const { updatePhysics } = usePhysics();
 *   
 *   // Initialize particles on mount
 *   React.useEffect(() => {
 *     initializeParticles({ nonce: 12345 });
 *   }, [initializeParticles]);
 *   
 *   // Update particles and physics on each frame
 *   useFrame((state, delta) => {
 *     updatePhysics({ deltaTime: delta });
 *     updateParticles({ deltaTime: delta });
 *   });
 *   
 *   return (
 *     <ParticleRenderer particles={particles} />
 *   );
 * };
 * ```
 */
