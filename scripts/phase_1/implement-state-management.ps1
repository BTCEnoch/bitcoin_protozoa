# Implement State Management Script
# This script sets up Zustand store for application state

Write-Host "Implementing State Management..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$storeDir = "$srcDir\store"

# Ensure directories exist
if (-not (Test-Path $storeDir)) {
    New-Item -ItemType Directory -Path $storeDir -Force | Out-Null
}

# Create or update the store index file
$storeIndexFile = "$storeDir\index.ts"
Write-Host "Creating store in $storeIndexFile..." -ForegroundColor Yellow

$storeIndexContent = @"
/**
 * Store
 *
 * @description Global state management using Zustand
 */

import { create } from 'zustand';
import { devtools } from 'zustand/middleware';
import { Particle, ParticleGroup, ParticleRole } from '../domains/particle/types';
import { createParticleGroups, createParticlesForGroups } from '../domains/particle/services/particleService/creation';

/**
 * Application State
 */
interface AppState {
  // Particle state
  particles: Particle[];
  groups: ParticleGroup[];
  nonce: number;
  
  // UI state
  showControls: boolean;
  showGlow: boolean;
  showTrails: boolean;
  backgroundColor: string;
  
  // Actions
  setNonce: (nonce: number) => void;
  resetParticles: () => void;
  updateParticle: (id: number, updates: Partial<Particle>) => void;
  setShowControls: (show: boolean) => void;
  setShowGlow: (show: boolean) => void;
  setShowTrails: (show: boolean) => void;
  setBackgroundColor: (color: string) => void;
}

/**
 * Create the store
 */
export const useStore = create<AppState>()(
  devtools(
    (set, get) => ({
      // Initial particle state
      particles: [],
      groups: [],
      nonce: 12345,
      
      // Initial UI state
      showControls: true,
      showGlow: true,
      showTrails: false,
      backgroundColor: '#000000',
      
      // Actions
      setNonce: (nonce) => {
        set({ nonce });
        get().resetParticles();
      },
      
      resetParticles: () => {
        const { nonce } = get();
        const groups = createParticleGroups(nonce);
        const particles = createParticlesForGroups(groups, nonce);
        
        set({ groups, particles });
      },
      
      updateParticle: (id, updates) => {
        set((state) => ({
          particles: state.particles.map((p) => 
            p.id === id ? { ...p, ...updates } : p
          )
        }));
      },
      
      setShowControls: (show) => set({ showControls: show }),
      setShowGlow: (show) => set({ showGlow: show }),
      setShowTrails: (show) => set({ showTrails: show }),
      setBackgroundColor: (color) => set({ backgroundColor: color })
    }),
    { name: 'Bitcoin Protozoa Store' }
  )
);

// Initialize the store
const initializeStore = () => {
  const { resetParticles } = useStore.getState();
  resetParticles();
};

// Initialize on import
initializeStore();
"@

Set-Content -Path $storeIndexFile -Value $storeIndexContent

# Create a hook for using the store
$particleStoreHookFile = "$srcDir\domains\particle\hooks\useParticleStore.ts"
$particleHooksDir = "$srcDir\domains\particle\hooks"

# Ensure directory exists
if (-not (Test-Path $particleHooksDir)) {
    New-Item -ItemType Directory -Path $particleHooksDir -Force | Out-Null
}

Write-Host "Creating useParticleStore hook in $particleStoreHookFile..." -ForegroundColor Yellow

$particleStoreHookContent = @"
/**
 * Particle Store Hook
 *
 * @description Hook for accessing particle-related state from the global store
 */

import { useStore } from '../../../store';

/**
 * Hook for accessing particle-related state
 */
export const useParticleStore = () => {
  const particles = useStore((state) => state.particles);
  const groups = useStore((state) => state.groups);
  const nonce = useStore((state) => state.nonce);
  const setNonce = useStore((state) => state.setNonce);
  const resetParticles = useStore((state) => state.resetParticles);
  const updateParticle = useStore((state) => state.updateParticle);
  
  return {
    particles,
    groups,
    nonce,
    setNonce,
    resetParticles,
    updateParticle
  };
};
"@

Set-Content -Path $particleStoreHookFile -Value $particleStoreHookContent

# Create a hook for UI settings
$uiStoreHookFile = "$srcDir\domains\ui\hooks\useUIStore.ts"
$uiHooksDir = "$srcDir\domains\ui\hooks"

# Ensure directory exists
if (-not (Test-Path $uiHooksDir)) {
    New-Item -ItemType Directory -Path $uiHooksDir -Force | Out-Null
}

Write-Host "Creating useUIStore hook in $uiStoreHookFile..." -ForegroundColor Yellow

$uiStoreHookContent = @"
/**
 * UI Store Hook
 *
 * @description Hook for accessing UI-related state from the global store
 */

import { useStore } from '../../../store';

/**
 * Hook for accessing UI-related state
 */
export const useUIStore = () => {
  const showControls = useStore((state) => state.showControls);
  const showGlow = useStore((state) => state.showGlow);
  const showTrails = useStore((state) => state.showTrails);
  const backgroundColor = useStore((state) => state.backgroundColor);
  const setShowControls = useStore((state) => state.setShowControls);
  const setShowGlow = useStore((state) => state.setShowGlow);
  const setShowTrails = useStore((state) => state.setShowTrails);
  const setBackgroundColor = useStore((state) => state.setBackgroundColor);
  
  return {
    showControls,
    showGlow,
    showTrails,
    backgroundColor,
    setShowControls,
    setShowGlow,
    setShowTrails,
    setBackgroundColor
  };
};
"@

Set-Content -Path $uiStoreHookFile -Value $uiStoreHookContent

# Update the useParticles hook to use the store
$particlesHookFile = "$srcDir\domains\particle\hooks\useParticles.ts"

# Check if the file exists
if (Test-Path $particlesHookFile) {
    Write-Host "Updating useParticles hook to use the store..." -ForegroundColor Yellow
    
    $particlesHookContent = @"
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
"@
    
    Set-Content -Path $particlesHookFile -Value $particlesHookContent
}

Write-Host "State management implementation complete!" -ForegroundColor Green
