/**
 * Store
 *
 * @description Global state management using Zustand
 */

import { create } from 'zustand';
import { devtools } from 'zustand/middleware';
import { Particle, ParticleGroup, ParticleRole } from '../domains/particle/types';
import { createParticleGroups, createParticlesForGroups } from '../domains/particle/services/particleService/creation';

/**
 * Application State
 */
interface AppState {
  // Particle state
  particles: Particle[];
  groups: ParticleGroup[];
  nonce: number;
  
  // UI state
  showControls: boolean;
  showGlow: boolean;
  showTrails: boolean;
  backgroundColor: string;
  
  // Actions
  setNonce: (nonce: number) => void;
  resetParticles: () => void;
  updateParticle: (id: number, updates: Partial<Particle>) => void;
  setShowControls: (show: boolean) => void;
  setShowGlow: (show: boolean) => void;
  setShowTrails: (show: boolean) => void;
  setBackgroundColor: (color: string) => void;
}

/**
 * Create the store
 */
export const useStore = create<AppState>()(
  devtools(
    (set, get) => ({
      // Initial particle state
      particles: [],
      groups: [],
      nonce: 12345,
      
      // Initial UI state
      showControls: true,
      showGlow: true,
      showTrails: false,
      backgroundColor: '#000000',
      
      // Actions
      setNonce: (nonce) => {
        set({ nonce });
        get().resetParticles();
      },
      
      resetParticles: () => {
        const { nonce } = get();
        const groups = createParticleGroups(nonce);
        const particles = createParticlesForGroups(groups, nonce);
        
        set({ groups, particles });
      },
      
      updateParticle: (id, updates) => {
        set((state) => ({
          particles: state.particles.map((p) => 
            p.id === id ? { ...p, ...updates } : p
          )
        }));
      },
      
      setShowControls: (show) => set({ showControls: show }),
      setShowGlow: (show) => set({ showGlow: show }),
      setShowTrails: (show) => set({ showTrails: show }),
      setBackgroundColor: (color) => set({ backgroundColor: color })
    }),
    { name: 'Bitcoin Protozoa Store' }
  )
);

// Initialize the store
const initializeStore = () => {
  const { resetParticles } = useStore.getState();
  resetParticles();
};

// Initialize on import
initializeStore();
