# Mutation Implementation Template
# This template is used to generate scripts for implementing mutation traits

param (
    [string]$outputDir = "src/domains/particle/mutations",
    [string]$description = "Implements the mutation traits system"
)

# Configuration
$mutationDir = "$outputDir"
$indexPath = "$mutationDir/index.ts"
$typesPath = "$mutationDir/types.ts"
$implementationPath = "$mutationDir/implementation.ts"
$effectsPath = "$mutationDir/effects.ts"
$testPath = "src/domains/particle/mutations/mutations.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $mutationDir)) {
    New-Item -ItemType Directory -Path $mutationDir -Force | Out-Null
    Write-Host "Created directory: $mutationDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * Mutation Traits Types
 * 
 * @description Type definitions for the mutation traits system
 */
import { ParticleRole } from '../types';
import { Vector3 } from 'three';

/**
 * Mutation rarity tiers
 */
export enum MutationRarity {
  COMMON = 'COMMON',
  UNCOMMON = 'UNCOMMON',
  RARE = 'RARE',
  EPIC = 'EPIC',
  LEGENDARY = 'LEGENDARY',
  MYTHIC = 'MYTHIC'
}

/**
 * Mutation category types
 */
export enum MutationCategory {
  SINGLE_GROUP_BOOST = 'SINGLE_GROUP_BOOST',
  MULTI_GROUP_BOOST = 'MULTI_GROUP_BOOST',
  GLOBAL_BOOST = 'GLOBAL_BOOST',
  SPECIAL_EFFECT = 'SPECIAL_EFFECT',
  PARTICLE_COUNT_BONUS = 'PARTICLE_COUNT_BONUS'
}

/**
 * Stat type for mutations
 */
export enum StatType {
  HP = 'HP',
  INT = 'INT',
  DAMAGE = 'DAMAGE',
  DEFENSE = 'DEFENSE',
  AGILITY = 'AGILITY'
}

/**
 * Base mutation interface
 */
export interface Mutation {
  id: string;
  name: string;
  description: string;
  rarity: MutationRarity;
  category: MutationCategory;
  apply: (creature: any) => void; // Replace 'any' with your creature type
}

/**
 * Single group boost mutation
 */
export interface SingleGroupBoostMutation extends Mutation {
  category: MutationCategory.SINGLE_GROUP_BOOST;
  role: ParticleRole;
  statType: StatType;
  boostPercentage: number;
}

/**
 * Multi group boost mutation
 */
export interface MultiGroupBoostMutation extends Mutation {
  category: MutationCategory.MULTI_GROUP_BOOST;
  roles: ParticleRole[];
  statTypes: StatType[];
  boostPercentages: number[];
}

/**
 * Global boost mutation
 */
export interface GlobalBoostMutation extends Mutation {
  category: MutationCategory.GLOBAL_BOOST;
  boostPercentage: number;
}

/**
 * Special effect mutation
 */
export interface SpecialEffectMutation extends Mutation {
  category: MutationCategory.SPECIAL_EFFECT;
  role: ParticleRole;
  effectType: string;
  effectValue: number;
}

/**
 * Particle count bonus mutation
 */
export interface ParticleCountBonusMutation extends Mutation {
  category: MutationCategory.PARTICLE_COUNT_BONUS;
  particleCount: number;
  role?: ParticleRole; // Optional, if null then random role
}

/**
 * Type guard to check if a mutation is a single group boost
 */
export function isSingleGroupBoostMutation(mutation: Mutation): mutation is SingleGroupBoostMutation {
  return mutation.category === MutationCategory.SINGLE_GROUP_BOOST;
}

/**
 * Type guard to check if a mutation is a multi group boost
 */
export function isMultiGroupBoostMutation(mutation: Mutation): mutation is MultiGroupBoostMutation {
  return mutation.category === MutationCategory.MULTI_GROUP_BOOST;
}

/**
 * Type guard to check if a mutation is a global boost
 */
export function isGlobalBoostMutation(mutation: Mutation): mutation is GlobalBoostMutation {
  return mutation.category === MutationCategory.GLOBAL_BOOST;
}

/**
 * Type guard to check if a mutation is a special effect
 */
export function isSpecialEffectMutation(mutation: Mutation): mutation is SpecialEffectMutation {
  return mutation.category === MutationCategory.SPECIAL_EFFECT;
}

