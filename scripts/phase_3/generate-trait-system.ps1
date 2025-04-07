# generate-trait-system.ps1
# This script generates the trait system for the Bitcoin Protozoa project

# Configuration
$projectRoot = (Resolve-Path -Path ".").Path -replace "\\", "/"
$outputDir = "$projectRoot/src/domains/particle/traits"

# Ensure the output directory exists
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "Created directory: $outputDir" -ForegroundColor Green
}

# Create the trait system types file
$typesContent = @"
/**
 * Trait System Types
 * 
 * @description Type definitions for the trait system
 */
import { FormationRarity } from '../formations/core/types';
import { BehaviorRarity } from '../behaviors/core/types';
import { ParticleRole } from '../types';

/**
 * Trait type enum
 */
export enum TraitType {
  FORMATION = 'FORMATION',
  BEHAVIOR = 'BEHAVIOR'
}

/**
 * Base trait interface
 */
export interface Trait {
  id: string;
  type: TraitType;
  role: ParticleRole;
  name: string;
  description: string;
  advantage: string;
  explanation?: string;
  rarity: FormationRarity | BehaviorRarity;
}

/**
 * Formation trait interface
 */
export interface FormationTrait extends Trait {
  type: TraitType.FORMATION;
  rarity: FormationRarity;
}

/**
 * Behavior trait interface
 */
export interface BehaviorTrait extends Trait {
  type: TraitType.BEHAVIOR;
  rarity: BehaviorRarity;
}

/**
 * Creature traits interface
 */
export interface CreatureTraits {
  formationTraits: {
    [key in ParticleRole]: FormationTrait;
  };
  behaviorTraits: {
    [key in ParticleRole]: BehaviorTrait;
  };
}
"@

# Create the trait generator file
$generatorContent = @"
/**
 * Trait Generator
 * 
 * @description Generates traits from Bitcoin block data
 */
import { FormationRarity } from '../formations/core/types';
import { BehaviorRarity } from '../behaviors/core/types';
import { ParticleRole } from '../types';
import { Trait, TraitType, FormationTrait, BehaviorTrait, CreatureTraits } from './types';

// Import trait data
import { CORE_FORMATION_DATA, CORE_BEHAVIOR_DATA } from './core_trait_data';
import { CONTROL_FORMATION_DATA, CONTROL_BEHAVIOR_DATA } from './control_trait_data';
import { MOVEMENT_FORMATION_DATA, MOVEMENT_BEHAVIOR_DATA } from './movement_trait_data';
import { DEFENSE_FORMATION_DATA, DEFENSE_BEHAVIOR_DATA } from './defense_trait_data';
import { ATTACK_FORMATION_DATA, ATTACK_BEHAVIOR_DATA } from './attack_trait_data';

/**
 * Rarity weights for trait generation
 * Higher confirmations increase the chance of rarer traits
 */
const RARITY_WEIGHTS = {
  // Confirmations: 0-9,999
  LOW: {
    [FormationRarity.COMMON]: 0.60,
    [FormationRarity.UNCOMMON]: 0.30,
    [FormationRarity.RARE]: 0.07,
    [FormationRarity.EPIC]: 0.02,
    [FormationRarity.LEGENDARY]: 0.007,
    [FormationRarity.MYTHIC]: 0.003
  },
  // Confirmations: 10,000-99,999
  MEDIUM: {
    [FormationRarity.COMMON]: 0.40,
    [FormationRarity.UNCOMMON]: 0.35,
    [FormationRarity.RARE]: 0.15,
    [FormationRarity.EPIC]: 0.07,
    [FormationRarity.LEGENDARY]: 0.02,
    [FormationRarity.MYTHIC]: 0.01
  },
  // Confirmations: 100,000-999,999
  HIGH: {
    [FormationRarity.COMMON]: 0.20,
    [FormationRarity.UNCOMMON]: 0.30,
    [FormationRarity.RARE]: 0.25,
    [FormationRarity.EPIC]: 0.15,
    [FormationRarity.LEGENDARY]: 0.07,
    [FormationRarity.MYTHIC]: 0.03
  },
  // Confirmations: 1,000,000+
  VERY_HIGH: {
    [FormationRarity.COMMON]: 0.10,
    [FormationRarity.UNCOMMON]: 0.20,
    [FormationRarity.RARE]: 0.25,
    [FormationRarity.EPIC]: 0.25,
    [FormationRarity.LEGENDARY]: 0.15,
    [FormationRarity.MYTHIC]: 0.05
  }
};

/**
 * Get the confirmation level based on the number of confirmations
 * 
 * @param confirmations Number of confirmations
 * @returns The confirmation level
 */
function getConfirmationLevel(confirmations: number): 'LOW' | 'MEDIUM' | 'HIGH' | 'VERY_HIGH' {
  if (confirmations < 10000) {
    return 'LOW';
  } else if (confirmations < 100000) {
    return 'MEDIUM';
  } else if (confirmations < 1000000) {
    return 'HIGH';
  } else {
    return 'VERY_HIGH';
  }
}

/**
 * Create a deterministic RNG based on a seed
 * 
 * @param seed The seed for the RNG
 * @returns A function that returns a deterministic random number between 0 and 1
 */
