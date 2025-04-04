/**
 * Particle Renderer Component
 *
 * @description Renders particles using instanced meshes for optimal performance
 * @module ParticleRenderer
 */

import { useRef, useEffect, useMemo } from 'react';
import { useFrame } from '@react-three/fiber';
import * as THREE from 'three';
import { Particle } from '../../types';
import { ParticleRendererProps } from './types';

/**
 * Component for rendering particles using instanced meshes
 *
 * @component
 * @param {ParticleRendererProps} props - Component properties
 * @returns {JSX.Element} Rendered component
 */
const ParticleRenderer: React.FC<ParticleRendererProps> = ({
  particles,
  showGlow = true,
  showTrails = false,
  highlightActive = true
}) => {
  // References for instanced meshes (one per role)
  const meshRefs = useRef<{ [key: string]: THREE.InstancedMesh | null }>({});

  // Dummy object for matrix calculations
  const dummy = useMemo(() => new THREE.Object3D(), []);

  // Material refs
  const materialRefs = useRef<{ [key: string]: THREE.Material | null }>({});

  // Group particles by role
  const particlesByRole = useMemo(() => {
    const grouped: { [key: string]: Particle[] } = {};

    particles.forEach(particle => {
      if (!grouped[particle.role]) {
        grouped[particle.role] = [];
      }

      if (particle.isActive) {
        grouped[particle.role].push(particle);
      }
    });

    return grouped;
  }, [particles]);

  /**
   * Update instance matrices and colors on each frame
   * This is called by React Three Fiber's useFrame hook on every animation frame
   */
  useFrame(() => {
    // Update each role group
    Object.entries(particlesByRole).forEach(([role, roleParticles]) => {
      const mesh = meshRefs.current[role];
      if (!mesh) return;

      // Update each particle in the role
      roleParticles.forEach((particle, i) => {
        // Set position
        dummy.position.copy(particle.position);

        // Set scale based on particle size
        const scale = particle.size * particle.scale;
        dummy.scale.set(scale, scale, scale);

        // Update matrix
        dummy.updateMatrix();

        // Apply to instanced mesh
        mesh.setMatrixAt(i, dummy.matrix);

        // Set color if using per-instance color
        if (mesh.instanceColor) {
          mesh.instanceColor.setXYZ(
            i,
            particle.color.r,
            particle.color.g,
            particle.color.b
          );
        }
      });

      // Mark instance matrices as needing update
      mesh.instanceMatrix.needsUpdate = true;
      if (mesh.instanceColor) {
        mesh.instanceColor.needsUpdate = true;
      }

      // Update material if needed
      if (showGlow && materialRefs.current[role]) {
        const material = materialRefs.current[role] as THREE.MeshStandardMaterial;
        // Update glow parameters
material.emissiveIntensity = showGlow ? 0.5 : 0.0;
material.emissive = new THREE.Color(
  roleParticles[0]?.color.r || 1.0,
  roleParticles[0]?.color.g || 1.0,
  roleParticles[0]?.color.b || 1.0
);
      }
    });
  });

  return (
    <group>
      {/* Render instanced mesh for each role */}
      {Object.entries(particlesByRole).map(([role, roleParticles]) => (
        <instancedMesh
          key={role}
          ref={(mesh) => (meshRefs.current[role] = mesh)}
          args={[undefined, undefined, roleParticles.length]}
          frustumCulled={false}
        >
          <sphereGeometry args={[1, 16, 16]} />
          <meshStandardMaterial
            ref={(material) => (materialRefs.current[role] = material)}
            color="#ffffff"
            emissive="#ffffff"
            emissiveIntensity={0.2}
            toneMapped={false}
          />
        </instancedMesh>
      ))}
    </group>
  );
};

export default ParticleRenderer;



