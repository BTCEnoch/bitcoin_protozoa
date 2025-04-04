/**
 * Props for the ParticleContainer component
 */
export interface ParticleContainerProps {
  /**
   * Nonce value for deterministic generation
   */
  nonce?: number;
  
  /**
   * Width of the container
   */
  width?: string | number;
  
  /**
   * Height of the container
   */
  height?: string | number;
  
  /**
   * Background color of the container
   */
  backgroundColor?: string;
  
  /**
   * Whether to show orbit controls
   */
  showControls?: boolean;
}
