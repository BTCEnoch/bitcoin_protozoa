/**
 * Particle Renderer Example
 * 
 * This example demonstrates how to render particles using Three.js with instanced meshes
 * for optimal performance. It shows how to create a React component that renders
 * particles with different roles and visual properties.
 * 
 * @see ../../engine/03_particle_system.md
 */

import React, { useRef, useMemo, useEffect } from 'react';
import { useFrame } from '@react-three/fiber';
import { InstancedMesh, Object3D, SphereGeometry, MeshStandardMaterial, Color } from 'three';
import { Particle, ParticleRole } from '../../../src/domains/particle/types';

interface ParticleRendererProps {
  particles: Particle[];
  showGlow?: boolean;
}

/**
 * Component for rendering particles using instanced meshes
 * 
 * This component uses instanced meshes to efficiently render large numbers of particles.
 * It groups particles by role to apply different visual properties to each role.
 */
const ParticleRenderer: React.FC<ParticleRendererProps> = ({ 
  particles, 
  showGlow = true 
}) => {
  // Group particles by role
  const particlesByRole = useMemo(() => {
    const result: Record<ParticleRole, Particle[]> = {
      [ParticleRole.CORE]: [],
      [ParticleRole.CONTROL]: [],
      [ParticleRole.MOVEMENT]: [],
      [ParticleRole.DEFENSE]: [],
      [ParticleRole.ATTACK]: []
    };
    
    particles.forEach(particle => {
      if (particle.isActive) {
        result[particle.role].push(particle);
      }
    });
    
    return result;
  }, [particles]);
  
  // Create refs for each role's instanced mesh
  const meshRefs = {
    [ParticleRole.CORE]: useRef<InstancedMesh>(null),
    [ParticleRole.CONTROL]: useRef<InstancedMesh>(null),
    [ParticleRole.MOVEMENT]: useRef<InstancedMesh>(null),
    [ParticleRole.DEFENSE]: useRef<InstancedMesh>(null),
    [ParticleRole.ATTACK]: useRef<InstancedMesh>(null)
  };
  
  // Create a temporary object for position and scale updates
  const tempObject = useMemo(() => new Object3D(), []);
  
  // Define visual properties for each role
  const roleProperties = useMemo(() => ({
    [ParticleRole.CORE]: {
      size: 1.0,
      emissive: new Color(0.8, 0.2, 0.2),
      emissiveIntensity: showGlow ? 0.5 : 0
    },
    [ParticleRole.CONTROL]: {
      size: 0.8,
      emissive: new Color(0.2, 0.8, 0.2),
      emissiveIntensity: showGlow ? 0.4 : 0
    },
    [ParticleRole.MOVEMENT]: {
      size: 0.7,
      emissive: new Color(0.2, 0.2, 0.8),
      emissiveIntensity: showGlow ? 0.3 : 0
    },
    [ParticleRole.DEFENSE]: {
      size: 0.9,
      emissive: new Color(0.8, 0.8, 0.2),
      emissiveIntensity: showGlow ? 0.4 : 0
    },
    [ParticleRole.ATTACK]: {
      size: 0.6,
      emissive: new Color(0.8, 0.2, 0.8),
      emissiveIntensity: showGlow ? 0.5 : 0
    }
  }), [showGlow]);
  
  // Update particle positions and colors on each frame
  useFrame(() => {
    // Update each role's instanced mesh
    Object.entries(particlesByRole).forEach(([role, roleParticles]) => {
      const mesh = meshRefs[role as ParticleRole].current;
      if (!mesh) return;
      
      // Update each particle in the role
      roleParticles.forEach((particle, i) => {
        // Update position
        tempObject.position.copy(particle.position);
        
        // Update scale based on particle size and scale
        const scale = particle.size * particle.scale;
        tempObject.scale.set(scale, scale, scale);
        
        // Apply the transformation to the instanced mesh
        tempObject.updateMatrix();
        mesh.setMatrixAt(i, tempObject.matrix);
        
        // Update color
        mesh.setColorAt(
          i, 
          new Color(particle.color.r, particle.color.g, particle.color.b)
        );
      });
      
      // Mark instance matrices and colors as needing update
      mesh.instanceMatrix.needsUpdate = true;
      if (mesh.instanceColor) mesh.instanceColor.needsUpdate = true;
    });
  });
  
  return (
    <group>
      {/* Render an instanced mesh for each role */}
      {Object.entries(roleProperties).map(([role, props]) => {
        const roleParticles = particlesByRole[role as ParticleRole];
        if (roleParticles.length === 0) return null;
        
        return (
          <instancedMesh
            key={role}
            ref={meshRefs[role as ParticleRole]}
            args={[undefined, undefined, roleParticles.length]}
            frustumCulled={false}
          >
            <sphereGeometry args={[props.size, 16, 16]} />
            <meshStandardMaterial
              emissive={props.emissive}
              emissiveIntensity={props.emissiveIntensity}
              toneMapped={false}
            />
          </instancedMesh>
        );
      })}
    </group>
  );
};

export default ParticleRenderer;

/**
 * Example usage:
 * 
 * ```tsx
 * import { Canvas } from '@react-three/fiber';
 * import ParticleRenderer from './ParticleRenderer';
 * import { useParticles } from '../hooks/useParticles';
 * 
 * const ParticleScene = () => {
 *   const { particles } = useParticles();
 *   
 *   return (
 *     <Canvas>
 *       <ambientLight intensity={0.5} />
 *       <pointLight position={[10, 10, 10]} />
 *       <ParticleRenderer particles={particles} showGlow={true} />
 *     </Canvas>
 *   );
 * };
 * ```
 */
