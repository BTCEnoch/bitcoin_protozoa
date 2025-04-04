import { useRef, useEffect } from 'react';
import { Canvas } from '@react-three/fiber';
import { useParticles } from '../../hooks/useParticles';
import { usePhysics } from '../../../physics/hooks/usePhysics';
import { useUIStore } from '../../../ui/hooks/useUIStore';
import ParticleRenderer from '../ParticleRenderer/index';
import { ParticleContainerProps } from './types';

/**
 * Component for containing and managing particles
 */
const ParticleContainer: React.FC<ParticleContainerProps> = ({
  nonce = 12345,
  width = '100%',
  height = '100%',
  backgroundColor = '#000000',
  showControls = true
}) => {
  // Get particles and physics
  const { particles, resetParticles } = useParticles(nonce);
  const { physicsService } = usePhysics(particles);

  // Get UI state
  const { showGlow, showTrails } = useUIStore();

  // Reference to animation frame
  const frameRef = useRef<number>();

  // Set up animation loop
  useEffect(() => {
    let lastTime = 0;

    const animate = (time: number) => {
      // Calculate delta time
      const deltaTime = Math.min((time - lastTime) / 1000, 0.1); // Cap at 0.1s to prevent large jumps
      lastTime = time;

      // Update physics
      physicsService.update({ deltaTime });

      // Request next frame
      frameRef.current = requestAnimationFrame(animate);
    };

    // Start animation
    frameRef.current = requestAnimationFrame(animate);

    // Clean up on unmount
    return () => {
      if (frameRef.current) {
        cancelAnimationFrame(frameRef.current);
      }
    };
  }, [physicsService]);

  // Reset particles when nonce changes
  useEffect(() => {
    resetParticles();
  }, [nonce, resetParticles]);

  return (
    <div style={{ width, height, backgroundColor }}>
      <Canvas camera={{ position: [0, 0, 50], fov: 50 }}>
        {/* Lighting */}
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} intensity={1} />

        {/* Particles */}
        <ParticleRenderer
          particles={particles}
          showGlow={showGlow}
          showTrails={showTrails}
          highlightActive={true}
        />

        {/* Controls will be added later */}
      </Canvas>
    </div>
  );
};

export { ParticleContainer };



