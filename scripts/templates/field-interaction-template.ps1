# Field Interaction Template
# This template is used to generate the field interaction implementation

param (
    [string]$outputDir = "src/domains/physics/forceFields",
    [string]$description = "Implements interactions between force fields"
)

# Configuration
$interactionDir = "$outputDir/interactions"
$indexPath = "$interactionDir/index.ts"
$typesPath = "$interactionDir/types.ts"
$fieldFieldPath = "$interactionDir/fieldFieldInteraction.ts"
$hierarchyPath = "$interactionDir/hierarchicalInfluence.ts"
$testPath = "$interactionDir/interactions.test.ts"

# Ensure the directory exists
if (-not (Test-Path -Path $interactionDir)) {
    New-Item -ItemType Directory -Path $interactionDir -Force | Out-Null
    Write-Host "Created directory: $interactionDir" -ForegroundColor Green
}

# Create types file
$typesContent = @"
/**
 * Field Interaction Types
 * 
 * @description Type definitions for force field interactions
 */
import { ForceField } from '../types';
import { ParticleRole } from '../../../particle/types';

/**
 * Interaction result between two force fields
 */
export interface FieldInteractionResult {
  /**
   * Whether the fields interact
   */
  interacts: boolean;
  
  /**
   * Strength of the interaction
   */
  strength: number;
  
  /**
   * Type of interaction
   */
  type: 'reinforce' | 'interfere' | 'override' | 'none';
}

/**
 * Hierarchical influence levels
 */
export interface HierarchyLevels {
  [key: string]: number;
}

/**
 * Hierarchy compatibility matrix
 */
export interface HierarchyCompatibility {
  [sourceRole: string]: {
    [targetRole: string]: number;
  };
}
"@

# Create field-field interaction file
$fieldFieldContent = @"
/**
 * Field-Field Interaction
 * 
 * @description Functions for calculating interactions between force fields
 */
import { Vector3 } from 'three';
import { ForceField } from '../types';
import { FieldInteractionResult } from './types';
import { getHierarchyLevel } from './hierarchicalInfluence';

/**
 * Calculate the interaction between two force fields
 * 
 * @param field1 The first force field
 * @param field2 The second force field
 * @returns The interaction result
 */
export function calculateFieldInteraction(
  field1: ForceField,
  field2: ForceField
): FieldInteractionResult {
  // Skip self-interaction
  if (field1.id === field2.id) {
    return { interacts: false, strength: 0, type: 'none' };
  }
  
  // Check if fields are close enough to interact
  const distance = field1.position.distanceTo(field2.position);
  const interactionRange = field1.properties.range + field2.properties.range;
  
  if (distance > interactionRange) {
    return { interacts: false, strength: 0, type: 'none' };
  }
  
  // Calculate overlap percentage
  const overlapDistance = interactionRange - distance;
  const overlapPercentage = overlapDistance / interactionRange;
  
  // Determine interaction type based on roles and hierarchy
  const interactionType = determineInteractionType(field1, field2);
  
  // Calculate interaction strength
  const interactionStrength = calculateInteractionStrength(
    field1,
    field2,
    overlapPercentage,
    interactionType
  );
  
  return {
    interacts: true,
    strength: interactionStrength,
    type: interactionType
  };
}

/**
 * Determine the type of interaction between two force fields
 * 
 * @param field1 The first force field
 * @param field2 The second force field
 * @returns The interaction type
 */
function determineInteractionType(
  field1: ForceField,
  field2: ForceField
): 'reinforce' | 'interfere' | 'override' | 'none' {
  // Same role fields reinforce each other
  if (field1.role === field2.role) {
    return 'reinforce';
  }
  
  // Get hierarchy levels
  const level1 = getHierarchyLevel(field1.role);
  const level2 = getHierarchyLevel(field2.role);
  
  // Higher level fields override lower level fields
  if (Math.abs(level1 - level2) >= 2) {
    return level1 > level2 ? 'override' : 'override';
  }
  
  // Similar level fields with different roles interfere
  return 'interfere';
}

/**
 * Calculate the strength of interaction between two force fields
 * 
 * @param field1 The first force field
 * @param field2 The second force field
 * @param overlapPercentage The percentage of overlap between fields
 * @param interactionType The type of interaction
 * @returns The interaction strength
 */
