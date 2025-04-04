/**
 * Particle Store Hook
 *
 * @description Hook for accessing particle-related state from the global store
 */

import { useStore } from '../../../store';

/**
 * Hook for accessing particle-related state
 */
export const useParticleStore = () => {
  const particles = useStore((state) => state.particles);
  const groups = useStore((state) => state.groups);
  const nonce = useStore((state) => state.nonce);
  const setNonce = useStore((state) => state.setNonce);
  const resetParticles = useStore((state) => state.resetParticles);
  const updateParticle = useStore((state) => state.updateParticle);
  
  return {
    particles,
    groups,
    nonce,
    setNonce,
    resetParticles,
    updateParticle
  };
};
