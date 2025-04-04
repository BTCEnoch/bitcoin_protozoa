# Implement Particle Container Script
# This script implements the particle container component

Write-Host "Implementing Particle Container..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$particleDomainDir = "$srcDir\domains\particle"
$componentsDir = "$particleDomainDir\components"
$containerDir = "$componentsDir\ParticleContainer"

# Ensure directories exist
if (-not (Test-Path $containerDir)) {
    New-Item -ItemType Directory -Path $containerDir -Force | Out-Null
}

# Create or update the ParticleContainer component
$containerFile = "$containerDir\index.tsx"
Write-Host "Creating ParticleContainer component in $containerFile..." -ForegroundColor Yellow

$containerContent = @"
import { useRef, useEffect } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls } from '@react-three/drei';
import { useParticles } from '../../hooks/useParticles';
import { usePhysics } from '../../../physics/hooks/usePhysics';
import ParticleRenderer from '../ParticleRenderer';
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
        <ParticleRenderer particles={particles} />
        
        {/* Controls */}
        {showControls && <OrbitControls />}
      </Canvas>
    </div>
  );
};

export default ParticleContainer;
"@

Set-Content -Path $containerFile -Value $containerContent

# Create types file for the container
$typesFile = "$containerDir\types.ts"
Write-Host "Creating types for ParticleContainer in $typesFile..." -ForegroundColor Yellow

$typesContent = @"
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
"@

Set-Content -Path $typesFile -Value $typesContent

# Create a hook for physics
$physicsHooksDir = "$srcDir\domains\physics\hooks"
if (-not (Test-Path $physicsHooksDir)) {
    New-Item -ItemType Directory -Path $physicsHooksDir -Force | Out-Null
}

$physicsHookFile = "$physicsHooksDir\usePhysics.ts"
Write-Host "Creating usePhysics hook in $physicsHookFile..." -ForegroundColor Yellow

$physicsHookContent = @"
import { useState, useEffect } from 'react';
import { PhysicsService } from '../services/physicsService';
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
"@

Set-Content -Path $physicsHookFile -Value $physicsHookContent

# Create a custom animation frame hook
$hooksDir = "$srcDir\hooks"
if (-not (Test-Path $hooksDir)) {
    New-Item -ItemType Directory -Path $hooksDir -Force | Out-Null
}

$animationHookFile = "$hooksDir\useAnimationFrame.ts"
Write-Host "Creating useAnimationFrame hook in $animationHookFile..." -ForegroundColor Yellow

$animationHookContent = @"
import { useRef, useEffect } from 'react';

/**
 * Hook for using requestAnimationFrame
 * @param callback - Callback function to run on each frame
 */
export const useAnimationFrame = (callback: (deltaTime: number) => void) => {
  // Store callback in a ref
  const callbackRef = useRef(callback);
  
  // Update callback ref when callback changes
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);
  
  // Set up animation frame
  useEffect(() => {
    let frameId: number;
    let lastTime = 0;
    
    const animate = (time: number) => {
      // Calculate delta time in seconds
      const deltaTime = Math.min((time - lastTime) / 1000, 0.1); // Cap at 0.1s to prevent large jumps
      lastTime = time;
      
      // Call the callback
      callbackRef.current(deltaTime);
      
      // Request next frame
      frameId = requestAnimationFrame(animate);
    };
    
    // Start animation
    frameId = requestAnimationFrame(animate);
    
    // Clean up on unmount
    return () => {
      cancelAnimationFrame(frameId);
    };
  }, []);
};
"@

Set-Content -Path $animationHookFile -Value $animationHookContent

Write-Host "Particle container implementation complete!" -ForegroundColor Green
