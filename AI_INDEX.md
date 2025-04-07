# AI Navigation Index for Bitcoin Protozoa

This document serves as a comprehensive index for AI systems to navigate and understand the Bitcoin Protozoa project. It provides structured entry points to the documentation and highlights key concepts and relationships.

## Project Overview

Bitcoin Protozoa is an immutable application deployed on Bitcoin using the Ordinals protocol as recursive inscriptions. It features particle-based creatures with emergent behaviors, evolutionary traits, and a comprehensive class system.

### Core Concepts

1. **Particle System**: 500 particles distributed across 5 roles (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
2. **Deterministic Generation**: Uses Bitcoin block data (nonce and confirmations) for trait generation
3. **Evolution System**: Mutations triggered by confirmation milestones (10k-1M) with varying chances (1-100%)
4. **Class System**: 5 main classes with 15 subclasses each (75 total) across 6 rarity tiers
5. **Trait System**: Formation traits, behavior traits, and mutation traits organized by rarity

## Documentation Structure

The documentation is organized hierarchically with index files at each level:

1. **Repository Root**: [README.md](README.md) - Project overview and directory structure
2. **Main Documentation**: [bitcoin_protozoa/00_index.md](bitcoin_protozoa/00_index.md) - Main index for all documentation
3. **Trait System**: [bitcoin_protozoa/traits/00_summary.md](bitcoin_protozoa/traits/00_summary.md) - Overview of the trait system
4. **Balancing System**: [bitcoin_protozoa/trait_balance_structure/00_index.md](bitcoin_protozoa/trait_balance_structure/00_index.md) - Details on the balancing system
5. **Project Management**: [bitcoin_protozoa/project/README.md](bitcoin_protozoa/project/README.md) - Project management documentation

## Key Relationships

### Particle Roles and Classes

| Role | Main Class | Primary Focus | Subclasses Document |
|------|------------|---------------|---------------------|
| CORE | Healer | Restoration and support | [CORE Subclasses](bitcoin_protozoa/traits/13_core_subclasses.md) |
| CONTROL | Caster | Utility and crowd control | [CONTROL Subclasses](bitcoin_protozoa/traits/14_control_subclasses.md) |
| ATTACK | Striker | Damage and offense | [ATTACK Subclasses](bitcoin_protozoa/traits/10_attack_subclasses.md) |
| DEFENSE | Tank | Protection and durability | [DEFENSE Subclasses](bitcoin_protozoa/traits/11_defense_subclasses.md) |
| MOVEMENT | Rogue | Speed and evasion | [MOVEMENT Subclasses](bitcoin_protozoa/traits/12_movement_subclasses.md) |

### Rarity Tiers and Particle Counts

| Rarity | Percentage | Particle Count Range | Subclasses per Role |
|--------|------------|----------------------|---------------------|
| Common | 40% | 43–95 particles | 4 |
| Uncommon | 30% | 96–110 particles | 3 |
| Rare | 20% | 111–125 particles | 3 |
| Epic | 8% | 126–141 particles | 2 |
| Legendary | 1.5% | 142–151 particles | 2 |
| Mythic | 0.5% | 152–220 particles | 1 |

### Trait Categories

1. **Visual Traits**: Define the appearance of particles
   - [Color Palettes](bitcoin_protozoa/traits/01_color_palettes.md)
   - [Particle Shapes](bitcoin_protozoa/traits/02_particle_shapes.md)

2. **Formation Traits**: Define how particles arrange themselves
   - [Formation Patterns](bitcoin_protozoa/traits/03_formation_patterns.md)
   - [Role Formation Traits](bitcoin_protozoa/traits/07_role_formation_traits.md)

3. **Behavior Traits**: Define how particles move and interact
   - [Behavior Traits](bitcoin_protozoa/traits/04_behavior_traits.md)
   - [Role Behavior Traits](bitcoin_protozoa/traits/08_role_behavior_traits.md)

4. **Mutation Traits**: Provide bonuses triggered by Bitcoin confirmation milestones
   - [Mutation Traits](bitcoin_protozoa/traits/09_mutation_traits.md)

## Implementation Details

The implementation is organized into phases:

1. **Phase 1**: Standardization and foundation
2. **Phase 2**: Core systems and architecture
3. **Phase 3**: Visual traits implementation
4. **Phase 4**: Particle roles and hierarchy
5. **Phase 5**: Physics and force fields
6. **Phase 6**: Evolution and mutation system
7. **Phase 7**: Advanced behaviors and interactions
8. **Phase 8**: Bitcoin integration and deployment

Implementation scripts are available in the [scripts](scripts/) directory, organized by phase.

## Technology Stack

- **Frontend**: React, TypeScript, Vite
- **3D Rendering**: Three.js, React Three Fiber
- **State Management**: Zustand
- **Styling**: @emotion/react
- **Testing**: Vitest, React Testing Library
- **Bitcoin Integration**: Ordinals protocol

## AI-Specific Notes

- All documentation follows a consistent structure with numbered files for ordering
- Each directory contains a README.md or index file (00_*.md) for navigation
- Cross-linking is used extensively to connect related concepts
- AI-specific navigation guides are included at the top of key documents, marked with `<!-- AI-INDEX-START -->` and `<!-- AI-INDEX-END -->` tags
- The particle count ranges determine rarity tier, which affects subclass assignment and abilities