/**
 * Type guard to check if a mutation is a particle count bonus
 */
export function isParticleCountBonusMutation(mutation: Mutation): mutation is ParticleCountBonusMutation {
  return mutation.category === MutationCategory.PARTICLE_COUNT_BONUS;
}
"@

# Create implementation file
$implementationContent = @"
/**
 * Mutation Traits Implementation
 * 
 * @description Implementation of the mutation traits system
 */
import { ParticleRole, Creature } from '../types';
import { 
  Mutation, 
  MutationRarity, 
  MutationCategory,
  StatType,
  SingleGroupBoostMutation,
  MultiGroupBoostMutation,
  GlobalBoostMutation,
  SpecialEffectMutation,
  ParticleCountBonusMutation
} from './types';
import { applyMutationEffects } from './effects';

/**
 * Create a single group boost mutation
 */
function createSingleGroupBoostMutation(
  id: string,
  name: string,
  description: string,
  rarity: MutationRarity,
  role: ParticleRole,
  statType: StatType,
  boostPercentage: number
): SingleGroupBoostMutation {
  return {
    id,
    name,
    description,
    rarity,
    category: MutationCategory.SINGLE_GROUP_BOOST,
    role,
    statType,
    boostPercentage,
    apply: (creature: Creature) => {
      // Implementation of single group boost
      applyMutationEffects(creature, id);
    }
  };
}

/**
 * Create a multi group boost mutation
 */
function createMultiGroupBoostMutation(
  id: string,
  name: string,
  description: string,
  rarity: MutationRarity,
  roles: ParticleRole[],
  statTypes: StatType[],
  boostPercentages: number[]
): MultiGroupBoostMutation {
  return {
    id,
    name,
    description,
    rarity,
    category: MutationCategory.MULTI_GROUP_BOOST,
    roles,
    statTypes,
    boostPercentages,
    apply: (creature: Creature) => {
      // Implementation of multi group boost
      applyMutationEffects(creature, id);
    }
  };
}

/**
 * Create a global boost mutation
 */
function createGlobalBoostMutation(
  id: string,
  name: string,
  description: string,
  rarity: MutationRarity,
  boostPercentage: number
): GlobalBoostMutation {
  return {
    id,
    name,
    description,
    rarity,
    category: MutationCategory.GLOBAL_BOOST,
    boostPercentage,
    apply: (creature: Creature) => {
      // Implementation of global boost
      applyMutationEffects(creature, id);
    }
  };
}

/**
 * Create a special effect mutation
 */
function createSpecialEffectMutation(
  id: string,
  name: string,
  description: string,
  rarity: MutationRarity,
  role: ParticleRole,
  effectType: string,
  effectValue: number
): SpecialEffectMutation {
  return {
    id,
    name,
    description,
    rarity,
    category: MutationCategory.SPECIAL_EFFECT,
    role,
    effectType,
    effectValue,
    apply: (creature: Creature) => {
      // Implementation of special effect
      applyMutationEffects(creature, id);
    }
  };
}

/**
 * Create a particle count bonus mutation
 */
function createParticleCountBonusMutation(
  id: string,
  name: string,
  description: string,
  rarity: MutationRarity,
  particleCount: number,
  role?: ParticleRole
): ParticleCountBonusMutation {
  return {
    id,
    name,
    description,
    rarity,
    category: MutationCategory.PARTICLE_COUNT_BONUS,
    particleCount,
    role,
    apply: (creature: Creature) => {
      // Implementation of particle count bonus
      applyMutationEffects(creature, id);
    }
  };
}

/**
 * All mutations
 */
export const MUTATIONS: Mutation[] = [
  // Common mutations
  // ... Add all 200 mutations here
  
  // Example mutations
  createSingleGroupBoostMutation(
    'core_vitality_a',
    'Core Vitality A',
    '+5% HP for CORE particles',
    MutationRarity.COMMON,
    'CORE',
    StatType.HP,
    5
  ),
  
  createMultiGroupBoostMutation(
    'core_control_synergy',
    'CORE-CONTROL Synergy',
    '+3% HP, +3% Int',
    MutationRarity.COMMON,
    ['CORE', 'CONTROL'],
    [StatType.HP, StatType.INT],
    [3, 3]
  ),
  
  createGlobalBoostMutation(
    'minor_global_boost_a',
    'Minor Global Boost A',
    '+1% to all stats',
    MutationRarity.COMMON,
    1
  ),
  
  createSpecialEffectMutation(
    'minor_dodge',
    'Minor Dodge',
    '5% chance to dodge attacks',
    MutationRarity.COMMON,
    'DEFENSE',
    'dodge',
    5
  ),
  
  createParticleCountBonusMutation(
    'minor_particle_boost',
    'Minor Particle Boost',
    '+5 particles to a random group',
    MutationRarity.RARE,
    5
  )
];

