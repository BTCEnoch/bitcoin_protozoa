# Implement Particle Class Script
# This script implements the basic particle class with position, velocity, and acceleration

Write-Host "Implementing Particle Class..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$particleDomainDir = "$srcDir\domains\particle"
$typesFile = "$particleDomainDir\types.ts"
$constantsFile = "$particleDomainDir\constants.ts"

# Check if files exist
if (-not (Test-Path $typesFile)) {
    Write-Host "Error: $typesFile does not exist. Please run the setup-project.ps1 script first." -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $constantsFile)) {
    Write-Host "Error: $constantsFile does not exist. Please run the setup-project.ps1 script first." -ForegroundColor Red
    exit 1
}

# Update types.ts with complete Particle interface
Write-Host "Updating Particle interface in $typesFile..." -ForegroundColor Yellow
$typesContent = Get-Content $typesFile -Raw

# Check if the file already has the updated content
if ($typesContent -match "export interface Particle \{") {
    Write-Host "Particle interface already exists. Updating..." -ForegroundColor Yellow
    
    # Define the pattern to match the existing Particle interface
    $pattern = "export interface Particle \{[^}]*\}"
    
    # Define the replacement Particle interface
    $replacement = @"
export interface Particle {
  id: number;
  groupId: string;
  role: ParticleRole;

  // Physical properties
  position: Vector3;
  oldPosition: Vector3; // For Verlet integration
  velocity: Vector3;
  acceleration: Vector3;
  mass: number;
  size: number;

  // Visual properties
  color: { r: number; g: number; b: number };
  glowIntensity: number;
  trailLength: number;
  pulseRate: number;
  scale: number;

  // Behavioral properties
  energyLevel: number;
  lifetime: number;
  interactionRadius: number;
  forceFieldInfluence: number;

  // State
  isActive: boolean;
}
"@
    
    # Replace the existing interface with the updated one
    $typesContent = $typesContent -replace $pattern, $replacement
    Set-Content -Path $typesFile -Value $typesContent
} else {
    Write-Host "Particle interface not found. Creating..." -ForegroundColor Yellow
    
    # Add imports if needed
    if (-not ($typesContent -match "import { Vector3 } from 'three';")) {
        $typesContent = "import { Vector3 } from 'three';" + "`n" + $typesContent
    }
    
    # Add the Particle interface
    $particleInterface = @"

/**
 * Particle Interface
 * Defines the properties of a particle in the system
 */
export interface Particle {
  id: number;
  groupId: string;
  role: ParticleRole;

  // Physical properties
  position: Vector3;
  oldPosition: Vector3; // For Verlet integration
  velocity: Vector3;
  acceleration: Vector3;
  mass: number;
  size: number;

  // Visual properties
  color: { r: number; g: number; b: number };
  glowIntensity: number;
  trailLength: number;
  pulseRate: number;
  scale: number;

  // Behavioral properties
  energyLevel: number;
  lifetime: number;
  interactionRadius: number;
  forceFieldInfluence: number;

  // State
  isActive: boolean;
}
"@
    
    $typesContent += $particleInterface
    Set-Content -Path $typesFile -Value $typesContent
}

# Update constants.ts with particle constants
Write-Host "Updating particle constants in $constantsFile..." -ForegroundColor Yellow
$constantsContent = Get-Content $constantsFile -Raw

# Check if the file already has the updated content
if ($constantsContent -match "export const PARTICLE_DEFAULT_CONFIG") {
    Write-Host "Particle constants already exist. Updating..." -ForegroundColor Yellow
    
    # Define the pattern to match the existing constants
    $pattern = "export const PARTICLE_DEFAULT_CONFIG[^;]*;"
    
    # Define the replacement constants
    $replacement = @"
export const PARTICLE_DEFAULT_CONFIG: ParticleConfig = {
  totalParticles: TOTAL_PARTICLES,
  baseParticlesPerRole: BASE_PARTICLES_PER_ROLE,
  maxParticleSize: 5.0,
  minParticleSize: 0.5,
  maxParticleMass: 2.0,
  minParticleMass: 0.5,
  initialEnergy: 100.0,
  maxLifetime: 1000.0,
  defaultInteractionRadius: 10.0
};
"@
    
    # Replace the existing constants with the updated ones
    $constantsContent = $constantsContent -replace $pattern, $replacement
    Set-Content -Path $constantsFile -Value $constantsContent
} else {
    Write-Host "Particle constants not found. Creating..." -ForegroundColor Yellow
    
    # Add the constants
    $particleConstants = @"

/**
 * Total number of particles per creature
 */
export const TOTAL_PARTICLES = 500;

/**
 * Base particles per role
 */
export const BASE_PARTICLES_PER_ROLE = 40;

/**
 * Default particle configuration
 */
export const PARTICLE_DEFAULT_CONFIG: ParticleConfig = {
  totalParticles: TOTAL_PARTICLES,
  baseParticlesPerRole: BASE_PARTICLES_PER_ROLE,
  maxParticleSize: 5.0,
  minParticleSize: 0.5,
  maxParticleMass: 2.0,
  minParticleMass: 0.5,
  initialEnergy: 100.0,
  maxLifetime: 1000.0,
  defaultInteractionRadius: 10.0
};

/**
 * Default particle masses by role
 */
export const DEFAULT_PARTICLE_MASSES = {
  [ParticleRole.CORE]: 0.5,
  [ParticleRole.CONTROL]: 0.7,
  [ParticleRole.MOVEMENT]: 1.0,
  [ParticleRole.DEFENSE]: 1.5,
  [ParticleRole.ATTACK]: 2.0
};

/**
 * Default particle sizes by role
 */
export const DEFAULT_PARTICLE_SIZES = {
  [ParticleRole.CORE]: 0.5,
  [ParticleRole.CONTROL]: 0.8,
  [ParticleRole.MOVEMENT]: 1.0,
  [ParticleRole.DEFENSE]: 1.2,
  [ParticleRole.ATTACK]: 1.5
};
"@
    
    $constantsContent += $particleConstants
    Set-Content -Path $constantsFile -Value $constantsContent
}

