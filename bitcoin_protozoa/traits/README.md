# Trait System Documentation

This directory contains documentation for the trait system in Bitcoin Protozoa. The trait system defines the characteristics, behaviors, and abilities of the particle creatures.

## Directory Contents

- [`00_summary.md`](00_summary.md): Overview of the trait system
- [`01_color_palettes.md`](01_color_palettes.md): Documentation for color palettes
- [`02_particle_shapes.md`](02_particle_shapes.md): Documentation for particle shapes
- [`03_particle_roles.md`](03_particle_roles.md): Documentation for particle roles
- [`04_role_hierarchy.md`](04_role_hierarchy.md): Documentation for role hierarchy
- [`05_role_behaviors.md`](05_role_behaviors.md): Documentation for role behaviors
- [`07_role_formation_traits.md`](07_role_formation_traits.md): Documentation for role formation traits
- [`08_role_behavior_traits.md`](08_role_behavior_traits.md): Documentation for role behavior traits
- [`09_mutation_traits.md`](09_mutation_traits.md): Documentation for mutation traits

## Trait Categories

The trait system is divided into several categories:

1. **Visual Traits**: Color palettes and particle shapes
2. **Role-Based Traits**: Traits specific to each particle role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
3. **Formation Traits**: Traits that define how particles arrange themselves spatially
4. **Behavior Traits**: Traits that define how particles move and interact
5. **Mutation Traits**: Traits that provide bonuses and enhancements triggered by Bitcoin confirmation milestones

## Key Documents

- [Trait System Overview](00_summary.md): Start here for an overview of the trait system
- [Role Formation Traits](07_role_formation_traits.md): Details on the 75 formation traits
- [Role Behavior Traits](08_role_behavior_traits.md): Details on the 75 behavior traits
- [Mutation Traits](09_mutation_traits.md): Details on the 200 mutation traits

## Implementation

The trait system is implemented in the following scripts:

- [`/scripts/phase_3/implement-trait-system.ps1`](../../scripts/phase_3/implement-trait-system.ps1): Main implementation script
- [`/scripts/phase_3/implement-mutation-traits.ps1`](../../scripts/phase_3/implement-mutation-traits.ps1): Mutation traits implementation

For more details on the balancing of the trait system, see the [`/trait_balance_structure`](../trait_balance_structure/) directory.