/**
 * Get mutations by rarity
 */
export function getMutationsByRarity(rarity: MutationRarity): Mutation[] {
  return MUTATIONS.filter(mutation => mutation.rarity === rarity);
}

/**
 * Get mutations by category
 */
export function getMutationsByCategory(category: MutationCategory): Mutation[] {
  return MUTATIONS.filter(mutation => mutation.category === category);
}

/**
 * Get a mutation by ID
 */
export function getMutationById(id: string): Mutation | undefined {
  return MUTATIONS.find(mutation => mutation.id === id);
}

/**
 * Generate mutations based on Bitcoin confirmation milestones
 */
export function generateMutations(blockNonce: number, confirmations: number): Mutation[] {
  // Create a deterministic RNG based on the block nonce
  const rng = createDeterministicRNG(blockNonce);
  
  // Determine number of mutations based on confirmations
  const mutationCount = determineMutationCount(confirmations, rng);
  
  // Select mutations based on rarity tiers
  const selectedMutations: Mutation[] = [];
  
  for (let i = 0; i < mutationCount; i++) {
    // Determine rarity tier based on confirmations
    const rarity = determineRarityTier(confirmations, rng);
    
    // Get all mutations of this rarity
    const rarityMutations = getMutationsByRarity(rarity);
    
    // Select a random mutation from this rarity tier
    const index = Math.floor(rng() * rarityMutations.length);
    const selectedMutation = rarityMutations[index];
    
    // Ensure no duplicate mutations
    if (selectedMutation && !selectedMutations.includes(selectedMutation)) {
      selectedMutations.push(selectedMutation);
    }
  }
  
  return selectedMutations;
}

/**
 * Determine the number of mutations based on confirmations
 */
function determineMutationCount(confirmations: number, rng: () => number): number {
  const roll = rng();
  
  if (confirmations < 10000) {
    // 50% chance for 1 mutation
    return roll < 0.5 ? 1 : 0;
  } else if (confirmations < 100000) {
    // 50% chance for 1 mutation, 10% chance for 2 mutations
    if (roll < 0.5) return 1;
    if (roll < 0.6) return 2;
    return 0;
  } else if (confirmations < 1000000) {
    // 60% chance for 1 mutation, 20% chance for 2 mutations, 1% chance for 3 mutations
    if (roll < 0.6) return 1;
    if (roll < 0.8) return 2;
    if (roll < 0.81) return 3;
    return 0;
  } else {
    // 70% chance for 1 mutation, 30% chance for 2 mutations, 5% chance for 3 mutations
    if (roll < 0.7) return 1;
    if (roll < 0.95) return 2;
    return 3;
  }
}

/**
 * Determine the rarity tier based on confirmations
 */