# Create or update the particle service creation.ts file
$particleServiceDir = "$particleDomainDir\services\particleService"
$creationFile = "$particleServiceDir\creation.ts"

# Ensure the directory exists
if (-not (Test-Path $particleServiceDir)) {
    New-Item -ItemType Directory -Path $particleServiceDir -Force | Out-Null
}

Write-Host "Creating particle creation functions in $creationFile..." -ForegroundColor Yellow
$creationContent = @"
/**
 * Particle Creation Functions
 *
 * @description Functions for creating particles and particle groups
 */

import { Vector3 } from 'three';
import { Particle, ParticleGroup, ParticleRole } from '../../types';
import { DEFAULT_PARTICLE_MASSES, DEFAULT_PARTICLE_SIZES } from '../../constants';

/**
 * Create a new particle
 * @param id - Unique identifier for the particle
 * @param groupId - Group identifier for the particle
 * @param role - Role of the particle
 * @param position - Initial position
 * @returns New particle instance
 */
export const createParticle = (
  id: number,
  groupId: string,
  role: ParticleRole,
  position: Vector3 = new Vector3(0, 0, 0)
): Particle => {
  return {
    id,
    groupId,
    role,

    // Physical properties
    position: position.clone(),
    oldPosition: position.clone(),
    velocity: new Vector3(0, 0, 0),
    acceleration: new Vector3(0, 0, 0),
    mass: DEFAULT_PARTICLE_MASSES[role],
    size: DEFAULT_PARTICLE_SIZES[role],

    // Visual properties
    color: { r: 1, g: 1, b: 1 }, // Default white, will be set based on group
    glowIntensity: 0.0,
    trailLength: 0.0,
    pulseRate: 0.0,
    scale: 1.0,

    // Behavioral properties
    energyLevel: 100.0,
    lifetime: 0.0,
    interactionRadius: 10.0,
    forceFieldInfluence: 1.0,

    // State
    isActive: true
  };
};

/**
 * Mulberry32 RNG function
 * @param seed - Seed value
 * @returns Random number generator function
 */
export const mulberry32 = (seed: number) => {
  return () => {
    let t = seed += 0x6D2B79F5;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
};

/**
 * Create particle groups
 * @param nonce - Bitcoin block nonce for deterministic generation
 * @returns Array of particle groups
 */
export const createParticleGroups = (nonce: number): ParticleGroup[] => {
  const random = mulberry32(nonce);
  const groups: ParticleGroup[] = [];

  // Create 5 groups (one for each role)
  for (let i = 0; i < 5; i++) {
    const role = Object.values(ParticleRole)[i];
    groups.push({
      id: \`group_\${role}_\${i}\`,
      role,
      color: {
        r: random(),
        g: random(),
        b: random()
      },
      particleCount: 0
    });
  }

  return groups;
};

/**
 * Create particles for groups
 * @param groups - Particle groups
 * @param nonce - Bitcoin block nonce for deterministic generation
 * @returns Array of particles
 */
export const createParticlesForGroups = (groups: ParticleGroup[], nonce: number): Particle[] => {
  const random = mulberry32(nonce);
  const particles: Particle[] = [];
  let particleId = 0;

  // Create particles for each group
  groups.forEach(group => {
    const baseCount = 40; // Base particles per role
    const count = baseCount;
    
    for (let i = 0; i < count; i++) {
      // Create random position within a sphere
      const radius = 10.0;
      const theta = random() * Math.PI * 2;
      const phi = Math.acos(2 * random() - 1);
      const x = radius * Math.sin(phi) * Math.cos(theta);
      const y = radius * Math.sin(phi) * Math.sin(theta);
      const z = radius * Math.cos(phi);
      
      const position = new Vector3(x, y, z);
      
      // Create particle
      const particle = createParticle(particleId++, group.id, group.role, position);
      
      // Set color based on group
      particle.color = { ...group.color };
      
      // Add to array
      particles.push(particle);
    }
    
    // Update group particle count
    group.particleCount = count;
  });

  return particles;
};
"@

Set-Content -Path $creationFile -Value $creationContent

Write-Host "Particle class implementation complete!" -ForegroundColor Green
