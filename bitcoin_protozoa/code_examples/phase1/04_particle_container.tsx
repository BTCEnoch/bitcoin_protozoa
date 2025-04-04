/**
 * Particle Container Example
 * 
 * This example demonstrates the implementation of a particle container component
 * that manages the rendering and updating of particles in a Three.js scene.
 * 
 * @see ../../engine/03_particle_system.md
 */

import React, { useRef, useEffect } from 'react';
import { Canvas, useFrame } from '@react-three/fiber';
import { OrbitControls, Stats } from '@react-three/drei';
import { useParticles } from '../../../src/domains/particle/hooks/useParticles';
import { usePhysics } from '../../../src/domains/physics/hooks/usePhysics';
import ParticleRenderer from './02_particle_renderer';

/**
 * Scene component that manages particle updates
 */
const ParticleScene: React.FC = () => {
  // Get particles and physics from hooks
  const { particles, updateParticles } = useParticles();
  const { updatePhysics } = usePhysics();
  
  // Update particles and physics on each frame
  useFrame((state, delta) => {
    // Limit delta time to prevent large jumps
    const limitedDelta = Math.min(delta, 0.1);
    
    // Update physics first
    updatePhysics(limitedDelta);
    
    // Then update particles
    updateParticles(limitedDelta);
  });
  
  return (
    <>
      {/* Render particles */}
      <ParticleRenderer particles={particles} showGlow={true} />
      
      {/* Add a simple ground plane for reference */}
      <mesh rotation={[-Math.PI / 2, 0, 0]} position={[0, -10, 0]} receiveShadow>
        <planeGeometry args={[100, 100]} />
        <meshStandardMaterial color="#303030" />
      </mesh>
    </>
  );
};

/**
 * Main particle container component
 */
const ParticleContainer: React.FC = () => {
  return (
    <div style={{ width: '100%', height: '100vh' }}>
      <Canvas
        camera={{ position: [0, 0, 30], fov: 50 }}
        shadows
        dpr={[1, 2]} // Responsive DPR for better performance
      >
        {/* Add lights */}
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} intensity={1} castShadow />
        
        {/* Add particle scene */}
        <ParticleScene />
        
        {/* Add controls */}
        <OrbitControls 
          enablePan={true}
          enableZoom={true}
          enableRotate={true}
          minDistance={5}
          maxDistance={100}
        />
        
        {/* Add performance stats */}
        <Stats />
      </Canvas>
      
      {/* UI controls could be added here */}
      <div style={{
        position: 'absolute',
        bottom: '20px',
        left: '20px',
        color: 'white',
        background: 'rgba(0, 0, 0, 0.5)',
        padding: '10px',
        borderRadius: '5px'
      }}>
        <h3>Bitcoin Protozoa</h3>
        <p>Particle System Demo</p>
      </div>
    </div>
  );
};

export default ParticleContainer;

/**
 * Example usage in App.tsx:
 * 
 * ```tsx
 * import React from 'react';
 * import ParticleContainer from './components/ParticleContainer';
 * import { ParticleProvider } from './providers/ParticleProvider';
 * import { PhysicsProvider } from './providers/PhysicsProvider';
 * 
 * const App: React.FC = () => {
 *   return (
 *     <PhysicsProvider>
 *       <ParticleProvider>
 *         <ParticleContainer />
 *       </ParticleProvider>
 *     </PhysicsProvider>
 *   );
 * };
 * 
 * export default App;
 * ```
 */