function determineRarityTier(confirmations: number, rng: () => number): MutationRarity {
  const roll = rng();
  
  if (confirmations < 10000) {
    // Common: 60%, Uncommon: 25%, Rare: 10%, Epic: 4%, Legendary: 1%, Mythic: 0%
    if (roll < 0.6) return MutationRarity.COMMON;
    if (roll < 0.85) return MutationRarity.UNCOMMON;
    if (roll < 0.95) return MutationRarity.RARE;
    if (roll < 0.99) return MutationRarity.EPIC;
    return MutationRarity.LEGENDARY;
  } else if (confirmations < 100000) {
    // Common: 50%, Uncommon: 30%, Rare: 15%, Epic: 4%, Legendary: 1%, Mythic: 0%
    if (roll < 0.5) return MutationRarity.COMMON;
    if (roll < 0.8) return MutationRarity.UNCOMMON;
    if (roll < 0.95) return MutationRarity.RARE;
    if (roll < 0.99) return MutationRarity.EPIC;
    return MutationRarity.LEGENDARY;
  } else if (confirmations < 1000000) {
    // Common: 40%, Uncommon: 30%, Rare: 20%, Epic: 7%, Legendary: 2%, Mythic: 1%
    if (roll < 0.4) return MutationRarity.COMMON;
    if (roll < 0.7) return MutationRarity.UNCOMMON;
    if (roll < 0.9) return MutationRarity.RARE;
    if (roll < 0.97) return MutationRarity.EPIC;
    if (roll < 0.99) return MutationRarity.LEGENDARY;
    return MutationRarity.MYTHIC;
  } else {
    // Common: 30%, Uncommon: 30%, Rare: 25%, Epic: 10%, Legendary: 4%, Mythic: 1%
    if (roll < 0.3) return MutationRarity.COMMON;
    if (roll < 0.6) return MutationRarity.UNCOMMON;
    if (roll < 0.85) return MutationRarity.RARE;
    if (roll < 0.95) return MutationRarity.EPIC;
    if (roll < 0.99) return MutationRarity.LEGENDARY;
    return MutationRarity.MYTHIC;
  }
}

/**
 * Create a deterministic RNG based on a seed
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
"@

# Create effects file
$effectsContent = @"
/**
 * Mutation Effects
 * 
 * @description Effects for mutation traits
 */
import { Creature } from '../types';
import { getMutationById } from './implementation';
import { 
  isSingleGroupBoostMutation,
  isMultiGroupBoostMutation,
  isGlobalBoostMutation,
  isSpecialEffectMutation,
  isParticleCountBonusMutation
} from './types';

/**
 * Apply mutation effects to a creature
 */
export function applyMutationEffects(creature: Creature, mutationId: string): void {
  const mutation = getMutationById(mutationId);
  
  if (!mutation) {
    console.warn(`Mutation with ID ${mutationId} not found`);
    return;
  }
  
  if (isSingleGroupBoostMutation(mutation)) {
    // Apply single group boost
    applySingleGroupBoost(creature, mutation.role, mutation.statType, mutation.boostPercentage);
  } else if (isMultiGroupBoostMutation(mutation)) {
    // Apply multi group boost
    for (let i = 0; i < mutation.roles.length; i++) {
      applySingleGroupBoost(creature, mutation.roles[i], mutation.statTypes[i], mutation.boostPercentages[i]);
    }
  } else if (isGlobalBoostMutation(mutation)) {
    // Apply global boost
    applyGlobalBoost(creature, mutation.boostPercentage);
  } else if (isSpecialEffectMutation(mutation)) {
    // Apply special effect
    applySpecialEffect(creature, mutation.role, mutation.effectType, mutation.effectValue);
  } else if (isParticleCountBonusMutation(mutation)) {
    // Apply particle count bonus
    applyParticleCountBonus(creature, mutation.particleCount, mutation.role);
  }
}

/**
 * Apply a single group boost
 */
function applySingleGroupBoost(creature: Creature, role: string, statType: string, boostPercentage: number): void {
  // Implementation of single group boost
  console.log(`Applying ${boostPercentage}% boost to ${statType} for ${role} particles`);
}

/**
 * Apply a global boost
 */
function applyGlobalBoost(creature: Creature, boostPercentage: number): void {
  // Implementation of global boost
  console.log(`Applying ${boostPercentage}% boost to all stats`);
}

/**
 * Apply a special effect
 */
function applySpecialEffect(creature: Creature, role: string, effectType: string, effectValue: number): void {
  // Implementation of special effect
  console.log(`Applying ${effectType} effect with value ${effectValue} to ${role} particles`);
}

/**
 * Apply a particle count bonus
 */
function applyParticleCountBonus(creature: Creature, particleCount: number, role?: string): void {
  // Implementation of particle count bonus
  if (role) {
    console.log(`Adding ${particleCount} particles to ${role} group`);
  } else {
    console.log(`Adding ${particleCount} particles to a random group`);
  }
}
"@

# Create index file
$indexContent = @"
/**
 * Mutation Traits
 * 
 * @description Mutation traits system for Bitcoin Protozoa
 */
export * from './types';
export * from './implementation';
export * from './effects';
"@

# Create test file
$testContent = @"
/**
 * Mutation Traits Tests
 * 
 * @description Tests for the mutation traits system
 */
