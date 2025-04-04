import { useState, useEffect } from 'react';
import { PhysicsService } from '../services/physicsService/index';
import { Particle } from '../../particle/types';

/**
 * Hook for physics simulation
 */
export const usePhysics = (particles: Particle[]) => {
  // Create physics service
  const [physicsService] = useState(() => new PhysicsService());

  // Update particles when they change
  useEffect(() => {
    physicsService.setParticles(particles);
  }, [particles, physicsService]);

  return { physicsService };
};

