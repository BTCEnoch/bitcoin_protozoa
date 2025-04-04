/**
 * Particles Hook
 *
 * @description Hook for accessing and managing particles
 */

import { useEffect } from 'react';
import { useParticleStore } from './useParticleStore';

/**
 * Hook for accessing and managing particles
 * @param initialNonce - Initial nonce value
 */
export const useParticles = (initialNonce?: number) => {
  const {
    particles,
    groups,
    nonce,
    setNonce,
    resetParticles,
    updateParticle
  } = useParticleStore();
  
  // Set initial nonce if provided
  useEffect(() => {
    if (initialNonce !== undefined && initialNonce !== nonce) {
      setNonce(initialNonce);
    }
  }, [initialNonce, nonce, setNonce]);
  
  return {
    particles,
    groups,
    nonce,
    setNonce,
    resetParticles,
    updateParticle
  };
};
