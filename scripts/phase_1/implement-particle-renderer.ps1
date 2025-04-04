# Implement Particle Renderer Script
# This script implements the particle renderer using Three.js

Write-Host "Implementing Particle Renderer..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$particleDomainDir = "$srcDir\domains\particle"
$componentsDir = "$particleDomainDir\components"
$rendererDir = "$componentsDir\ParticleRenderer"

# Ensure directories exist
if (-not (Test-Path $rendererDir)) {
    New-Item -ItemType Directory -Path $rendererDir -Force | Out-Null
}

# Create or update the ParticleRenderer component
$rendererFile = "$rendererDir\index.tsx"
Write-Host "Creating ParticleRenderer component in $rendererFile..." -ForegroundColor Yellow

$rendererContent = @"
import { useRef, useEffect, useMemo } from 'react';
import { useFrame } from '@react-three/fiber';
import * as THREE from 'three';
import { Particle } from '../../types';
import { ParticleRendererProps } from './types';

/**
 * Component for rendering particles using instanced mesh
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

  // Update instance matrices on each frame
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
        // Update glow parameters if needed
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
"@

Set-Content -Path $rendererFile -Value $rendererContent

# Create types file for the renderer
$typesFile = "$rendererDir\types.ts"
Write-Host "Creating types for ParticleRenderer in $typesFile..." -ForegroundColor Yellow

$typesContent = @"
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
"@

Set-Content -Path $typesFile -Value $typesContent

# Create a basic test file for the renderer
$testsDir = "tests"
$unitTestsDir = "$testsDir\unit\domains\particle"

# Ensure test directory exists
if (-not (Test-Path $unitTestsDir)) {
    New-Item -ItemType Directory -Path $unitTestsDir -Force | Out-Null
}

$testFile = "$unitTestsDir\ParticleRenderer.test.tsx"
Write-Host "Creating test for ParticleRenderer in $testFile..." -ForegroundColor Yellow

$testContent = @"
import { describe, it, expect, beforeEach, vi } from 'vitest';
import { render } from '@testing-library/react';
import ParticleRenderer from '@/domains/particle/components/ParticleRenderer';
import { ParticleRole } from '@/domains/particle/types';
import { Vector3 } from 'three';

// Mock Three.js components
vi.mock('@react-three/fiber', () => ({
  useFrame: vi.fn((callback) => callback()),
}));

describe('ParticleRenderer', () => {
  const mockParticles = [
    {
      id: 1,
      groupId: 'group1',
      role: ParticleRole.CORE,
      position: new Vector3(0, 0, 0),
      oldPosition: new Vector3(0, 0, 0),
      velocity: new Vector3(0, 0, 0),
      acceleration: new Vector3(0, 0, 0),
      mass: 1,
      size: 1,
      color: { r: 1, g: 0, b: 0 },
      glowIntensity: 0,
      trailLength: 0,
      pulseRate: 0,
      scale: 1,
      energyLevel: 100,
      lifetime: 0,
      interactionRadius: 10,
      forceFieldInfluence: 1,
      isActive: true
    },
    {
      id: 2,
      groupId: 'group1',
      role: ParticleRole.CONTROL,
      position: new Vector3(1, 1, 1),
      oldPosition: new Vector3(1, 1, 1),
      velocity: new Vector3(0, 0, 0),
      acceleration: new Vector3(0, 0, 0),
      mass: 1,
      size: 1,
      color: { r: 0, g: 1, b: 0 },
      glowIntensity: 0,
      trailLength: 0,
      pulseRate: 0,
      scale: 1,
      energyLevel: 100,
      lifetime: 0,
      interactionRadius: 10,
      forceFieldInfluence: 1,
      isActive: true
    },
  ];

  beforeEach(() => {
    vi.clearAllMocks();
  });

  it('renders without crashing', () => {
    // This test will need to be updated when we have a proper testing environment for Three.js
    expect(() => render(<ParticleRenderer particles={mockParticles} />)).not.toThrow();
  });

  // Add more tests as the component is implemented
});
"@

Set-Content -Path $testFile -Value $testContent

# Create a hook for using particles
$hooksDir = "$particleDomainDir\hooks"
if (-not (Test-Path $hooksDir)) {
    New-Item -ItemType Directory -Path $hooksDir -Force | Out-Null
}

$hookFile = "$hooksDir\useParticles.ts"
Write-Host "Creating useParticles hook in $hookFile..." -ForegroundColor Yellow

$hookContent = @"
import { useState, useEffect, useCallback } from 'react';
import { Vector3 } from 'three';
import { Particle, ParticleRole, ParticleGroup } from '../types';
import { createParticle, createParticleGroups, createParticlesForGroups, mulberry32 } from '../services/particleService/creation';

/**
 * Hook for managing particles
 */
export const useParticles = (nonce: number = 12345) => {
  const [particles, setParticles] = useState<Particle[]>([]);
  const [groups, setGroups] = useState<ParticleGroup[]>([]);
  
  // Initialize particles
  useEffect(() => {
    const newGroups = createParticleGroups(nonce);
    const newParticles = createParticlesForGroups(newGroups, nonce);
    
    setGroups(newGroups);
    setParticles(newParticles);
  }, [nonce]);
  
  // Add a new particle
  const addParticle = useCallback((role: ParticleRole, position: Vector3) => {
    setParticles(prevParticles => {
      const group = groups.find(g => g.role === role);
      if (!group) return prevParticles;
      
      const newParticle = createParticle(
        prevParticles.length,
        group.id,
        role,
        position
      );
      
      // Set color based on group
      newParticle.color = { ...group.color };
      
      return [...prevParticles, newParticle];
    });
  }, [groups]);
  
  // Remove a particle
  const removeParticle = useCallback((id: number) => {
    setParticles(prevParticles => 
      prevParticles.map(p => 
        p.id === id ? { ...p, isActive: false } : p
      )
    );
  }, []);
  
  // Update a particle
  const updateParticle = useCallback((id: number, updates: Partial<Particle>) => {
    setParticles(prevParticles => 
      prevParticles.map(p => 
        p.id === id ? { ...p, ...updates } : p
      )
    );
  }, []);
  
  // Reset all particles
  const resetParticles = useCallback(() => {
    const newGroups = createParticleGroups(nonce);
    const newParticles = createParticlesForGroups(newGroups, nonce);
    
    setGroups(newGroups);
    setParticles(newParticles);
  }, [nonce]);
  
  return {
    particles,
    groups,
    addParticle,
    removeParticle,
    updateParticle,
    resetParticles
  };
};
"@

Set-Content -Path $hookFile -Value $hookContent

Write-Host "Particle renderer implementation complete!" -ForegroundColor Green