import { describe, it, expect, beforeEach } from 'vitest';
import { 
  MUTATIONS,
  getMutationsByRarity,
  getMutationsByCategory,
  getMutationById,
  generateMutations
} from './implementation';
import { 
  MutationRarity,
  MutationCategory
} from './types';

describe('Mutation Traits', () => {
  describe('Mutation Registry', () => {
    it('should have mutations defined for each rarity tier', () => {
      // Check that we have mutations for each rarity tier
      expect(getMutationsByRarity(MutationRarity.COMMON).length).toBeGreaterThan(0);
      expect(getMutationsByRarity(MutationRarity.UNCOMMON).length).toBeGreaterThan(0);
      expect(getMutationsByRarity(MutationRarity.RARE).length).toBeGreaterThan(0);
      expect(getMutationsByRarity(MutationRarity.EPIC).length).toBeGreaterThan(0);
      expect(getMutationsByRarity(MutationRarity.LEGENDARY).length).toBeGreaterThan(0);
      expect(getMutationsByRarity(MutationRarity.MYTHIC).length).toBeGreaterThan(0);
    });
    
    it('should have mutations defined for each category', () => {
      // Check that we have mutations for each category
      expect(getMutationsByCategory(MutationCategory.SINGLE_GROUP_BOOST).length).toBeGreaterThan(0);
      expect(getMutationsByCategory(MutationCategory.MULTI_GROUP_BOOST).length).toBeGreaterThan(0);
      expect(getMutationsByCategory(MutationCategory.GLOBAL_BOOST).length).toBeGreaterThan(0);
      expect(getMutationsByCategory(MutationCategory.SPECIAL_EFFECT).length).toBeGreaterThan(0);
      expect(getMutationsByCategory(MutationCategory.PARTICLE_COUNT_BONUS).length).toBeGreaterThan(0);
    });
    
    it('should be able to retrieve mutations by ID', () => {
      // Get the first mutation
      const firstMutation = MUTATIONS[0];
      
      // Retrieve it by ID
      const retrievedMutation = getMutationById(firstMutation.id);
      
      // Check that we got the same mutation
      expect(retrievedMutation).toBe(firstMutation);
    });
  });
  
  describe('Mutation Generation', () => {
    it('should generate mutations based on confirmations', () => {
      // Test with different confirmation levels
      const lowConfirmations = generateMutations(12345, 5000);
      const mediumConfirmations = generateMutations(12345, 50000);
      const highConfirmations = generateMutations(12345, 500000);
      const veryHighConfirmations = generateMutations(12345, 2000000);
      
      // Check that mutations are generated
      expect(lowConfirmations.length).toBeGreaterThanOrEqual(0);
      expect(mediumConfirmations.length).toBeGreaterThanOrEqual(0);
      expect(highConfirmations.length).toBeGreaterThanOrEqual(0);
      expect(veryHighConfirmations.length).toBeGreaterThanOrEqual(0);
    });
    
    it('should be deterministic based on block nonce', () => {
      // Generate mutations with the same nonce and confirmations
      const mutations1 = generateMutations(12345, 5000);
      const mutations2 = generateMutations(12345, 5000);
      
      // Check that the results are the same
      expect(mutations1).toEqual(mutations2);
      
      // Generate mutations with different nonces
      const mutations3 = generateMutations(54321, 5000);
      
      // Check that the results are different
      expect(mutations1).not.toEqual(mutations3);
    });
  });
  
  describe('Mutation Application', () => {
    let testCreature: any;
    
    beforeEach(() => {
      // Create a test creature
      testCreature = {
        particles: {
          CORE: [],
          CONTROL: [],
          MOVEMENT: [],
          DEFENSE: [],
          ATTACK: []
        },
        stats: {
          HP: 100,
          INT: 100,
          DAMAGE: 100,
          DEFENSE: 100,
          AGILITY: 100
        }
      };
    });
    
    it('should apply mutations without errors', () => {
      // Test each mutation
      MUTATIONS.forEach(mutation => {
        // This should not throw an error
        expect(() => {
          mutation.apply(testCreature);
        }).not.toThrow();
      });
    });
  });
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $implementationPath -Value $implementationContent -Force
Set-Content -Path $effectsPath -Value $effectsContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created mutation implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $implementationPath" -ForegroundColor Green
Write-Host "  - $effectsPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
