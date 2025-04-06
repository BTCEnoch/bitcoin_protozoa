# Traits Summary

This directory contains documentation on the trait system for the Bitcoin Protozoa project, focusing on the various traits that define the appearance and behavior of particle creatures.

## Key Documents

- [Color Palettes](01_color_palettes.md) - Color palettes for particle groups
- [Particle Shapes](02_particle_shapes.md) - Shape variations for particles
- [Formation Patterns](03_formation_patterns.md) - Formation patterns for particle groups
- [Behavior Traits](04_behavior_traits.md) - Behavior traits for particle groups
- [Force Field Traits](05_force_field_traits.md) - Force field traits for particle groups
- [Trait System](06_trait_system.md) - Comprehensive trait system architecture
- [Role Formation Traits](07_role_formation_traits.md) - Role-based formation traits across rarity tiers
- [Role Behavior Traits](08_role_behavior_traits.md) - Role-based behavior traits across rarity tiers
- [Mutation Traits](09_mutation_traits.md) - Mutation traits across rarity tiers

## Trait System Overview

The trait system defines the visual and behavioral characteristics of particle creatures. For a comprehensive overview of the trait system architecture, see the [Trait System](06_trait_system.md) document.

1. **Visual Traits**: Define the appearance of particles
   - Color schemes
   - Particle shapes
   - Visual effects
   - Scale variations

2. **Formation Traits**: Define how particles arrange themselves
   - CORE formations (15 formations across 6 rarity tiers)
   - CONTROL formations (15 formations across 6 rarity tiers)
   - MOVEMENT formations (15 formations across 6 rarity tiers)
   - DEFENSE formations (15 formations across 6 rarity tiers)
   - ATTACK formations (15 formations across 6 rarity tiers)

3. **Behavior Traits**: Define how particles move and interact
   - CORE behaviors (15 behaviors across 6 rarity tiers)
   - CONTROL behaviors (15 behaviors across 6 rarity tiers)
   - MOVEMENT behaviors (15 behaviors across 6 rarity tiers)
   - DEFENSE behaviors (15 behaviors across 6 rarity tiers)
   - ATTACK behaviors (15 behaviors across 6 rarity tiers)

4. **Force Calculation Traits**: Define the physics of particle interactions
   - Attraction/repulsion profiles
   - Force field properties
   - Interaction matrices
   - Spatial relationships

## Color Palettes

The color palettes document provides a comprehensive collection of color schemes for particle groups, organized by color theory principles:

1. **Bitcoin-Inspired**: Palettes incorporating Bitcoin orange
2. **Complementary**: Palettes using complementary color pairs
3. **Analogous**: Palettes using adjacent colors on the color wheel
4. **Triadic**: Palettes using three colors equally spaced on the color wheel
5. **Split-Complementary**: Palettes using a base color and two colors adjacent to its complement
6. **Tetradic**: Palettes using four colors arranged in two complementary pairs
7. **Monochromatic**: Palettes using variations of a single color
8. **Natural**: Palettes inspired by natural elements and environments
9. **Vibrant**: Palettes using highly saturated, energetic colors
10. **Pastel**: Palettes using soft, desaturated colors

Each palette consists of 5 colors, one for each particle role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK), designed to create visually appealing and harmonious creatures.

## Particle Shapes

The particle shapes document details the various shape options for particles, organized by role and rarity:

1. **Basic Shapes**: Simple geometric forms (spheres, cubes, etc.)
2. **Complex Shapes**: More intricate geometric forms
3. **Organic Shapes**: Biologically-inspired forms
4. **Abstract Shapes**: Unique, non-standard forms
5. **Composite Shapes**: Combinations of multiple shape elements

Each shape is designed to visually represent the particle's role while providing visual diversity.

## Formation Patterns

The formation patterns document describes how particles arrange themselves into cohesive structures:

1. **Core Formations**: Centered, stable formations for CORE particles
2. **Control Formations**: Orbital, gyroscopic formations for CONTROL particles
3. **Movement Formations**: Dynamic, propulsive formations for MOVEMENT particles
4. **Defense Formations**: Protective, barrier-like formations for DEFENSE particles
5. **Attack Formations**: Aggressive, outward-facing formations for ATTACK particles

Formations influence both the visual appearance and functional behavior of particle groups.

## Behavior Traits

The behavior traits document outlines how particles move and interact with each other:

1. **Core Behaviors**: Stable, influential behaviors for CORE particles
2. **Control Behaviors**: Coordinating, directive behaviors for CONTROL particles
3. **Movement Behaviors**: Propulsive, navigational behaviors for MOVEMENT particles
4. **Defense Behaviors**: Protective, responsive behaviors for DEFENSE particles
5. **Attack Behaviors**: Offensive, tactical behaviors for ATTACK particles

Behaviors create the dynamic, lifelike qualities of the particle creatures through emergent patterns and interactions.

## Mutation Traits

The mutation traits document details the rare bonuses that enhance a creature beyond its base traits:

1. **Single-Group Boosts**: Enhance a single group (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
2. **Multi-Group Boosts**: Enhance multiple groups simultaneously (pairs or triples)
3. **Global Boosts**: Provide smaller bonuses to all five groups
4. **Special Effects**: Offer unique bonuses like dodge chance or regeneration
5. **Particle Count Bonuses**: Add particles to a group (high rarity only)

Mutations are assigned based on Bitcoin confirmation milestones, with higher confirmations increasing the chance of rarer mutations. The 200 mutation traits are distributed across six rarity tiers: Common (60), Uncommon (50), Rare (40), Epic (30), Legendary (15), and Mythic (5).

## Force Fields

The force field traits document details the invisible force structures that shape and influence particle movement:

1. **Core Force Fields**: Central, stabilizing fields for CORE particles
2. **Control Force Fields**: Coordinating, directive fields for CONTROL particles
3. **Movement Force Fields**: Propulsive, navigational fields for MOVEMENT particles
4. **Defense Force Fields**: Protective, responsive fields for DEFENSE particles
5. **Attack Force Fields**: Offensive, tactical fields for ATTACK particles

Force fields create the underlying structure and dynamics of the particle creatures, defining spatial relationships and influence patterns.

## Implementation Approach

Traits are implemented using a deterministic approach based on Bitcoin block data:

1. **Deterministic Generation**: Traits are generated deterministically from the block nonce
2. **Role-Based Assignment**: Different traits are assigned to different particle roles
3. **Rarity Tiers**: Traits are organized into rarity tiers (Common, Uncommon, Rare, Epic, Legendary, Mythic)
4. **Visual Consistency**: Traits are designed to create visually cohesive creatures
5. **Performance Optimization**: Traits are implemented with performance in mind

## Related Documentation

- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Visual Design](../ui/02_visual_design.md) - For details on visual design principles
- [Color Theory](../ui/03_color_themes.md) - For details on color theory principles
- [RNG System](../bitcoin/03_rng_system.md) - For details on the deterministic random number generation
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - For details on the confirmation-based mutation system