function calculateInteractionStrength(
  field1: ForceField,
  field2: ForceField,
  overlapPercentage: number,
  interactionType: 'reinforce' | 'interfere' | 'override' | 'none'
): number {
  // Base strength is the product of field strengths and overlap
  const baseStrength = 
    field1.properties.strength * 
    field2.properties.strength * 
    overlapPercentage;
  
  // Modify based on interaction type
  switch (interactionType) {
    case 'reinforce':
      return baseStrength * 1.5; // Reinforcement boosts strength
    
    case 'interfere':
      return baseStrength * 0.8; // Interference reduces strength
    
    case 'override':
      // Override strength depends on hierarchy difference
      const level1 = getHierarchyLevel(field1.role);
      const level2 = getHierarchyLevel(field2.role);
      const hierarchyDiff = Math.abs(level1 - level2);
      return baseStrength * (1 + 0.5 * hierarchyDiff);
    
    case 'none':
    default:
      return 0;
  }
}

/**
 * Apply the effects of field interactions
 * 
 * @param fields Array of force fields
 * @param deltaTime Time since last update
 */
export function applyFieldInteractions(
  fields: ForceField[],
  deltaTime: number
): void {
  // Calculate all interactions
  for (let i = 0; i < fields.length; i++) {
    for (let j = i + 1; j < fields.length; j++) {
      const field1 = fields[i];
      const field2 = fields[j];
      
      const interaction = calculateFieldInteraction(field1, field2);
      
      if (interaction.interacts) {
        // Apply interaction effects based on type
        applyInteractionEffect(field1, field2, interaction, deltaTime);
      }
    }
  }
}

/**
 * Apply the effect of an interaction between two fields
 * 
 * @param field1 The first force field
 * @param field2 The second force field
 * @param interaction The interaction result
 * @param deltaTime Time since last update
 */
function applyInteractionEffect(
  field1: ForceField,
  field2: ForceField,
  interaction: FieldInteractionResult,
  deltaTime: number
): void {
  // Implementation depends on the specific effects desired
  // This is a placeholder for the actual implementation
  
  switch (interaction.type) {
    case 'reinforce':
      // Reinforcing fields might temporarily increase each other's strength
      // or create stable formations
      break;
    
    case 'interfere':
      // Interfering fields might create complex force patterns
      // or cancel out in certain regions
      break;
    
    case 'override':
      // Overriding fields might suppress or redirect the other field
      break;
    
    case 'none':
    default:
      // No effect
      break;
  }
}
"@

# Create hierarchical influence file
$hierarchyContent = @"
/**
 * Hierarchical Influence
 * 
 * @description Implementation of hierarchical influence between force fields
 */
import { ParticleRole } from '../../../particle/types';
import { HierarchyLevels, HierarchyCompatibility } from './types';

/**
 * Hierarchy levels for each role
 * Higher numbers indicate higher positions in the hierarchy
 */
export const HIERARCHY_LEVELS: HierarchyLevels = {
  CORE: 4,     // Highest level
  CONTROL: 3,  // Second level
  MOVEMENT: 2, // Third level
  DEFENSE: 2,  // Third level
  ATTACK: 2    // Third level
};

/**
 * Hierarchy compatibility matrix
 * Values indicate the degree to which a source role can influence a target role
 * 1.0 = full influence, 0.0 = no influence
 */
export const HIERARCHY_COMPATIBILITY: HierarchyCompatibility = {
  CORE: {
    CORE: 1.0,
    CONTROL: 1.0,
    MOVEMENT: 0.7,
    DEFENSE: 0.7,
    ATTACK: 0.7
  },
  CONTROL: {
    CORE: 0.3,
    CONTROL: 1.0,
    MOVEMENT: 1.0,
    DEFENSE: 1.0,
    ATTACK: 1.0
  },
  MOVEMENT: {
    CORE: 0.1,
    CONTROL: 0.3,
    MOVEMENT: 1.0,
    DEFENSE: 0.2,
    ATTACK: 0.2
  },
  DEFENSE: {
    CORE: 0.1,
    CONTROL: 0.3,
    MOVEMENT: 0.2,
    DEFENSE: 1.0,
    ATTACK: 0.2
  },
  ATTACK: {
    CORE: 0.1,
    CONTROL: 0.3,
    MOVEMENT: 0.2,
    DEFENSE: 0.2,
    ATTACK: 1.0
  }
};

/**
 * Get the hierarchy level for a role
 * 
 * @param role The particle role
 * @returns The hierarchy level (higher = more influential)
 */
