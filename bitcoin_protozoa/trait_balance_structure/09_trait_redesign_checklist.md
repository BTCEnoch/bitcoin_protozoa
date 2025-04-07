# Trait Redesign Checklist

This document outlines the steps needed to implement a clearer approach to trait and attribute assignment in the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [Current State Analysis](#current-state-analysis)
3. [Redesign Goals](#redesign-goals)
4. [Implementation Checklist](#implementation-checklist)
5. [Testing and Validation](#testing-and-validation)

## Overview

The Bitcoin Protozoa project currently has a trait system that includes formation traits, behavior traits, and mutation traits. The system is based on Bitcoin block data and uses a deterministic RNG approach. However, the current implementation needs refinement to ensure better balance, clearer organization, and more intuitive assignment of traits and attributes.

This checklist will guide the redesign process, focusing on standardizing terminology, aligning trait structures, defining clear scaling functions, and implementing a class system that leverages the traits effectively.

## Current State Analysis

### Trait Types

1. **Formation Traits (75 total)**
   - 15 traits per role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
   - 6 rarity tiers (Common, Uncommon, Rare, Epic, Legendary, Mythic)
   - Define how particles arrange themselves

2. **Behavior Traits (75 total)**
   - 15 traits per role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
   - 6 rarity tiers (Common, Uncommon, Rare, Epic, Legendary, Mythic)
   - Define how particles move and interact

3. **Mutation Traits (200 total)**
   - Distributed across 6 rarity tiers
   - Categories: Single-Group Boosts, Multi-Group Boosts, Global Boosts, Special Effects, Particle Count Bonuses
   - Triggered by Bitcoin confirmation milestones

### Assignment Methods

1. **Formation and Behavior Traits**
   - Assigned using deterministic RNG based on Bitcoin block nonce
   - One formation trait and one behavior trait per role

2. **Mutation Traits**
   - Assigned based on Bitcoin confirmation milestones
   - Number of mutations depends on confirmation count
   - Rarity distribution depends on confirmation count

### Issues Identified

1. **Terminology Inconsistency**
   - Inconsistent naming between documentation and code (e.g., "Motion" vs. "MOVEMENT")
   - Inconsistent capitalization of role names

2. **Trait Structure Misalignment**
   - Different rarity tier systems between documentation (5 tiers) and implementation (6 tiers)
   - Unclear mapping between role-based traits and trait categories

3. **Scaling Function Gaps**
   - Lack of clear formulas for how particle counts affect stats
   - Incomplete implementation of diminishing returns

4. **Class System Placeholder**
   - Class system mentioned but not fully defined or implemented
   - Unclear integration with existing trait system

## Redesign Goals

1. **Standardize Terminology**
   - Consistent naming across all documentation and code
   - Consistent capitalization and formatting

2. **Align Trait Structures**
   - Unified rarity tier system with 6 tiers: Common (40%), Uncommon (30%), Rare (20%), Epic (8%), Legendary (1.5%), Mythic (0.5%)
   - Clear mapping between role-based traits and trait categories
   - Balanced distribution of traits across categories
   - 15 behaviors per group (75 total) distributed across rarity tiers

3. **Define Clear Scaling Functions**
   - Precise formulas for how particle counts affect stats
   - Proper implementation of diminishing returns
   - Balanced stat progression from minimum to maximum

4. **Implement Class System**
   - Class determination based on particle distribution
   - Class-specific abilities and bonuses
   - Integration with trait system

5. **Improve Mutation System**
   - Direct particle distribution instead of percentages
   - Clear rules for mutation stacking
   - Balanced mutation effects

## Implementation Checklist

### 1. Standardize Terminology

- [ ] Update all documentation to use consistent role names (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
- [ ] Ensure consistent capitalization of role names (all uppercase)
- [ ] Create a terminology reference document
- [ ] Update code to use consistent terminology

### 2. Align Trait Structures

- [ ] Decide on rarity tier approach (extend to 6 tiers with Mythic)
- [ ] Update rarity probabilities: Common (40%), Uncommon (30%), Rare (20%), Epic (8%), Legendary (1.5%), Mythic (0.5%)
- [ ] Create mapping between role-based traits and trait categories
- [ ] Balance trait distribution across categories
- [ ] Update trait documentation to reflect new structure

### 3. Define Scaling Functions

- [ ] Implement effective particle calculation with diminishing returns
- [ ] Define base stats for each role at 40 particles
- [ ] Create formulas for how stats scale with particle count
- [ ] Implement combined stat formulas for multi-role effects
- [ ] Document all scaling functions and formulas

### 4. Implement Particle Distribution

- [ ] Implement direct particle allocation instead of percentages
- [ ] Define particle count ranges by rarity tier:
  - Common (40%): 43–95 particles
  - Uncommon (30%): 96–110 particles
  - Rare (20%): 111–125 particles
  - Epic (8%): 126–141 particles
  - Legendary (1.5%): 142–151 particles
  - Mythic (0.5%): 152–220 particles
- [ ] Implement random distribution of particles based on rarity tier
- [ ] Test distribution with various seeds

### 5. Refine Trait Assignment

- [ ] Update formation trait assignment to use new rarity system
- [ ] Update behavior trait assignment to use new rarity system
- [ ] Ensure deterministic assignment based on Bitcoin block data
- [ ] Implement trait selection algorithm
- [ ] Test trait assignment with various seeds

### 6. Enhance Mutation System

- [ ] Update mutation trait assignment based on confirmation milestones
- [ ] Implement mutation stacking rules
- [ ] Define particle count caps for mutations
- [ ] Create mutation visualization system
- [ ] Test mutation system with various confirmation counts

### 7. Develop Class System

- [ ] Define main class determination based on highest particle group
  - CORE → Healer
  - CONTROL → Caster
  - ATTACK → Striker
  - DEFENSE → Tank
  - MOVEMENT → Rogue
- [ ] Implement subclass determination based on full ranking of all five groups
  - Main class determined by highest group
  - Subclass determined by order of remaining four groups
  - 15 subclasses per main class distributed across rarity tiers
  - 75 total unique subclasses (5 × 15)
- [ ] Implement subclass distribution by rarity tier
  - Common: 4 subclasses per main class
  - Uncommon: 3 subclasses per main class
  - Rare: 3 subclasses per main class
  - Epic: 2 subclasses per main class
  - Legendary: 2 subclasses per main class
  - Mythic: 1 subclass per main class
- [ ] Create class-specific base skills for each main class
- [ ] Implement CORE crowd control effects
  - Silence: Prevents enemies from using abilities
  - Confuse: Causes enemies to act unpredictably or attack allies
  - Blind: Reduces enemy accuracy or vision
- [ ] Implement dispel-type skills for CORE subclasses
- [ ] Implement subclass modifiers that affect skills based on group ranking:
  - Second-highest group: Major skill modification
  - Third-highest group: Secondary effect
  - Fourth-highest group: Minor bonus
  - Fifth-highest group: Subtle perk
- [ ] Implement behavior pool for each particle group
  - 15 behaviors per group (75 total)
  - Role-specific behaviors tailored to each group's function
  - Main class category-relevant behaviors
  - Random assignment to subclasses within each group
- [ ] Ensure each subclass has unique gameplay characteristics
- [ ] Integrate class system with trait system
- [ ] Test class system with various particle distributions

## Testing and Validation

- [ ] Create unit tests for all components
- [ ] Test edge cases and boundary conditions
- [ ] Verify deterministic behavior with fixed seeds
- [ ] Generate large number of creatures to analyze distribution
- [ ] Balance testing and adjustment
- [ ] Documentation of test results

## Next Steps

After completing this checklist, the next steps will be:

1. Implement the redesigned trait system in code
2. Create comprehensive documentation
3. Develop visualization tools for traits and classes
4. Conduct user testing and gather feedback
5. Refine based on feedback