function createDeterministicRNG(seed: number): () => number {
  let state = seed;
  
  // Simple mulberry32 implementation
  return function() {
    state += 0x6D2B79F5;
    let t = state;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
}

/**
 * Select a rarity tier based on weights
 * 
 * @param weights The rarity weights
 * @param rng The random number generator
 * @returns The selected rarity tier
 */
function selectRarity(
  weights: Record<FormationRarity | BehaviorRarity, number>,
  rng: () => number
): FormationRarity | BehaviorRarity {
  const value = rng();
  let cumulativeWeight = 0;
  
  for (const rarity of Object.keys(weights) as Array<FormationRarity | BehaviorRarity>) {
    cumulativeWeight += weights[rarity];
    if (value <= cumulativeWeight) {
      return rarity;
    }
  }
  
  // Fallback to COMMON if something goes wrong
  return FormationRarity.COMMON;
}

/**
 * Select a trait from the available traits for a given role and rarity
 * 
 * @param role The particle role
 * @param rarity The rarity tier
 * @param traitType The type of trait (FORMATION or BEHAVIOR)
 * @param rng The random number generator
 * @returns The selected trait
 */
function selectTrait(
  role: ParticleRole,
  rarity: FormationRarity | BehaviorRarity,
  traitType: TraitType,
  rng: () => number
): Trait {
  // Get the appropriate trait data
  let traitData: any;
  
  if (traitType === TraitType.FORMATION) {
    switch (role) {
      case 'CORE':
        traitData = CORE_FORMATION_DATA[rarity as FormationRarity];
        break;
      case 'CONTROL':
        traitData = CONTROL_FORMATION_DATA[rarity as FormationRarity];
        break;
      case 'MOVEMENT':
        traitData = MOVEMENT_FORMATION_DATA[rarity as FormationRarity];
        break;
      case 'DEFENSE':
        traitData = DEFENSE_FORMATION_DATA[rarity as FormationRarity];
        break;
      case 'ATTACK':
        traitData = ATTACK_FORMATION_DATA[rarity as FormationRarity];
        break;
    }
  } else {
    switch (role) {
      case 'CORE':
        traitData = CORE_BEHAVIOR_DATA[rarity as BehaviorRarity];
        break;
      case 'CONTROL':
        traitData = CONTROL_BEHAVIOR_DATA[rarity as BehaviorRarity];
        break;
      case 'MOVEMENT':
        traitData = MOVEMENT_BEHAVIOR_DATA[rarity as BehaviorRarity];
        break;
      case 'DEFENSE':
        traitData = DEFENSE_BEHAVIOR_DATA[rarity as BehaviorRarity];
        break;
      case 'ATTACK':
        traitData = ATTACK_BEHAVIOR_DATA[rarity as BehaviorRarity];
        break;
    }
  }
  
  // Select a random trait from the available traits
  const index = Math.floor(rng() * traitData.length);
  const selectedTrait = traitData[index];
  
  // Create the trait object
  return {
    id: `${role}_${traitType}_${rarity}_${index}`,
    type: traitType,
    role,
    name: selectedTrait.name,
    description: selectedTrait.description,
    advantage: selectedTrait.advantage,
    explanation: selectedTrait.explanation,
    rarity
  };
}

/**
 * Generate traits for a creature based on Bitcoin block data
 * 
 * @param blockNonce The Bitcoin block nonce
 * @param confirmations The number of confirmations
 * @returns The generated traits
 */
export function generateTraits(blockNonce: number, confirmations: number): CreatureTraits {
  // Create a deterministic RNG based on the block nonce
  const rng = createDeterministicRNG(blockNonce);
  
  // Get the confirmation level
  const confirmationLevel = getConfirmationLevel(confirmations);
  const weights = RARITY_WEIGHTS[confirmationLevel];
  
  // Generate formation traits for each role
  const formationTraits: Partial<Record<ParticleRole, FormationTrait>> = {};
  const behaviorTraits: Partial<Record<ParticleRole, BehaviorTrait>> = {};
  
  const roles: ParticleRole[] = ['CORE', 'CONTROL', 'MOVEMENT', 'DEFENSE', 'ATTACK'];
  
  for (const role of roles) {
    // Select formation trait rarity
    const formationRarity = selectRarity(weights, rng) as FormationRarity;
    
    // Select formation trait
    const formationTrait = selectTrait(role, formationRarity, TraitType.FORMATION, rng) as FormationTrait;
    formationTraits[role] = formationTrait;
    
    // Select behavior trait rarity
    const behaviorRarity = selectRarity(weights, rng) as BehaviorRarity;
    
    // Select behavior trait
    const behaviorTrait = selectTrait(role, behaviorRarity, TraitType.BEHAVIOR, rng) as BehaviorTrait;
    behaviorTraits[role] = behaviorTrait;
  }
  
  return {
    formationTraits: formationTraits as Record<ParticleRole, FormationTrait>,
    behaviorTraits: behaviorTraits as Record<ParticleRole, BehaviorTrait>
  };
}
"@

# Create the index file
$indexContent = @"
/**
 * Trait System
 * 
 * @description Trait system for Bitcoin Protozoa
 */
export * from './types';
export * from './generator';
"@

# Save the files
Set-Content -Path "$outputDir/types.ts" -Value $typesContent -Force
Set-Content -Path "$outputDir/generator.ts" -Value $generatorContent -Force
Set-Content -Path "$outputDir/index.ts" -Value $indexContent -Force

Write-Host "Generated trait system files:" -ForegroundColor Green
Write-Host "  - $outputDir/types.ts" -ForegroundColor Green
Write-Host "  - $outputDir/generator.ts" -ForegroundColor Green
Write-Host "  - $outputDir/index.ts" -ForegroundColor Green

Write-Host "Trait system generation complete!" -ForegroundColor Green