export function getHierarchyLevel(role: ParticleRole): number {
  return HIERARCHY_LEVELS[role] || 0;
}

/**
 * Get the compatibility between two roles
 * 
 * @param sourceRole The source role
 * @param targetRole The target role
 * @returns The compatibility factor (0-1)
 */
export function getHierarchyCompatibility(
  sourceRole: ParticleRole,
  targetRole: ParticleRole
): number {
  if (!HIERARCHY_COMPATIBILITY[sourceRole]) return 0;
  return HIERARCHY_COMPATIBILITY[sourceRole][targetRole] || 0;
}

/**
 * Check if a source role can contain a target role
 * 
 * @param sourceRole The source role
 * @param targetRole The target role
 * @returns True if the source can contain the target
 */
export function canContainRole(
  sourceRole: ParticleRole,
  targetRole: ParticleRole
): boolean {
  // CORE can contain all roles
  if (sourceRole === 'CORE') return true;
  
  // CONTROL can contain all except CORE
  if (sourceRole === 'CONTROL') return targetRole !== 'CORE';
  
  // Other roles can only contain themselves
  return sourceRole === targetRole;
}

/**
 * Calculate the influence factor between two roles based on hierarchy
 * 
 * @param sourceRole The source role
 * @param targetRole The target role
 * @returns The influence factor
 */
export function calculateHierarchicalInfluence(
  sourceRole: ParticleRole,
  targetRole: ParticleRole
): number {
  // Get basic compatibility
  const compatibility = getHierarchyCompatibility(sourceRole, targetRole);
  
  // Get hierarchy levels
  const sourceLevel = getHierarchyLevel(sourceRole);
  const targetLevel = getHierarchyLevel(targetRole);
  
  // Calculate level difference factor
  // Higher source levels have more influence on lower target levels
  const levelDifference = sourceLevel - targetLevel;
  const levelFactor = levelDifference > 0 
    ? 1 + 0.2 * levelDifference  // Bonus for higher level
    : 1 / (1 + 0.3 * Math.abs(levelDifference)); // Penalty for lower level
  
  // Combine factors
  return compatibility * levelFactor;
}
"@

# Create index file
$indexContent = @"
/**
 * Force Field Interactions
 * 
 * @description Interactions between force fields
 */
export * from './types';
export * from './fieldFieldInteraction';
export * from './hierarchicalInfluence';
"@

# Create test file
$testContent = @"
/**
 * Field Interaction Tests
 * 
 * @description Tests for force field interactions
 */
import { describe, it, expect } from 'vitest';
import { Vector3 } from 'three';
import { ForceField } from '../types';
import { 
  calculateFieldInteraction,
  applyFieldInteractions
} from './fieldFieldInteraction';
import {
  getHierarchyLevel,
  getHierarchyCompatibility,
  canContainRole,
  calculateHierarchicalInfluence,
  HIERARCHY_LEVELS,
  HIERARCHY_COMPATIBILITY
} from './hierarchicalInfluence';

