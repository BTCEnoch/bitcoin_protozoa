# Phase 3: Visual Traits Implementation Scripts

This directory contains scripts for implementing the visual traits system in Bitcoin Protozoa. These scripts generate and implement formation traits, behavior traits, and mutation traits.

## Key Scripts

### Trait System Implementation

- [`implement-trait-system.ps1`](implement-trait-system.ps1): Main script for implementing the trait system
- [`generate-trait-data.ps1`](generate-trait-data.ps1): Generates trait data for all trait types
- [`implement-all-traits.ps1`](implement-all-traits.ps1): Implements all traits (formation, behavior, mutation)

### Formation Traits Implementation

- [`implement-core-formations.ps1`](implement-core-formations.ps1): Implements CORE formation traits
- [`implement-control-formations.ps1`](implement-control-formations.ps1): Implements CONTROL formation traits
- [`implement-movement-formations.ps1`](implement-movement-formations.ps1): Implements MOVEMENT formation traits
- [`implement-defense-formations.ps1`](implement-defense-formations.ps1): Implements DEFENSE formation traits
- [`implement-attack-formations.ps1`](implement-attack-formations.ps1): Implements ATTACK formation traits

### Behavior Traits Implementation

- [`implement-core-behaviors.ps1`](implement-core-behaviors.ps1): Implements CORE behavior traits
- [`implement-control-behaviors.ps1`](implement-control-behaviors.ps1): Implements CONTROL behavior traits
- [`implement-movement-behaviors.ps1`](implement-movement-behaviors.ps1): Implements MOVEMENT behavior traits
- [`implement-defense-behaviors.ps1`](implement-defense-behaviors.ps1): Implements DEFENSE behavior traits
- [`implement-attack-behaviors.ps1`](implement-attack-behaviors.ps1): Implements ATTACK behavior traits

### Mutation Traits Implementation

- [`implement-mutation-traits.ps1`](implement-mutation-traits.ps1): Implements mutation traits

### Visual Components

- [`color-palette-generator.ps1`](color-palette-generator.ps1): Generates color palettes for particles
- [`shape-mesh-generator.ps1`](shape-mesh-generator.ps1): Generates mesh shapes for particles
- [`shader-generator.ps1`](shader-generator.ps1): Generates shaders for particle effects
- [`visual-trait-previewer.ps1`](visual-trait-previewer.ps1): Previews visual traits
- [`visual-regression-testing.ps1`](visual-regression-testing.ps1): Tests visual traits for regressions

## Usage

To implement the entire trait system, run:

```powershell
.\implement-trait-system.ps1
```

To implement specific trait types, run the corresponding script:

```powershell
.\implement-core-formations.ps1
.\implement-core-behaviors.ps1
.\implement-mutation-traits.ps1
```

## Documentation

For more information on the trait system, see the following documentation:

- [Trait System Overview](../../bitcoin_protozoa/traits/00_summary.md)
- [Role Formation Traits](../../bitcoin_protozoa/traits/07_role_formation_traits.md)
- [Role Behavior Traits](../../bitcoin_protozoa/traits/08_role_behavior_traits.md)
- [Mutation Traits](../../bitcoin_protozoa/traits/09_mutation_traits.md)
- [Trait Balance Structure](../../bitcoin_protozoa/trait_balance_structure/00_index.md)
