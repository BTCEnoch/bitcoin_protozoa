# Class System Implementation

This document details the implementation of the class system for Bitcoin Protozoa, focusing on how particle distributions determine classes and subclasses, and how these affect gameplay.

## Table of Contents

1. [Overview](#overview)
2. [Main Classes](#main-classes)
3. [Subclass System](#subclass-system)
4. [Class Skills](#class-skills)
5. [Subclass Modifiers](#subclass-modifiers)
6. [Integration with Traits](#integration-with-traits)
7. [Implementation Guidelines](#implementation-guidelines)

## Overview

The Bitcoin Protozoa class system transforms particle distributions into meaningful gameplay roles. Each creature is assigned a main class based on its dominant particle group, with subclasses determined by the ranking of the remaining groups. This creates a rich variety of 120 unique subclasses, each with distinct gameplay characteristics.

## Main Classes

The main class is determined by the particle group with the highest count:

| Dominant Group | Main Class | Primary Focus |
|----------------|------------|---------------|
| CORE | Healer | Restoration and support |
| CONTROL | Caster | Utility and crowd control |
| ATTACK | Striker | Damage and offense |
| DEFENSE | Tank | Protection and durability |
| MOVEMENT | Rogue | Speed and evasion |

Each main class has a set of base skills and characteristics that define its primary role in gameplay.

## Subclass System

The subclass is determined by the full ranking of all five particle groups:

1. **Main Class**: Determined by the highest group
2. **Subclass**: Determined by the order of the remaining four groups

This creates 24 subclasses per main class (4! permutations), for a total of 120 unique subclasses (5 × 24).

### Class Determination Diagram

```
                      ┌───────────────────────┐
                      │   Particle Groups     │
                      │   CORE: 120          │
                      │   CONTROL: 80        │
                      │   ATTACK: 100        │
                      │   DEFENSE: 110       │
                      │   MOVEMENT: 90       │
                      └──────────┬────────────┘
                                 │
                                 ▼
                      ┌───────────────────────┐
                      │   Sort by Count       │
                      │   (Highest to Lowest) │
                      └──────────┬────────────┘
                                 │
                                 ▼
                      ┌───────────────────────┐
                      │   Ranked Groups       │
                      │   1. CORE             │
                      │   2. DEFENSE          │
                      │   3. ATTACK           │
                      │   4. MOVEMENT         │
                      │   5. CONTROL          │
                      └──────────┬────────────┘
                                 │
                                 ▼
          ┌─────────────────────┴─────────────────────┐
          │                                           │
          ▼                                           ▼
┌───────────────────────┐                 ┌───────────────────────┐
│   Main Class          │                 │   Subclass            │
│   (From Highest)      │                 │   (From Remaining)    │
│                       │                 │                       │
│   CORE → Healer       │                 │   DEFENSE-ATTACK-     │
│                       │                 │   MOVEMENT-CONTROL    │
└───────────────────────┘                 └───────────────────────┘
                                                     │
                                                     ▼
                                         ┌───────────────────────┐
                                         │   Final Class         │
                                         │                       │
                                         │   Guardian Healer     │
                                         │   with Striker Agility│
                                         │   and Arcane Support  │
                                         └───────────────────────┘
```

### Example Subclass Naming

For a creature with CORE as the highest group, followed by DEFENSE, CONTROL, ATTACK, and MOVEMENT:

- Main Class: Healer (from CORE)
- Subclass: Guardian Healer (from DEFENSE being second)
- Full Classification: Guardian Healer with Control Precision and Mobile Strike (representing the full order)

### Subclass Uniqueness

Even subclasses that share the same top three groups but differ in the fourth and fifth positions will have distinct gameplay characteristics. For example:

- **Subclass A**: Healer with DEFENSE > CONTROL > ATTACK > MOVEMENT
- **Subclass B**: Healer with DEFENSE > CONTROL > MOVEMENT > ATTACK

Both are Guardian Healers with Control Precision, but Subclass A has a minor attack bonus and slight movement perk, while Subclass B has a minor movement bonus and slight attack perk.

## Class Skills

Each main class has a set of base skills that define its primary role:

### Healer (CORE)
- **Heal**: Restores health to allies
- **Restore**: Removes debuffs from allies
- **Stabilize**: Provides damage reduction to allies

### Caster (CONTROL)
- **Arcane Bolt**: Deals damage and applies a control effect
- **Manipulate**: Alters the battlefield or enemy behavior
- **Enhance**: Boosts ally effectiveness

### Striker (ATTACK)
- **Strike**: Deals high damage to a single target
- **Barrage**: Deals moderate damage to multiple targets
- **Penetrate**: Ignores a portion of enemy defense

### Tank (DEFENSE)
- **Shield**: Absorbs damage for allies
- **Taunt**: Forces enemies to attack the tank
- **Fortify**: Increases own defense temporarily

### Rogue (MOVEMENT)
- **Dash**: Quickly repositions
- **Evade**: Increases dodge chance
- **Ambush**: Deals bonus damage from advantageous positions

## Subclass Modifiers

The ranking of all five particle groups influences how the base skills function:

### Subclass Modifier Table

The following table shows how each group modifies skills based on its position in the ranking:

| Group Position | CORE | CONTROL | ATTACK | DEFENSE | MOVEMENT |
|----------------|------|---------|--------|---------|----------|
| **2nd (Major)** | +Healing (50%) | +Crowd Control (5s) | +Damage (30%) | +Shield (50%) | +Speed (30%) |
| **3rd (Secondary)** | +Regen (2%/s) | +Debuff (3s) | +Penetration (15%) | +Resistance (20%) | +Evasion (15%) |
| **4th (Minor)** | +Stability (10%) | +Utility (5%) | +Crit Chance (5%) | +Reflect (10%) | +Dash (10%) |
| **5th (Subtle)** | +Energy (5%) | +Focus (3%) | +Bleed (2%) | +Thorns (3%) | +Agility (5%) |

### Second-Highest Group (Major Modifier)
- **CORE**: Adds healing or regeneration effects
- **CONTROL**: Adds crowd control or utility effects
- **ATTACK**: Adds damage or offensive effects
- **DEFENSE**: Adds protection or damage reduction effects
- **MOVEMENT**: Adds speed or mobility effects

### Third-Highest Group (Secondary Modifier)
- **CORE**: Adds a minor healing or stability effect
- **CONTROL**: Adds a minor control or utility effect
- **ATTACK**: Adds a minor damage or penetration effect
- **DEFENSE**: Adds a minor protection or resistance effect
- **MOVEMENT**: Adds a minor speed or evasion effect

### Fourth-Highest Group (Minor Modifier)
- Provides a small bonus related to the group's function
- Typically 25-50% as effective as the third-highest group's modifier

### Fifth-Highest Group (Subtle Perk)
- Provides a very small bonus or unique perk
- May activate under specific conditions or with low probability

### Example Skill Modification

For a Healer with DEFENSE > CONTROL > ATTACK > MOVEMENT ranking:

**Heal Skill**:
- Base Effect: Restores 100 health
- DEFENSE (2nd): Adds a shield (50% of healing amount)
- CONTROL (3rd): Adds a minor slow effect to nearby enemies
- ATTACK (4th): Adds a small damage reflection (10% for 3 seconds)
- MOVEMENT (5th): Grants a tiny speed boost after casting (5% for 2 seconds)

## Integration with Traits

The class system integrates with the trait system in several ways:

### Formation Traits
- Affect the spatial arrangement of particles, which can enhance class abilities
- Example: A "Spherical Shell" formation for a Tank enhances the Shield ability

### Behavior Traits
- Affect how particles interact, which can modify class behaviors
- Example: "Reactive Armor" behavior for a Tank improves damage reflection

### Mutation Traits
- Provide direct bonuses to stats or abilities
- Can enhance class-specific skills or provide new capabilities
- Example: "+15% Defense" mutation makes a Tank's Shield ability more effective

## Implementation Guidelines

### 1. Class Determination

```typescript
function determineClass(particleGroups: Record<string, number>): {
  mainClass: string;
  subclass: string;
  ranking: string[];
} {
  // Sort groups by particle count (descending)
  const ranking = Object.entries(particleGroups)
    .sort((a, b) => b[1] - a[1])
    .map(([group]) => group);

  // Determine main class from highest group
  const mainClassMap: Record<string, string> = {
    'CORE': 'Healer',
    'CONTROL': 'Caster',
    'ATTACK': 'Striker',
    'DEFENSE': 'Tank',
    'MOVEMENT': 'Rogue'
  };

  const mainClass = mainClassMap[ranking[0]];

  // Determine subclass name based on second highest
  const subclassPrefixMap: Record<string, string> = {
    'CORE': 'Vital',
    'CONTROL': 'Arcane',
    'ATTACK': 'Battle',
    'DEFENSE': 'Guardian',
    'MOVEMENT': 'Swift'
  };

  const subclass = `${subclassPrefixMap[ranking[1]]} ${mainClass}`;

  return { mainClass, subclass, ranking };
}
```

### 2. Skill Modification

```typescript
function modifySkill(
  skill: Skill,
  ranking: string[],
  traits: Trait[]
): Skill {
  const modifiedSkill = { ...skill };

  // Apply second group modifier (major)
  applyGroupModifier(modifiedSkill, ranking[1], 1.0, traits);

  // Apply third group modifier (secondary)
  applyGroupModifier(modifiedSkill, ranking[2], 0.6, traits);

  // Apply fourth group modifier (minor)
  applyGroupModifier(modifiedSkill, ranking[3], 0.3, traits);

  // Apply fifth group modifier (subtle)
  applyGroupModifier(modifiedSkill, ranking[4], 0.1, traits);

  return modifiedSkill;
}
```

### 3. Trait Integration

```typescript
function applyTraitsToClass(
  creature: Creature,
  traits: Trait[]
): void {
  // Apply formation traits
  const formationTraits = traits.filter(t => t.type === 'formation');
  formationTraits.forEach(trait => {
    applyFormationTraitToClass(creature, trait);
  });

  // Apply behavior traits
  const behaviorTraits = traits.filter(t => t.type === 'behavior');
  behaviorTraits.forEach(trait => {
    applyBehaviorTraitToClass(creature, trait);
  });

  // Apply mutation traits
  const mutationTraits = traits.filter(t => t.type === 'mutation');
  mutationTraits.forEach(trait => {
    applyMutationTraitToClass(creature, trait);
  });
}
```

### 4. Testing and Balance

- Test each main class with various subclass configurations
- Ensure all 120 subclasses have unique gameplay characteristics
- Balance skill modifiers to ensure no subclass is overpowered
- Verify trait interactions with classes work as expected