describe('Field Interactions', () => {
  // Create test fields
  const createTestField = (
    id: number,
    position: Vector3,
    role: string,
    strength: number,
    range: number
  ): ForceField => ({
    id,
    type: 'TEST',
    position,
    role: role as any,
    properties: {
      strength,
      range,
      shape: {},
      rotation: {
        speed: 0,
        axis: new Vector3(0, 1, 0)
      }
    },
    calculateInfluence: () => {},
    getVisualization: () => ({ color: null, opacity: 0, vertices: [] })
  });
  
  describe('Field-Field Interaction', () => {
    it('should detect when fields interact', () => {
      const field1 = createTestField(1, new Vector3(0, 0, 0), 'CORE', 1.0, 5.0);
      const field2 = createTestField(2, new Vector3(8, 0, 0), 'CONTROL', 1.0, 5.0);
      
      // Fields should interact (ranges overlap: 5 + 5 > 8)
      const interaction = calculateFieldInteraction(field1, field2);
      expect(interaction.interacts).toBe(true);
    });
    
    it('should detect when fields do not interact', () => {
      const field1 = createTestField(1, new Vector3(0, 0, 0), 'CORE', 1.0, 5.0);
      const field2 = createTestField(2, new Vector3(15, 0, 0), 'CONTROL', 1.0, 5.0);
      
      // Fields should not interact (ranges don't overlap: 5 + 5 < 15)
      const interaction = calculateFieldInteraction(field1, field2);
      expect(interaction.interacts).toBe(false);
    });
    
    it('should determine correct interaction type for same role', () => {
      const field1 = createTestField(1, new Vector3(0, 0, 0), 'CORE', 1.0, 5.0);
      const field2 = createTestField(2, new Vector3(8, 0, 0), 'CORE', 1.0, 5.0);
      
      const interaction = calculateFieldInteraction(field1, field2);
      expect(interaction.type).toBe('reinforce');
    });
    
    it('should determine correct interaction type for different roles', () => {
      const field1 = createTestField(1, new Vector3(0, 0, 0), 'CORE', 1.0, 5.0);
      const field2 = createTestField(2, new Vector3(8, 0, 0), 'MOVEMENT', 1.0, 5.0);
      
      const interaction = calculateFieldInteraction(field1, field2);
      // CORE is much higher in hierarchy than MOVEMENT, should override
      expect(interaction.type).toBe('override');
    });
  });
  
  describe('Hierarchical Influence', () => {
    it('should have correct hierarchy levels', () => {
      expect(getHierarchyLevel('CORE')).toBe(4);
      expect(getHierarchyLevel('CONTROL')).toBe(3);
      expect(getHierarchyLevel('MOVEMENT')).toBe(2);
      expect(getHierarchyLevel('DEFENSE')).toBe(2);
      expect(getHierarchyLevel('ATTACK')).toBe(2);
    });
    
    it('should have correct hierarchy compatibility', () => {
      // CORE should fully influence itself and CONTROL
      expect(getHierarchyCompatibility('CORE', 'CORE')).toBe(1.0);
      expect(getHierarchyCompatibility('CORE', 'CONTROL')).toBe(1.0);
      
      // CORE should partially influence lower roles
      expect(getHierarchyCompatibility('CORE', 'MOVEMENT')).toBe(0.7);
      
      // MOVEMENT should not influence CORE much
      expect(getHierarchyCompatibility('MOVEMENT', 'CORE')).toBe(0.1);
    });
    
    it('should correctly determine containment', () => {
      // CORE can contain all roles
      expect(canContainRole('CORE', 'CORE')).toBe(true);
      expect(canContainRole('CORE', 'CONTROL')).toBe(true);
      expect(canContainRole('CORE', 'MOVEMENT')).toBe(true);
      
      // CONTROL can contain all except CORE
      expect(canContainRole('CONTROL', 'CORE')).toBe(false);
      expect(canContainRole('CONTROL', 'CONTROL')).toBe(true);
      expect(canContainRole('CONTROL', 'MOVEMENT')).toBe(true);
      
      // MOVEMENT can only contain MOVEMENT
      expect(canContainRole('MOVEMENT', 'CORE')).toBe(false);
      expect(canContainRole('MOVEMENT', 'CONTROL')).toBe(false);
      expect(canContainRole('MOVEMENT', 'MOVEMENT')).toBe(true);
      expect(canContainRole('MOVEMENT', 'DEFENSE')).toBe(false);
    });
    
    it('should calculate hierarchical influence correctly', () => {
      // CORE influencing CONTROL (higher to lower)
      const coreToControl = calculateHierarchicalInfluence('CORE', 'CONTROL');
      expect(coreToControl).toBeGreaterThan(1.0); // Should be boosted
      
      // MOVEMENT influencing CORE (lower to higher)
      const movementToCore = calculateHierarchicalInfluence('MOVEMENT', 'CORE');
      expect(movementToCore).toBeLessThan(0.1); // Should be reduced
      
      // Same level influence
      const defenseToAttack = calculateHierarchicalInfluence('DEFENSE', 'ATTACK');
      expect(defenseToAttack).toBe(0.2); // Should be as defined in compatibility matrix
    });
  });
});
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $fieldFieldPath -Value $fieldFieldContent -Force
Set-Content -Path $hierarchyPath -Value $hierarchyContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force
Set-Content -Path $testPath -Value $testContent -Force

Write-Host "Created field interaction implementation files:" -ForegroundColor Green
Write-Host "  - $typesPath" -ForegroundColor Green
Write-Host "  - $fieldFieldPath" -ForegroundColor Green
Write-Host "  - $hierarchyPath" -ForegroundColor Green
Write-Host "  - $indexPath" -ForegroundColor Green
Write-Host "  - $testPath" -ForegroundColor Green
