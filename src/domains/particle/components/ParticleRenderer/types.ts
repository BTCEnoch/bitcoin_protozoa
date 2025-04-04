import { Particle } from '../../types';

/**
 * Props for the ParticleRenderer component
 */
export interface ParticleRendererProps {
  /**
   * Array of particles to render
   */
  particles: Particle[];
  
  /**
   * Whether to show particle glow effects
   */
  showGlow?: boolean;
  
  /**
   * Whether to show particle trails
   */
  showTrails?: boolean;
  
  /**
   * Whether to highlight active particles
   */
  highlightActive?: boolean;
}
