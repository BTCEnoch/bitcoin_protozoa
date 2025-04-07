# traits DOCUMENTATION 
 
This document contains all the content from the traits subdirectory of the Bitcoin Protozoa project. 
 
## Files 
 
### 00_summary.md 
 
```.md 
# Traits Summary

This directory contains documentation on the trait system for the Bitcoin Protozoa project, focusing on the various traits that define the appearance and behavior of particle creatures.

## Key Documents

- [Color Palettes](01_color_palettes.md) - Color palettes for particle groups
- [Particle Shapes](02_particle_shapes.md) - Shape variations for particles
- [Formation Patterns](03_formation_patterns.md) - Formation patterns for particle groups
- [Behavior Traits](04_behavior_traits.md) - Behavior traits for particle groups
- [Force Field Traits](05_force_field_traits.md) - Force field traits for particle groups
- [Trait System](06_trait_system.md) - Comprehensive trait system architecture

## Trait System Overview

The trait system defines the visual and behavioral characteristics of particle creatures. For a comprehensive overview of the trait system architecture, see the [Trait System](06_trait_system.md) document.

1. **Visual Traits**: Define the appearance of particles
   - Color schemes
   - Particle shapes
   - Visual effects
   - Scale variations

2. **Formation Traits**: Define how particles arrange themselves
   - Core formations
   - Control formations
   - Movement formations
   - Defense formations
   - Attack formations

3. **Behavior Traits**: Define how particles move and interact
   - Emergent behaviors
   - Role-specific behaviors
   - Group interactions
   - Environmental responses

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
 
``` 
 
--- 
 
### 01_color_palettes.md 
 
```.md 
# Color Palettes for Particle Groups

This document provides a comprehensive collection of color palettes for particle groups in the Bitcoin Protozoa project. Each palette consists of 5 colors, one for each particle role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK), designed according to color theory principles to create visually appealing and harmonious creatures.

## Table of Contents

1. [Color Theory Principles](#color-theory-principles) [Line 20]
2. [Palette Structure](#palette-structure) [Line 40]
3. [Palette Categories](#palette-categories) [Line 60]
   - [Bitcoin-Inspired](#bitcoin-inspired) [Line 65]
   - [Complementary](#complementary) [Line 120]
   - [Analogous](#analogous) [Line 180]
   - [Triadic](#triadic) [Line 240]
   - [Split-Complementary](#split-complementary) [Line 300]
   - [Tetradic](#tetradic) [Line 360]
   - [Monochromatic](#monochromatic) [Line 420]
   - [Natural](#natural) [Line 480]
   - [Vibrant](#vibrant) [Line 540]
   - [Pastel](#pastel) [Line 600]
4. [Implementation](#implementation) [Line 660]
5. [Related Documents](#related-documents) [Line 700]

## Color Theory Principles

The color palettes in this document follow established color theory principles to ensure visual harmony and appeal:

1. **Color Harmony**: Colors are selected based on established color relationships (complementary, analogous, triadic, etc.)
2. **Visual Distinction**: Each role has a visually distinct color to ensure clear identification
3. **Contrast Balance**: Appropriate contrast between colors for visual clarity
4. **Saturation Variation**: Varied saturation levels to create visual interest
5. **Brightness Hierarchy**: Strategic brightness levels to establish visual hierarchy

These principles ensure that each creature has a cohesive visual identity while maintaining clear visual distinction between particle roles.

## Palette Structure

Each palette consists of 5 colors, one for each particle role:

1. **CORE**: The central, foundational color that defines the creature's primary identity
2. **CONTROL**: The color for control particles, often contrasting with or complementing the CORE
3. **MOVEMENT**: The color for movement particles, typically dynamic and energetic
4. **DEFENSE**: The color for defense particles, often solid and stable
5. **ATTACK**: The color for attack particles, typically bold and attention-grabbing

Each color is specified in hexadecimal format (#RRGGBB) and includes RGB values for implementation reference.

## Palette Categories

The color palettes are organized into categories based on color relationships and themes.

### Bitcoin-Inspired

These palettes incorporate Bitcoin orange (#F7931A) as a primary color, creating a visual connection to Bitcoin while ensuring visual harmony.

#### Bitcoin Classic

```
CORE:      #F7931A (247, 147, 26)   - Bitcoin Orange
CONTROL:   #00A3FF (0, 163, 255)    - Electric Blue
MOVEMENT:  #00E676 (0, 230, 118)    - Vibrant Green
DEFENSE:   #7B1FA2 (123, 31, 162)   - Royal Purple
ATTACK:    #FF1744 (255, 23, 68)    - Energetic Red
```

**Color Harmony**: Complementary colors with Bitcoin orange as the focal point.

#### Bitcoin Gold

```
CORE:      #F7931A (247, 147, 26)   - Bitcoin Orange
CONTROL:   #FFD700 (255, 215, 0)    - Gold
MOVEMENT:  #FFA000 (255, 160, 0)    - Amber
DEFENSE:   #795548 (121, 85, 72)    - Brown
ATTACK:    #FF5722 (255, 87, 34)    - Deep Orange
```

**Color Harmony**: Analogous colors in the orange-gold spectrum.

#### Bitcoin Ocean

```
CORE:      #F7931A (247, 147, 26)   - Bitcoin Orange
CONTROL:   #0288D1 (2, 136, 209)    - Light Blue
MOVEMENT:  #00BCD4 (0, 188, 212)    - Cyan
DEFENSE:   #01579B (1, 87, 155)     - Dark Blue
ATTACK:    #FF5722 (255, 87, 34)    - Deep Orange
```

**Color Harmony**: Cool blues contrasting with warm orange.

#### Bitcoin Forest

```
CORE:      #F7931A (247, 147, 26)   - Bitcoin Orange
CONTROL:   #388E3C (56, 142, 60)    - Green
MOVEMENT:  #8BC34A (139, 195, 74)   - Light Green
DEFENSE:   #1B5E20 (27, 94, 32)     - Dark Green
ATTACK:    #FF5722 (255, 87, 34)    - Deep Orange
```

**Color Harmony**: Green tones contrasting with warm orange.

#### Bitcoin Sunset

```
CORE:      #F7931A (247, 147, 26)   - Bitcoin Orange
CONTROL:   #FF9800 (255, 152, 0)    - Orange
MOVEMENT:  #FFEB3B (255, 235, 59)   - Yellow
DEFENSE:   #E91E63 (233, 30, 99)    - Pink
ATTACK:    #9C27B0 (156, 39, 176)   - Purple
```

**Color Harmony**: Sunset-inspired gradient with complementary purple.

### Complementary

These palettes use complementary colors (opposite on the color wheel) to create strong visual contrast and energy.

#### Blue-Orange

```
CORE:      #1E88E5 (30, 136, 229)   - Bright Blue
CONTROL:   #64B5F6 (100, 181, 246)  - Light Blue
MOVEMENT:  #0D47A1 (13, 71, 161)    - Dark Blue
DEFENSE:   #FF9800 (255, 152, 0)    - Orange
ATTACK:    #F57C00 (245, 124, 0)    - Dark Orange
```

**Color Harmony**: Blue and orange complementary pair with variations.

#### Purple-Yellow

```
CORE:      #9C27B0 (156, 39, 176)   - Purple
CONTROL:   #BA68C8 (186, 104, 200)  - Light Purple
MOVEMENT:  #6A1B9A (106, 27, 154)   - Dark Purple
DEFENSE:   #FFEB3B (255, 235, 59)   - Yellow
ATTACK:    #FDD835 (253, 216, 53)   - Dark Yellow
```

**Color Harmony**: Purple and yellow complementary pair with variations.

#### Red-Green

```
CORE:      #E53935 (229, 57, 53)    - Red
CONTROL:   #EF5350 (239, 83, 80)    - Light Red
MOVEMENT:  #B71C1C (183, 28, 28)    - Dark Red
DEFENSE:   #43A047 (67, 160, 71)    - Green
ATTACK:    #2E7D32 (46, 125, 50)    - Dark Green
```

**Color Harmony**: Red and green complementary pair with variations.

#### Teal-Coral

```
CORE:      #00897B (0, 137, 123)    - Teal
CONTROL:   #4DB6AC (77, 182, 172)   - Light Teal
MOVEMENT:  #004D40 (0, 77, 64)      - Dark Teal
DEFENSE:   #FF7043 (255, 112, 67)   - Coral
ATTACK:    #E64A19 (230, 74, 25)    - Dark Coral
```

**Color Harmony**: Teal and coral complementary pair with variations.

#### Indigo-Amber

```
CORE:      #3F51B5 (63, 81, 181)    - Indigo
CONTROL:   #7986CB (121, 134, 203)  - Light Indigo
MOVEMENT:  #283593 (40, 53, 147)    - Dark Indigo
DEFENSE:   #FFC107 (255, 193, 7)    - Amber
ATTACK:    #FFA000 (255, 160, 0)    - Dark Amber
```

**Color Harmony**: Indigo and amber complementary pair with variations.

### Analogous

These palettes use analogous colors (adjacent on the color wheel) to create harmonious, cohesive visuals.

#### Ocean Depths

```
CORE:      #0277BD (2, 119, 189)    - Blue
CONTROL:   #00BCD4 (0, 188, 212)    - Cyan
MOVEMENT:  #26C6DA (38, 198, 218)   - Light Cyan
DEFENSE:   #006064 (0, 96, 100)     - Dark Teal
ATTACK:    #01579B (1, 87, 155)     - Dark Blue
```

**Color Harmony**: Blue-cyan-teal analogous colors.

#### Forest Canopy

```
CORE:      #388E3C (56, 142, 60)    - Green
CONTROL:   #8BC34A (139, 195, 74)   - Light Green
MOVEMENT:  #CDDC39 (205, 220, 57)   - Lime
DEFENSE:   #1B5E20 (27, 94, 32)     - Dark Green
ATTACK:    #33691E (51, 105, 30)    - Dark Olive
```

**Color Harmony**: Green-lime analogous colors.

#### Sunset Glow

```
CORE:      #E91E63 (233, 30, 99)    - Pink
CONTROL:   #F06292 (240, 98, 146)   - Light Pink
MOVEMENT:  #FF5722 (255, 87, 34)    - Deep Orange
DEFENSE:   #C2185B (194, 24, 91)    - Dark Pink
ATTACK:    #D81B60 (216, 27, 96)    - Bright Pink
```

**Color Harmony**: Pink-red-orange analogous colors.

#### Tropical Paradise

```
CORE:      #00BFA5 (0, 191, 165)    - Teal
CONTROL:   #00E676 (0, 230, 118)    - Green
MOVEMENT:  #76FF03 (118, 255, 3)    - Lime
DEFENSE:   #00796B (0, 121, 107)    - Dark Teal
ATTACK:    #00C853 (0, 200, 83)     - Bright Green
```

**Color Harmony**: Teal-green-lime analogous colors.

#### Royal Elegance

```
CORE:      #7B1FA2 (123, 31, 162)   - Purple
CONTROL:   #9C27B0 (156, 39, 176)   - Bright Purple
MOVEMENT:  #3F51B5 (63, 81, 181)    - Indigo
DEFENSE:   #4A148C (74, 20, 140)    - Dark Purple
ATTACK:    #512DA8 (81, 45, 168)    - Dark Indigo
```

**Color Harmony**: Purple-indigo analogous colors.

### Triadic

These palettes use triadic colors (three colors equally spaced on the color wheel) to create balanced, vibrant visuals.

#### Primary Triad

```
CORE:      #2196F3 (33, 150, 243)   - Blue
CONTROL:   #F44336 (244, 67, 54)    - Red
MOVEMENT:  #FFEB3B (255, 235, 59)   - Yellow
DEFENSE:   #0D47A1 (13, 71, 161)    - Dark Blue
ATTACK:    #B71C1C (183, 28, 28)    - Dark Red
```

**Color Harmony**: Classic red-yellow-blue triadic colors.

#### Secondary Triad

```
CORE:      #9C27B0 (156, 39, 176)   - Purple
CONTROL:   #FF9800 (255, 152, 0)    - Orange
MOVEMENT:  #4CAF50 (76, 175, 80)    - Green
DEFENSE:   #6A1B9A (106, 27, 154)   - Dark Purple
ATTACK:    #E65100 (230, 81, 0)     - Dark Orange
```

**Color Harmony**: Purple-orange-green triadic colors.

#### Jewel Tones

```
CORE:      #00BCD4 (0, 188, 212)    - Cyan
CONTROL:   #E91E63 (233, 30, 99)    - Pink
MOVEMENT:  #CDDC39 (205, 220, 57)   - Lime
DEFENSE:   #00838F (0, 131, 143)    - Dark Cyan
ATTACK:    #AD1457 (173, 20, 87)    - Dark Pink
```

**Color Harmony**: Cyan-pink-lime triadic colors.

#### Vibrant Triad

```
CORE:      #673AB7 (103, 58, 183)   - Deep Purple
CONTROL:   #FF5722 (255, 87, 34)    - Deep Orange
MOVEMENT:  #00BFA5 (0, 191, 165)    - Teal
DEFENSE:   #4527A0 (69, 39, 160)    - Dark Purple
ATTACK:    #BF360C (191, 54, 12)    - Burnt Orange
```

**Color Harmony**: Purple-orange-teal triadic colors.

#### Muted Triad

```
CORE:      #607D8B (96, 125, 139)   - Blue Grey
CONTROL:   #795548 (121, 85, 72)    - Brown
MOVEMENT:  #9E9D24 (158, 157, 36)   - Olive
DEFENSE:   #455A64 (69, 90, 100)    - Dark Blue Grey
ATTACK:    #4E342E (78, 52, 46)     - Dark Brown
```

**Color Harmony**: Blue grey-brown-olive triadic colors.

### Split-Complementary

These palettes use a base color and two colors adjacent to its complement, creating balanced contrast with more variety than complementary schemes.

#### Blue Base

```
CORE:      #1976D2 (25, 118, 210)   - Blue
CONTROL:   #64B5F6 (100, 181, 246)  - Light Blue
MOVEMENT:  #0D47A1 (13, 71, 161)    - Dark Blue
DEFENSE:   #FF9800 (255, 152, 0)    - Orange
ATTACK:    #FF5722 (255, 87, 34)    - Deep Orange
```

**Color Harmony**: Blue with orange and deep orange (split-complement).

#### Green Base

```
CORE:      #4CAF50 (76, 175, 80)    - Green
CONTROL:   #81C784 (129, 199, 132)  - Light Green
MOVEMENT:  #2E7D32 (46, 125, 50)    - Dark Green
DEFENSE:   #E91E63 (233, 30, 99)    - Pink
ATTACK:    #9C27B0 (156, 39, 176)   - Purple
```

**Color Harmony**: Green with pink and purple (split-complement).

#### Orange Base

```
CORE:      #FF9800 (255, 152, 0)    - Orange
CONTROL:   #FFB74D (255, 183, 77)   - Light Orange
MOVEMENT:  #EF6C00 (239, 108, 0)    - Dark Orange
DEFENSE:   #2196F3 (33, 150, 243)   - Blue
ATTACK:    #00BCD4 (0, 188, 212)    - Cyan
```

**Color Harmony**: Orange with blue and cyan (split-complement).

#### Purple Base

```
CORE:      #9C27B0 (156, 39, 176)   - Purple
CONTROL:   #BA68C8 (186, 104, 200)  - Light Purple
MOVEMENT:  #6A1B9A (106, 27, 154)   - Dark Purple
DEFENSE:   #CDDC39 (205, 220, 57)   - Lime
ATTACK:    #4CAF50 (76, 175, 80)    - Green
```

**Color Harmony**: Purple with lime and green (split-complement).

#### Red Base

```
CORE:      #F44336 (244, 67, 54)    - Red
CONTROL:   #EF9A9A (239, 154, 154)  - Light Red
MOVEMENT:  #B71C1C (183, 28, 28)    - Dark Red
DEFENSE:   #00BCD4 (0, 188, 212)    - Cyan
ATTACK:    #4CAF50 (76, 175, 80)    - Green
```

**Color Harmony**: Red with cyan and green (split-complement).

### Tetradic

These palettes use four colors arranged in two complementary pairs, creating rich, balanced color schemes.

#### Vibrant Tetrad

```
CORE:      #2196F3 (33, 150, 243)   - Blue
CONTROL:   #FF9800 (255, 152, 0)    - Orange
MOVEMENT:  #9C27B0 (156, 39, 176)   - Purple
DEFENSE:   #4CAF50 (76, 175, 80)    - Green
ATTACK:    #F44336 (244, 67, 54)    - Red
```

**Color Harmony**: Blue-orange and purple-green complementary pairs.

#### Jewel Tetrad

```
CORE:      #00BCD4 (0, 188, 212)    - Cyan
CONTROL:   #FF5722 (255, 87, 34)    - Deep Orange
MOVEMENT:  #673AB7 (103, 58, 183)   - Deep Purple
DEFENSE:   #CDDC39 (205, 220, 57)   - Lime
ATTACK:    #E91E63 (233, 30, 99)    - Pink
```

**Color Harmony**: Cyan-orange and purple-lime complementary pairs.

#### Pastel Tetrad

```
CORE:      #81D4FA (129, 212, 250)  - Light Blue
CONTROL:   #FFCC80 (255, 204, 128)  - Light Orange
MOVEMENT:  #CE93D8 (206, 147, 216)  - Light Purple
DEFENSE:   #A5D6A7 (165, 214, 167)  - Light Green
ATTACK:    #EF9A9A (239, 154, 154)  - Light Red
```

**Color Harmony**: Pastel blue-orange and purple-green complementary pairs.

#### Bold Tetrad

```
CORE:      #0D47A1 (13, 71, 161)    - Dark Blue
CONTROL:   #E65100 (230, 81, 0)     - Dark Orange
MOVEMENT:  #4A148C (74, 20, 140)    - Dark Purple
DEFENSE:   #1B5E20 (27, 94, 32)     - Dark Green
ATTACK:    #B71C1C (183, 28, 28)    - Dark Red
```

**Color Harmony**: Dark blue-orange and purple-green complementary pairs.

#### Muted Tetrad

```
CORE:      #607D8B (96, 125, 139)   - Blue Grey
CONTROL:   #8D6E63 (141, 110, 99)   - Brown
MOVEMENT:  #78909C (120, 144, 156)  - Light Blue Grey
DEFENSE:   #A1887F (161, 136, 127)  - Light Brown
ATTACK:    #455A64 (69, 90, 100)    - Dark Blue Grey
```

**Color Harmony**: Muted blue grey-brown complementary pairs.

### Monochromatic

These palettes use variations of a single color, creating cohesive, harmonious visuals with different shades, tints, and tones.

#### Blue Monochrome

```
CORE:      #2196F3 (33, 150, 243)   - Blue
CONTROL:   #64B5F6 (100, 181, 246)  - Light Blue
MOVEMENT:  #BBDEFB (187, 222, 251)  - Pale Blue
DEFENSE:   #1976D2 (25, 118, 210)   - Medium Blue
ATTACK:    #0D47A1 (13, 71, 161)    - Dark Blue
```

**Color Harmony**: Variations of blue from pale to dark.

#### Green Monochrome

```
CORE:      #4CAF50 (76, 175, 80)    - Green
CONTROL:   #81C784 (129, 199, 132)  - Light Green
MOVEMENT:  #C8E6C9 (200, 230, 201)  - Pale Green
DEFENSE:   #388E3C (56, 142, 60)    - Medium Green
ATTACK:    #1B5E20 (27, 94, 32)     - Dark Green
```

**Color Harmony**: Variations of green from pale to dark.

#### Purple Monochrome

```
CORE:      #9C27B0 (156, 39, 176)   - Purple
CONTROL:   #BA68C8 (186, 104, 200)  - Light Purple
MOVEMENT:  #E1BEE7 (225, 190, 231)  - Pale Purple
DEFENSE:   #7B1FA2 (123, 31, 162)   - Medium Purple
ATTACK:    #4A148C (74, 20, 140)    - Dark Purple
```

**Color Harmony**: Variations of purple from pale to dark.

#### Orange Monochrome

```
CORE:      #FF9800 (255, 152, 0)    - Orange
CONTROL:   #FFB74D (255, 183, 77)   - Light Orange
MOVEMENT:  #FFE0B2 (255, 224, 178)  - Pale Orange
DEFENSE:   #F57C00 (245, 124, 0)    - Medium Orange
ATTACK:    #E65100 (230, 81, 0)     - Dark Orange
```

**Color Harmony**: Variations of orange from pale to dark.

#### Red Monochrome

```
CORE:      #F44336 (244, 67, 54)    - Red
CONTROL:   #EF9A9A (239, 154, 154)  - Light Red
MOVEMENT:  #FFCDD2 (255, 205, 210)  - Pale Red
DEFENSE:   #E53935 (229, 57, 53)    - Medium Red
ATTACK:    #B71C1C (183, 28, 28)    - Dark Red
```

**Color Harmony**: Variations of red from pale to dark.

### Natural

These palettes are inspired by natural elements and environments, creating organic, harmonious visuals.

#### Ocean

```
CORE:      #0288D1 (2, 136, 209)    - Ocean Blue
CONTROL:   #26C6DA (38, 198, 218)   - Turquoise
MOVEMENT:  #80DEEA (128, 222, 234)  - Light Turquoise
DEFENSE:   #01579B (1, 87, 155)     - Deep Blue
ATTACK:    #006064 (0, 96, 100)     - Deep Teal
```

**Color Harmony**: Ocean-inspired blues and teals.

#### Forest

```
CORE:      #2E7D32 (46, 125, 50)    - Forest Green
CONTROL:   #66BB6A (102, 187, 106)  - Leaf Green
MOVEMENT:  #AED581 (174, 213, 129)  - Light Green
DEFENSE:   #1B5E20 (27, 94, 32)     - Dark Green
ATTACK:    #795548 (121, 85, 72)    - Brown
```

**Color Harmony**: Forest-inspired greens and brown.

#### Sunset

```
CORE:      #FF9800 (255, 152, 0)    - Orange
CONTROL:   #FFEB3B (255, 235, 59)   - Yellow
MOVEMENT:  #FF5722 (255, 87, 34)    - Deep Orange
DEFENSE:   #E91E63 (233, 30, 99)    - Pink
ATTACK:    #7B1FA2 (123, 31, 162)   - Purple
```

**Color Harmony**: Sunset-inspired warm colors transitioning to cool.

#### Desert

```
CORE:      #FFA000 (255, 160, 0)    - Amber
CONTROL:   #FFD54F (255, 213, 79)   - Light Amber
MOVEMENT:  #FFECB3 (255, 236, 179)  - Pale Amber
DEFENSE:   #FF6F00 (255, 111, 0)    - Dark Amber
ATTACK:    #6D4C41 (109, 76, 65)    - Brown
```

**Color Harmony**: Desert-inspired warm earth tones.

#### Aurora

```
CORE:      #00BFA5 (0, 191, 165)    - Teal
CONTROL:   #64FFDA (100, 255, 218)  - Light Teal
MOVEMENT:  #18FFFF (24, 255, 255)   - Cyan
DEFENSE:   #AA00FF (170, 0, 255)    - Violet
ATTACK:    #6200EA (98, 0, 234)     - Deep Purple
```

**Color Harmony**: Aurora-inspired blues, teals, and purples.

### Vibrant

These palettes use highly saturated, energetic colors to create bold, eye-catching visuals.

#### Neon

```
CORE:      #00E676 (0, 230, 118)    - Neon Green
CONTROL:   #00E5FF (0, 229, 255)    - Neon Blue
MOVEMENT:  #FFEA00 (255, 234, 0)    - Neon Yellow
DEFENSE:   #FF1744 (255, 23, 68)    - Neon Red
ATTACK:    #D500F9 (213, 0, 249)    - Neon Purple
```

**Color Harmony**: Vibrant neon colors across the spectrum.

#### Candy

```
CORE:      #FF4081 (255, 64, 129)   - Pink
CONTROL:   #FF80AB (255, 128, 171)  - Light Pink
MOVEMENT:  #82B1FF (130, 177, 255)  - Light Blue
DEFENSE:   #FFAB40 (255, 171, 64)   - Light Orange
ATTACK:    #7C4DFF (124, 77, 255)   - Purple
```

**Color Harmony**: Bright, candy-like colors.

#### Electric

```
CORE:      #00B0FF (0, 176, 255)    - Light Blue
CONTROL:   #18FFFF (24, 255, 255)   - Cyan
MOVEMENT:  #76FF03 (118, 255, 3)    - Lime
DEFENSE:   #FF9100 (255, 145, 0)    - Orange
ATTACK:    #FF1744 (255, 23, 68)    - Red
```

**Color Harmony**: Bright, electric colors across the spectrum.

#### Tropical

```
CORE:      #00E676 (0, 230, 118)    - Green
CONTROL:   #1DE9B6 (29, 233, 182)   - Teal
MOVEMENT:  #FFFF00 (255, 255, 0)    - Yellow
DEFENSE:   #FF3D00 (255, 61, 0)     - Orange
ATTACK:    #FF4081 (255, 64, 129)   - Pink
```

**Color Harmony**: Bright, tropical colors.

#### Vibrant Rainbow

```
CORE:      #2979FF (41, 121, 255)   - Blue
CONTROL:   #00E676 (0, 230, 118)    - Green
MOVEMENT:  #FFEA00 (255, 234, 0)    - Yellow
DEFENSE:   #FF3D00 (255, 61, 0)     - Orange
ATTACK:    #D500F9 (213, 0, 249)    - Purple
```

**Color Harmony**: Vibrant rainbow spectrum.

### Pastel

These palettes use soft, desaturated colors to create gentle, soothing visuals.

#### Soft Pastels

```
CORE:      #BBDEFB (187, 222, 251)  - Pastel Blue
CONTROL:   #C8E6C9 (200, 230, 201)  - Pastel Green
MOVEMENT:  #FFF9C4 (255, 249, 196)  - Pastel Yellow
DEFENSE:   #FFCCBC (255, 204, 188)  - Pastel Orange
ATTACK:    #F8BBD0 (248, 187, 208)  - Pastel Pink
```

**Color Harmony**: Soft pastel rainbow.

#### Muted Pastels

```
CORE:      #90CAF9 (144, 202, 249)  - Muted Blue
CONTROL:   #A5D6A7 (165, 214, 167)  - Muted Green
MOVEMENT:  #FFF59D (255, 245, 157)  - Muted Yellow
DEFENSE:   #FFAB91 (255, 171, 145)  - Muted Orange
ATTACK:    #F48FB1 (244, 143, 177)  - Muted Pink
```

**Color Harmony**: Muted pastel rainbow.

#### Dreamy

```
CORE:      #B39DDB (179, 157, 219)  - Lavender
CONTROL:   #81D4FA (129, 212, 250)  - Sky Blue
MOVEMENT:  #C5E1A5 (197, 225, 165)  - Mint Green
DEFENSE:   #FFF176 (255, 241, 118)  - Pale Yellow
ATTACK:    #FFAB91 (255, 171, 145)  - Peach
```

**Color Harmony**: Dreamy, soft colors.

#### Vintage Pastels

```
CORE:      #BCAAA4 (188, 170, 164)  - Taupe
CONTROL:   #D7CCC8 (215, 204, 200)  - Light Taupe
MOVEMENT:  #FFE0B2 (255, 224, 178)  - Pale Orange
DEFENSE:   #E1BEE7 (225, 190, 231)  - Pale Purple
ATTACK:    #B0BEC5 (176, 190, 197)  - Pale Blue Grey
```

**Color Harmony**: Vintage-inspired soft colors.

#### Watercolor

```
CORE:      #80CBC4 (128, 203, 196)  - Soft Teal
CONTROL:   #A5D6A7 (165, 214, 167)  - Soft Green
MOVEMENT:  #FFF59D (255, 245, 157)  - Soft Yellow
DEFENSE:   #EF9A9A (239, 154, 154)  - Soft Red
ATTACK:    #CE93D8 (206, 147, 216)  - Soft Purple
```

**Color Harmony**: Watercolor-inspired soft colors.

## Implementation

These color palettes can be implemented in the trait system as follows:

```typescript
// Define color palettes for particle groups
const COLOR_PALETTES = {
  // Bitcoin-Inspired
  bitcoinClassic: {
    CORE: { r: 247/255, g: 147/255, b: 26/255 },      // #F7931A - Bitcoin Orange
    CONTROL: { r: 0/255, g: 163/255, b: 255/255 },      // #00A3FF - Electric Blue
    MOVEMENT: { r: 0/255, g: 230/255, b: 118/255 },     // #00E676 - Vibrant Green
    DEFENSE: { r: 123/255, g: 31/255, b: 162/255 },     // #7B1FA2 - Royal Purple
    ATTACK: { r: 255/255, g: 23/255, b: 68/255 }        // #FF1744 - Energetic Red
  },

  // Complementary
  blueOrange: {
    CORE: { r: 30/255, g: 136/255, b: 229/255 },       // #1E88E5 - Bright Blue
    CONTROL: { r: 100/255, g: 181/255, b: 246/255 },    // #64B5F6 - Light Blue
    MOVEMENT: { r: 13/255, g: 71/255, b: 161/255 },     // #0D47A1 - Dark Blue
    DEFENSE: { r: 255/255, g: 152/255, b: 0/255 },      // #FF9800 - Orange
    ATTACK: { r: 245/255, g: 124/255, b: 0/255 }        // #F57C00 - Dark Orange
  },

  // Add more palettes as needed...
};

// Select a color palette based on the block nonce
function selectColorPalette(blockNonce: number): any {
  // Use the nonce to seed the RNG
  const rng = mulberry32(blockNonce);

  // Get all palette keys
  const paletteKeys = Object.keys(COLOR_PALETTES);

  // Select a random palette
  const paletteIndex = Math.floor(rng() * paletteKeys.length);
  const selectedPalette = paletteKeys[paletteIndex];

  return COLOR_PALETTES[selectedPalette];
}

// Apply colors to particle groups
function applyColorPalette(palette: any, particleGroups: ParticleGroup[]): void {
  particleGroups.forEach(group => {
    const roleColor = palette[group.role];
    if (roleColor) {
      group.color = roleColor;
    }
  });
}
```

## Related Documents

- [Trait System](../bitcoin/07_trait_system.md) - For details on the trait system
- [Particle Types](../particles/02_particle_types.md) - For details on particle roles
- [Visual Design](../ui/02_visual_design.md) - For details on visual design principles
- [Color Theory](../ui/03_color_themes.md) - For details on color theory principles
 
``` 
 
--- 
 
### 02_particle_shapes.md 
 
```.md 
# Particle Shapes

This document outlines the various particle shapes used in the Bitcoin Protozoa project, detailing their visual characteristics, implementation, and rarity tiers.

## Table of Contents

1. [Shape Philosophy](#shape-philosophy) [Line 20]
2. [Shape Categories](#shape-categories) [Line 40]
   - [Basic Shapes](#basic-shapes) [Line 45]
   - [Complex Shapes](#complex-shapes) [Line 100]
   - [Composite Shapes](#composite-shapes) [Line 150]
   - [Animated Shapes](#animated-shapes) [Line 200]
3. [Shape Properties](#shape-properties) [Line 250]
   - [Size](#size) [Line 255]
   - [Geometry](#geometry) [Line 280]
   - [Material](#material) [Line 310]
   - [Texture](#texture) [Line 340]
4. [Shape Variations](#shape-variations) [Line 370]
   - [Role-Based Variations](#role-based-variations) [Line 375]
   - [Group-Based Variations](#group-based-variations) [Line 410]
   - [Mutation-Based Variations](#mutation-based-variations) [Line 440]
5. [Shape Implementation](#shape-implementation) [Line 470]
   - [Three.js Implementation](#threejs-implementation) [Line 475]
   - [Instanced Meshes](#instanced-meshes) [Line 510]
   - [Performance Considerations](#performance-considerations) [Line 540]
6. [Shape Rarity Tiers](#shape-rarity-tiers) [Line 570]
   - [Common Shapes](#common-shapes) [Line 575]
   - [Uncommon Shapes](#uncommon-shapes) [Line 600]
   - [Rare Shapes](#rare-shapes) [Line 625]
   - [Epic Shapes](#epic-shapes) [Line 650]
   - [Legendary Shapes](#legendary-shapes) [Line 675]
   - [Mythic Shapes](#mythic-shapes) [Line 700]
7. [Related Documents](#related-documents) [Line 730]

## Shape Philosophy

The particle shapes in Bitcoin Protozoa are designed to create visually distinctive and engaging creatures while maintaining optimal performance. The shape system follows these core principles:

1. **Visual Distinction**: Each shape category provides a unique visual identity
2. **Role Appropriateness**: Shapes are designed to visually represent their functional role
3. **Performance Efficiency**: Shapes are optimized for rendering performance
4. **Deterministic Generation**: Shapes are assigned deterministically based on the Bitcoin block nonce
5. **Rarity Hierarchy**: Shapes are organized into rarity tiers for visual variety

The shape of a particle influences not only its visual appearance but also how it interacts with other particles and the environment. More complex shapes may have different collision behaviors, visual effects, and movement patterns.

## Shape Categories

Particle shapes are organized into four main categories, each with distinct visual characteristics and implementation approaches.

### Basic Shapes

Basic shapes are the fundamental building blocks of the particle system, offering excellent performance and clear visual identity.

#### Sphere

```typescript
// Standard sphere shape
const geometry = new THREE.SphereGeometry(radius, 16, 12);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Smooth, rounded appearance
- Uniform from all angles
- Simple light interaction
- Clear silhouette

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Common

#### Cube

```typescript
// Standard cube shape
const geometry = new THREE.BoxGeometry(size, size, size);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Sharp, angular appearance
- Distinct faces and edges
- Interesting light interaction with flat surfaces
- Strong, structured silhouette

**Role Affinity**: DEFENSE, ATTACK

**Rarity Tier**: Common

#### Tetrahedron

```typescript
// Standard tetrahedron shape
const geometry = new THREE.TetrahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pyramid-like shape with triangular faces
- Sharp points and edges
- Dynamic appearance that changes significantly with rotation
- Distinctive triangular silhouette

**Role Affinity**: ATTACK, MOVEMENT

**Rarity Tier**: Common

#### Octahedron

```typescript
// Standard octahedron shape
const geometry = new THREE.OctahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Diamond-like shape with triangular faces
- Multiple points and edges
- Balanced between angular and rounded appearance
- Symmetrical from multiple angles

**Role Affinity**: CONTROL, MOVEMENT

**Rarity Tier**: Common

#### Cylinder

```typescript
// Standard cylinder shape
const geometry = new THREE.CylinderGeometry(radius, radius, height, 16);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pill-like shape with circular ends
- Directional appearance with clear orientation
- Smooth curved surface with flat ends
- Distinctive when viewed from different angles

**Role Affinity**: MOVEMENT, DEFENSE

**Rarity Tier**: Common

### Complex Shapes

Complex shapes offer more visual interest and uniqueness, with slightly higher performance cost but greater visual distinction.

#### Torus

```typescript
// Torus (donut) shape
const geometry = new THREE.TorusGeometry(radius, tubeRadius, 16, 24);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Ring or donut-like shape with a hole in the center
- Smooth curved surface
- Interesting silhouette that changes dramatically with viewing angle
- Distinctive negative space

**Role Affinity**: CONTROL, CORE

**Rarity Tier**: Uncommon

#### Icosahedron

```typescript
// Icosahedron shape (20-sided polyhedron)
const geometry = new THREE.IcosahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Many triangular faces (20)
- Nearly spherical appearance with faceted surface
- Complex light interaction with multiple faces
- Detailed silhouette with many edges

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Uncommon

#### Dodecahedron

```typescript
// Dodecahedron shape (12-sided polyhedron)
const geometry = new THREE.DodecahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pentagonal faces (12)
- Rounded but still faceted appearance
- Distinctive pentagon patterns visible when rotating
- Balanced between angular and spherical

**Role Affinity**: DEFENSE, CORE

**Rarity Tier**: Uncommon

#### Cone

```typescript
// Cone shape
const geometry = new THREE.ConeGeometry(radius, height, 16);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pointed top with circular base
- Highly directional appearance
- Distinctive silhouette from all angles
- Clear orientation in space

**Role Affinity**: ATTACK, MOVEMENT

**Rarity Tier**: Uncommon

#### Torusknot

```typescript
// Torusknot shape (pretzel-like)
const geometry = new THREE.TorusKnotGeometry(radius, tubeRadius, 64, 8, 2, 3);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Twisted, knotted appearance
- Complex, intertwined structure
- Dramatic changes in appearance when rotating
- Unique, eye-catching form

**Role Affinity**: CORE, MOVEMENT

**Rarity Tier**: Rare

### Composite Shapes

Composite shapes combine multiple geometries to create more complex and unique forms, offering high visual distinction at a moderate performance cost.

#### Gyroscope

```typescript
// Gyroscope-like composite shape
const group = new THREE.Group();

// Inner ring
const innerRing = new THREE.Mesh(
  new THREE.TorusGeometry(radius * 0.8, radius * 0.1, 8, 24),
  new THREE.MeshStandardMaterial({ color })
);
group.add(innerRing);

// Outer ring
const outerRing = new THREE.Mesh(
  new THREE.TorusGeometry(radius, radius * 0.1, 8, 24),
  new THREE.MeshStandardMaterial({ color })
);
outerRing.rotation.x = Math.PI / 2;
group.add(outerRing);

// Core sphere
const core = new THREE.Mesh(
  new THREE.SphereGeometry(radius * 0.3, 8, 6),
  new THREE.MeshStandardMaterial({ color })
);
group.add(core);
```

**Visual Characteristics**:
- Multiple intersecting rings with central sphere
- Complex, mechanical appearance
- Interesting negative space
- Distinctive from all viewing angles

**Role Affinity**: CONTROL, CORE

**Rarity Tier**: Rare

#### Satellite

```typescript
// Satellite-like composite shape
const group = new THREE.Group();

// Main body
const body = new THREE.Mesh(
  new THREE.CylinderGeometry(radius * 0.5, radius * 0.5, radius * 1.5, 8),
  new THREE.MeshStandardMaterial({ color })
);
group.add(body);

// Solar panels
const panel1 = new THREE.Mesh(
  new THREE.BoxGeometry(radius * 2, radius * 0.1, radius * 0.8),
  new THREE.MeshStandardMaterial({ color })
);
panel1.position.x = radius * 1.2;
group.add(panel1);

const panel2 = new THREE.Mesh(
  new THREE.BoxGeometry(radius * 2, radius * 0.1, radius * 0.8),
  new THREE.MeshStandardMaterial({ color })
);
panel2.position.x = -radius * 1.2;
group.add(panel2);

// Antenna
const antenna = new THREE.Mesh(
  new THREE.ConeGeometry(radius * 0.2, radius * 0.8, 8),
  new THREE.MeshStandardMaterial({ color })
);
antenna.position.y = radius * 1.1;
group.add(antenna);
```

**Visual Characteristics**:
- Central body with extending panels
- Asymmetrical, technological appearance
- Multiple distinct components
- Clear directional orientation

**Role Affinity**: DEFENSE, ATTACK

**Rarity Tier**: Rare

#### Molecular

```typescript
// Molecular structure composite shape
const group = new THREE.Group();

// Central atom
const center = new THREE.Mesh(
  new THREE.SphereGeometry(radius * 0.5, 12, 8),
  new THREE.MeshStandardMaterial({ color })
);
group.add(center);

// Orbital atoms
const positions = [
  new THREE.Vector3(radius, 0, 0),
  new THREE.Vector3(-radius, 0, 0),
  new THREE.Vector3(0, radius, 0),
  new THREE.Vector3(0, -radius, 0),
  new THREE.Vector3(0, 0, radius),
  new THREE.Vector3(0, 0, -radius)
];

positions.forEach(position => {
  // Atom
  const atom = new THREE.Mesh(
    new THREE.SphereGeometry(radius * 0.3, 8, 6),
    new THREE.MeshStandardMaterial({ color })
  );
  atom.position.copy(position);
  group.add(atom);

  // Connection rod
  const direction = position.clone().normalize();
  const rod = new THREE.Mesh(
    new THREE.CylinderGeometry(radius * 0.1, radius * 0.1, position.length(), 6),
    new THREE.MeshStandardMaterial({ color })
  );

  // Position and orient the rod
  rod.position.copy(position.clone().multiplyScalar(0.5));
  rod.lookAt(position);
  rod.rotateX(Math.PI / 2);

  group.add(rod);
});
```

**Visual Characteristics**:
- Central sphere with connected smaller spheres
- Atom-like or molecular structure
- Symmetrical arrangement
- Complex but organized appearance

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Epic

### Animated Shapes

Animated shapes incorporate movement and transformation into their geometry, creating dynamic and eye-catching visuals at a higher performance cost.

#### Pulsating Sphere

```typescript
// Pulsating sphere with animation
const geometry = new THREE.SphereGeometry(radius, 16, 12);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);

// Animation function
function animate(time) {
  const scale = 1 + Math.sin(time * 2) * 0.2; // Pulsate between 0.8 and 1.2 scale
  mesh.scale.set(scale, scale, scale);
}
```

**Visual Characteristics**:
- Sphere that grows and shrinks rhythmically
- Breathing-like animation
- Draws attention through movement
- Maintains basic sphere shape

**Role Affinity**: CORE

**Rarity Tier**: Rare

#### Rotating Crystal

```typescript
// Rotating crystal with animation
const geometry = new THREE.OctahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({
  color,
  flatShading: true
});
const mesh = new THREE.Mesh(geometry, material);

// Animation function
function animate(time) {
  mesh.rotation.x = time * 0.5;
  mesh.rotation.y = time * 0.3;
}
```

**Visual Characteristics**:
- Crystal-like shape that rotates continuously
- Changing silhouette as it rotates
- Catches light differently throughout rotation
- Dynamic appearance with constant motion

**Role Affinity**: MOVEMENT, ATTACK

**Rarity Tier**: Rare

#### Morphing Cube

```typescript
// Morphing cube with animation
const geometry = new THREE.BoxGeometry(size, size, size);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);

// Animation function
function animate(time) {
  // Morph between cube and sphere by adjusting vertex positions
  const vertices = geometry.attributes.position.array;

  for (let i = 0; i < vertices.length; i += 3) {
    const x = vertices[i];
    const y = vertices[i + 1];
    const z = vertices[i + 2];

    // Calculate original distance from center
    const length = Math.sqrt(x * x + y * y + z * z);

    // Normalize to get direction
    const nx = x / length;
    const ny = y / length;
    const nz = z / length;

    // Mix between cube and sphere based on time
    const morphFactor = (Math.sin(time) + 1) / 2; // 0 to 1

    // Update vertex position
    vertices[i] = x * (1 - morphFactor) + nx * size * 0.5 * morphFactor;
    vertices[i + 1] = y * (1 - morphFactor) + ny * size * 0.5 * morphFactor;
    vertices[i + 2] = z * (1 - morphFactor) + nz * size * 0.5 * morphFactor;
  }

  geometry.attributes.position.needsUpdate = true;
}
```

**Visual Characteristics**:
- Shape that transitions between cube and sphere
- Continuous transformation
- Fluid, organic movement
- Visually captivating metamorphosis

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Epic

#### Orbiting Satellites

```typescript
// Main body with orbiting satellites
const group = new THREE.Group();

// Core
const core = new THREE.Mesh(
  new THREE.SphereGeometry(radius * 0.5, 12, 8),
  new THREE.MeshStandardMaterial({ color })
);
group.add(core);

// Orbiting satellites
const satellites = [];
for (let i = 0; i < 3; i++) {
  const satellite = new THREE.Mesh(
    new THREE.SphereGeometry(radius * 0.2, 8, 6),
    new THREE.MeshStandardMaterial({ color })
  );

  // Create orbit ring (invisible)
  const orbitRing = new THREE.Object3D();
  orbitRing.rotation.x = Math.PI * Math.random();
  orbitRing.rotation.y = Math.PI * Math.random();

  // Position satellite on ring
  satellite.position.set(radius * 1.2, 0, 0);

  // Add to hierarchy
  orbitRing.add(satellite);
  group.add(orbitRing);
  satellites.push({ satellite, orbitRing });
}

// Animation function
function animate(time) {
  satellites.forEach((obj, i) => {
    obj.orbitRing.rotation.y += 0.01 * (i + 1); // Different speeds
  });
}
```

**Visual Characteristics**:
- Central body with smaller objects orbiting around it
- Planetary or atomic appearance
- Dynamic movement with multiple elements
- Complex, system-like visual

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Legendary

## Shape Properties

Shape properties define the specific visual characteristics of each particle shape, affecting their appearance and behavior.

### Size

Particle size influences visual impact, collision behavior, and performance. Size is typically determined by the particle's role and rarity.

#### Size Ranges

```typescript
// Size ranges by role
const sizeRanges = {
  CORE: { min: 0.8, max: 1.2 },      // Larger, central particles
  CONTROL: { min: 0.6, max: 0.9 },    // Medium-sized particles
  MOVEMENT: { min: 0.4, max: 0.7 },   // Smaller, faster particles
  DEFENSE: { min: 0.7, max: 1.0 },    // Medium-large particles
  ATTACK: { min: 0.5, max: 0.8 }      // Medium-small particles
};

// Size calculation based on role and random factor
function calculateSize(role, randomFactor) {
  const range = sizeRanges[role];
  return range.min + (range.max - range.min) * randomFactor;
}
```

#### Size Variation

Size variation within particle groups creates visual interest and hierarchy:

```typescript
// Size variation within a group
function createParticlesWithSizeVariation(group, count, baseSize) {
  const particles = [];

  for (let i = 0; i < count; i++) {
    // Calculate variation factor
    // Core particles have less variation, movement particles have more
    const variationRange = group.role === ParticleRole.CORE ? 0.2 : 0.4;
    const variation = 1 - variationRange/2 + Math.random() * variationRange;

    // Apply variation to base size
    const size = baseSize * variation;

    // Create particle with calculated size
    const particle = createParticle(group.role, size);
    particles.push(particle);
  }

  return particles;
}
```

#### Size Impact on Physics

Particle size affects physical interactions:

```typescript
// Physics calculations based on size
function calculatePhysicsProperties(particle) {
  // Mass increases with the cube of the radius (volume)
  particle.mass = particle.radius ** 3 * DENSITY_FACTOR;

  // Larger particles experience more drag
  particle.dragCoefficient = BASE_DRAG * particle.radius;

  // Collision radius is slightly larger than visual radius
  particle.collisionRadius = particle.radius * 1.1;

  return particle;
}
```

### Geometry

Geometry defines the structure and complexity of particle shapes, affecting both visual appearance and performance.

#### Geometry Detail Levels

Geometry detail is adjusted based on performance requirements:

```typescript
// Detail levels for different shapes
const geometryDetailLevels = {
  LOW: {
    sphere: { widthSegments: 8, heightSegments: 6 },
    box: { widthSegments: 1, heightSegments: 1, depthSegments: 1 },
    cylinder: { radialSegments: 8, heightSegments: 1 },
    cone: { radialSegments: 8, heightSegments: 1 },
    torus: { tubularSegments: 16, radialSegments: 8 }
  },
  MEDIUM: {
    sphere: { widthSegments: 16, heightSegments: 12 },
    box: { widthSegments: 2, heightSegments: 2, depthSegments: 2 },
    cylinder: { radialSegments: 16, heightSegments: 2 },
    cone: { radialSegments: 16, heightSegments: 2 },
    torus: { tubularSegments: 24, radialSegments: 12 }
  },
  HIGH: {
    sphere: { widthSegments: 32, heightSegments: 24 },
    box: { widthSegments: 3, heightSegments: 3, depthSegments: 3 },
    cylinder: { radialSegments: 32, heightSegments: 4 },
    cone: { radialSegments: 32, heightSegments: 4 },
    torus: { tubularSegments: 48, radialSegments: 24 }
  }
};

// Function to create geometry with appropriate detail level
function createGeometry(shape, size, detailLevel = 'MEDIUM') {
  const details = geometryDetailLevels[detailLevel][shape];

  switch (shape) {
    case 'sphere':
      return new THREE.SphereGeometry(
        size,
        details.widthSegments,
        details.heightSegments
      );
    case 'box':
      return new THREE.BoxGeometry(
        size, size, size,
        details.widthSegments,
        details.heightSegments,
        details.depthSegments
      );
    case 'cylinder':
      return new THREE.CylinderGeometry(
        size, size, size * 2,
        details.radialSegments,
        details.heightSegments
      );
    case 'cone':
      return new THREE.ConeGeometry(
        size, size * 2,
        details.radialSegments,
        details.heightSegments
      );
    case 'torus':
      return new THREE.TorusGeometry(
        size, size * 0.3,
        details.radialSegments,
        details.tubularSegments
      );
    default:
      return new THREE.SphereGeometry(size, 16, 12);
  }
}
```

#### Geometry Modifiers

Geometry modifiers alter the base shapes to create more variety:

```typescript
// Apply modifiers to geometry
function applyGeometryModifiers(geometry, modifiers) {
  const position = geometry.attributes.position;
  const normal = geometry.attributes.normal;

  for (let i = 0; i < position.count; i++) {
    const x = position.getX(i);
    const y = position.getY(i);
    const z = position.getZ(i);

    // Apply noise modifier
    if (modifiers.noise) {
      const noiseScale = modifiers.noise.scale || 0.1;
      const noise = (Math.random() - 0.5) * noiseScale;

      position.setX(i, x + noise);
      position.setY(i, y + noise);
      position.setZ(i, z + noise);
    }

    // Apply twist modifier
    if (modifiers.twist) {
      const twistAmount = modifiers.twist.amount || 0.2;
      const angle = y * twistAmount;

      const cosAngle = Math.cos(angle);
      const sinAngle = Math.sin(angle);

      const newX = x * cosAngle - z * sinAngle;
      const newZ = x * sinAngle + z * cosAngle;

      position.setX(i, newX);
      position.setZ(i, newZ);
    }

    // Apply bulge modifier
    if (modifiers.bulge) {
      const bulgeAmount = modifiers.bulge.amount || 0.3;
      const bulgeCenter = modifiers.bulge.center || new THREE.Vector3(0, 0, 0);

      const dx = x - bulgeCenter.x;
      const dy = y - bulgeCenter.y;
      const dz = z - bulgeCenter.z;

      const distance = Math.sqrt(dx * dx + dy * dy + dz * dz);
      const normalizedDistance = distance / geometry.boundingSphere.radius;

      const bulgeFactor = 1 + bulgeAmount * (1 - normalizedDistance);

      position.setX(i, bulgeCenter.x + dx * bulgeFactor);
      position.setY(i, bulgeCenter.y + dy * bulgeFactor);
      position.setZ(i, bulgeCenter.z + dz * bulgeFactor);
    }
  }

  // Update geometry
  position.needsUpdate = true;
  geometry.computeVertexNormals();

  return geometry;
}
```

### Material

Material properties define the surface appearance of particles, affecting how they interact with light and appear visually.

#### Material Types

Different material types create distinct visual styles:

```typescript
// Material types for particles
const materialTypes = {
  STANDARD: 'standard',   // Default physically-based material
  BASIC: 'basic',         // Simple, unlit material
  PHONG: 'phong',         // Classic shiny material
  TOON: 'toon',           // Cartoon-style material
  GLASS: 'glass'          // Transparent, refractive material
};

// Function to create material based on type
function createMaterial(type, color, options = {}) {
  switch (type) {
    case materialTypes.STANDARD:
      return new THREE.MeshStandardMaterial({
        color,
        roughness: options.roughness || 0.7,
        metalness: options.metalness || 0.3,
        flatShading: options.flatShading || false
      });

    case materialTypes.BASIC:
      return new THREE.MeshBasicMaterial({
        color,
        wireframe: options.wireframe || false
      });

    case materialTypes.PHONG:
      return new THREE.MeshPhongMaterial({
        color,
        shininess: options.shininess || 30,
        specular: options.specular || 0x111111
      });

    case materialTypes.TOON:
      return new THREE.MeshToonMaterial({
        color,
        gradientMap: options.gradientMap || null
      });

    case materialTypes.GLASS:
      return new THREE.MeshPhysicalMaterial({
        color,
        transmission: 0.9,
        transparent: true,
        roughness: 0.1,
        thickness: 0.5,
        clearcoat: 1.0,
        clearcoatRoughness: 0.1
      });

    default:
      return new THREE.MeshStandardMaterial({ color });
  }
}
```

#### Material Properties

Material properties are adjusted based on particle role and rarity:

```typescript
// Material properties by role
const materialProperties = {
  CORE: {
    roughness: 0.3,
    metalness: 0.7,
    flatShading: false
  },
  CONTROL: {
    roughness: 0.5,
    metalness: 0.5,
    flatShading: false
  },
  MOVEMENT: {
    roughness: 0.2,
    metalness: 0.3,
    flatShading: false
  },
  DEFENSE: {
    roughness: 0.8,
    metalness: 0.4,
    flatShading: true
  },
  ATTACK: {
    roughness: 0.4,
    metalness: 0.6,
    flatShading: true
  }
};

// Material property adjustments based on rarity
function adjustMaterialForRarity(material, rarity) {
  switch (rarity) {
    case 'COMMON':
      // No adjustments for common
      break;

    case 'UNCOMMON':
      material.roughness = Math.max(0.1, material.roughness - 0.1);
      material.metalness = Math.min(0.9, material.metalness + 0.1);
      break;

    case 'RARE':
      material.roughness = Math.max(0.1, material.roughness - 0.2);
      material.metalness = Math.min(0.9, material.metalness + 0.2);
      break;

    case 'EPIC':
      material.roughness = 0.1;
      material.metalness = 0.9;
      material.clearcoat = 1.0;
      break;

    case 'LEGENDARY':
      material.roughness = 0.05;
      material.metalness = 1.0;
      material.clearcoat = 1.0;
      material.clearcoatRoughness = 0.1;
      break;

    case 'MYTHIC':
      material.roughness = 0.0;
      material.metalness = 1.0;
      material.clearcoat = 1.0;
      material.clearcoatRoughness = 0.0;
      material.emissive = material.color.clone();
      material.emissiveIntensity = 0.2;
      break;
  }

  return material;
}
```

### Texture

Textures add detail and visual interest to particle surfaces without increasing geometry complexity.

#### Procedural Textures

Procedurally generated textures provide unique visual details:

```typescript
// Create procedural texture
function createProceduralTexture(type, resolution = 256, options = {}) {
  // Create canvas for texture generation
  const canvas = document.createElement('canvas');
  canvas.width = resolution;
  canvas.height = resolution;
  const ctx = canvas.getContext('2d');

  switch (type) {
    case 'noise':
      // Create noise texture
      const scale = options.scale || 20;
      const color1 = options.color1 || '#ffffff';
      const color2 = options.color2 || '#000000';

      for (let x = 0; x < resolution; x++) {
        for (let y = 0; y < resolution; y++) {
          const value = Math.random();
          ctx.fillStyle = value > 0.5 ? color1 : color2;
          ctx.fillRect(x, y, 1, 1);
        }
      }
      break;

    case 'gradient':
      // Create gradient texture
      const gradient = ctx.createLinearGradient(0, 0, resolution, resolution);
      gradient.addColorStop(0, options.color1 || '#ffffff');
      gradient.addColorStop(1, options.color2 || '#000000');

      ctx.fillStyle = gradient;
      ctx.fillRect(0, 0, resolution, resolution);
      break;

    case 'cells':
      // Create cellular pattern
      const cellSize = options.cellSize || 32;
      const cellColor = options.cellColor || '#ffffff';
      const backgroundColor = options.backgroundColor || '#000000';

      ctx.fillStyle = backgroundColor;
      ctx.fillRect(0, 0, resolution, resolution);

      ctx.fillStyle = cellColor;
      for (let x = 0; x < resolution; x += cellSize) {
        for (let y = 0; y < resolution; y += cellSize) {
          const size = cellSize * 0.8;
          const offsetX = (cellSize - size) / 2;
          const offsetY = (cellSize - size) / 2;

          ctx.fillRect(x + offsetX, y + offsetY, size, size);
        }
      }
      break;
  }

  // Create texture from canvas
  const texture = new THREE.CanvasTexture(canvas);
  texture.wrapS = THREE.RepeatWrapping;
  texture.wrapT = THREE.RepeatWrapping;

  return texture;
}
```

#### Texture Mapping

Texture mapping applies textures to particle materials:

```typescript
// Apply texture to material
function applyTexture(material, textureType, options = {}) {
  // Create texture
  const texture = createProceduralTexture(textureType, options.resolution, options);

  // Apply texture based on mapping type
  switch (options.mapping || 'color') {
    case 'color':
      material.map = texture;
      break;

    case 'normal':
      material.normalMap = texture;
      material.normalScale = new THREE.Vector2(options.normalScale || 1, options.normalScale || 1);
      break;

    case 'roughness':
      material.roughnessMap = texture;
      break;

    case 'metalness':
      material.metalnessMap = texture;
      break;

    case 'emissive':
      material.emissiveMap = texture;
      material.emissive = new THREE.Color(options.emissiveColor || 0xffffff);
      material.emissiveIntensity = options.emissiveIntensity || 1.0;
      break;
  }

  // Update material
  material.needsUpdate = true;

  return material;
}
```

## Shape Variations

Shape variations create visual diversity within the particle system, with different variations based on role, group, and mutations.

### Role-Based Variations

Different particle roles have different shape tendencies:

```typescript
// Shape probabilities by role
const shapesByRole = {
  CORE: {
    sphere: 0.3,
    icosahedron: 0.2,
    torus: 0.2,
    dodecahedron: 0.15,
    molecular: 0.1,
    pulsatingSphere: 0.05
  },
  CONTROL: {
    torus: 0.25,
    octahedron: 0.2,
    gyroscope: 0.2,
    sphere: 0.15,
    cube: 0.1,
    morphingCube: 0.1
  },
  MOVEMENT: {
    tetrahedron: 0.25,
    cylinder: 0.2,
    cone: 0.2,
    octahedron: 0.15,
    rotatingCrystal: 0.1,
    torusknot: 0.1
  },
  DEFENSE: {
    cube: 0.3,
    dodecahedron: 0.2,
    cylinder: 0.2,
    satellite: 0.15,
    sphere: 0.1,
    icosahedron: 0.05
  },
  ATTACK: {
    tetrahedron: 0.3,
    cone: 0.25,
    cube: 0.15,
    rotatingCrystal: 0.15,
    satellite: 0.1,
    torusknot: 0.05
  }
};

// Select shape based on role and random factor
function selectShapeForRole(role, randomFactor) {
  const shapes = shapesByRole[role];
  let cumulativeProbability = 0;

  for (const [shape, probability] of Object.entries(shapes)) {
    cumulativeProbability += probability;

    if (randomFactor <= cumulativeProbability) {
      return shape;
    }
  }

  // Default fallback
  return 'sphere';
}
```

### Group-Based Variations

Particles within the same group share shape characteristics for visual cohesion:

```typescript
// Apply group-based shape variations
function applyGroupShapeVariations(group, particles) {
  // Determine base shape for the group
  const baseShape = group.shapeType || 'sphere';

  // Determine material type for the group
  const materialType = group.materialType || materialTypes.STANDARD;

  // Determine if the group has special modifiers
  const hasModifiers = group.hasModifiers || false;

  // Apply consistent shapes to all particles in the group
  particles.forEach(particle => {
    // Use the same base shape for all particles in the group
    particle.shapeType = baseShape;

    // Use the same material type for all particles in the group
    particle.materialType = materialType;

    // Apply role-specific variations within the group
    if (particle.role === ParticleRole.CORE) {
      // Core particles might be slightly larger
      particle.scale = 1.2;
    } else if (particle.role === ParticleRole.MOVEMENT) {
      // Movement particles might have more dynamic shapes
      if (baseShape === 'sphere') {
        particle.shapeType = 'tetrahedron';
      }
    } else if (particle.role === ParticleRole.DEFENSE) {
      // Defense particles might have more angular shapes
      if (baseShape === 'sphere') {
        particle.shapeType = 'cube';
      }
    }

    // Apply modifiers if the group has them
    if (hasModifiers) {
      particle.modifiers = group.modifiers;
    }
  });

  return particles;
}
```

### Mutation-Based Variations

Mutations introduce new shape variations as creatures evolve with Bitcoin confirmations:

```typescript
// Apply mutation-based shape variations
function applyShapeMutation(particle, confirmations) {
  // Determine mutation tier based on confirmations
  let mutationTier = 0;

  if (confirmations >= 100000) {
    mutationTier = 5; // Mythic
  } else if (confirmations >= 50000) {
    mutationTier = 4; // Legendary
  } else if (confirmations >= 10000) {
    mutationTier = 3; // Epic
  } else if (confirmations >= 5000) {
    mutationTier = 2; // Rare
  } else if (confirmations >= 1000) {
    mutationTier = 1; // Uncommon
  }

  // No mutations for tier 0
  if (mutationTier === 0) {
    return particle;
  }

  // Apply mutations based on tier
  switch (mutationTier) {
    case 1: // Uncommon
      // Slight material enhancement
      particle.material.roughness = Math.max(0.1, particle.material.roughness - 0.1);
      particle.material.metalness = Math.min(0.9, particle.material.metalness + 0.1);
      break;

    case 2: // Rare
      // Add texture or slight shape modification
      if (Math.random() < 0.5) {
        // Add texture
        applyTexture(particle.material, 'noise', {
          mapping: 'normal',
          normalScale: 0.5
        });
      } else {
        // Add shape modifier
        particle.modifiers = particle.modifiers || {};
        particle.modifiers.noise = { scale: 0.1 };
      }
      break;

    case 3: // Epic
      // More significant shape or material change
      if (Math.random() < 0.3) {
        // Change to more complex shape in same category
        if (particle.shapeType === 'sphere') {
          particle.shapeType = 'icosahedron';
        } else if (particle.shapeType === 'cube') {
          particle.shapeType = 'dodecahedron';
        }
      } else {
        // Add emissive effect
        applyTexture(particle.material, 'gradient', {
          mapping: 'emissive',
          emissiveColor: particle.material.color.clone(),
          emissiveIntensity: 0.3
        });
      }
      break;

    case 4: // Legendary
      // Animated shape or special effect
      if (particle.role === ParticleRole.CORE || particle.role === ParticleRole.CONTROL) {
        // Change to animated shape
        particle.shapeType = 'pulsatingSphere';
      } else if (particle.role === ParticleRole.MOVEMENT) {
        particle.shapeType = 'rotatingCrystal';
      } else {
        // Add special material effect
        particle.materialType = materialTypes.GLASS;
      }
      break;

    case 5: // Mythic
      // Complete transformation to special shape
      if (particle.role === ParticleRole.CORE) {
        particle.shapeType = 'molecular';
      } else if (particle.role === ParticleRole.CONTROL) {
        particle.shapeType = 'gyroscope';
      } else if (particle.role === ParticleRole.MOVEMENT) {
        particle.shapeType = 'torusknot';
      } else if (particle.role === ParticleRole.DEFENSE) {
        particle.shapeType = 'satellite';
      } else {
        particle.shapeType = 'morphingCube';
      }
      break;
  }

  return particle;
}
```

## Shape Implementation

The implementation of particle shapes focuses on performance and visual quality, using Three.js for rendering.

### Three.js Implementation

Three.js provides efficient 3D rendering capabilities for particle shapes:

```typescript
// Create particle mesh with Three.js
function createParticleMesh(particle) {
  // Create geometry based on shape type
  let geometry;

  switch (particle.shapeType) {
    case 'sphere':
      geometry = new THREE.SphereGeometry(particle.radius, 16, 12);
      break;

    case 'cube':
      geometry = new THREE.BoxGeometry(
        particle.radius * 2,
        particle.radius * 2,
        particle.radius * 2
      );
      break;

    case 'tetrahedron':
      geometry = new THREE.TetrahedronGeometry(particle.radius);
      break;

    case 'octahedron':
      geometry = new THREE.OctahedronGeometry(particle.radius);
      break;

    case 'icosahedron':
      geometry = new THREE.IcosahedronGeometry(particle.radius);
      break;

    case 'dodecahedron':
      geometry = new THREE.DodecahedronGeometry(particle.radius);
      break;

    case 'cylinder':
      geometry = new THREE.CylinderGeometry(
        particle.radius,
        particle.radius,
        particle.radius * 2,
        16
      );
      break;

    case 'cone':
      geometry = new THREE.ConeGeometry(
        particle.radius,
        particle.radius * 2,
        16
      );
      break;

    case 'torus':
      geometry = new THREE.TorusGeometry(
        particle.radius,
        particle.radius * 0.3,
        16,
        24
      );
      break;

    case 'torusknot':
      geometry = new THREE.TorusKnotGeometry(
        particle.radius,
        particle.radius * 0.3,
        64,
        8,
        2,
        3
      );
      break;

    default:
      // Default to sphere
      geometry = new THREE.SphereGeometry(particle.radius, 16, 12);
  }

  // Apply geometry modifiers if any
  if (particle.modifiers) {
    geometry = applyGeometryModifiers(geometry, particle.modifiers);
  }

  // Create material
  const material = createMaterial(
    particle.materialType || materialTypes.STANDARD,
    particle.color,
    {
      roughness: particle.roughness || 0.7,
      metalness: particle.metalness || 0.3,
      flatShading: particle.flatShading || false
    }
  );

  // Create mesh
  const mesh = new THREE.Mesh(geometry, material);

  // Set initial position
  mesh.position.copy(particle.position);

  // Store reference to particle data
  mesh.userData.particle = particle;

  return mesh;
}
```

### Instanced Meshes

Instanced meshes improve performance for large numbers of similar particles:

```typescript
// Create instanced mesh for particles
function createInstancedParticleMesh(particles, shapeType) {
  // Filter particles by shape type
  const filteredParticles = particles.filter(p => p.shapeType === shapeType);

  if (filteredParticles.length === 0) {
    return null;
  }

  // Create base geometry
  let geometry;

  switch (shapeType) {
    case 'sphere':
      geometry = new THREE.SphereGeometry(1, 16, 12);
      break;

    case 'cube':
      geometry = new THREE.BoxGeometry(2, 2, 2);
      break;

    case 'tetrahedron':
      geometry = new THREE.TetrahedronGeometry(1);
      break;

    // Add other shape types as needed

    default:
      geometry = new THREE.SphereGeometry(1, 16, 12);
  }

  // Create material
  const material = new THREE.MeshStandardMaterial();

  // Create instanced mesh
  const instancedMesh = new THREE.InstancedMesh(
    geometry,
    material,
    filteredParticles.length
  );

  // Set up instances
  const matrix = new THREE.Matrix4();
  const color = new THREE.Color();

  filteredParticles.forEach((particle, i) => {
    // Position
    matrix.setPosition(particle.position.x, particle.position.y, particle.position.z);

    // Scale
    const scale = particle.radius || 1;
    matrix.scale(new THREE.Vector3(scale, scale, scale));

    // Apply to instance
    instancedMesh.setMatrixAt(i, matrix);

    // Color
    instancedMesh.setColorAt(i, color.set(particle.color));
  });

  // Update instance matrices
  instancedMesh.instanceMatrix.needsUpdate = true;

  // Update instance colors
  if (instancedMesh.instanceColor) {
    instancedMesh.instanceColor.needsUpdate = true;
  }

  return instancedMesh;
}
```

### Performance Considerations

Performance optimizations for particle shapes ensure smooth rendering:

```typescript
// Performance optimization strategies
const performanceStrategies = {
  // Automatically adjust detail level based on particle count
  autoAdjustDetailLevel(particleCount) {
    if (particleCount > 1000) {
      return 'LOW';
    } else if (particleCount > 500) {
      return 'MEDIUM';
    } else {
      return 'HIGH';
    }
  },

  // Use instanced meshes for particles with the same shape
  useInstancedMeshes(particles) {
    // Group particles by shape type
    const shapeGroups = {};

    particles.forEach(particle => {
      const shapeType = particle.shapeType || 'sphere';
      if (!shapeGroups[shapeType]) {
        shapeGroups[shapeType] = [];
      }
      shapeGroups[shapeType].push(particle);
    });

    // Create instanced meshes for groups with more than 10 particles
    const meshes = [];

    for (const [shapeType, groupParticles] of Object.entries(shapeGroups)) {
      if (groupParticles.length > 10) {
        const instancedMesh = createInstancedParticleMesh(groupParticles, shapeType);
        if (instancedMesh) {
          meshes.push(instancedMesh);
        }
      } else {
        // Create individual meshes for small groups
        groupParticles.forEach(particle => {
          meshes.push(createParticleMesh(particle));
        });
      }
    }

    return meshes;
  },

  // Implement level of detail (LOD) for particles
  implementLOD(particle, camera) {
    // Calculate distance to camera
    const distance = particle.position.distanceTo(camera.position);

    // Adjust detail level based on distance
    let detailLevel;

    if (distance > 50) {
      detailLevel = 'LOW';
    } else if (distance > 20) {
      detailLevel = 'MEDIUM';
    } else {
      detailLevel = 'HIGH';
    }

    return detailLevel;
  },

  // Cull particles that are not visible
  cullInvisibleParticles(particles, camera, frustum) {
    return particles.filter(particle => {
      // Skip if particle is not active
      if (!particle.active) return false;

      // Check if particle is in camera frustum
      const position = new THREE.Vector3(
        particle.position.x,
        particle.position.y,
        particle.position.z
      );

      return frustum.containsPoint(position);
    });
  }
};
```

## Shape Rarity Tiers

Shape rarity tiers define the relative frequency and visual distinctiveness of different particle shapes.

### Common Shapes

Common shapes are the most frequently occurring and serve as the foundation for particle visuals:

```typescript
// Common shapes (50% probability)
const commonShapes = {
  sphere: {
    name: 'Sphere',
    probability: 0.15,
    description: 'A basic spherical shape with smooth surface.',
    complexity: 'low',
    performance: 'high'
  },
  cube: {
    name: 'Cube',
    probability: 0.15,
    description: 'A six-sided box shape with flat faces.',
    complexity: 'low',
    performance: 'high'
  },
  tetrahedron: {
    name: 'Tetrahedron',
    probability: 0.1,
    description: 'A four-sided pyramid shape with triangular faces.',
    complexity: 'low',
    performance: 'high'
  },
  octahedron: {
    name: 'Octahedron',
    probability: 0.05,
    description: 'An eight-sided shape with triangular faces.',
    complexity: 'low',
    performance: 'high'
  },
  cylinder: {
    name: 'Cylinder',
    probability: 0.05,
    description: 'A cylindrical shape with circular ends.',
    complexity: 'low',
    performance: 'high'
  }
};
```

### Uncommon Shapes

Uncommon shapes occur less frequently and offer more visual interest:

```typescript
// Uncommon shapes (30% probability)
const uncommonShapes = {
  cone: {
    name: 'Cone',
    probability: 0.1,
    description: 'A cone shape with circular base and pointed top.',
    complexity: 'low',
    performance: 'high'
  },
  torus: {
    name: 'Torus',
    probability: 0.08,
    description: 'A donut-shaped ring with a hole in the center.',
    complexity: 'medium',
    performance: 'medium'
  },
  icosahedron: {
    name: 'Icosahedron',
    probability: 0.07,
    description: 'A twenty-sided polyhedron with triangular faces.',
    complexity: 'medium',
    performance: 'medium'
  },
  dodecahedron: {
    name: 'Dodecahedron',
    probability: 0.05,
    description: 'A twelve-sided polyhedron with pentagonal faces.',
    complexity: 'medium',
    performance: 'medium'
  }
};
```

### Rare Shapes

Rare shapes are visually distinctive and occur infrequently:

```typescript
// Rare shapes (15% probability)
const rareShapes = {
  torusknot: {
    name: 'Torus Knot',
    probability: 0.05,
    description: 'A complex knot-like shape twisted in 3D space.',
    complexity: 'high',
    performance: 'medium'
  },
  pulsatingSphere: {
    name: 'Pulsating Sphere',
    probability: 0.04,
    description: 'A sphere that rhythmically grows and shrinks.',
    complexity: 'medium',
    performance: 'medium',
    animated: true
  },
  rotatingCrystal: {
    name: 'Rotating Crystal',
    probability: 0.03,
    description: 'A crystalline shape that continuously rotates.',
    complexity: 'medium',
    performance: 'medium',
    animated: true
  },
  gyroscope: {
    name: 'Gyroscope',
    probability: 0.03,
    description: 'A complex shape with intersecting rings and a central sphere.',
    complexity: 'high',
    performance: 'medium',
    composite: true
  }
};
```

### Epic Shapes

Epic shapes are rare and visually impressive:

```typescript
// Epic shapes (3% probability)
const epicShapes = {
  satellite: {
    name: 'Satellite',
    probability: 0.01,
    description: 'A complex shape resembling a satellite with extending panels.',
    complexity: 'high',
    performance: 'medium',
    composite: true
  },
  morphingCube: {
    name: 'Morphing Cube',
    probability: 0.01,
    description: 'A cube that smoothly morphs between different shapes.',
    complexity: 'high',
    performance: 'low',
    animated: true
  },
  molecular: {
    name: 'Molecular',
    probability: 0.01,
    description: 'A molecular structure with a central atom and orbiting particles.',
    complexity: 'high',
    performance: 'medium',
    composite: true
  }
};
```

### Legendary Shapes

Legendary shapes are extremely rare and visually spectacular:

```typescript
// Legendary shapes (1.5% probability)
const legendaryShapes = {
  orbitingSatellites: {
    name: 'Orbiting Satellites',
    probability: 0.01,
    description: 'A central body with smaller objects orbiting around it.',
    complexity: 'very high',
    performance: 'low',
    animated: true,
    composite: true
  },
  crystalCluster: {
    name: 'Crystal Cluster',
    probability: 0.005,
    description: 'A complex arrangement of interconnected crystal formations.',
    complexity: 'very high',
    performance: 'low',
    composite: true
  }
};
```

### Mythic Shapes

Mythic shapes are the rarest and most visually stunning:

```typescript
// Mythic shapes (0.5% probability)
const mythicShapes = {
  vortex: {
    name: 'Vortex',
    probability: 0.003,
    description: 'A swirling, animated vortex with particles flowing through it.',
    complexity: 'extreme',
    performance: 'very low',
    animated: true,
    composite: true,
    special: true
  },
  quantumFlux: {
    name: 'Quantum Flux',
    probability: 0.002,
    description: 'A constantly shifting, ethereal form that defies conventional geometry.',
    complexity: 'extreme',
    performance: 'very low',
    animated: true,
    special: true
  }
};

// Combined shape registry with all rarity tiers
const shapeRegistry = {
  ...commonShapes,
  ...uncommonShapes,
  ...rareShapes,
  ...epicShapes,
  ...legendaryShapes,
  ...mythicShapes
};
```

## Related Documents

- [Color Palettes](01_color_palettes.md) - For details on particle color palettes
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Physics Engine](../physics/01_physics_engine.md) - For details on physics calculations
- [Trait System](../bitcoin/07_trait_system.md) - For details on the trait system architecture 
``` 
 
--- 
 
### 03_formation_patterns.md 
 
```.md 
# Formation Patterns

This document outlines the various formation patterns used in the Bitcoin Protozoa project, detailing how particles arrange themselves into cohesive structures based on their roles and traits.

## Table of Contents

1. [Formation Philosophy](#formation-philosophy) [Line 20]
2. [Formation Categories](#formation-categories) [Line 40]
   - [Core Formations](#core-formations) [Line 45]
   - [Control Formations](#control-formations) [Line 100]
   - [Movement Formations](#movement-formations) [Line 150]
   - [Defense Formations](#defense-formations) [Line 200]
   - [Attack Formations](#attack-formations) [Line 250]
3. [Formation Properties](#formation-properties) [Line 300]
   - [Density](#density) [Line 305]
   - [Symmetry](#symmetry) [Line 330]
   - [Stability](#stability) [Line 355]
   - [Adaptability](#adaptability) [Line 380]
4. [Formation Dynamics](#formation-dynamics) [Line 410]
   - [Formation Transitions](#formation-transitions) [Line 415]
   - [Environmental Responses](#environmental-responses) [Line 450]
   - [Inter-Group Interactions](#inter-group-interactions) [Line 485]
5. [Formation Implementation](#formation-implementation) [Line 520]
   - [Position Calculation](#position-calculation) [Line 525]
   - [Force Application](#force-application) [Line 560]
   - [Stability Maintenance](#stability-maintenance) [Line 595]
6. [Formation Rarity Tiers](#formation-rarity-tiers) [Line 630]
   - [Common Formations](#common-formations) [Line 635]
   - [Uncommon Formations](#uncommon-formations) [Line 670]
   - [Rare Formations](#rare-formations) [Line 705]
   - [Epic Formations](#epic-formations) [Line 740]
   - [Legendary Formations](#legendary-formations) [Line 775]
   - [Mythic Formations](#mythic-formations) [Line 810]
7. [Related Documents](#related-documents) [Line 845]

## Formation Philosophy

Formation patterns in Bitcoin Protozoa define how particles organize themselves into coherent structures, creating the overall shape and behavior of the creature. These formations are not static arrangements but dynamic systems that respond to internal and external forces while maintaining their fundamental characteristics.

The formation system follows these core principles:

1. **Role-Based Organization**: Each particle group forms patterns appropriate to its functional role
2. **Emergent Complexity**: Simple rules lead to complex, emergent behaviors and structures
3. **Dynamic Stability**: Formations maintain their structure while adapting to changing conditions
4. **Deterministic Generation**: Formation patterns are assigned deterministically based on the Bitcoin block nonce
5. **Visual Distinctiveness**: Each formation type creates a visually unique identity for the creature

Formations influence not only the visual appearance of particle groups but also their functional behavior. Different formations have different strengths and weaknesses in terms of mobility, resilience, and interaction capabilities.

## Formation Categories

Formation patterns are organized by particle role, with each role having formation types that reflect its function in the creature's ecosystem.

### Core Formations

Core formations define the central structure of the creature, providing stability and identity.

#### Nucleus

```typescript
// Nucleus formation - dense central cluster
function nucleusFormation(particles: Particle[], center: Vector3, radius: number): void {
  const particleCount = particles.length;

  particles.forEach((particle, index) => {
    // Calculate position within a sphere
    const phi = Math.acos(-1 + (2 * index) / particleCount);
    const theta = Math.sqrt(particleCount * Math.PI) * phi;

    // Convert spherical to Cartesian coordinates
    const x = radius * Math.cos(theta) * Math.sin(phi);
    const y = radius * Math.sin(theta) * Math.sin(phi);
    const z = radius * Math.cos(phi);

    // Set target position relative to center
    particle.targetPosition.set(
      center.x + x,
      center.y + y,
      center.z + z
    );

    // Set formation-specific properties
    particle.formationDensity = 0.8; // High density
    particle.formationRadius = radius;
  });
}
```

**Characteristics**:
- Dense, spherical arrangement
- Highly stable central structure
- Particles evenly distributed in 3D space
- Strong gravitational influence

**Role Affinity**: CORE

**Rarity Tier**: Common

#### Lattice

```typescript
// Lattice formation - crystalline structure
function latticeFormation(particles: Particle[], center: Vector3, radius: number): void {
  const gridSize = Math.ceil(Math.cbrt(particles.length));
  const spacing = (radius * 2) / gridSize;

  particles.forEach((particle, index) => {
    // Calculate 3D grid position
    const x = index % gridSize;
    const y = Math.floor(index / gridSize) % gridSize;
    const z = Math.floor(index / (gridSize * gridSize));

    // Set target position relative to center
    particle.targetPosition.set(
      center.x + (x - gridSize/2) * spacing,
      center.y + (y - gridSize/2) * spacing,
      center.z + (z - gridSize/2) * spacing
    );

    // Set formation-specific properties
    particle.formationDensity = 0.6; // Medium-high density
    particle.formationSymmetry = 'cubic';
  });
}
```

**Characteristics**:
- Ordered, grid-like arrangement
- Rigid, crystalline structure
- Highly symmetrical
- Strong structural integrity

**Role Affinity**: CORE

**Rarity Tier**: Uncommon

#### Spiral

```typescript
// Spiral formation - galaxy-like structure
function spiralFormation(particles: Particle[], center: Vector3, radius: number): void {
  const arms = 2 + Math.floor(Math.random() * 3); // 2-4 spiral arms
  const rotations = 2; // Number of complete rotations

  particles.forEach((particle, index) => {
    // Calculate which arm this particle belongs to
    const armIndex = index % arms;
    const particlesPerArm = Math.ceil(particles.length / arms);
    const particleIndexInArm = Math.floor(index / arms);

    // Calculate angle and radius
    const angle = (particleIndexInArm / particlesPerArm) * Math.PI * 2 * rotations;
    const armOffset = (armIndex / arms) * Math.PI * 2;
    const totalAngle = angle + armOffset;

    // Radius increases with angle
    const particleRadius = (radius * particleIndexInArm) / particlesPerArm;

    // Convert polar to Cartesian coordinates
    const x = particleRadius * Math.cos(totalAngle);
    const y = particleRadius * Math.sin(totalAngle) * 0.3; // Flatten the spiral
    const z = (particleIndexInArm / particlesPerArm - 0.5) * radius * 0.5; // Slight vertical spread

    // Set target position relative to center
    particle.targetPosition.set(
      center.x + x,
      center.y + y,
      center.z + z
    );

    // Set formation-specific properties
    particle.formationDensity = 0.4; // Medium density
    particle.formationSymmetry = 'radial';
  });
}
```

**Characteristics**:
- Elegant spiral structure
- Dynamic, flowing appearance
- Balanced distribution with distinct arms
- Moderate stability with rotational momentum

**Role Affinity**: CORE

**Rarity Tier**: Rare

### Control Formations

Control formations organize particles to maximize influence over other groups, focusing on coordination and regulation.

#### Orbital

```typescript
// Orbital formation - particles in orbital shells
function orbitalFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Determine number of shells based on particle count
  const shellCount = Math.min(5, Math.max(2, Math.floor(Math.sqrt(particles.length / 10))));

  // Distribute particles among shells
  const particlesPerShell = [];
  let remainingParticles = particles.length;

  for (let i = 0; i < shellCount; i++) {
    // More particles in outer shells
    const shellCapacity = Math.floor((i + 1) * particles.length / ((shellCount * (shellCount + 1)) / 2));
    particlesPerShell[i] = Math.min(remainingParticles, shellCapacity);
    remainingParticles -= particlesPerShell[i];
  }

  let particleIndex = 0;

  // Place particles in each shell
  for (let shell = 0; shell < shellCount; shell++) {
    const shellRadius = radius * (shell + 1) / shellCount;
    const shellParticles = particlesPerShell[shell];

    for (let i = 0; i < shellParticles; i++) {
      if (particleIndex >= particles.length) break;

      const particle = particles[particleIndex++];

      // Calculate position on shell
      const phi = Math.acos(-1 + (2 * i) / shellParticles);
      const theta = Math.sqrt(shellParticles * Math.PI) * phi;

      // Convert spherical to Cartesian coordinates
      const x = shellRadius * Math.cos(theta) * Math.sin(phi);
      const y = shellRadius * Math.sin(theta) * Math.sin(phi);
      const z = shellRadius * Math.cos(phi);

      // Set target position relative to center
      particle.targetPosition.set(
        center.x + x,
        center.y + y,
        center.z + z
      );

      // Set formation-specific properties
      particle.formationDensity = 0.5; // Medium density
      particle.formationSymmetry = 'spherical';
      particle.orbitSpeed = 0.02 * (shellCount - shell) / shellCount; // Outer shells orbit slower
      particle.orbitAxis = new Vector3(0, 1, 0); // Orbit around y-axis
    }
  }
}
```

**Characteristics**:
- Concentric spherical shells
- Dynamic orbital movement
- Balanced distribution in 3D space
- Good coverage of surrounding space

**Role Affinity**: CONTROL

**Rarity Tier**: Common

#### Network

```typescript
// Network formation - interconnected nodes
function networkFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Create node positions
  const nodeCount = Math.min(particles.length, 15);
  const nodes = [];

  // Generate random node positions
  for (let i = 0; i < nodeCount; i++) {
    nodes.push(new Vector3(
      center.x + (Math.random() - 0.5) * radius * 2,
      center.y + (Math.random() - 0.5) * radius * 2,
      center.z + (Math.random() - 0.5) * radius * 2
    ));
  }

  // Assign particles to nodes
  particles.forEach((particle, index) => {
    // Determine which node this particle belongs to
    const nodeIndex = index % nodeCount;
    const particlesPerNode = Math.ceil(particles.length / nodeCount);
    const particleIndexInNode = Math.floor(index / nodeCount);

    // Get node position
    const nodePosition = nodes[nodeIndex];

    // Calculate offset from node center
    const offsetRadius = radius * 0.2;
    const offsetPhi = Math.acos(-1 + (2 * particleIndexInNode) / particlesPerNode);
    const offsetTheta = Math.sqrt(particlesPerNode * Math.PI) * offsetPhi;

    // Convert spherical to Cartesian coordinates for offset
    const offsetX = offsetRadius * Math.cos(offsetTheta) * Math.sin(offsetPhi);
    const offsetY = offsetRadius * Math.sin(offsetTheta) * Math.sin(offsetPhi);
    const offsetZ = offsetRadius * Math.cos(offsetPhi);

    // Set target position relative to node
    particle.targetPosition.set(
      nodePosition.x + offsetX,
      nodePosition.y + offsetY,
      nodePosition.z + offsetZ
    );

    // Set formation-specific properties
    particle.formationDensity = 0.7; // High density at nodes
    particle.formationSymmetry = 'network';
    particle.nodeIndex = nodeIndex;
    particle.connections = [];

    // Connect to other nodes (store connection information)
    for (let i = 0; i < 3; i++) {
      const connectionNodeIndex = (nodeIndex + i + 1) % nodeCount;
      particle.connections.push(connectionNodeIndex);
    }
  });
}
```

**Characteristics**:
- Distributed network of interconnected nodes
- Complex, web-like structure
- High connectivity between particle clusters
- Efficient information/force distribution

**Role Affinity**: CONTROL

**Rarity Tier**: Uncommon

#### Hierarchical

```typescript
// Hierarchical formation - tree-like structure
function hierarchicalFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define hierarchy levels
  const levels = Math.min(5, Math.max(2, Math.floor(Math.log2(particles.length / 5))));

  // Calculate particles per level
  const particlesPerLevel = [];
  let remainingParticles = particles.length;

  for (let level = 0; level < levels; level++) {
    // Each level has 2^level nodes (binary tree structure)
    const levelCapacity = Math.pow(2, level);
    particlesPerLevel[level] = Math.min(remainingParticles, levelCapacity);
    remainingParticles -= particlesPerLevel[level];
  }

  // Distribute remaining particles to the deepest level
  if (remainingParticles > 0) {
    particlesPerLevel[levels - 1] += remainingParticles;
  }

  let particleIndex = 0;

  // Place particles in each level
  for (let level = 0; level < levels; level++) {
    const levelParticles = particlesPerLevel[level];
    const levelHeight = radius * (1 - level / levels); // Top level has highest y
    const levelRadius = radius * (level / levels); // Radius increases with depth

    for (let i = 0; i < levelParticles; i++) {
      if (particleIndex >= particles.length) break;

      const particle = particles[particleIndex++];

      // Calculate angle around the y-axis
      const angle = (i / levelParticles) * Math.PI * 2;

      // Calculate position
      const x = center.x + levelRadius * Math.cos(angle);
      const y = center.y + levelHeight;
      const z = center.z + levelRadius * Math.sin(angle);

      // Set target position
      particle.targetPosition.set(x, y, z);

      // Set formation-specific properties
      particle.formationDensity = 0.6; // Medium-high density
      particle.formationSymmetry = 'hierarchical';
      particle.hierarchyLevel = level;

      // Store parent-child relationships
      if (level > 0) {
        const parentIndex = Math.floor((particleIndex - 1) / 2) - 1;
        if (parentIndex >= 0 && parentIndex < particles.length) {
          particle.parentIndex = parentIndex;
        }
      }
    }
  }
}
```

**Characteristics**:
- Tree-like hierarchical structure
- Clear organizational levels
- Efficient command and control structure
- Balanced distribution of authority

**Role Affinity**: CONTROL

**Rarity Tier**: Rare

### Movement Formations

Movement formations optimize for mobility and dynamic positioning, allowing particles to navigate efficiently.

#### Stream

```typescript
// Stream formation - flowing line of particles
function streamFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define stream parameters
  const streamLength = radius * 2;
  const streamWidth = radius * 0.5;
  const streamHeight = radius * 0.5;
  const curvature = 0.5; // How much the stream curves

  particles.forEach((particle, index) => {
    // Calculate position along stream
    const t = index / (particles.length - 1); // 0 to 1

    // Create a curved path
    const x = center.x + (t - 0.5) * streamLength;
    const y = center.y + Math.sin(t * Math.PI) * curvature * radius;
    const z = center.z + (Math.random() - 0.5) * streamWidth;

    // Add some vertical spread
    const yOffset = (Math.random() - 0.5) * streamHeight;

    // Set target position
    particle.targetPosition.set(x, y + yOffset, z);

    // Set formation-specific properties
    particle.formationDensity = 0.3; // Low-medium density
    particle.formationSymmetry = 'flow';
    particle.flowPosition = t; // Position along the stream (0-1)
    particle.flowSpeed = 0.02 * (1 - 0.5 * Math.sin(t * Math.PI * 2)); // Speed varies along stream
  });
}
```

**Characteristics**:
- Flowing, stream-like arrangement
- Dynamic, fluid movement
- Efficient forward motion
- Adaptable path following

**Role Affinity**: MOVEMENT

**Rarity Tier**: Common

#### Vortex

```typescript
// Vortex formation - swirling, tornado-like structure
function vortexFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define vortex parameters
  const height = radius * 2;
  const rotations = 3; // Number of complete rotations from bottom to top

  particles.forEach((particle, index) => {
    // Calculate vertical position (height)
    const t = index / (particles.length - 1); // 0 to 1
    const y = center.y + (t - 0.5) * height;

    // Calculate radius at this height (narrower at top)
    const radiusAtHeight = radius * (1 - 0.7 * t);

    // Calculate angle based on height
    const angle = t * Math.PI * 2 * rotations;

    // Convert polar to Cartesian coordinates
    const x = center.x + radiusAtHeight * Math.cos(angle);
    const z = center.z + radiusAtHeight * Math.sin(angle);

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.4; // Medium density
    particle.formationSymmetry = 'rotational';
    particle.vortexHeight = t;
    particle.vortexAngle = angle;
    particle.vortexSpeed = 0.03 * (1 - 0.5 * t); // Faster at bottom, slower at top
  });
}
```

**Characteristics**:
- Swirling, tornado-like structure
- Strong rotational movement
- Vertical organization
- Concentrated energy

**Role Affinity**: MOVEMENT

**Rarity Tier**: Uncommon

#### Flock

```typescript
// Flock formation - bird-like group movement
function flockFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define flock parameters
  const spread = radius * 1.5;
  const depth = radius * 2;

  // Create a V-shaped formation
  particles.forEach((particle, index) => {
    // Determine which wing this particle belongs to
    const isLeftWing = index % 2 === 0;
    const wingIndex = Math.floor(index / 2);
    const particlesPerWing = Math.ceil(particles.length / 2);

    // Calculate position in wing
    const t = wingIndex / particlesPerWing; // 0 to 1

    // Wing angle (left or right)
    const wingAngle = isLeftWing ? Math.PI * 0.25 : -Math.PI * 0.25;

    // Distance from center
    const distance = t * spread;

    // Calculate position
    const x = center.x + Math.cos(wingAngle) * distance;
    const y = center.y + (Math.random() - 0.5) * radius * 0.3; // Slight vertical variation
    const z = center.z + Math.sin(wingAngle) * distance - t * depth; // Depth increases with distance

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.2; // Low density
    particle.formationSymmetry = 'bilateral';
    particle.flockPosition = t;
    particle.flockWing = isLeftWing ? 'left' : 'right';

    // Flocking behavior parameters
    particle.separationWeight = 1.5;
    particle.alignmentWeight = 1.0;
    particle.cohesionWeight = 1.0;
    particle.perceptionRadius = radius * 0.3;
  });
}
```

**Characteristics**:
- V-shaped, bird-like formation
- Coordinated group movement
- Efficient aerodynamic structure
- Adaptive positioning

**Role Affinity**: MOVEMENT

**Rarity Tier**: Rare

### Defense Formations

Defense formations prioritize protection and resilience, creating barriers and shields.

#### Shield

```typescript
// Shield formation - protective barrier
function shieldFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define shield parameters
  const width = radius * 2;
  const height = radius * 1.5;
  const curvature = 0.3; // How curved the shield is

  // Calculate grid dimensions
  const rows = Math.ceil(Math.sqrt(particles.length * height / width));
  const cols = Math.ceil(particles.length / rows);

  particles.forEach((particle, index) => {
    // Calculate grid position
    const row = Math.floor(index / cols);
    const col = index % cols;

    // Convert to normalized coordinates (0 to 1)
    const u = col / (cols - 1 || 1);
    const v = row / (rows - 1 || 1);

    // Calculate curved shield position
    const x = center.x + (u - 0.5) * width;
    const y = center.y + (v - 0.5) * height;
    const z = center.z - radius * curvature * (1 - 4 * Math.pow(u - 0.5, 2)) * (1 - 4 * Math.pow(v - 0.5, 2));

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.9; // Very high density
    particle.formationSymmetry = 'bilateral';
    particle.shieldPosition = { u, v };
    particle.shieldStrength = 1.0 - 0.5 * Math.sqrt(Math.pow(u - 0.5, 2) + Math.pow(v - 0.5, 2)); // Stronger in center
  });
}
```

**Characteristics**:
- Curved, shield-like barrier
- High-density protective structure
- Strong central reinforcement
- Effective against frontal threats

**Role Affinity**: DEFENSE

**Rarity Tier**: Common

#### Fortress

```typescript
// Fortress formation - enclosed protective structure
function fortressFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define fortress parameters
  const sides = 6; // Hexagonal base
  const height = radius * 1.5;
  const baseRadius = radius * 0.8;

  // Calculate particles per side and top
  const particlesPerSide = Math.floor(particles.length / (sides + 1));
  const particlesForTop = particles.length - (particlesPerSide * sides);

  let particleIndex = 0;

  // Create the sides
  for (let side = 0; side < sides; side++) {
    // Calculate angle for this side
    const angle = (side / sides) * Math.PI * 2;
    const nextAngle = ((side + 1) / sides) * Math.PI * 2;

    // Calculate corner positions
    const corner1 = new Vector3(
      center.x + baseRadius * Math.cos(angle),
      center.y - height / 2,
      center.z + baseRadius * Math.sin(angle)
    );

    const corner2 = new Vector3(
      center.x + baseRadius * Math.cos(nextAngle),
      center.y - height / 2,
      center.z + baseRadius * Math.sin(nextAngle)
    );

    // Distribute particles on this side
    for (let i = 0; i < particlesPerSide; i++) {
      if (particleIndex >= particles.length) break;

      const particle = particles[particleIndex++];

      // Calculate position on wall (0 to 1 horizontally and vertically)
      const h = (i % Math.ceil(Math.sqrt(particlesPerSide))) / Math.ceil(Math.sqrt(particlesPerSide));
      const v = Math.floor(i / Math.ceil(Math.sqrt(particlesPerSide))) / Math.ceil(Math.sqrt(particlesPerSide));

      // Interpolate between corners horizontally and add height
      const x = corner1.x + (corner2.x - corner1.x) * h;
      const z = corner1.z + (corner2.z - corner1.z) * h;
      const y = corner1.y + v * height;

      // Set target position
      particle.targetPosition.set(x, y, z);

      // Set formation-specific properties
      particle.formationDensity = 0.8; // High density
      particle.formationSymmetry = 'radial';
      particle.fortressSide = side;
      particle.fortressPosition = { h, v };
    }
  }

  // Create the top
  for (let i = 0; i < particlesForTop; i++) {
    if (particleIndex >= particles.length) break;

    const particle = particles[particleIndex++];

    // Calculate position on top (circular arrangement)
    const angle = (i / particlesForTop) * Math.PI * 2;
    const topRadius = baseRadius * (1 - i / particlesForTop); // Decreasing radius for spiral effect

    const x = center.x + topRadius * Math.cos(angle);
    const y = center.y + height / 2;
    const z = center.z + topRadius * Math.sin(angle);

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.7; // High density
    particle.formationSymmetry = 'radial';
    particle.fortressSide = -1; // Top
    particle.fortressPosition = { r: i / particlesForTop, theta: angle };
  }
}
```

**Characteristics**:
- Enclosed, fortress-like structure
- Multi-directional protection
- Strong structural integrity
- Defensive positioning

**Role Affinity**: DEFENSE

**Rarity Tier**: Uncommon

#### Sphere

```typescript
// Sphere formation - complete surrounding protection
function sphereFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Fibonacci sphere distribution for even coverage
  const goldenRatio = (1 + Math.sqrt(5)) / 2;

  particles.forEach((particle, index) => {
    // Calculate even distribution on sphere using Fibonacci sequence
    const i = index + 0.5; // Offset to avoid exact poles

    // Golden angle increment
    const phi = Math.acos(1 - 2 * i / particles.length);
    const theta = 2 * Math.PI * i / goldenRatio;

    // Convert spherical to Cartesian coordinates
    const x = center.x + radius * Math.cos(theta) * Math.sin(phi);
    const y = center.y + radius * Math.sin(theta) * Math.sin(phi);
    const z = center.z + radius * Math.cos(phi);

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.6; // Medium-high density
    particle.formationSymmetry = 'spherical';
    particle.spherePosition = { phi, theta };

    // Outward-facing orientation
    const normal = new Vector3(x - center.x, y - center.y, z - center.z).normalize();
    particle.orientation = normal;
  });
}
```

**Characteristics**:
- Complete spherical protection
- Omnidirectional defense
- Even particle distribution
- Maximized coverage

**Role Affinity**: DEFENSE

**Rarity Tier**: Rare

### Attack Formations

Attack formations optimize for offensive capabilities, focusing on concentration of force and strategic positioning.

#### Spear

```typescript
// Spear formation - concentrated forward attack
function spearFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define spear parameters
  const length = radius * 3;
  const width = radius * 0.5;

  particles.forEach((particle, index) => {
    // Calculate position along spear (0 at back, 1 at tip)
    const t = index / (particles.length - 1);

    // More particles at the tip
    const adjustedT = Math.pow(t, 1.5);

    // Calculate radial distance from center axis (narrower at tip)
    const radialDistance = width * (1 - adjustedT);

    // Calculate angle around the spear axis
    const angle = index * 2.39; // Golden angle for spiral effect

    // Calculate position
    const x = center.x + radialDistance * Math.cos(angle);
    const y = center.y + radialDistance * Math.sin(angle);
    const z = center.z + length * (adjustedT - 0.5); // Tip points forward in z-direction

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.7 + 0.3 * adjustedT; // Denser at tip
    particle.formationSymmetry = 'axial';
    particle.spearPosition = adjustedT;

    // Forward-facing orientation
    particle.orientation = new Vector3(0, 0, 1);
  });
}
```

**Characteristics**:
- Concentrated, spear-like formation
- Forward-focused attack structure
- High density at the tip
- Piercing capability

**Role Affinity**: ATTACK

**Rarity Tier**: Common

#### Swarm

```typescript
// Swarm formation - distributed attack pattern
function swarmFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define swarm parameters
  const spread = radius * 2;
  const depth = radius * 2;

  particles.forEach((particle, index) => {
    // Calculate random position within swarm volume
    // Using deterministic pseudo-random based on index
    const seed = index * 1000;
    const rng = (n) => ((Math.sin(n) * 10000) % 1 + 1) % 1; // Simple deterministic RNG

    // Calculate position with slight clustering
    const angle = rng(seed) * Math.PI * 2;
    const distance = rng(seed + 1) * spread;
    const height = (rng(seed + 2) - 0.5) * spread;
    const forward = (rng(seed + 3) - 0.5) * depth;

    // Add some clustering by biasing toward certain positions
    const clusterBias = 0.3;
    const clusterCount = 3;
    const nearestCluster = Math.floor(rng(seed + 4) * clusterCount);
    const clusterAngle = (nearestCluster / clusterCount) * Math.PI * 2;

    // Mix random position with cluster position
    const finalAngle = angle * (1 - clusterBias) + clusterAngle * clusterBias;

    // Calculate final position
    const x = center.x + Math.cos(finalAngle) * distance;
    const y = center.y + height;
    const z = center.z + Math.sin(finalAngle) * distance + forward;

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.3; // Low-medium density
    particle.formationSymmetry = 'asymmetric';
    particle.swarmIndex = index;

    // Swarm behavior parameters
    particle.separationWeight = 1.0;
    particle.alignmentWeight = 0.7;
    particle.cohesionWeight = 0.5;
    particle.randomWeight = 0.3; // Add some randomness to movement
    particle.perceptionRadius = radius * 0.4;
  });
}
```

**Characteristics**:
- Distributed, swarm-like arrangement
- Semi-random positioning with clustering
- Unpredictable movement patterns
- Surrounding attack capability

**Role Affinity**: ATTACK

**Rarity Tier**: Uncommon

#### Pincer

```typescript
// Pincer formation - encircling attack pattern
function pincerFormation(particles: Particle[], center: Vector3, radius: number): void {
  // Define pincer parameters
  const armCount = 2; // Two pincer arms
  const armLength = radius * 2;
  const armWidth = radius * 0.5;
  const armCurvature = 0.6; // How much the arms curve inward

  // Distribute particles between arms
  const particlesPerArm = Math.floor(particles.length / armCount);

  particles.forEach((particle, index) => {
    // Determine which arm this particle belongs to
    const armIndex = index % armCount;
    const particleIndexInArm = Math.floor(index / armCount);

    // Calculate position along arm (0 at base, 1 at tip)
    const t = particleIndexInArm / particlesPerArm;

    // Calculate angle for this arm
    const baseAngle = (armIndex / armCount) * Math.PI * 2;

    // Calculate arm position with curvature
    const armAngle = baseAngle + (armCurvature * Math.PI * (t - 0.5));

    // Calculate distance from center
    const distance = armLength * t;

    // Calculate position
    const x = center.x + Math.cos(armAngle) * distance;
    const y = center.y + (Math.random() - 0.5) * armWidth * 0.5; // Slight vertical variation
    const z = center.z + Math.sin(armAngle) * distance;

    // Set target position
    particle.targetPosition.set(x, y, z);

    // Set formation-specific properties
    particle.formationDensity = 0.6; // Medium-high density
    particle.formationSymmetry = 'bilateral';
    particle.pincerArm = armIndex;
    particle.pincerPosition = t;

    // Orientation toward center of pincer
    const targetAngle = baseAngle + Math.PI + (armCurvature * Math.PI * (t - 0.5));
    particle.orientation = new Vector3(Math.cos(targetAngle), 0, Math.sin(targetAngle));
  });
}
```

**Characteristics**:
- Curved, pincer-like formation
- Encircling attack pattern
- Coordinated dual-arm structure
- Trapping capability

**Role Affinity**: ATTACK

**Rarity Tier**: Rare

## Formation Properties

Formation properties define the specific characteristics of each formation pattern, affecting their behavior and effectiveness.

### Density

Density refers to how closely packed particles are within a formation, affecting structural integrity and force concentration.

```typescript
// Calculate formation density
function calculateFormationDensity(particles: Particle[]): number {
  if (particles.length <= 1) return 0;

  // Calculate average distance between particles
  let totalDistance = 0;
  let pairCount = 0;

  // Sample a subset of pairs for efficiency
  const sampleSize = Math.min(particles.length, 100);

  for (let i = 0; i < sampleSize; i++) {
    const particleA = particles[Math.floor(Math.random() * particles.length)];

    for (let j = 0; j < 5; j++) { // Check against 5 other random particles
      const particleB = particles[Math.floor(Math.random() * particles.length)];

      if (particleA !== particleB) {
        const distance = particleA.position.distanceTo(particleB.position);
        totalDistance += distance;
        pairCount++;
      }
    }
  }

  const averageDistance = totalDistance / pairCount;
  const maxDistance = calculateFormationRadius(particles) * 2;

  // Normalize density (0 to 1, where 1 is most dense)
  return 1 - (averageDistance / maxDistance);
}

// Calculate formation radius
function calculateFormationRadius(particles: Particle[]): number {
  if (particles.length === 0) return 0;

  // Find the center of the formation
  const center = new Vector3();
  particles.forEach(particle => {
    center.add(particle.position);
  });
  center.divideScalar(particles.length);

  // Find the maximum distance from center
  let maxDistance = 0;
  particles.forEach(particle => {
    const distance = particle.position.distanceTo(center);
    maxDistance = Math.max(maxDistance, distance);
  });

  return maxDistance;
}
```

#### Density Effects

Density affects various aspects of formation behavior:

```typescript
// Apply density effects to formation
function applyDensityEffects(particles: Particle[], density: number): void {
  // Calculate base parameters based on density
  const cohesionStrength = 0.5 + density * 0.5; // Higher density = stronger cohesion
  const separationDistance = 1.0 - density * 0.7; // Higher density = smaller separation distance
  const collisionDamping = 0.3 + density * 0.6; // Higher density = more collision damping

  particles.forEach(particle => {
    // Apply density-based parameters
    particle.cohesionStrength = cohesionStrength;
    particle.separationDistance = separationDistance;
    particle.collisionDamping = collisionDamping;

    // Adjust visual properties based on density
    particle.scale = 1.0 - density * 0.2; // Slightly smaller particles in dense formations

    // Adjust physics properties
    particle.mass = particle.baseMass * (1.0 + density * 0.5); // Heavier particles in dense formations
  });
}
```

#### Density by Role

Different roles have different optimal density ranges:

```typescript
// Optimal density ranges by role
const optimalDensityByRole = {
  CORE: { min: 0.7, max: 0.9 },      // High density for stability
  CONTROL: { min: 0.5, max: 0.8 },   // Medium-high density for coordination
  MOVEMENT: { min: 0.2, max: 0.5 },  // Low-medium density for mobility
  DEFENSE: { min: 0.6, max: 0.9 },   // High density for protection
  ATTACK: { min: 0.4, max: 0.7 }     // Medium density for balance of force and mobility
};

// Adjust formation to optimal density
function adjustFormationDensity(particles: Particle[], role: string): void {
  // Calculate current density
  const currentDensity = calculateFormationDensity(particles);

  // Get optimal range for this role
  const optimalRange = optimalDensityByRole[role] || { min: 0.5, max: 0.7 };

  // Determine target density
  let targetDensity;
  if (currentDensity < optimalRange.min) {
    targetDensity = optimalRange.min;
  } else if (currentDensity > optimalRange.max) {
    targetDensity = optimalRange.max;
  } else {
    // Already in optimal range
    return;
  }

  // Calculate adjustment factor
  const adjustmentFactor = targetDensity / currentDensity;

  // Adjust particle positions to achieve target density
  const center = calculateFormationCenter(particles);

  particles.forEach(particle => {
    // Calculate vector from center to particle
    const direction = new Vector3().subVectors(particle.position, center);

    // Adjust distance from center
    direction.multiplyScalar(1 / adjustmentFactor);

    // Set new target position
    particle.targetPosition.copy(center).add(direction);
  });
}
```

### Symmetry

Symmetry defines the balance and arrangement of particles within a formation, affecting its stability and visual identity.

```typescript
// Symmetry types
const symmetryTypes = {
  RADIAL: 'radial',           // Symmetry around a central point (like a circle)
  BILATERAL: 'bilateral',     // Mirror symmetry across an axis (like left/right)
  AXIAL: 'axial',             // Symmetry around an axis (like a cylinder)
  SPHERICAL: 'spherical',     // Symmetry in all directions (like a sphere)
  ASYMMETRIC: 'asymmetric',   // Intentionally asymmetric
  CUBIC: 'cubic',             // Symmetry along three perpendicular axes
  ROTATIONAL: 'rotational',   // Symmetry when rotated by certain angles
  FRACTAL: 'fractal',         // Self-similar patterns at different scales
  FLOW: 'flow',               // Directional symmetry following a flow
  NETWORK: 'network',         // Connection-based symmetry
  HIERARCHICAL: 'hierarchical' // Level-based organizational symmetry
};

// Calculate formation center
function calculateFormationCenter(particles: Particle[]): Vector3 {
  const center = new Vector3();

  if (particles.length === 0) return center;

  particles.forEach(particle => {
    center.add(particle.position);
  });

  return center.divideScalar(particles.length);
}
```

#### Symmetry Analysis

Analyzing formation symmetry to determine its type and quality:

```typescript
// Analyze formation symmetry
function analyzeFormationSymmetry(particles: Particle[]): string {
  if (particles.length <= 1) return symmetryTypes.RADIAL;

  // Calculate center of formation
  const center = calculateFormationCenter(particles);

  // Check for different types of symmetry

  // Test for spherical symmetry
  const sphericalSymmetryScore = testSphericalSymmetry(particles, center);
  if (sphericalSymmetryScore > 0.8) return symmetryTypes.SPHERICAL;

  // Test for radial symmetry
  const radialSymmetryScore = testRadialSymmetry(particles, center);
  if (radialSymmetryScore > 0.7) return symmetryTypes.RADIAL;

  // Test for bilateral symmetry
  const bilateralSymmetryScore = testBilateralSymmetry(particles, center);
  if (bilateralSymmetryScore > 0.7) return symmetryTypes.BILATERAL;

  // Test for axial symmetry
  const axialSymmetryScore = testAxialSymmetry(particles, center);
  if (axialSymmetryScore > 0.7) return symmetryTypes.AXIAL;

  // Test for cubic symmetry
  const cubicSymmetryScore = testCubicSymmetry(particles, center);
  if (cubicSymmetryScore > 0.7) return symmetryTypes.CUBIC;

  // If no strong symmetry is detected
  return symmetryTypes.ASYMMETRIC;
}

// Example of one symmetry test
function testRadialSymmetry(particles: Particle[], center: Vector3): number {
  // Project particles onto XZ plane
  const projectedPositions = particles.map(particle => {
    const position = particle.position.clone();
    position.y = 0; // Project to XZ plane
    return position;
  });

  // Calculate average distance from center in XZ plane
  const avgDistance = projectedPositions.reduce((sum, pos) => {
    return sum + pos.distanceTo(new Vector3(center.x, 0, center.z));
  }, 0) / particles.length;

  // Calculate variance in distances
  const distanceVariance = projectedPositions.reduce((sum, pos) => {
    const distance = pos.distanceTo(new Vector3(center.x, 0, center.z));
    return sum + Math.pow(distance - avgDistance, 2);
  }, 0) / particles.length;

  // Normalize variance (0 = perfect radial symmetry, 1 = no symmetry)
  const normalizedVariance = Math.min(1, distanceVariance / (avgDistance * avgDistance));

  // Convert to symmetry score (1 = perfect symmetry, 0 = no symmetry)
  return 1 - normalizedVariance;
}
```

### Stability

Stability measures how well a formation maintains its structure under external forces and perturbations.

```typescript
// Calculate formation stability
function calculateFormationStability(particles: Particle[]): number {
  if (particles.length <= 1) return 1.0; // Single particle is stable by definition

  // Factors that contribute to stability
  const densityFactor = calculateFormationDensity(particles);

  // Calculate average distance to nearest neighbors
  const avgNeighborDistance = calculateAverageNeighborDistance(particles);
  const neighborDistanceVariance = calculateNeighborDistanceVariance(particles, avgNeighborDistance);

  // Normalized variance (lower variance = higher stability)
  const normalizedVariance = Math.min(1, neighborDistanceVariance / (avgNeighborDistance * avgNeighborDistance));
  const uniformityFactor = 1 - normalizedVariance;

  // Calculate symmetry factor
  const symmetryType = analyzeFormationSymmetry(particles);
  let symmetryFactor = 0.5; // Default

  switch (symmetryType) {
    case symmetryTypes.SPHERICAL:
      symmetryFactor = 1.0; // Most stable
      break;
    case symmetryTypes.CUBIC:
      symmetryFactor = 0.9;
      break;
    case symmetryTypes.RADIAL:
      symmetryFactor = 0.8;
      break;
    case symmetryTypes.AXIAL:
      symmetryFactor = 0.7;
      break;
    case symmetryTypes.BILATERAL:
      symmetryFactor = 0.6;
      break;
    case symmetryTypes.ASYMMETRIC:
      symmetryFactor = 0.3; // Least stable
      break;
  }

  // Combine factors (weighted average)
  return densityFactor * 0.4 + uniformityFactor * 0.3 + symmetryFactor * 0.3;
}

// Helper functions for stability calculation
function calculateAverageNeighborDistance(particles: Particle[]): number {
  let totalDistance = 0;
  let count = 0;

  particles.forEach(particleA => {
    // Find nearest neighbor
    let minDistance = Infinity;

    particles.forEach(particleB => {
      if (particleA !== particleB) {
        const distance = particleA.position.distanceTo(particleB.position);
        minDistance = Math.min(minDistance, distance);
      }
    });

    if (minDistance !== Infinity) {
      totalDistance += minDistance;
      count++;
    }
  });

  return count > 0 ? totalDistance / count : 0;
}

function calculateNeighborDistanceVariance(particles: Particle[], avgDistance: number): number {
  let totalVariance = 0;
  let count = 0;

  particles.forEach(particleA => {
    // Find nearest neighbor
    let minDistance = Infinity;

    particles.forEach(particleB => {
      if (particleA !== particleB) {
        const distance = particleA.position.distanceTo(particleB.position);
        minDistance = Math.min(minDistance, distance);
      }
    });

    if (minDistance !== Infinity) {
      totalVariance += Math.pow(minDistance - avgDistance, 2);
      count++;
    }
  });

  return count > 0 ? totalVariance / count : 0;
}
```

#### Stability Maintenance

Maintaining formation stability through corrective forces:

```typescript
// Apply stability maintenance forces
function applyStabilityForces(particles: Particle[], targetFormation: string): void {
  // Calculate current formation properties
  const center = calculateFormationCenter(particles);
  const currentSymmetry = analyzeFormationSymmetry(particles);
  const currentStability = calculateFormationStability(particles);

  // Apply different forces based on target formation
  switch (targetFormation) {
    case 'nucleus':
      // Apply strong cohesion to maintain dense central structure
      applyCohesionForce(particles, center, 1.5);
      break;

    case 'lattice':
      // Apply grid-alignment forces
      applyGridAlignmentForce(particles, center, 1.0);
      break;

    case 'spiral':
      // Apply spiral-maintaining forces
      applySpiralForce(particles, center, 1.0);
      break;

    case 'orbital':
      // Apply orbital forces to maintain shells
      applyOrbitalForce(particles, center, 1.0);
      break;

    // Add cases for other formation types

    default:
      // Default stability maintenance
      applyCohesionForce(particles, center, 1.0);
      break;
  }

  // Apply general stability forces based on current stability
  const stabilityForceFactor = Math.max(0, 1.0 - currentStability);

  if (stabilityForceFactor > 0.2) {
    // Apply stronger corrective forces when stability is low
    applySymmetryRestorationForce(particles, center, currentSymmetry, stabilityForceFactor);
  }
}

// Example of a specific stability force
function applyCohesionForce(particles: Particle[], center: Vector3, strength: number): void {
  particles.forEach(particle => {
    // Calculate direction to center
    const direction = new Vector3().subVectors(center, particle.position).normalize();

    // Calculate distance-based force (stronger when further from center)
    const distance = particle.position.distanceTo(center);
    const forceMagnitude = strength * Math.min(1.0, distance / 10.0);

    // Apply force toward center
    particle.acceleration.add(direction.multiplyScalar(forceMagnitude));
  });
}
```

### Adaptability

Adaptability measures how well a formation can change in response to environmental conditions and threats.

```typescript
// Calculate formation adaptability
function calculateFormationAdaptability(particles: Particle[]): number {
  // Factors that contribute to adaptability

  // Density factor (lower density = higher adaptability)
  const densityFactor = 1.0 - calculateFormationDensity(particles);

  // Symmetry factor (certain symmetries are more adaptable)
  const symmetryType = analyzeFormationSymmetry(particles);
  let symmetryFactor = 0.5; // Default

  switch (symmetryType) {
    case symmetryTypes.ASYMMETRIC:
      symmetryFactor = 0.9; // Most adaptable
      break;
    case symmetryTypes.FLOW:
      symmetryFactor = 0.8;
      break;
    case symmetryTypes.BILATERAL:
      symmetryFactor = 0.7;
      break;
    case symmetryTypes.RADIAL:
      symmetryFactor = 0.6;
      break;
    case symmetryTypes.SPHERICAL:
      symmetryFactor = 0.4; // Least adaptable
      break;
  }

  // Spacing factor (more evenly spaced = more adaptable)
  const avgNeighborDistance = calculateAverageNeighborDistance(particles);
  const neighborDistanceVariance = calculateNeighborDistanceVariance(particles, avgNeighborDistance);
  const normalizedVariance = Math.min(1, neighborDistanceVariance / (avgNeighborDistance * avgNeighborDistance));
  const spacingFactor = 1.0 - normalizedVariance;

  // Combine factors (weighted average)
  return densityFactor * 0.4 + symmetryFactor * 0.4 + spacingFactor * 0.2;
}
```

#### Adaptive Responses

Implementing adaptive responses to environmental changes:

```typescript
// Apply adaptive formation changes
function applyAdaptiveResponse(particles: Particle[], threat: Threat): void {
  // Calculate threat direction and distance
  const center = calculateFormationCenter(particles);
  const threatDirection = new Vector3().subVectors(threat.position, center).normalize();
  const threatDistance = center.distanceTo(threat.position);

  // Determine appropriate response based on threat type and distance
  switch (threat.type) {
    case 'physical':
      if (threatDistance < threat.radius * 2) {
        // Close physical threat - defensive formation
        transitionToDefensiveFormation(particles, threatDirection);
      } else {
        // Distant physical threat - evasive action
        applyEvasiveMovement(particles, threatDirection, threatDistance);
      }
      break;

    case 'energy':
      // Energy-based threat - dispersal response
      applyDispersalResponse(particles, threatDirection, threatDistance);
      break;

    case 'attraction':
      // Attractive force - resistance response
      applyAttractionResistance(particles, threatDirection, threatDistance, threat.strength);
      break;

    default:
      // Generic threat response - increase adaptability
      increaseFormationAdaptability(particles);
      break;
  }
}

// Example of a specific adaptive response
function transitionToDefensiveFormation(particles: Particle[], threatDirection: Vector3): void {
  // Determine which particles should form the defensive front
  const frontParticles = [];
  const supportParticles = [];

  // Sort particles based on their position relative to the threat
  particles.forEach(particle => {
    const center = calculateFormationCenter(particles);
    const particleDirection = new Vector3().subVectors(particle.position, center).normalize();
    const alignment = particleDirection.dot(threatDirection);

    if (alignment > 0.5) {
      // Particles in the threat direction form the front
      frontParticles.push(particle);
    } else {
      // Other particles provide support
      supportParticles.push(particle);
    }
  });

  // Arrange front particles in a shield formation
  if (frontParticles.length > 0) {
    const frontCenter = calculateFormationCenter(frontParticles);
    shieldFormation(frontParticles, frontCenter, calculateFormationRadius(frontParticles) * 1.2);
  }

  // Arrange support particles to reinforce the formation
  if (supportParticles.length > 0) {
    const supportCenter = calculateFormationCenter(supportParticles);
    // Position support particles behind the front
    const supportOffset = threatDirection.clone().multiplyScalar(-calculateFormationRadius(particles) * 0.5);
    supportCenter.add(supportOffset);

    // Use a formation that provides good support
    if (supportParticles.length > 20) {
      latticeFormation(supportParticles, supportCenter, calculateFormationRadius(supportParticles));
    } else {
      nucleusFormation(supportParticles, supportCenter, calculateFormationRadius(supportParticles) * 0.8);
    }
  }
}
```

## Formation Dynamics

Formation dynamics describe how formations change and evolve over time, responding to internal and external factors.

### Formation Transitions

Transitions between different formation patterns allow for adaptation to changing conditions.

```typescript
// Transition between formations
function transitionFormation(
  particles: Particle[],
  currentFormation: string,
  targetFormation: string,
  transitionSpeed: number = 0.05
): void {
  // Store current positions as starting positions
  particles.forEach(particle => {
    if (!particle.transitionData) {
      particle.transitionData = {
        startPosition: particle.position.clone(),
        progress: 0
      };
    }
  });

  // Calculate target positions based on target formation
  const center = calculateFormationCenter(particles);
  const radius = calculateFormationRadius(particles);

  // Apply target formation function to get target positions
  switch (targetFormation) {
    case 'nucleus':
      nucleusFormation(particles, center, radius);
      break;

    case 'lattice':
      latticeFormation(particles, center, radius);
      break;

    case 'spiral':
      spiralFormation(particles, center, radius);
      break;

    case 'orbital':
      orbitalFormation(particles, center, radius);
      break;

    case 'network':
      networkFormation(particles, center, radius);
      break;

    case 'stream':
      streamFormation(particles, center, radius);
      break;

    case 'vortex':
      vortexFormation(particles, center, radius);
      break;

    case 'shield':
      shieldFormation(particles, center, radius);
      break;

    case 'fortress':
      fortressFormation(particles, center, radius);
      break;

    case 'spear':
      spearFormation(particles, center, radius);
      break;

    case 'swarm':
      swarmFormation(particles, center, radius);
      break;

    default:
      // Default to nucleus formation
      nucleusFormation(particles, center, radius);
      break;
  }

  // Store target positions
  particles.forEach(particle => {
    particle.transitionData.targetPosition = particle.targetPosition.clone();
  });

  // Update transition progress
  particles.forEach(particle => {
    particle.transitionData.progress += transitionSpeed;

    if (particle.transitionData.progress >= 1.0) {
      // Transition complete
      particle.transitionData.progress = 1.0;
    }

    // Interpolate between start and target positions
    const t = particle.transitionData.progress;
    particle.targetPosition.lerpVectors(
      particle.transitionData.startPosition,
      particle.transitionData.targetPosition,
      t
    );
  });

  // Check if transition is complete
  const transitionComplete = particles.every(p => p.transitionData.progress >= 1.0);

  if (transitionComplete) {
    // Clean up transition data
    particles.forEach(particle => {
      delete particle.transitionData;
    });
  }
}
```

### Environmental Responses

Formations respond to environmental factors such as obstacles, forces, and boundaries.

```typescript
// Apply environmental responses
function applyEnvironmentalResponses(particles: Particle[], environment: Environment): void {
  // Apply boundary constraints
  if (environment.boundaries) {
    applyBoundaryConstraints(particles, environment.boundaries);
  }

  // Apply obstacle avoidance
  if (environment.obstacles && environment.obstacles.length > 0) {
    applyObstacleAvoidance(particles, environment.obstacles);
  }

  // Apply environmental forces
  if (environment.forces && environment.forces.length > 0) {
    applyEnvironmentalForces(particles, environment.forces);
  }

  // Apply flow fields
  if (environment.flowField) {
    applyFlowField(particles, environment.flowField);
  }
}

// Example of boundary constraints
function applyBoundaryConstraints(particles: Particle[], boundaries: Boundary): void {
  const { min, max } = boundaries;

  particles.forEach(particle => {
    // Calculate distance to each boundary
    const distanceToMinX = particle.position.x - min.x;
    const distanceToMaxX = max.x - particle.position.x;
    const distanceToMinY = particle.position.y - min.y;
    const distanceToMaxY = max.y - particle.position.y;
    const distanceToMinZ = particle.position.z - min.z;
    const distanceToMaxZ = max.z - particle.position.z;

    // Apply repulsive forces near boundaries
    const boundaryForce = new Vector3(0, 0, 0);
    const boundaryThreshold = 5.0; // Distance at which boundary forces start
    const boundaryStrength = 0.5; // Strength of boundary forces

    if (distanceToMinX < boundaryThreshold) {
      boundaryForce.x += boundaryStrength * (1.0 - distanceToMinX / boundaryThreshold);
    }

    if (distanceToMaxX < boundaryThreshold) {
      boundaryForce.x -= boundaryStrength * (1.0 - distanceToMaxX / boundaryThreshold);
    }

    if (distanceToMinY < boundaryThreshold) {
      boundaryForce.y += boundaryStrength * (1.0 - distanceToMinY / boundaryThreshold);
    }

    if (distanceToMaxY < boundaryThreshold) {
      boundaryForce.y -= boundaryStrength * (1.0 - distanceToMaxY / boundaryThreshold);
    }

    if (distanceToMinZ < boundaryThreshold) {
      boundaryForce.z += boundaryStrength * (1.0 - distanceToMinZ / boundaryThreshold);
    }

    if (distanceToMaxZ < boundaryThreshold) {
      boundaryForce.z -= boundaryStrength * (1.0 - distanceToMaxZ / boundaryThreshold);
    }

    // Apply boundary force
    particle.acceleration.add(boundaryForce);
  });
}
```

### Inter-Group Interactions

Formations interact with other particle groups, creating complex emergent behaviors.

```typescript
// Apply inter-group interactions
function applyInterGroupInteractions(groups: ParticleGroup[]): void {
  // Process each pair of groups
  for (let i = 0; i < groups.length; i++) {
    for (let j = i + 1; j < groups.length; j++) {
      const groupA = groups[i];
      const groupB = groups[j];

      // Calculate interaction forces between groups
      calculateInterGroupForces(groupA, groupB);
    }
  }
}

// Calculate forces between two groups
function calculateInterGroupForces(groupA: ParticleGroup, groupB: ParticleGroup): void {
  // Get interaction parameters based on group roles
  const interactionParams = getInteractionParameters(groupA.role, groupB.role);

  // Apply forces based on interaction parameters
  groupA.particles.forEach(particleA => {
    groupB.particles.forEach(particleB => {
      // Calculate direction and distance
      const direction = new Vector3().subVectors(particleB.position, particleA.position);
      const distance = direction.length();

      // Skip if too far away
      if (distance > interactionParams.maxDistance) return;

      // Normalize direction
      direction.normalize();

      // Calculate force magnitude based on distance
      let forceMagnitude = 0;

      if (distance < interactionParams.repulsionDistance) {
        // Repulsive force (inverse square)
        forceMagnitude = -interactionParams.repulsionStrength *
          (1.0 - distance / interactionParams.repulsionDistance);
      } else if (distance < interactionParams.attractionDistance) {
        // Attractive force (linear)
        forceMagnitude = interactionParams.attractionStrength *
          (1.0 - (distance - interactionParams.repulsionDistance) /
                (interactionParams.attractionDistance - interactionParams.repulsionDistance));
      }

      // Apply force to both particles (equal and opposite)
      const force = direction.multiplyScalar(forceMagnitude);

      particleA.acceleration.add(force);
      particleB.acceleration.sub(force);
    });
  });
}

// Get interaction parameters based on group roles
function getInteractionParameters(roleA: string, roleB: string): InteractionParameters {
  // Default parameters
  const defaultParams = {
    maxDistance: 20.0,
    repulsionDistance: 5.0,
    repulsionStrength: 0.5,
    attractionDistance: 15.0,
    attractionStrength: 0.2
  };

  // Role-specific interactions
  if (roleA === 'CORE' && roleB === 'CONTROL') {
    // Core and Control have strong mutual attraction
    return {
      maxDistance: 30.0,
      repulsionDistance: 3.0,
      repulsionStrength: 0.3,
      attractionDistance: 25.0,
      attractionStrength: 0.6
    };
  } else if ((roleA === 'ATTACK' && roleB === 'DEFENSE') ||
             (roleA === 'DEFENSE' && roleB === 'ATTACK')) {
    // Attack and Defense have strong repulsion
    return {
      maxDistance: 25.0,
      repulsionDistance: 15.0,
      repulsionStrength: 0.8,
      attractionDistance: 20.0,
      attractionStrength: 0.1
    };
  } else if ((roleA === 'MOVEMENT' && roleB === 'CONTROL') ||
             (roleA === 'CONTROL' && roleB === 'MOVEMENT')) {
    // Movement and Control have moderate attraction
    return {
      maxDistance: 25.0,
      repulsionDistance: 4.0,
      repulsionStrength: 0.4,
      attractionDistance: 20.0,
      attractionStrength: 0.4
    };
  }

  // Default interaction parameters
  return defaultParams;
}
```

## Formation Implementation

Implementation details for formation patterns, focusing on efficient calculation and application of formation rules.

### Position Calculation

Efficient calculation of particle positions within formations:

```typescript
// Calculate particle positions for a formation
function calculateFormationPositions(
  particles: Particle[],
  formationType: string,
  center: Vector3,
  radius: number
): Vector3[] {
  // Array to store calculated positions
  const positions: Vector3[] = [];

  // Calculate positions based on formation type
  switch (formationType) {
    case 'nucleus':
      positions.push(...calculateNucleusPositions(particles.length, center, radius));
      break;

    case 'lattice':
      positions.push(...calculateLatticePositions(particles.length, center, radius));
      break;

    case 'spiral':
      positions.push(...calculateSpiralPositions(particles.length, center, radius));
      break;

    case 'orbital':
      positions.push(...calculateOrbitalPositions(particles.length, center, radius));
      break;

    case 'network':
      positions.push(...calculateNetworkPositions(particles.length, center, radius));
      break;

    case 'stream':
      positions.push(...calculateStreamPositions(particles.length, center, radius));
      break;

    case 'shield':
      positions.push(...calculateShieldPositions(particles.length, center, radius));
      break;

    default:
      // Default to nucleus formation
      positions.push(...calculateNucleusPositions(particles.length, center, radius));
      break;
  }

  return positions;
}

// Example of position calculation for nucleus formation
function calculateNucleusPositions(count: number, center: Vector3, radius: number): Vector3[] {
  const positions: Vector3[] = [];

  // Fibonacci sphere algorithm for even distribution
  const goldenRatio = (1 + Math.sqrt(5)) / 2;

  for (let i = 0; i < count; i++) {
    const y = 1 - (i / (count - 1)) * 2; // -1 to 1
    const radius_at_y = Math.sqrt(1 - y * y); // Radius at this y level (Pythagorean theorem)

    const theta = 2 * Math.PI * i / goldenRatio; // Golden angle increment

    const x = Math.cos(theta) * radius_at_y;
    const z = Math.sin(theta) * radius_at_y;

    // Scale by radius and add center offset
    positions.push(new Vector3(
      center.x + x * radius,
      center.y + y * radius,
      center.z + z * radius
    ));
  }

  return positions;
}

// Example of position calculation for lattice formation
function calculateLatticePositions(count: number, center: Vector3, radius: number): Vector3[] {
  const positions: Vector3[] = [];

  // Calculate grid dimensions
  const gridSize = Math.ceil(Math.cbrt(count));
  const spacing = (radius * 2) / gridSize;

  // Create grid positions
  let index = 0;
  for (let x = 0; x < gridSize && index < count; x++) {
    for (let y = 0; y < gridSize && index < count; y++) {
      for (let z = 0; z < gridSize && index < count; z++) {
        positions.push(new Vector3(
          center.x + (x - gridSize/2) * spacing,
          center.y + (y - gridSize/2) * spacing,
          center.z + (z - gridSize/2) * spacing
        ));

        index++;
      }
    }
  }

  return positions;
}
```

### Force Application

Applying forces to maintain formation structure and behavior:

```typescript
// Apply formation forces to particles
function applyFormationForces(particles: Particle[], formationType: string): void {
  // Calculate formation center
  const center = calculateFormationCenter(particles);

  // Apply different forces based on formation type
  switch (formationType) {
    case 'nucleus':
      applyNucleusForces(particles, center);
      break;

    case 'lattice':
      applyLatticeForces(particles, center);
      break;

    case 'spiral':
      applySpiralForces(particles, center);
      break;

    case 'orbital':
      applyOrbitalForces(particles, center);
      break;

    case 'network':
      applyNetworkForces(particles, center);
      break;

    case 'stream':
      applyStreamForces(particles, center);
      break;

    case 'shield':
      applyShieldForces(particles, center);
      break;

    default:
      // Default to basic cohesion and separation forces
      applyBasicFormationForces(particles, center);
      break;
  }
}

// Example of forces for nucleus formation
function applyNucleusForces(particles: Particle[], center: Vector3): void {
  // Parameters
  const cohesionStrength = 0.5;
  const separationStrength = 0.3;
  const separationDistance = 1.0;

  particles.forEach(particle => {
    // Vector from particle to center
    const toCenter = new Vector3().subVectors(center, particle.position);
    const distanceToCenter = toCenter.length();

    // Normalize direction
    toCenter.normalize();

    // Cohesion force (attraction to center)
    const cohesionForce = toCenter.clone().multiplyScalar(cohesionStrength * distanceToCenter);

    // Apply cohesion force
    particle.acceleration.add(cohesionForce);

    // Separation force (repulsion from other particles)
    const separationForce = new Vector3();

    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const toOther = new Vector3().subVectors(otherParticle.position, particle.position);
      const distance = toOther.length();

      if (distance < separationDistance) {
        // Calculate repulsion force (stronger at closer distances)
        const repulsionStrength = separationStrength * (1 - distance / separationDistance);
        separationForce.sub(toOther.normalize().multiplyScalar(repulsionStrength));
      }
    });

    // Apply separation force
    particle.acceleration.add(separationForce);
  });
}

// Example of forces for orbital formation
function applyOrbitalForces(particles: Particle[], center: Vector3): void {
  // Group particles by orbital shell
  const shells = groupParticlesByShell(particles, center);

  // Process each shell
  shells.forEach(shell => {
    const shellRadius = calculateShellRadius(shell, center);

    shell.forEach(particle => {
      // Calculate current distance from center
      const toCenter = new Vector3().subVectors(particle.position, center);
      const distanceToCenter = toCenter.length();

      // Force to maintain shell radius
      const radiusForce = (shellRadius - distanceToCenter) * 0.1;
      const radiusDirection = toCenter.clone().normalize();
      particle.acceleration.add(radiusDirection.multiplyScalar(radiusForce));

      // Calculate orbital velocity
      const orbitSpeed = 0.02 * (1 / Math.sqrt(shellRadius)); // Kepler's law: speed decreases with radius

      // Calculate orbital direction (perpendicular to radius vector in XZ plane)
      const orbitDirection = new Vector3(-toCenter.z, 0, toCenter.x).normalize();

      // Apply orbital force
      particle.acceleration.add(orbitDirection.multiplyScalar(orbitSpeed));
    });
  });
}

// Helper function to group particles by shell
function groupParticlesByShell(particles: Particle[], center: Vector3): Particle[][] {
  // Sort particles by distance from center
  const sortedParticles = [...particles].sort((a, b) => {
    const distA = a.position.distanceTo(center);
    const distB = b.position.distanceTo(center);
    return distA - distB;
  });

  // Determine shell boundaries
  const shellCount = Math.min(5, Math.max(2, Math.floor(Math.sqrt(particles.length / 10))));
  const shells: Particle[][] = Array(shellCount).fill(null).map(() => []);

  // Distribute particles to shells
  sortedParticles.forEach((particle, index) => {
    const shellIndex = Math.min(shellCount - 1, Math.floor(index * shellCount / particles.length));
    shells[shellIndex].push(particle);
  });

  return shells;
}

// Calculate average radius for a shell
function calculateShellRadius(shellParticles: Particle[], center: Vector3): number {
  if (shellParticles.length === 0) return 0;

  const totalDistance = shellParticles.reduce((sum, particle) => {
    return sum + particle.position.distanceTo(center);
  }, 0);

  return totalDistance / shellParticles.length;
}
```

### Stability Maintenance

Maintaining formation stability through corrective forces and adjustments:

```typescript
// Apply stability maintenance forces
function applyStabilityMaintenance(particles: Particle[], formationType: string): void {
  // Calculate current formation properties
  const center = calculateFormationCenter(particles);
  const stability = calculateFormationStability(particles);

  // Apply stronger corrective forces when stability is low
  const stabilityFactor = Math.max(0, 1.0 - stability);

  if (stabilityFactor > 0.2) {
    // Apply general stability forces
    particles.forEach(particle => {
      // Calculate target position based on formation type
      const targetPosition = calculateTargetPosition(particle, particles, formationType, center);

      // Calculate direction to target position
      const toTarget = new Vector3().subVectors(targetPosition, particle.position);
      const distance = toTarget.length();

      // Apply force toward target position (stronger when further away)
      const forceMagnitude = Math.min(1.0, distance * 0.1) * stabilityFactor;
      const force = toTarget.normalize().multiplyScalar(forceMagnitude);

      particle.acceleration.add(force);
    });
  }

  // Apply formation-specific stability maintenance
  switch (formationType) {
    case 'nucleus':
      // Maintain spherical shape
      applySphericalCorrection(particles, center, stabilityFactor);
      break;

    case 'lattice':
      // Maintain grid alignment
      applyGridCorrection(particles, center, stabilityFactor);
      break;

    case 'spiral':
      // Maintain spiral shape
      applySpiralCorrection(particles, center, stabilityFactor);
      break;

    // Add cases for other formation types
  }
}

// Example of spherical correction for nucleus formation
function applySphericalCorrection(particles: Particle[], center: Vector3, stabilityFactor: number): void {
  // Calculate average distance from center
  const avgDistance = particles.reduce((sum, particle) => {
    return sum + particle.position.distanceTo(center);
  }, 0) / particles.length;

  particles.forEach(particle => {
    // Calculate current distance from center
    const toCenter = new Vector3().subVectors(particle.position, center);
    const distance = toCenter.length();

    // Calculate correction force to maintain spherical shape
    const correction = (avgDistance - distance) * 0.05 * stabilityFactor;
    const correctionForce = toCenter.normalize().multiplyScalar(correction);

    // Apply correction force
    particle.acceleration.add(correctionForce);
  });
}
```

## Formation Rarity Tiers

Formation patterns are organized into rarity tiers, with rarer formations offering more complex and visually distinctive arrangements.

### Common Formations

Common formations are the most frequently occurring and serve as the foundation for particle organization:

```typescript
// Common formations (50% probability)
const commonFormations = {
  nucleus: {
    name: 'Nucleus',
    probability: 0.15,
    description: 'Dense, spherical arrangement with particles evenly distributed around a central point.',
    complexity: 'low',
    roles: ['CORE']
  },
  orbital: {
    name: 'Orbital',
    probability: 0.15,
    description: 'Particles arranged in concentric orbital shells around a central point.',
    complexity: 'low',
    roles: ['CONTROL']
  },
  stream: {
    name: 'Stream',
    probability: 0.10,
    description: 'Flowing, stream-like arrangement optimized for directional movement.',
    complexity: 'low',
    roles: ['MOVEMENT']
  },
  shield: {
    name: 'Shield',
    probability: 0.10,
    description: 'Curved, barrier-like formation providing directional protection.',
    complexity: 'low',
    roles: ['DEFENSE']
  },
  spear: {
    name: 'Spear',
    probability: 0.10,
    description: 'Concentrated, forward-focused formation optimized for piercing attacks.',
    complexity: 'low',
    roles: ['ATTACK']
  }
};

### Uncommon Formations

Uncommon formations occur less frequently and offer more complex organizational patterns:

```typescript
// Uncommon formations (30% probability)
const uncommonFormations = {
  lattice: {
    name: 'Lattice',
    probability: 0.08,
    description: 'Ordered, grid-like arrangement with particles in a crystalline structure.',
    complexity: 'medium',
    roles: ['CORE']
  },
  network: {
    name: 'Network',
    probability: 0.07,
    description: 'Interconnected nodes with particles forming a complex web-like structure.',
    complexity: 'medium',
    roles: ['CONTROL']
  },
  vortex: {
    name: 'Vortex',
    probability: 0.06,
    description: 'Swirling, tornado-like structure with strong rotational movement.',
    complexity: 'medium',
    roles: ['MOVEMENT']
  },
  fortress: {
    name: 'Fortress',
    probability: 0.05,
    description: 'Enclosed, multi-directional protective structure with high defensive capability.',
    complexity: 'medium',
    roles: ['DEFENSE']
  },
  swarm: {
    name: 'Swarm',
    probability: 0.04,
    description: 'Distributed, semi-random arrangement with unpredictable movement patterns.',
    complexity: 'medium',
    roles: ['ATTACK']
  }
};

### Rare Formations

Rare formations are visually distinctive and offer unique organizational advantages:

```typescript
// Rare formations (15% probability)
const rareFormations = {
  spiral: {
    name: 'Spiral',
    probability: 0.04,
    description: 'Elegant spiral structure with particles arranged in distinct arms.',
    complexity: 'high',
    roles: ['CORE']
  },
  hierarchical: {
    name: 'Hierarchical',
    probability: 0.03,
    description: 'Tree-like structure with clear organizational levels and command chain.',
    complexity: 'high',
    roles: ['CONTROL']
  },
  flock: {
    name: 'Flock',
    probability: 0.03,
    description: 'V-shaped, bird-like formation optimized for coordinated group movement.',
    complexity: 'high',
    roles: ['MOVEMENT']
  },
  sphere: {
    name: 'Sphere',
    probability: 0.03,
    description: 'Complete spherical protection with particles evenly distributed on the surface.',
    complexity: 'high',
    roles: ['DEFENSE']
  },
  pincer: {
    name: 'Pincer',
    probability: 0.02,
    description: 'Curved, dual-arm formation designed for encircling and trapping targets.',
    complexity: 'high',
    roles: ['ATTACK']
  }
};

### Epic Formations

Epic formations are rare and visually impressive, offering powerful organizational advantages:

```typescript
// Epic formations (3% probability)
const epicFormations = {
  fractal: {
    name: 'Fractal',
    probability: 0.01,
    description: 'Self-similar, recursive structure with patterns repeating at different scales.',
    complexity: 'very high',
    roles: ['CORE']
  },
  neural: {
    name: 'Neural',
    probability: 0.01,
    description: 'Brain-like network with complex interconnections and information processing.',
    complexity: 'very high',
    roles: ['CONTROL']
  },
  slipstream: {
    name: 'Slipstream',
    probability: 0.005,
    description: 'Aerodynamic formation with particles creating low-resistance channels.',
    complexity: 'very high',
    roles: ['MOVEMENT']
  },
  citadel: {
    name: 'Citadel',
    probability: 0.005,
    description: 'Multi-layered defensive structure with specialized zones and countermeasures.',
    complexity: 'very high',
    roles: ['DEFENSE']
  },
  hydra: {
    name: 'Hydra',
    probability: 0.005,
    description: 'Multi-headed attack formation with independent striking capabilities.',
    complexity: 'very high',
    roles: ['ATTACK']
  }
};

### Legendary Formations

Legendary formations are extremely rare and visually spectacular, offering powerful and unique advantages:

```typescript
// Legendary formations (1.5% probability)
const legendaryFormations = {
  tesseract: {
    name: 'Tesseract',
    probability: 0.005,
    description: 'Four-dimensional cube-like structure with particles arranged in hypercube pattern.',
    complexity: 'extreme',
    roles: ['CORE']
  },
  quantum: {
    name: 'Quantum',
    probability: 0.004,
    description: 'Particles existing in multiple states simultaneously, with probabilistic positioning.',
    complexity: 'extreme',
    roles: ['CONTROL']
  },
  phoenix: {
    name: 'Phoenix',
    probability: 0.003,
    description: 'Bird-like formation with dynamic, flowing wings and regenerative properties.',
    complexity: 'extreme',
    roles: ['MOVEMENT']
  },
  aegis: {
    name: 'Aegis',
    probability: 0.002,
    description: 'Legendary shield formation with adaptive, responsive defensive capabilities.',
    complexity: 'extreme',
    roles: ['DEFENSE']
  },
  kraken: {
    name: 'Kraken',
    probability: 0.001,
    description: 'Multi-tentacled attack formation capable of simultaneous strikes from all directions.',
    complexity: 'extreme',
    roles: ['ATTACK']
  }
};

### Mythic Formations

Mythic formations are the rarest and most visually stunning, offering legendary capabilities:

```typescript
// Mythic formations (0.5% probability)
const mythicFormations = {
  singularity: {
    name: 'Singularity',
    probability: 0.002,
    description: 'Particles arranged around a central point of infinite density, warping space around them.',
    complexity: 'mythic',
    roles: ['CORE'],
    special: true
  },
  omniscient: {
    name: 'Omniscient',
    probability: 0.001,
    description: 'All-seeing formation with particles arranged in patterns of perfect information flow.',
    complexity: 'mythic',
    roles: ['CONTROL'],
    special: true
  },
  chronos: {
    name: 'Chronos',
    probability: 0.001,
    description: 'Time-manipulating formation with particles moving in temporal harmony.',
    complexity: 'mythic',
    roles: ['MOVEMENT'],
    special: true
  },
  pantheon: {
    name: 'Pantheon',
    probability: 0.0005,
    description: 'Divine defensive formation creating an impenetrable sanctuary.',
    complexity: 'mythic',
    roles: ['DEFENSE'],
    special: true
  },
  apocalypse: {
    name: 'Apocalypse',
    probability: 0.0005,
    description: 'World-ending attack formation channeling cataclysmic force.',
    complexity: 'mythic',
    roles: ['ATTACK'],
    special: true
  }
};

// Combined formation registry with all rarity tiers
const formationRegistry = {
  ...commonFormations,
  ...uncommonFormations,
  ...rareFormations,
  ...epicFormations,
  ...legendaryFormations,
  ...mythicFormations
};
```

## Related Documents

- [Particle Shapes](02_particle_shapes.md) - For details on particle shapes
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Physics Engine](../physics/01_physics_engine.md) - For details on physics calculations
- [Trait System](../bitcoin/07_trait_system.md) - For details on the trait system architecture 
``` 
 
--- 
 
### 04_behavior_traits.md 
 
```.md 
# Behavior Traits

This document outlines the various behavior traits used in the Bitcoin Protozoa project, detailing how particles move and interact based on their roles and traits.

## Table of Contents

1. [Behavior Philosophy](#behavior-philosophy) [Line 20]
2. [Behavior Categories](#behavior-categories) [Line 40]
   - [Core Behaviors](#core-behaviors) [Line 45]
   - [Control Behaviors](#control-behaviors) [Line 100]
   - [Movement Behaviors](#movement-behaviors) [Line 150]
   - [Defense Behaviors](#defense-behaviors) [Line 200]
   - [Attack Behaviors](#attack-behaviors) [Line 250]
3. [Behavior Properties](#behavior-properties) [Line 300]
   - [Strength](#strength) [Line 305]
   - [Range](#range) [Line 330]
   - [Priority](#priority) [Line 355]
   - [Persistence](#persistence) [Line 380]
4. [Behavior Dynamics](#behavior-dynamics) [Line 410]
   - [Behavior Transitions](#behavior-transitions) [Line 415]
   - [Behavior Combinations](#behavior-combinations) [Line 450]
   - [Emergent Behaviors](#emergent-behaviors) [Line 485]
5. [Behavior Implementation](#behavior-implementation) [Line 520]
   - [Flocking Behavior](#flocking-behavior) [Line 525]
   - [Pulsation Behavior](#pulsation-behavior) [Line 560]
   - [Rotation Behavior](#rotation-behavior) [Line 595]
   - [Oscillation Behavior](#oscillation-behavior) [Line 630]
   - [Bifurcation Behavior](#bifurcation-behavior) [Line 665]
6. [Behavior Rarity Tiers](#behavior-rarity-tiers) [Line 700]
   - [Common Behaviors](#common-behaviors) [Line 705]
   - [Uncommon Behaviors](#uncommon-behaviors) [Line 740]
   - [Rare Behaviors](#rare-behaviors) [Line 775]
   - [Epic Behaviors](#epic-behaviors) [Line 810]
   - [Legendary Behaviors](#legendary-behaviors) [Line 845]
   - [Mythic Behaviors](#mythic-behaviors) [Line 880]
7. [Related Documents](#related-documents) [Line 915]

## Behavior Philosophy

Behavior traits in Bitcoin Protozoa define how particles move and interact, creating the dynamic and lifelike qualities of the creature. These behaviors are not simple animations but complex systems that respond to internal and external forces while maintaining their fundamental characteristics.

The behavior system follows these core principles:

1. **Role-Based Behaviors**: Each particle group exhibits behaviors appropriate to its functional role
2. **Emergent Complexity**: Simple behavioral rules lead to complex, emergent patterns and interactions
3. **Dynamic Adaptation**: Behaviors adapt to changing conditions while maintaining their core purpose
4. **Deterministic Generation**: Behavior traits are assigned deterministically based on the Bitcoin block nonce
5. **Visual Distinctiveness**: Each behavior type creates visually unique movement patterns for the creature

Behaviors influence not only the movement of particle groups but also their interactions with other groups and the environment. Different behaviors have different advantages in terms of efficiency, responsiveness, and coordination capabilities.

## Behavior Categories

Behavior categories are organized by particle role, with each role having behaviors that align with its function in the overall organism. These behaviors determine how particles move, respond to stimuli, and interact with other particles.

### Core Behaviors

Core behaviors focus on stability, influence, and coordination, serving as the central organizing force for the entire creature.

#### Central Pulsation

```typescript
// Central pulsation behavior - rhythmic expansion and contraction
function centralPulsationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define pulsation parameters
  const frequency = 0.05; // Oscillations per frame
  const amplitude = strength * 0.2; // Maximum displacement
  const phase = Date.now() * 0.001; // Time-based phase

  particles.forEach(particle => {
    // Calculate distance from center
    const distanceToCenter = particle.position.distanceTo(center);

    // Calculate pulsation factor based on time
    const pulseFactor = Math.sin(phase * frequency) * amplitude;

    // Direction from center to particle
    const direction = new Vector3().subVectors(particle.position, center).normalize();

    // Apply pulsation force
    const pulseForce = direction.multiplyScalar(pulseFactor);
    particle.acceleration.add(pulseForce);

    // Set behavior-specific properties
    particle.behaviorType = 'pulsation';
    particle.pulsationPhase = phase;
    particle.pulsationAmplitude = amplitude;
    particle.pulsationFrequency = frequency;
  });
}
```

**Characteristics**:
- Rhythmic expansion and contraction
- Synchronized movement
- Stable central position
- Influence radiates outward

**Role Affinity**: CORE

**Rarity Tier**: Common

#### Orbital Influence

```typescript
// Orbital influence behavior - particles orbit while exerting influence
function orbitalInfluenceBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define orbital parameters
  const orbitSpeed = strength * 0.03; // Rotation speed
  const influenceRadius = 5.0; // Radius of influence

  particles.forEach(particle => {
    // Calculate current angle and distance
    const toParticle = new Vector3().subVectors(particle.position, center);
    const distance = toParticle.length();
    const currentAngle = Math.atan2(toParticle.z, toParticle.x);

    // Calculate new angle
    const newAngle = currentAngle + orbitSpeed;

    // Calculate new position
    const newX = center.x + Math.cos(newAngle) * distance;
    const newZ = center.z + Math.sin(newAngle) * distance;

    // Create target position
    const targetPosition = new Vector3(newX, particle.position.y, newZ);

    // Calculate direction to target
    const direction = new Vector3().subVectors(targetPosition, particle.position).normalize();

    // Apply orbital force
    const orbitalForce = direction.multiplyScalar(strength);
    particle.acceleration.add(orbitalForce);

    // Influence nearby particles
    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const distanceToOther = particle.position.distanceTo(otherParticle.position);

      if (distanceToOther < influenceRadius) {
        // Calculate influence strength (stronger at closer distances)
        const influenceStrength = strength * 0.5 * (1 - distanceToOther / influenceRadius);

        // Direction from particle to other
        const influenceDirection = new Vector3().subVectors(particle.position, otherParticle.position).normalize();

        // Apply influence force
        otherParticle.acceleration.add(influenceDirection.multiplyScalar(influenceStrength));
      }
    });

    // Set behavior-specific properties
    particle.behaviorType = 'orbital';
    particle.orbitalAngle = newAngle;
    particle.orbitalDistance = distance;
    particle.influenceRadius = influenceRadius;
  });
}
```

**Characteristics**:
- Stable orbital movement
- Influence on surrounding particles
- Gravitational-like effects
- Coordinated group movement

**Role Affinity**: CORE

**Rarity Tier**: Uncommon

#### Quantum Fluctuation

```typescript
// Quantum fluctuation behavior - unpredictable micro-movements with stabilizing influence
function quantumFluctuationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define fluctuation parameters
  const fluctuationScale = strength * 0.1; // Scale of random movements
  const stabilizationFactor = 0.7; // How quickly fluctuations stabilize
  const influenceRadius = 4.0; // Radius of stabilizing influence

  particles.forEach(particle => {
    // Generate pseudo-random fluctuation using particle ID and time
    const seed = particle.id * 0.1 + Date.now() * 0.0001;
    const noise = new Vector3(
      Math.sin(seed * 0.7) * 2 - 1,
      Math.sin(seed * 1.3) * 2 - 1,
      Math.sin(seed * 2.1) * 2 - 1
    );

    // Apply fluctuation force
    const fluctuationForce = noise.multiplyScalar(fluctuationScale);
    particle.acceleration.add(fluctuationForce);

    // Calculate distance from center
    const distanceToCenter = particle.position.distanceTo(center);

    // Apply stabilizing force toward center
    const toCenter = new Vector3().subVectors(center, particle.position).normalize();
    const stabilizingForce = toCenter.multiplyScalar(distanceToCenter * stabilizationFactor * strength);
    particle.acceleration.add(stabilizingForce);

    // Stabilizing influence on nearby particles
    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const distanceToOther = particle.position.distanceTo(otherParticle.position);

      if (distanceToOther < influenceRadius) {
        // Calculate stabilizing influence (stronger at closer distances)
        const influenceStrength = strength * 0.3 * (1 - distanceToOther / influenceRadius);

        // Direction from particle to other
        const influenceDirection = new Vector3().subVectors(particle.position, otherParticle.position).normalize();

        // Apply stabilizing influence
        otherParticle.acceleration.add(influenceDirection.multiplyScalar(influenceStrength));
      }
    });

    // Set behavior-specific properties
    particle.behaviorType = 'quantum';
    particle.fluctuationScale = fluctuationScale;
    particle.stabilizationFactor = stabilizationFactor;
    particle.influenceRadius = influenceRadius;
  });
}
```

**Characteristics**:
- Unpredictable micro-movements
- Overall stability maintained
- Complex, quantum-like behavior
- Subtle influence on surrounding particles

**Role Affinity**: CORE

**Rarity Tier**: Rare

### Control Behaviors

Control behaviors focus on coordination, direction, and regulation, serving as the decision-making system for the creature.

#### Gyroscopic Rotation

```typescript
// Gyroscopic rotation behavior - stable rotation with directional influence
function gyroscopicRotationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define rotation parameters
  const rotationSpeed = strength * 0.04; // Base rotation speed
  const axisVariation = 0.2; // Variation in rotation axis
  const influenceStrength = strength * 0.6; // Strength of directional influence

  // Calculate rotation axis (slightly randomized)
  const seed = Date.now() * 0.0001;
  const rotationAxis = new Vector3(
    Math.sin(seed * 1.1) * axisVariation,
    1.0, // Primary rotation around Y axis
    Math.sin(seed * 0.7) * axisVariation
  ).normalize();

  particles.forEach(particle => {
    // Calculate vector from center to particle
    const toParticle = new Vector3().subVectors(particle.position, center);

    // Calculate rotation force (cross product with rotation axis)
    const rotationForce = new Vector3().crossVectors(rotationAxis, toParticle).normalize();

    // Apply rotation force
    particle.acceleration.add(rotationForce.multiplyScalar(rotationSpeed));

    // Calculate directional influence
    // This creates a tendency for the entire creature to move in a specific direction
    const movementDirection = new Vector3(Math.sin(seed * 2.3), 0, Math.cos(seed * 2.3)).normalize();
    particle.acceleration.add(movementDirection.multiplyScalar(influenceStrength * 0.1));

    // Set behavior-specific properties
    particle.behaviorType = 'gyroscopic';
    particle.rotationAxis = rotationAxis.clone();
    particle.rotationSpeed = rotationSpeed;
    particle.influenceDirection = movementDirection.clone();
  });
}
```

**Characteristics**:
- Stable rotation around a central axis
- Directional influence on creature movement
- Gyroscope-like stabilizing effect
- Coordinated group movement

**Role Affinity**: CONTROL

**Rarity Tier**: Common

#### Harmonic Oscillation

```typescript
// Harmonic oscillation behavior - coordinated wave-like movements
function harmonicOscillationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define oscillation parameters
  const baseFrequency = 0.04 * strength; // Base oscillation frequency
  const amplitude = 0.3 * strength; // Oscillation amplitude
  const phaseOffset = 0.5; // Phase offset between particles
  const time = Date.now() * 0.001; // Current time for oscillation

  // Sort particles by distance from center for wave propagation
  const sortedParticles = [...particles].sort((a, b) => {
    const distA = a.position.distanceTo(center);
    const distB = b.position.distanceTo(center);
    return distA - distB;
  });

  // Calculate average position for group coordination
  const avgPosition = new Vector3();
  particles.forEach(p => avgPosition.add(p.position));
  avgPosition.divideScalar(particles.length);

  // Apply oscillation to each particle
  sortedParticles.forEach((particle, index) => {
    // Calculate phase based on index (creates wave effect)
    const phase = index / sortedParticles.length * Math.PI * 2 * phaseOffset;

    // Calculate oscillation factor
    const oscillationFactor = Math.sin(time * baseFrequency + phase) * amplitude;

    // Calculate oscillation direction (perpendicular to radius)
    const toParticle = new Vector3().subVectors(particle.position, center);
    const oscillationDir = new Vector3().crossVectors(toParticle, new Vector3(0, 1, 0)).normalize();

    // Apply oscillation force
    const oscillationForce = oscillationDir.multiplyScalar(oscillationFactor);
    particle.acceleration.add(oscillationForce);

    // Apply cohesion force toward average position (keeps group together)
    const toAvg = new Vector3().subVectors(avgPosition, particle.position);
    const cohesionForce = toAvg.multiplyScalar(0.01 * strength);
    particle.acceleration.add(cohesionForce);

    // Set behavior-specific properties
    particle.behaviorType = 'harmonic';
    particle.oscillationPhase = phase;
    particle.oscillationAmplitude = amplitude;
    particle.oscillationFrequency = baseFrequency;
  });
}
```

**Characteristics**:
- Wave-like oscillating movement
- Coordinated group behavior
- Rhythmic, harmonic patterns
- Maintains group cohesion

**Role Affinity**: CONTROL

**Rarity Tier**: Uncommon

#### Consensus Movement

```typescript
// Consensus movement behavior - group decision-making for movement direction
function consensusMovementBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define consensus parameters
  const decisionThreshold = 0.7; // Threshold for consensus
  const influenceRadius = 4.0; // Radius of influence
  const maxSpeed = strength * 0.5; // Maximum movement speed
  const time = Date.now() * 0.001; // Current time

  // Calculate current consensus direction (changes slowly over time)
  const consensusDirection = new Vector3(
    Math.sin(time * 0.1),
    Math.sin(time * 0.07) * 0.3, // Less vertical movement
    Math.cos(time * 0.1)
  ).normalize();

  // Track individual particle directions
  const particleDirections = new Map<number, Vector3>();

  // First pass: determine individual preferred directions
  particles.forEach(particle => {
    // Calculate preferred direction based on particle properties
    const particleId = particle.id;
    const seed = particleId * 0.1 + time * 0.2;

    // Individual preference with some randomness
    const preferredDirection = new Vector3(
      Math.sin(seed * 1.1),
      Math.sin(seed * 0.7) * 0.2, // Less vertical movement
      Math.cos(seed * 1.1)
    ).normalize();

    // Store preferred direction
    particleDirections.set(particleId, preferredDirection);
  });

  // Second pass: calculate consensus and apply movement
  particles.forEach(particle => {
    // Get this particle's preferred direction
    const preferredDirection = particleDirections.get(particle.id);

    // Initialize influence vectors
    let influenceCount = 1; // Count self
    const aggregateDirection = preferredDirection.clone();

    // Consider nearby particles' directions
    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const distance = particle.position.distanceTo(otherParticle.position);

      if (distance < influenceRadius) {
        // Get other particle's direction
        const otherDirection = particleDirections.get(otherParticle.id);

        // Add to aggregate (weighted by distance)
        const weight = 1 - (distance / influenceRadius);
        aggregateDirection.add(otherDirection.clone().multiplyScalar(weight));
        influenceCount += weight;
      }
    });

    // Normalize aggregate direction
    aggregateDirection.divideScalar(influenceCount);

    // Blend with consensus direction based on threshold
    const finalDirection = new Vector3()
      .addVectors(
        aggregateDirection.multiplyScalar(1 - decisionThreshold),
        consensusDirection.multiplyScalar(decisionThreshold)
      )
      .normalize();

    // Apply movement force
    const movementForce = finalDirection.multiplyScalar(maxSpeed);
    particle.acceleration.add(movementForce);

    // Set behavior-specific properties
    particle.behaviorType = 'consensus';
    particle.consensusThreshold = decisionThreshold;
    particle.preferredDirection = preferredDirection.clone();
    particle.finalDirection = finalDirection.clone();
  });
}
```

**Characteristics**:
- Group decision-making for movement
- Balance between individual and group preferences
- Coordinated directional changes
- Emergent leadership dynamics

**Role Affinity**: CONTROL

**Rarity Tier**: Rare

### Movement Behaviors

Movement behaviors focus on propulsion, navigation, and mobility, serving as the locomotion system for the creature.

#### Flocking

```typescript
// Flocking behavior - coordinated group movement based on separation, alignment, and cohesion
function flockingBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define flocking parameters
  const perceptionRadius = 3.0; // How far a particle can "see" others
  const separationWeight = 1.5 * strength; // Weight for separation force
  const alignmentWeight = 1.0 * strength; // Weight for alignment force
  const cohesionWeight = 1.0 * strength; // Weight for cohesion force
  const maxSpeed = 0.5 * strength; // Maximum speed

  particles.forEach(particle => {
    // Initialize forces
    const separation = new Vector3();
    const alignment = new Vector3();
    const cohesion = new Vector3();

    // Count neighbors for averaging
    let separationCount = 0;
    let alignmentCount = 0;
    let cohesionCount = 0;

    // Check interactions with other particles
    particles.forEach(other => {
      if (other === particle) return;

      const distance = particle.position.distanceTo(other.position);

      if (distance < perceptionRadius) {
        // Separation: steer away from nearby particles
        if (distance < perceptionRadius * 0.5) {
          const diff = new Vector3().subVectors(particle.position, other.position);
          diff.divideScalar(distance); // Weight by distance (closer = stronger)
          separation.add(diff);
          separationCount++;
        }

        // Alignment: steer towards average heading of neighbors
        alignment.add(other.velocity);
        alignmentCount++;

        // Cohesion: steer towards center of mass of neighbors
        cohesion.add(other.position);
        cohesionCount++;
      }
    });

    // Calculate final forces
    if (separationCount > 0) {
      separation.divideScalar(separationCount);
      separation.normalize().multiplyScalar(separationWeight);
    }

    if (alignmentCount > 0) {
      alignment.divideScalar(alignmentCount);
      alignment.normalize().multiplyScalar(alignmentWeight);
    }

    if (cohesionCount > 0) {
      cohesion.divideScalar(cohesionCount);
      cohesion.sub(particle.position); // Direction to center of mass
      cohesion.normalize().multiplyScalar(cohesionWeight);
    }

    // Apply combined flocking force
    const flockingForce = new Vector3().add(separation).add(alignment).add(cohesion);

    // Limit to max speed
    if (flockingForce.length() > maxSpeed) {
      flockingForce.normalize().multiplyScalar(maxSpeed);
    }

    // Apply force
    particle.acceleration.add(flockingForce);

    // Set behavior-specific properties
    particle.behaviorType = 'flocking';
    particle.separationWeight = separationWeight;
    particle.alignmentWeight = alignmentWeight;
    particle.cohesionWeight = cohesionWeight;
    particle.perceptionRadius = perceptionRadius;
  });
}
```

**Characteristics**:
- Coordinated group movement
- Natural, organic motion
- Emergent patterns
- Adaptive navigation

**Role Affinity**: MOVEMENT

**Rarity Tier**: Common

#### Wave Propagation

```typescript
// Wave propagation behavior - movement in wave-like patterns
function wavePropagationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define wave parameters
  const waveSpeed = 0.05 * strength; // Wave propagation speed
  const waveAmplitude = 0.4 * strength; // Wave height
  const waveLength = 10.0; // Wave length
  const time = Date.now() * 0.001; // Current time

  // Sort particles by distance from center for wave propagation
  const sortedParticles = [...particles].sort((a, b) => {
    const distA = a.position.distanceTo(center);
    const distB = b.position.distanceTo(center);
    return distA - distB;
  });

  // Apply wave movement to each particle
  sortedParticles.forEach((particle, index) => {
    // Calculate phase based on index and time
    const phase = (index / sortedParticles.length) * Math.PI * 2 - time * waveSpeed;

    // Calculate wave displacement
    const displacement = Math.sin(phase) * waveAmplitude;

    // Calculate wave direction (perpendicular to radius)
    const toParticle = new Vector3().subVectors(particle.position, center);
    const distance = toParticle.length();

    // Primary wave direction (vertical)
    const waveDir = new Vector3(0, 1, 0);

    // Secondary wave direction (circular)
    const circularDir = new Vector3().crossVectors(toParticle.normalize(), waveDir).normalize();

    // Combine directions based on distance from center
    const combinedDir = new Vector3()
      .addVectors(
        waveDir.clone().multiplyScalar(0.7),
        circularDir.multiplyScalar(0.3)
      )
      .normalize();

    // Apply wave force
    const waveForce = combinedDir.multiplyScalar(displacement);
    particle.acceleration.add(waveForce);

    // Forward propagation force (moves the entire group)
    const propagationDir = new Vector3(Math.sin(time * 0.2), 0, Math.cos(time * 0.2)).normalize();
    const propagationForce = propagationDir.multiplyScalar(0.02 * strength);
    particle.acceleration.add(propagationForce);

    // Set behavior-specific properties
    particle.behaviorType = 'wave';
    particle.wavePhase = phase;
    particle.waveAmplitude = waveAmplitude;
    particle.waveSpeed = waveSpeed;
  });
}
```

**Characteristics**:
- Wave-like movement patterns
- Coordinated propagation
- Fluid, organic motion
- Directional group movement

**Role Affinity**: MOVEMENT

**Rarity Tier**: Uncommon

#### Quantum Propulsion

```typescript
// Quantum propulsion behavior - rapid teleportation-like movement
function quantumPropulsionBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define quantum propulsion parameters
  const jumpProbability = 0.01 * strength; // Probability of quantum jump per frame
  const maxJumpDistance = 2.0 * strength; // Maximum jump distance
  const recoveryTime = 30; // Frames to recover between jumps
  const time = Date.now() * 0.001; // Current time

  // Calculate group direction (changes slowly over time)
  const groupDirection = new Vector3(
    Math.sin(time * 0.1),
    Math.sin(time * 0.07) * 0.2, // Less vertical movement
    Math.cos(time * 0.1)
  ).normalize();

  particles.forEach(particle => {
    // Initialize or update particle's quantum state
    if (!particle.quantumState) {
      particle.quantumState = {
        lastJumpTime: 0,
        recoveryCounter: 0,
        jumpDirection: new Vector3()
      };
    }

    // Update recovery counter
    if (particle.quantumState.recoveryCounter > 0) {
      particle.quantumState.recoveryCounter--;
    }

    // Determine if particle should jump
    const shouldJump = Math.random() < jumpProbability && particle.quantumState.recoveryCounter === 0;

    if (shouldJump) {
      // Calculate jump direction (biased toward group direction)
      const randomFactor = 0.3; // How much randomness to add
      const jumpDirection = new Vector3()
        .addVectors(
          groupDirection.clone().multiplyScalar(1 - randomFactor),
          new Vector3(
            Math.random() * 2 - 1,
            (Math.random() * 2 - 1) * 0.2, // Less vertical
            Math.random() * 2 - 1
          ).normalize().multiplyScalar(randomFactor)
        )
        .normalize();

      // Calculate jump distance (random within max)
      const jumpDistance = Math.random() * maxJumpDistance;

      // Apply "teleportation" by adding a very strong impulse
      const jumpForce = jumpDirection.multiplyScalar(jumpDistance * 5.0);
      particle.acceleration.add(jumpForce);

      // Store jump data
      particle.quantumState.lastJumpTime = time;
      particle.quantumState.recoveryCounter = recoveryTime;
      particle.quantumState.jumpDirection = jumpDirection.clone();

      // Visual effect - store for rendering
      particle.jumpEffect = {
        active: true,
        startTime: time,
        direction: jumpDirection.clone(),
        distance: jumpDistance
      };
    } else {
      // Normal movement - follow group with some randomness
      const normalForce = groupDirection.clone().multiplyScalar(0.05 * strength);

      // Add small random movement
      const randomForce = new Vector3(
        (Math.random() * 2 - 1) * 0.01,
        (Math.random() * 2 - 1) * 0.005,
        (Math.random() * 2 - 1) * 0.01
      );

      particle.acceleration.add(normalForce).add(randomForce);

      // Clear jump effect
      if (particle.jumpEffect) {
        particle.jumpEffect.active = false;
      }
    }

    // Set behavior-specific properties
    particle.behaviorType = 'quantum-propulsion';
    particle.jumpProbability = jumpProbability;
    particle.maxJumpDistance = maxJumpDistance;
  });
}
```

**Characteristics**:
- Rapid, teleportation-like movement
- Unpredictable jumps with overall direction
- Coordinated group quantum leaps
- Energy-efficient long-distance travel

**Role Affinity**: MOVEMENT

**Rarity Tier**: Rare

### Defense Behaviors

Defense behaviors focus on protection, resilience, and threat response, serving as the protective system for the creature.

#### Phase Shifting

```typescript
// Phase shifting behavior - rapidly shifts between different defensive states
function phaseShiftingBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define phase shifting parameters
  const phaseCount = 3; // Number of different phases
  const phaseDuration = 2.0; // Duration of each phase in seconds
  const transitionSpeed = 0.3 * strength; // Speed of transition between phases
  const time = Date.now() * 0.001; // Current time

  // Calculate current phase and transition progress
  const phaseTime = time % (phaseCount * phaseDuration);
  const currentPhase = Math.floor(phaseTime / phaseDuration);
  const nextPhase = (currentPhase + 1) % phaseCount;
  const phaseProgress = (phaseTime % phaseDuration) / phaseDuration;

  // Define phase configurations
  const phaseConfigs = [
    { // Phase 0: Spherical barrier
      shape: 'sphere',
      radius: 5.0,
      density: 1.0
    },
    { // Phase 1: Expanded disk
      shape: 'disk',
      radius: 7.0,
      thickness: 1.0,
      density: 0.7
    },
    { // Phase 2: Dual-layer barrier
      shape: 'dual-sphere',
      innerRadius: 4.0,
      outerRadius: 6.0,
      density: 0.8
    }
  ];

  // Get current and next phase configs
  const currentConfig = phaseConfigs[currentPhase];
  const nextConfig = phaseConfigs[nextPhase];

  // Apply phase-shifting behavior to particles
  particles.forEach(particle => {
    // Calculate particle's target position based on current phase
    let currentTarget = new Vector3();
    let nextTarget = new Vector3();

    // Calculate particle index and ratio for position determination
    const particleIndex = particle.id % particles.length;
    const particleRatio = particleIndex / particles.length;

    // Calculate positions for current phase
    switch (currentConfig.shape) {
      case 'sphere':
        // Spherical distribution
        const phi1 = particleRatio * Math.PI * 2;
        const theta1 = Math.acos(2 * (particleIndex / particles.length) - 1);
        currentTarget.set(
          center.x + currentConfig.radius * Math.sin(theta1) * Math.cos(phi1),
          center.y + currentConfig.radius * Math.cos(theta1),
          center.z + currentConfig.radius * Math.sin(theta1) * Math.sin(phi1)
        );
        break;

      case 'disk':
        // Disk distribution
        const diskAngle = particleRatio * Math.PI * 2;
        const diskRadius = currentConfig.radius * Math.sqrt(Math.random()); // For even distribution
        const diskHeight = (Math.random() - 0.5) * currentConfig.thickness;
        currentTarget.set(
          center.x + diskRadius * Math.cos(diskAngle),
          center.y + diskHeight,
          center.z + diskRadius * Math.sin(diskAngle)
        );
        break;

      case 'dual-sphere':
        // Dual-layer spherical distribution
        const phi2 = particleRatio * Math.PI * 2;
        const theta2 = Math.acos(2 * (particleIndex / particles.length) - 1);
        const useInnerSphere = particleIndex < particles.length * 0.4; // 40% on inner sphere
        const sphereRadius = useInnerSphere ? currentConfig.innerRadius : currentConfig.outerRadius;
        currentTarget.set(
          center.x + sphereRadius * Math.sin(theta2) * Math.cos(phi2),
          center.y + sphereRadius * Math.cos(theta2),
          center.z + sphereRadius * Math.sin(theta2) * Math.sin(phi2)
        );
        break;
    }

    // Calculate positions for next phase (similar logic)
    // ... (similar switch statement for nextTarget based on nextConfig)

    // For brevity, we'll just use a simplified version for the example
    const nextPhi = particleRatio * Math.PI * 2;
    const nextTheta = Math.acos(2 * (particleIndex / particles.length) - 1);
    const nextRadius = nextConfig.shape === 'disk' ? nextConfig.radius :
                      (nextConfig.shape === 'dual-sphere' ?
                       (particleIndex < particles.length * 0.4 ? nextConfig.innerRadius : nextConfig.outerRadius) :
                       nextConfig.radius);

    nextTarget.set(
      center.x + nextRadius * Math.sin(nextTheta) * Math.cos(nextPhi),
      center.y + (nextConfig.shape === 'disk' ? (Math.random() - 0.5) * nextConfig.thickness : nextRadius * Math.cos(nextTheta)),
      center.z + nextRadius * Math.sin(nextTheta) * Math.sin(nextPhi)
    );

    // Interpolate between current and next target based on phase progress
    const targetPosition = new Vector3().lerpVectors(currentTarget, nextTarget, phaseProgress);

    // Calculate force toward target position
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const targetDistance = toTarget.length();

    // Apply force toward target position
    const forceMagnitude = Math.min(targetDistance * 0.2, 1.0) * strength * transitionSpeed;
    const phaseForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(phaseForce);

    // Set behavior-specific properties
    particle.behaviorType = 'phase-shift';
    particle.currentPhase = currentPhase;
    particle.phaseProgress = phaseProgress;
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Shifts between multiple defensive formations
- Unpredictable protection patterns
- Adaptive to different threat types
- Energy-efficient defense system

**Role Affinity**: DEFENSE

**Rarity Tier**: Rare

#### Reactive Shielding

```typescript
// Reactive shielding behavior - responds dynamically to threats
function reactiveShieldingBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define shielding parameters
  const baseRadius = 4.0; // Base radius of the shield
  const maxExpansion = 2.0; // Maximum expansion when reacting
  const reactionSpeed = 0.2 * strength; // How quickly shield reacts
  const recoveryRate = 0.05; // How quickly shield returns to normal
  const time = Date.now() * 0.001; // Current time

  // Simulate threat detection
  // In a real implementation, this would come from an actual threat detection system
  const threatDirection = new Vector3(
    Math.sin(time * 0.3),
    Math.sin(time * 0.2),
    Math.cos(time * 0.3)
  ).normalize();

  const threatIntensity = (Math.sin(time * 0.5) + 1) * 0.5; // 0 to 1
  const threatDistance = 10 + Math.sin(time * 0.2) * 5; // Distance of threat

  // Calculate shield expansion based on threat
  const shieldExpansion = threatIntensity * maxExpansion;

  // Group particles by their position relative to the threat
  particles.forEach(particle => {
    // Calculate particle's position relative to center
    const relativePos = new Vector3().subVectors(particle.position, center);
    const distance = relativePos.length();
    const direction = relativePos.clone().normalize();

    // Calculate dot product with threat direction to determine if particle
    // is on the threat-facing side
    const dotWithThreat = direction.dot(threatDirection);

    // Calculate target radius - expand more on threat-facing side
    let targetRadius = baseRadius;
    if (dotWithThreat > 0) {
      // Expand more in threat direction
      targetRadius += shieldExpansion * dotWithThreat;
    }

    // Calculate target position
    const targetPosition = new Vector3()
      .addVectors(
        center,
        direction.multiplyScalar(targetRadius)
      );

    // Calculate force toward target position
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const targetDistance = toTarget.length();

    // Stronger force when further from target position
    const forceMagnitude = Math.min(targetDistance * 0.2, 1.0) * strength;
    const shieldForce = toTarget.normalize().multiplyScalar(forceMagnitude);

    // Apply shield force
    particle.acceleration.add(shieldForce);

    // If on threat-facing side, add additional behaviors
    if (dotWithThreat > 0.2) {
      // Increase density in threat direction
      const densityForce = direction.clone().multiplyScalar(0.05 * strength * dotWithThreat);
      particle.acceleration.add(densityForce);

      // Add slight oscillation for energy field effect
      const oscillation = Math.sin(time * 5 + particle.id * 0.1) * 0.02 * strength;
      const oscillationForce = direction.clone().multiplyScalar(oscillation);
      particle.acceleration.add(oscillationForce);
    }

    // Set behavior-specific properties
    particle.behaviorType = 'reactive-shield';
    particle.shieldRadius = targetRadius;
    particle.threatResponse = dotWithThreat > 0 ? 'active' : 'passive';
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Dynamically responds to threats
- Concentrates particles in threat direction
- Energy field-like oscillation
- Adaptive protection system

**Role Affinity**: DEFENSE

**Rarity Tier**: Uncommon

#### Barrier Formation

```typescript
// Barrier formation behavior - creates protective barriers around vital areas
function barrierFormationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define barrier parameters
  const barrierRadius = 5.0; // Radius of the protective barrier
  const barrierThickness = 1.0; // Thickness of the barrier
  const barrierStrength = strength * 2.0; // Strength of the barrier
  const rotationSpeed = 0.01 * strength; // Rotation speed of the barrier
  const time = Date.now() * 0.001; // Current time

  // Determine what to protect (typically the CORE)
  const protectionTarget = center;

  // Calculate rotation angle
  const rotationAngle = time * rotationSpeed;

  particles.forEach(particle => {
    // Calculate ideal position on the barrier
    // Use particle's ID to determine its position on the barrier
    const particleIndex = particle.id % particles.length;
    const particleRatio = particleIndex / particles.length;

    // Calculate position on sphere using spherical coordinates
    const phi = particleRatio * Math.PI * 2; // Horizontal angle
    const theta = Math.acos(2 * Math.random() - 1); // Vertical angle for even distribution

    // Apply rotation over time
    const rotatedPhi = phi + rotationAngle;

    // Convert to Cartesian coordinates
    const x = protectionTarget.x + barrierRadius * Math.sin(theta) * Math.cos(rotatedPhi);
    const y = protectionTarget.y + barrierRadius * Math.cos(theta);
    const z = protectionTarget.z + barrierRadius * Math.sin(theta) * Math.sin(rotatedPhi);

    // Create target position
    const targetPosition = new Vector3(x, y, z);

    // Calculate direction and distance to target
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const distance = toTarget.length();

    // Apply force toward target position (stronger when further away)
    const forceMagnitude = Math.min(distance * 0.1, 0.5) * barrierStrength;
    const barrierForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(barrierForce);

    // Detect and respond to threats
    // This is a simplified threat detection - in a real implementation,
    // you would have a threat detection system that identifies external threats
    const threatDirection = new Vector3(
      Math.sin(time * 0.3),
      Math.sin(time * 0.2),
      Math.cos(time * 0.3)
    ).normalize();

    // Calculate if this particle is on the threat-facing side of the barrier
    const particleDirection = new Vector3().subVectors(particle.position, protectionTarget).normalize();
    const dotProduct = particleDirection.dot(threatDirection);

    // If particle is on the threat-facing side, strengthen the barrier
    if (dotProduct > 0.2) {
      // Move slightly outward to intercept threat
      const interceptForce = particleDirection.multiplyScalar(0.1 * strength);
      particle.acceleration.add(interceptForce);

      // Increase density in threat direction
      const lateralForce = new Vector3().crossVectors(particleDirection, new Vector3(0, 1, 0))
        .normalize()
        .multiplyScalar(0.05 * strength * (1 - dotProduct));
      particle.acceleration.add(lateralForce);
    }

    // Set behavior-specific properties
    particle.behaviorType = 'barrier';
    particle.barrierRadius = barrierRadius;
    particle.barrierStrength = barrierStrength;
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Forms protective spherical barrier
- Adapts to threat direction
- Rotates to provide complete coverage
- Prioritizes defense of vital areas

**Role Affinity**: DEFENSE

**Rarity Tier**: Common

### Attack Behaviors

Attack behaviors focus on offense, threat detection, and strategic positioning, serving as the offensive system for the creature.

#### Patrol Formation

```typescript
// Patrol formation behavior - systematic movement to detect threats
function patrolFormationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define patrol parameters
  const patrolRadius = 8.0; // Radius of patrol area
  const patrolSpeed = 0.05 * strength; // Speed of patrol movement
  const formationSpread = 2.0; // Spread of particles in formation
  const time = Date.now() * 0.001; // Current time

  // Calculate patrol center (moves in a circular pattern)
  const patrolCenterX = center.x + Math.sin(time * 0.2) * patrolRadius;
  const patrolCenterZ = center.z + Math.cos(time * 0.2) * patrolRadius;
  const patrolCenter = new Vector3(patrolCenterX, center.y, patrolCenterZ);

  // Calculate patrol direction (tangent to circle)
  const patrolDirection = new Vector3(
    Math.cos(time * 0.2),
    0,
    -Math.sin(time * 0.2)
  ).normalize();

  // Apply patrol behavior to particles
  particles.forEach((particle, index) => {
    // Calculate position in formation
    // Use particle index to determine position in formation
    const formationIndex = index % 3; // Simple 3-position formation
    const rowIndex = Math.floor(index / 3);

    // Calculate offset based on formation position
    let offsetX = 0;
    let offsetZ = 0;

    // V-shaped formation
    switch (formationIndex) {
      case 0: // Center
        offsetX = 0;
        offsetZ = -rowIndex * formationSpread * 0.5;
        break;
      case 1: // Left wing
        offsetX = -formationSpread * (rowIndex + 1);
        offsetZ = -rowIndex * formationSpread * 0.5;
        break;
      case 2: // Right wing
        offsetX = formationSpread * (rowIndex + 1);
        offsetZ = -rowIndex * formationSpread * 0.5;
        break;
    }

    // Calculate formation direction vectors
    const forward = patrolDirection.clone();
    const right = new Vector3().crossVectors(forward, new Vector3(0, 1, 0)).normalize();

    // Calculate target position in formation
    const targetPosition = new Vector3()
      .addVectors(
        patrolCenter,
        new Vector3()
          .addVectors(
            right.clone().multiplyScalar(offsetX),
            forward.clone().multiplyScalar(offsetZ)
          )
      );

    // Calculate direction and distance to target
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const distance = toTarget.length();

    // Apply force toward target position
    const forceMagnitude = Math.min(distance * 0.1, 0.5) * strength;
    const patrolForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(patrolForce);

    // Add threat detection behavior
    // Simulate threat detection by scanning the environment
    const scanRadius = 10.0;
    const scanDirection = new Vector3(
      Math.sin(time * 0.5 + index * 0.1),
      0,
      Math.cos(time * 0.5 + index * 0.1)
    ).normalize();

    // Set behavior-specific properties
    particle.behaviorType = 'patrol';
    particle.patrolPosition = formationIndex;
    particle.scanDirection = scanDirection.clone();
    particle.scanRadius = scanRadius;
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Organized patrol movement
- Systematic threat detection
- Formation-based positioning
- Coordinated group movement

**Role Affinity**: ATTACK

**Rarity Tier**: Common

#### Tactical Strike

```typescript
// Tactical strike behavior - coordinated attack movement
function tacticalStrikeBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define strike parameters
  const strikeRange = 12.0; // Maximum strike distance
  const strikeSpeed = 0.8 * strength; // Speed of strike movement
  const recoverySpeed = 0.3 * strength; // Speed of recovery movement
  const formationSpread = 1.5; // Spread of particles in formation
  const time = Date.now() * 0.001; // Current time

  // Simulate target detection
  // In a real implementation, this would come from an actual target detection system
  const targetDirection = new Vector3(
    Math.sin(time * 0.3),
    Math.sin(time * 0.2) * 0.3, // Less vertical movement
    Math.cos(time * 0.3)
  ).normalize();

  const targetDistance = 8 + Math.sin(time * 0.5) * 4; // Distance to target
  const targetPosition = new Vector3()
    .addVectors(
      center,
      targetDirection.clone().multiplyScalar(targetDistance)
    );

  // Determine strike phase (attack, hold, or recover)
  const cycleTime = 5.0; // Complete cycle time in seconds
  const attackTime = 1.0; // Time spent in attack phase
  const holdTime = 1.5; // Time spent in hold phase

  const phaseTime = time % cycleTime;
  let phase;
  if (phaseTime < attackTime) {
    phase = 'attack';
  } else if (phaseTime < attackTime + holdTime) {
    phase = 'hold';
  } else {
    phase = 'recover';
  }

  // Apply tactical strike behavior to particles
  particles.forEach((particle, index) => {
    // Calculate position in formation
    const formationIndex = index % 5; // 5-position formation
    const rowIndex = Math.floor(index / 5);

    // Calculate formation position
    let formationPosition;
    switch (phase) {
      case 'attack':
        // Concentrated attack formation - arrowhead
        switch (formationIndex) {
          case 0: // Leader
            formationPosition = new Vector3(0, 0, -rowIndex * formationSpread * 0.5);
            break;
          case 1: // Left close
            formationPosition = new Vector3(-formationSpread * 0.7, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 0.7);
            break;
          case 2: // Right close
            formationPosition = new Vector3(formationSpread * 0.7, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 0.7);
            break;
          case 3: // Left far
            formationPosition = new Vector3(-formationSpread * 1.5, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 1.5);
            break;
          case 4: // Right far
            formationPosition = new Vector3(formationSpread * 1.5, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 1.5);
            break;
        }
        break;

      case 'hold':
        // Surrounding formation - encircle target
        const angle = (formationIndex / 5) * Math.PI * 2 + rowIndex * 0.2;
        const holdRadius = formationSpread * 2;
        formationPosition = new Vector3(
          Math.sin(angle) * holdRadius,
          0,
          Math.cos(angle) * holdRadius
        );
        break;

      case 'recover':
        // Dispersed formation - prepare for next attack
        const recoverAngle = (formationIndex / 5) * Math.PI * 2 + rowIndex * 0.5;
        const recoverRadius = formationSpread * 3 + rowIndex * formationSpread * 0.5;
        formationPosition = new Vector3(
          Math.sin(recoverAngle) * recoverRadius,
          0,
          Math.cos(recoverAngle) * recoverRadius
        );
        break;
    }

    // Calculate world-space target position
    // Rotate formation to face target
    const forward = targetDirection.clone();
    const right = new Vector3().crossVectors(forward, new Vector3(0, 1, 0)).normalize();
    const up = new Vector3().crossVectors(right, forward).normalize();

    // Transform formation position to world space
    const worldOffset = new Vector3()
      .addScaledVector(right, formationPosition.x)
      .addScaledVector(up, formationPosition.y)
      .addScaledVector(forward, formationPosition.z);

    // Calculate final target position
    let finalTargetPosition;
    switch (phase) {
      case 'attack':
        // Move toward target
        finalTargetPosition = new Vector3().addVectors(targetPosition, worldOffset);
        break;

      case 'hold':
        // Hold position around target
        finalTargetPosition = new Vector3().addVectors(targetPosition, worldOffset);
        break;

      case 'recover':
        // Move back toward center
        const recoverProgress = (phaseTime - (attackTime + holdTime)) / (cycleTime - attackTime - holdTime);
        const recoverPosition = new Vector3().lerpVectors(
          targetPosition,
          center,
          recoverProgress
        );
        finalTargetPosition = new Vector3().addVectors(recoverPosition, worldOffset);
        break;
    }

    // Calculate direction and distance to target
    const toTarget = new Vector3().subVectors(finalTargetPosition, particle.position);
    const distance = toTarget.length();

    // Apply force toward target position
    let forceMagnitude;
    switch (phase) {
      case 'attack':
        forceMagnitude = Math.min(distance * 0.2, 1.0) * strikeSpeed;
        break;
      case 'hold':
        forceMagnitude = Math.min(distance * 0.3, 0.8) * strength;
        break;
      case 'recover':
        forceMagnitude = Math.min(distance * 0.15, 0.6) * recoverySpeed;
        break;
    }

    const strikeForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(strikeForce);

    // Set behavior-specific properties
    particle.behaviorType = 'tactical-strike';
    particle.strikePhase = phase;
    particle.formationPosition = formationIndex;
    particle.targetPosition = finalTargetPosition.clone();
  });
}
```

**Characteristics**:
- Coordinated attack movements
- Tactical positioning
- Phase-based strike patterns
- Target-focused behavior

**Role Affinity**: ATTACK

**Rarity Tier**: Uncommon

#### Quantum Strike

```typescript
// Quantum strike behavior - unpredictable, high-speed attack patterns
function quantumStrikeBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define quantum strike parameters
  const strikeRange = 15.0; // Maximum strike distance
  const strikeSpeed = 1.2 * strength; // Speed of strike movement
  const phaseShiftProbability = 0.02 * strength; // Probability of phase shift per frame
  const maxPhaseShifts = 3; // Maximum number of phase shifts per cycle
  const time = Date.now() * 0.001; // Current time

  // Simulate target detection
  // In a real implementation, this would come from an actual target detection system
  const targetDirection = new Vector3(
    Math.sin(time * 0.3),
    Math.sin(time * 0.2) * 0.3, // Less vertical movement
    Math.cos(time * 0.3)
  ).normalize();

  const targetDistance = 10 + Math.sin(time * 0.5) * 5; // Distance to target
  const targetPosition = new Vector3()
    .addVectors(
      center,
      targetDirection.clone().multiplyScalar(targetDistance)
    );

  // Group particles into strike teams
  const teamSize = Math.ceil(particles.length / 3); // 3 teams
  const teams = [[], [], []];

  particles.forEach((particle, index) => {
    const teamIndex = Math.floor(index / teamSize);
    if (teamIndex < 3) {
      teams[teamIndex].push(particle);
    } else {
      // Overflow particles go to team 0
      teams[0].push(particle);
    }
  });

  // Apply quantum strike behavior to each team
  teams.forEach((team, teamIndex) => {
    // Each team has its own phase state
    if (!team.phaseState) {
      team.phaseState = {
        currentPhase: 'prepare',
        phaseStartTime: time,
        phaseShiftCount: 0,
        strikeTarget: targetPosition.clone(),
        strikeDirection: targetDirection.clone()
      };
    }

    // Update phase state
    const phaseState = team.phaseState;
    const phaseTime = time - phaseState.phaseStartTime;

    // Determine if phase shift should occur
    let shouldShift = false;

    switch (phaseState.currentPhase) {
      case 'prepare':
        // Prepare phase lasts 1-2 seconds
        if (phaseTime > 1 + Math.random()) {
          shouldShift = true;
        }
        break;

      case 'strike':
        // Strike phase is brief (0.5 seconds)
        if (phaseTime > 0.5) {
          shouldShift = true;
        }
        break;

      case 'reposition':
        // Reposition phase lasts 0.5-1.5 seconds
        if (phaseTime > 0.5 + Math.random()) {
          shouldShift = true;
        }
        break;

      case 'recover':
        // Recovery phase lasts 2-3 seconds
        if (phaseTime > 2 + Math.random()) {
          shouldShift = true;
          // Reset phase shift count after recovery
          phaseState.phaseShiftCount = 0;
        }
        break;
    }

    // Random phase shifts during strike and reposition (quantum behavior)
    if (['strike', 'reposition'].includes(phaseState.currentPhase)) {
      if (Math.random() < phaseShiftProbability && phaseState.phaseShiftCount < maxPhaseShifts) {
        shouldShift = true;
      }
    }

    // Perform phase shift if needed
    if (shouldShift) {
      // Determine next phase
      let nextPhase;
      switch (phaseState.currentPhase) {
        case 'prepare':
          nextPhase = 'strike';
          // Update strike target
          phaseState.strikeTarget = new Vector3()
            .addVectors(
              targetPosition,
              new Vector3(
                (Math.random() * 2 - 1) * 3,
                (Math.random() * 2 - 1) * 1,
                (Math.random() * 2 - 1) * 3
              )
            );
          break;

        case 'strike':
          nextPhase = 'reposition';
          phaseState.phaseShiftCount++;
          break;

        case 'reposition':
          // Either strike again or recover based on phase shift count
          if (phaseState.phaseShiftCount >= maxPhaseShifts) {
            nextPhase = 'recover';
          } else {
            nextPhase = 'strike';
            // Update strike target
            phaseState.strikeTarget = new Vector3()
              .addVectors(
                targetPosition,
                new Vector3(
                  (Math.random() * 2 - 1) * 3,
                  (Math.random() * 2 - 1) * 1,
                  (Math.random() * 2 - 1) * 3
                )
              );
          }
          break;

        case 'recover':
          nextPhase = 'prepare';
          break;
      }

      // Update phase state
      phaseState.currentPhase = nextPhase;
      phaseState.phaseStartTime = time;
    }

    // Apply behavior based on current phase
    team.forEach((particle, particleIndex) => {
      // Calculate particle's position in team formation
      const formationIndex = particleIndex % 5; // 5-position formation
      const rowIndex = Math.floor(particleIndex / 5);

      // Calculate target position based on phase
      let targetPosition;
      let forceMagnitude;

      switch (phaseState.currentPhase) {
        case 'prepare':
          // Circular formation around center, offset by team index
          const prepareAngle = (formationIndex / 5) * Math.PI * 2 + (teamIndex * Math.PI * 2 / 3);
          const prepareRadius = 6 + rowIndex * 0.5;
          targetPosition = new Vector3(
            center.x + Math.sin(prepareAngle) * prepareRadius,
            center.y,
            center.z + Math.cos(prepareAngle) * prepareRadius
          );
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.15, 0.6) * strength;
          break;

        case 'strike':
          // Concentrated formation moving toward strike target
          // Calculate formation offset
          const strikeOffset = new Vector3(
            (formationIndex - 2) * 0.5,
            rowIndex * 0.2,
            -rowIndex * 0.5
          );

          // Rotate offset to face strike direction
          const strikeDir = new Vector3().subVectors(phaseState.strikeTarget, center).normalize();
          const strikeRight = new Vector3().crossVectors(strikeDir, new Vector3(0, 1, 0)).normalize();
          const strikeUp = new Vector3().crossVectors(strikeRight, strikeDir).normalize();

          const rotatedOffset = new Vector3()
            .addScaledVector(strikeRight, strikeOffset.x)
            .addScaledVector(strikeUp, strikeOffset.y)
            .addScaledVector(strikeDir, strikeOffset.z);

          targetPosition = new Vector3().addVectors(phaseState.strikeTarget, rotatedOffset);
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.25, 1.0) * strikeSpeed;
          break;

        case 'reposition':
          // Dispersed formation, preparing for next strike
          const repositionAngle = (formationIndex / 5) * Math.PI * 2 + (teamIndex * Math.PI * 2 / 3) + time * 0.5;
          const repositionRadius = 4 + Math.random() * 2;
          targetPosition = new Vector3(
            targetPosition.x + Math.sin(repositionAngle) * repositionRadius,
            targetPosition.y + (Math.random() - 0.5) * 2,
            targetPosition.z + Math.cos(repositionAngle) * repositionRadius
          );
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.2, 0.8) * strength;
          break;

        case 'recover':
          // Return to center in loose formation
          const recoverAngle = (formationIndex / 5) * Math.PI * 2 + (teamIndex * Math.PI * 2 / 3);
          const recoverRadius = 8 + rowIndex * 0.5;
          targetPosition = new Vector3(
            center.x + Math.sin(recoverAngle) * recoverRadius,
            center.y,
            center.z + Math.cos(recoverAngle) * recoverRadius
          );
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.1, 0.5) * strength;
          break;
      }

      // Calculate direction to target
      const toTarget = new Vector3().subVectors(targetPosition, particle.position);
      const distance = toTarget.length();

      // Apply force toward target position
      const strikeForce = toTarget.normalize().multiplyScalar(forceMagnitude);
      particle.acceleration.add(strikeForce);

      // Add quantum fluctuation in strike and reposition phases
      if (['strike', 'reposition'].includes(phaseState.currentPhase)) {
        const fluctuation = new Vector3(
          (Math.random() * 2 - 1) * 0.05 * strength,
          (Math.random() * 2 - 1) * 0.05 * strength,
          (Math.random() * 2 - 1) * 0.05 * strength
        );
        particle.acceleration.add(fluctuation);
      }

      // Set behavior-specific properties
      particle.behaviorType = 'quantum-strike';
      particle.strikePhase = phaseState.currentPhase;
      particle.teamIndex = teamIndex;
      particle.formationPosition = formationIndex;
      particle.targetPosition = targetPosition.clone();
    });
  });
}
```

**Characteristics**:
- Unpredictable attack patterns
- High-speed strike capabilities
- Coordinated team-based tactics
- Quantum-like phase shifting

**Role Affinity**: ATTACK

**Rarity Tier**: Rare
 
``` 
 
--- 
 
### 05_force_field_traits.md 
 
```.md 
# Force Field Traits

This document outlines the various force field traits used in the Bitcoin Protozoa project, detailing how force fields shape, contain, and influence particle movement and interactions.

## Table of Contents

1. [Force Field Philosophy](#force-field-philosophy) [Line 20]
2. [Force Field Categories](#force-field-categories) [Line 40]
   - [Core Force Fields](#core-force-fields) [Line 45]
   - [Control Force Fields](#control-force-fields) [Line 100]
   - [Movement Force Fields](#movement-force-fields) [Line 150]
   - [Defense Force Fields](#defense-force-fields) [Line 200]
   - [Attack Force Fields](#attack-force-fields) [Line 250]
3. [Force Field Properties](#force-field-properties) [Line 300]
   - [Strength](#strength) [Line 305]
   - [Flexibility](#flexibility) [Line 330]
   - [Responsiveness](#responsiveness) [Line 355]
   - [Stability](#stability) [Line 380]
4. [Force Field Dynamics](#force-field-dynamics) [Line 410]
   - [Rotation Patterns](#rotation-patterns) [Line 415]
   - [Oscillation Patterns](#oscillation-patterns) [Line 450]
   - [Interaction Patterns](#interaction-patterns) [Line 485]
5. [Force Field Implementation](#force-field-implementation) [Line 520]
   - [Gyroscopic Rotation](#gyroscopic-rotation) [Line 525]
   - [Containment Logic](#containment-logic) [Line 560]
   - [Influence Calculation](#influence-calculation) [Line 595]
   - [Spatial Optimization](#spatial-optimization) [Line 630]
   - [Deterministic Generation](#deterministic-generation) [Line 665]
6. [Force Field Rarity Tiers](#force-field-rarity-tiers) [Line 700]
   - [Common Force Fields](#common-force-fields) [Line 705]
   - [Uncommon Force Fields](#uncommon-force-fields) [Line 740]
   - [Rare Force Fields](#rare-force-fields) [Line 775]
   - [Epic Force Fields](#epic-force-fields) [Line 810]
   - [Legendary Force Fields](#legendary-force-fields) [Line 845]
   - [Mythic Force Fields](#mythic-force-fields) [Line 880]
7. [Related Documents](#related-documents) [Line 915]

## Force Field Philosophy

Force fields in Bitcoin Protozoa define the spatial boundaries and influence zones that shape particle movement and interactions. These invisible structures create the underlying framework that gives the creature its form, function, and emergent behaviors.

The force field system follows these core principles:

1. **Role-Based Hierarchy**: Force fields enforce the role hierarchy through containment and influence relationships
2. **Gyroscopic Dynamics**: Fields rotate independently around multiple axes, creating complex orbital patterns
3. **Emergent Structure**: The interaction between multiple force fields creates emergent, organic-looking structures
4. **Deterministic Generation**: Force field traits are assigned deterministically based on the Bitcoin block nonce
5. **Invisible Influence**: Force fields are invisible in the final rendering but crucial for creating lifelike behaviors

Force fields serve as the skeletal and muscular systems of the creature, providing structure and movement capabilities while remaining unseen. The interplay between different force field types creates the distinctive, organic appearance and behavior of each Bitcoin Protozoa creature.

## Force Field Categories

Force field categories are organized by particle role, with each role having force fields that align with its function in the overall organism. These fields determine how particles are contained, how they move, and how they interact with other particles.

### Core Force Fields

Core force fields focus on centrality, stability, and influence, serving as the central organizing force for the entire creature.

#### Spherical Core

```typescript
// Spherical core force field - central, stable containment field
function createSphericalCoreField(center: Vector3, radius: number, strength: number): ForceField {
  // Define field parameters
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Generate sphere vertices (icosphere approximation)
  const segments = 16;
  const rings = 8;

  // Generate vertices in a spherical pattern
  for (let ring = 0; ring <= rings; ring++) {
    const theta = (ring / rings) * Math.PI;
    const sinTheta = Math.sin(theta);
    const cosTheta = Math.cos(theta);

    for (let segment = 0; segment <= segments; segment++) {
      const phi = (segment / segments) * 2 * Math.PI;
      const sinPhi = Math.sin(phi);
      const cosPhi = Math.cos(phi);

      const x = center.x + radius * sinTheta * cosPhi;
      const y = center.y + radius * cosTheta;
      const z = center.z + radius * sinTheta * sinPhi;

      const vertex = new Vector3(x, y, z);
      vertices.push(vertex.clone());
      baseVertices.push(vertex.clone());
    }
  }

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.CORE,
    center: center.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: center.clone(),
      radius
    },
    rotationSpeed: {
      x: 0.001, // Very slow rotation for visual interest
      y: 0.002,
      z: 0.001
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength
  };

  return field;
}
```

**Characteristics**:
- Spherical or near-spherical shape
- Central position in the creature
- Minimal rotation for stability
- High containment strength
- Influences all particle roles
- Serves as the anchor point for other fields

**Role Affinity**: CORE

**Rarity Tier**: Common

#### Pulsating Core

```typescript
// Pulsating core force field - rhythmically expands and contracts
function createPulsatingCoreField(center: Vector3, radius: number, strength: number): ForceField {
  // Define field parameters
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Generate sphere vertices (icosphere approximation)
  const segments = 16;
  const rings = 8;

  // Generate vertices in a spherical pattern
  for (let ring = 0; ring <= rings; ring++) {
    const theta = (ring / rings) * Math.PI;
    const sinTheta = Math.sin(theta);
    const cosTheta = Math.cos(theta);

    for (let segment = 0; segment <= segments; segment++) {
      const phi = (segment / segments) * 2 * Math.PI;
      const sinPhi = Math.sin(phi);
      const cosPhi = Math.cos(phi);

      const x = center.x + radius * sinTheta * cosPhi;
      const y = center.y + radius * cosTheta;
      const z = center.z + radius * sinTheta * sinPhi;

      const vertex = new Vector3(x, y, z);
      vertices.push(vertex.clone());
      baseVertices.push(vertex.clone());
    }
  }

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.CORE,
    center: center.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: center.clone(),
      radius
    },
    rotationSpeed: {
      x: 0.001,
      y: 0.002,
      z: 0.001
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    // Pulsation properties
    pulsation: {
      frequency: 0.05, // Pulsations per frame
      amplitude: 0.2, // Maximum radius change (percentage)
      phase: 0 // Current phase
    }
  };

  // Add update method for pulsation
  field.update = function(deltaTime: number) {
    // Update pulsation phase
    this.pulsation.phase += this.pulsation.frequency * deltaTime;

    // Calculate current radius based on pulsation
    const pulseFactor = 1 + Math.sin(this.pulsation.phase) * this.pulsation.amplitude;
    const currentRadius = radius * pulseFactor;

    // Update bounding sphere
    this.boundingSphere.radius = currentRadius;

    // Update vertices
    for (let i = 0; i < this.vertices.length; i++) {
      const direction = new Vector3()
        .subVectors(this.baseVertices[i], this.center)
        .normalize();

      this.vertices[i].copy(this.center.clone().add(
        direction.multiplyScalar(currentRadius)
      ));
    }
  };

  return field;
}
```

**Characteristics**:
- Spherical shape with rhythmic expansion and contraction
- Central position in the creature
- Pulsating influence that affects all particles
- Creates wave-like effects throughout the creature
- Serves as a "heartbeat" for the organism

**Role Affinity**: CORE

**Rarity Tier**: Uncommon

### Control Force Fields

Control force fields focus on coordination, direction, and regulation, serving as the decision-making system for the creature.

#### Gyroscopic Control

```typescript
// Gyroscopic control force field - orbits around core with complex rotation
function createGyroscopicControlField(coreField: ForceField, orbitRadius: number, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate initial orbit position
  const orbitPosition = new Vector3(
    center.x + orbitRadius,
    center.y,
    center.z
  );

  // Generate octahedron vertices
  const size = orbitRadius * 0.4; // Size relative to orbit radius

  // 6 vertices of octahedron
  baseVertices.push(new Vector3(orbitPosition.x + size, orbitPosition.y, orbitPosition.z)); // +X
  baseVertices.push(new Vector3(orbitPosition.x - size, orbitPosition.y, orbitPosition.z)); // -X
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y + size, orbitPosition.z)); // +Y
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y - size, orbitPosition.z)); // -Y
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y, orbitPosition.z + size)); // +Z
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y, orbitPosition.z - size)); // -Z

  // Clone vertices for initial state
  baseVertices.forEach(v => vertices.push(v.clone()));

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.CONTROL,
    center: orbitPosition.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: orbitPosition.clone(),
      radius: size
    },
    rotationSpeed: {
      x: 0.01, // Faster rotation for control fields
      y: 0.015,
      z: 0.008
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    // Orbit properties
    orbit: {
      center: center.clone(),
      radius: orbitRadius,
      speed: 0.005,
      angle: 0
    }
  };

  // Add update method for gyroscopic rotation and orbit
  field.update = function(deltaTime: number) {
    // Update orbit angle
    this.orbit.angle += this.orbit.speed * deltaTime;

    // Calculate new orbit position
    const newX = this.orbit.center.x + Math.cos(this.orbit.angle) * this.orbit.radius;
    const newZ = this.orbit.center.z + Math.sin(this.orbit.angle) * this.orbit.radius;

    // Update center position
    this.center.set(newX, this.center.y, newZ);
    this.boundingSphere.center.copy(this.center);

    // Calculate rotation matrices
    const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
    const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

    // Apply rotation to each vertex
    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(orbitPosition);

      // Apply rotations
      let rotated = relativeVertex;
      rotated = rotationX.multiplyVector(rotated);
      rotated = rotationY.multiplyVector(rotated);
      rotated = rotationZ.multiplyVector(rotated);

      // Translate to new center position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }
  };

  return field;
}
```

**Characteristics**:
- Octahedral shape with complex rotation
- Orbits around the core field
- Gyroscopic rotation around multiple axes
- High influence on other fields
- Directs the overall movement of the creature
- Acts as the "brain" of the organism

**Role Affinity**: CONTROL

**Rarity Tier**: Common

#### Resonant Control

```typescript
// Resonant control force field - creates harmonic oscillations that influence other fields
function createResonantControlField(coreField: ForceField, orbitRadius: number, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate initial orbit position
  const orbitPosition = new Vector3(
    center.x + orbitRadius,
    center.y,
    center.z
  );

  // Generate dodecahedron vertices (simplified for example)
  const size = orbitRadius * 0.35;
  const phi = (1 + Math.sqrt(5)) / 2; // Golden ratio

  // 20 vertices of dodecahedron (simplified set)
  // Vertices based on golden ratio relationships
  baseVertices.push(new Vector3(orbitPosition.x + size, orbitPosition.y + size, orbitPosition.z + size));
  baseVertices.push(new Vector3(orbitPosition.x + size, orbitPosition.y + size, orbitPosition.z - size));
  baseVertices.push(new Vector3(orbitPosition.x + size, orbitPosition.y - size, orbitPosition.z + size));
  baseVertices.push(new Vector3(orbitPosition.x + size, orbitPosition.y - size, orbitPosition.z - size));
  baseVertices.push(new Vector3(orbitPosition.x - size, orbitPosition.y + size, orbitPosition.z + size));
  baseVertices.push(new Vector3(orbitPosition.x - size, orbitPosition.y + size, orbitPosition.z - size));
  baseVertices.push(new Vector3(orbitPosition.x - size, orbitPosition.y - size, orbitPosition.z + size));
  baseVertices.push(new Vector3(orbitPosition.x - size, orbitPosition.y - size, orbitPosition.z - size));

  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y + size * phi, orbitPosition.z + size / phi));
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y + size * phi, orbitPosition.z - size / phi));
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y - size * phi, orbitPosition.z + size / phi));
  baseVertices.push(new Vector3(orbitPosition.x, orbitPosition.y - size * phi, orbitPosition.z - size / phi));

  // Clone vertices for initial state
  baseVertices.forEach(v => vertices.push(v.clone()));

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.CONTROL,
    center: orbitPosition.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: orbitPosition.clone(),
      radius: size * phi
    },
    rotationSpeed: {
      x: 0.008,
      y: 0.012,
      z: 0.01
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    // Orbit properties
    orbit: {
      center: center.clone(),
      radius: orbitRadius,
      speed: 0.003,
      angle: Math.PI // Start on opposite side from gyroscopic control
    },
    // Resonance properties
    resonance: {
      frequency: 0.08,
      amplitude: 0.15,
      phase: 0,
      influenceRadius: orbitRadius * 2.5
    }
  };

  // Add update method for resonant behavior
  field.update = function(deltaTime: number) {
    // Update orbit angle
    this.orbit.angle += this.orbit.speed * deltaTime;

    // Calculate new orbit position
    const newX = this.orbit.center.x + Math.cos(this.orbit.angle) * this.orbit.radius;
    const newZ = this.orbit.center.z + Math.sin(this.orbit.angle) * this.orbit.radius;

    // Update center position
    this.center.set(newX, this.center.y, newZ);
    this.boundingSphere.center.copy(this.center);

    // Update resonance phase
    this.resonance.phase += this.resonance.frequency * deltaTime;

    // Calculate resonance factor
    const resonanceFactor = Math.sin(this.resonance.phase) * this.resonance.amplitude;

    // Apply rotation and resonance to vertices
    const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
    const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(orbitPosition);

      // Apply resonance (expand/contract)
      const direction = relativeVertex.clone().normalize();
      const distance = relativeVertex.length();
      const newDistance = distance * (1 + resonanceFactor);
      relativeVertex.copy(direction.multiplyScalar(newDistance));

      // Apply rotations
      let rotated = relativeVertex;
      rotated = rotationX.multiplyVector(rotated);
      rotated = rotationY.multiplyVector(rotated);
      rotated = rotationZ.multiplyVector(rotated);

      // Translate to new center position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }
  };

  return field;
}
```

**Characteristics**:
- Complex polyhedral shape with harmonic oscillations
- Orbits around the core field
- Creates resonant waves that influence other fields
- Modulates the strength of other fields
- Creates harmonic patterns throughout the creature
- Acts as the "nervous system" of the organism

**Role Affinity**: CONTROL

**Rarity Tier**: Uncommon

### Movement Force Fields

Movement force fields focus on propulsion, navigation, and mobility, serving as the locomotion system for the creature.

#### Fin Propulsion

```typescript
// Fin propulsion force field - elongated field that creates propulsive movement
function createFinPropulsionField(coreField: ForceField, controlField: ForceField, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate position relative to core and control fields
  // Position the fin perpendicular to the control field's orbit
  const controlToCore = new Vector3().subVectors(coreField.center, controlField.center).normalize();
  const finDirection = new Vector3().crossVectors(controlToCore, new Vector3(0, 1, 0)).normalize();

  // Calculate fin position
  const finDistance = controlField.boundingSphere.radius * 2.5;
  const finPosition = new Vector3(
    center.x + finDirection.x * finDistance,
    center.y,
    center.z + finDirection.z * finDistance
  );

  // Generate elongated fin shape
  const length = finDistance * 0.8; // Length of fin
  const width = finDistance * 0.3;  // Width of fin
  const height = finDistance * 0.15; // Height of fin

  // Create fin vertices (simplified rectangular prism)
  // Front face
  baseVertices.push(new Vector3(finPosition.x - width/2, finPosition.y + height/2, finPosition.z + length/2));
  baseVertices.push(new Vector3(finPosition.x + width/2, finPosition.y + height/2, finPosition.z + length/2));
  baseVertices.push(new Vector3(finPosition.x + width/2, finPosition.y - height/2, finPosition.z + length/2));
  baseVertices.push(new Vector3(finPosition.x - width/2, finPosition.y - height/2, finPosition.z + length/2));

  // Back face
  baseVertices.push(new Vector3(finPosition.x - width/2, finPosition.y + height/2, finPosition.z - length/2));
  baseVertices.push(new Vector3(finPosition.x + width/2, finPosition.y + height/2, finPosition.z - length/2));
  baseVertices.push(new Vector3(finPosition.x + width/2, finPosition.y - height/2, finPosition.z - length/2));
  baseVertices.push(new Vector3(finPosition.x - width/2, finPosition.y - height/2, finPosition.z - length/2));

  // Clone vertices for initial state
  baseVertices.forEach(v => vertices.push(v.clone()));

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.MOVEMENT,
    center: finPosition.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: finPosition.clone(),
      radius: Math.sqrt(Math.pow(length/2, 2) + Math.pow(width/2, 2) + Math.pow(height/2, 2))
    },
    rotationSpeed: {
      x: 0.001, // Minimal rotation
      y: 0.002,
      z: 0.001
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    direction: finDirection.clone(), // Movement direction
    // Propulsion properties
    propulsion: {
      frequency: 0.1,
      amplitude: 0.3,
      phase: 0,
      axis: new Vector3(0, 1, 0) // Vertical oscillation
    }
  };

  // Add update method for fin propulsion
  field.update = function(deltaTime: number) {
    // Update propulsion phase
    this.propulsion.phase += this.propulsion.frequency * deltaTime;

    // Calculate oscillation factor
    const oscillationFactor = Math.sin(this.propulsion.phase) * this.propulsion.amplitude;

    // Apply oscillation to vertices
    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(finPosition);

      // Apply oscillation along the specified axis
      const oscillationAmount = oscillationFactor * (relativeVertex.z / (length/2)); // More at the tip
      const oscillationOffset = this.propulsion.axis.clone().multiplyScalar(oscillationAmount);
      relativeVertex.add(oscillationOffset);

      // Apply minimal rotation for visual interest
      const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
      const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
      const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

      let rotated = relativeVertex;
      rotated = rotationX.multiplyVector(rotated);
      rotated = rotationY.multiplyVector(rotated);
      rotated = rotationZ.multiplyVector(rotated);

      // Translate back to position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }

    // Calculate propulsion force direction
    // Force is perpendicular to oscillation and fin direction
    const propulsionDirection = new Vector3().crossVectors(
      this.propulsion.axis,
      this.direction
    ).normalize();

    // Store propulsion data for physics calculations
    this.propulsionData = {
      direction: propulsionDirection,
      strength: Math.abs(oscillationFactor) * this.strength,
      phase: this.propulsion.phase
    };
  };

  return field;
}
```

**Characteristics**:
- Elongated, fin-like shape
- Oscillating movement for propulsion
- Positioned perpendicular to control field orbit
- Generates directional force
- Creates wave-like motion
- Acts as the "fins" or "flagella" of the organism

**Role Affinity**: MOVEMENT

**Rarity Tier**: Common

#### Vortex Propulsion

```typescript
// Vortex propulsion force field - creates spiral movement patterns for efficient propulsion
function createVortexPropulsionField(coreField: ForceField, controlField: ForceField, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate position opposite to the first fin (if any)
  // This creates balanced propulsion
  const controlToCore = new Vector3().subVectors(coreField.center, controlField.center).normalize();
  const vortexDirection = new Vector3().crossVectors(controlToCore, new Vector3(0, 1, 0)).normalize().multiplyScalar(-1);

  // Calculate vortex position
  const vortexDistance = controlField.boundingSphere.radius * 2.5;
  const vortexPosition = new Vector3(
    center.x + vortexDirection.x * vortexDistance,
    center.y,
    center.z + vortexDirection.z * vortexDistance
  );

  // Generate spiral cone shape
  const height = vortexDistance * 0.7;
  const baseRadius = vortexDistance * 0.3;
  const segments = 12;
  const turns = 2;
  const pointsPerTurn = 8;

  // Generate spiral vertices
  for (let turn = 0; turn < turns; turn++) {
    for (let point = 0; point < pointsPerTurn; point++) {
      const t = turn + point / pointsPerTurn;
      const angle = t * Math.PI * 2;
      const radius = baseRadius * (1 - t / turns);
      const y = height * (t / turns) - height / 2;

      const x = vortexPosition.x + Math.cos(angle) * radius;
      const z = vortexPosition.z + Math.sin(angle) * radius;

      baseVertices.push(new Vector3(x, vortexPosition.y + y, z));
    }
  }

  // Add tip vertex
  baseVertices.push(new Vector3(vortexPosition.x, vortexPosition.y + height/2, vortexPosition.z));

  // Clone vertices for initial state
  baseVertices.forEach(v => vertices.push(v.clone()));

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.MOVEMENT,
    center: vortexPosition.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: vortexPosition.clone(),
      radius: Math.sqrt(Math.pow(baseRadius, 2) + Math.pow(height/2, 2))
    },
    rotationSpeed: {
      x: 0.001,
      y: 0.02, // Fast rotation around Y axis for vortex effect
      z: 0.001
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    direction: vortexDirection.clone(), // Movement direction
    // Vortex properties
    vortex: {
      spinSpeed: 0.05,
      flowSpeed: 0.02,
      phase: 0
    }
  };

  // Add update method for vortex propulsion
  field.update = function(deltaTime: number) {
    // Update vortex phase
    this.vortex.phase += this.vortex.spinSpeed * deltaTime;

    // Apply rotation to create vortex effect
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);

    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(vortexPosition);

      // Apply Y rotation for spinning effect
      let rotated = rotationY.multiplyVector(relativeVertex);

      // Apply flow effect (spiral movement)
      const distanceFromCenter = Math.sqrt(Math.pow(rotated.x, 2) + Math.pow(rotated.z, 2));
      const heightRatio = (rotated.y + height/2) / height; // 0 at bottom, 1 at top
      const flowFactor = Math.sin(this.vortex.phase + heightRatio * Math.PI * 2) * this.vortex.flowSpeed;

      // Flow direction is tangential to the circle
      const flowDirection = new Vector3(-rotated.z, 0, rotated.x).normalize();
      rotated.add(flowDirection.multiplyScalar(flowFactor * distanceFromCenter));

      // Translate back to position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }

    // Calculate propulsion force
    // Vortex propulsion creates force along the vortex direction
    this.propulsionData = {
      direction: this.direction.clone(),
      strength: this.strength * 0.8, // Slightly less efficient than fin propulsion
      phase: this.vortex.phase
    };
  };

  return field;
}
```

**Characteristics**:
- Spiral, cone-like shape
- Rotating vortex movement
- Creates efficient propulsion through fluid dynamics
- Generates directional force through spiral motion
- Creates tornado-like flow patterns
- Acts as the "propeller" of the organism

**Role Affinity**: MOVEMENT

**Rarity Tier**: Uncommon

### Defense Force Fields

Defense force fields focus on protection, resilience, and threat response, serving as the protective system for the creature.

#### Membrane Barrier

```typescript
// Membrane barrier force field - creates a protective boundary around vital areas
function createMembraneBarrierField(coreField: ForceField, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate membrane radius (larger than core)
  const membraneRadius = coreField.boundingSphere.radius * 2.5;

  // Generate spherical membrane shape with slight irregularities
  const segments = 24;
  const rings = 12;

  // Generate vertices in a spherical pattern with variations
  for (let ring = 0; ring <= rings; ring++) {
    const theta = (ring / rings) * Math.PI;
    const sinTheta = Math.sin(theta);
    const cosTheta = Math.cos(theta);

    for (let segment = 0; segment <= segments; segment++) {
      const phi = (segment / segments) * 2 * Math.PI;
      const sinPhi = Math.sin(phi);
      const cosPhi = Math.cos(phi);

      // Add slight irregularities for organic appearance
      const noise = 0.1;
      const variation = 1 + (Math.sin(ring * 5 + segment * 3) * noise);

      const x = center.x + membraneRadius * variation * sinTheta * cosPhi;
      const y = center.y + membraneRadius * variation * cosTheta;
      const z = center.z + membraneRadius * variation * sinTheta * sinPhi;

      const vertex = new Vector3(x, y, z);
      vertices.push(vertex.clone());
      baseVertices.push(vertex.clone());
    }
  }

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.DEFENSE,
    center: center.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: center.clone(),
      radius: membraneRadius * 1.1 // Slightly larger to account for variations
    },
    rotationSpeed: {
      x: 0.002,
      y: 0.003,
      z: 0.002
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    // Membrane properties
    membrane: {
      thickness: membraneRadius * 0.1,
      permeability: 0.3, // How easily particles can pass through (0-1)
      elasticity: 0.5, // How much the membrane can stretch (0-1)
      pulseFrequency: 0.02,
      pulseAmplitude: 0.05,
      phase: 0
    }
  };

  // Add update method for membrane behavior
  field.update = function(deltaTime: number) {
    // Update membrane phase
    this.membrane.phase += this.membrane.pulseFrequency * deltaTime;

    // Calculate pulse factor
    const pulseFactor = 1 + Math.sin(this.membrane.phase) * this.membrane.pulseAmplitude;

    // Apply subtle pulsation and rotation to vertices
    const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
    const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(center);

      // Apply pulsation
      const direction = relativeVertex.clone().normalize();
      const distance = relativeVertex.length();
      const newDistance = distance * pulseFactor;
      relativeVertex.copy(direction.multiplyScalar(newDistance));

      // Apply rotation for subtle movement
      let rotated = relativeVertex;
      rotated = rotationX.multiplyVector(rotated);
      rotated = rotationY.multiplyVector(rotated);
      rotated = rotationZ.multiplyVector(rotated);

      // Translate back to position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }

    // Update bounding sphere radius with pulsation
    this.boundingSphere.radius = membraneRadius * 1.1 * pulseFactor;
  };

  return field;
}
```

**Characteristics**:
- Spherical, membrane-like shape with organic irregularities
- Surrounds and protects the core
- Subtle pulsation for visual interest
- Semi-permeable boundary
- Creates containment forces
- Acts as the "cell membrane" of the organism

**Role Affinity**: DEFENSE

**Rarity Tier**: Common

#### Reactive Shield

```typescript
// Reactive shield force field - dynamically responds to external threats
function createReactiveShieldField(coreField: ForceField, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate shield radius (slightly smaller than membrane)
  const shieldRadius = coreField.boundingSphere.radius * 2.2;

  // Generate shield shape (truncated icosahedron - similar to soccer ball)
  // This is a simplified version for the example
  const segments = 20;
  const rings = 10;

  // Generate vertices in a spherical pattern with faceted structure
  for (let ring = 0; ring <= rings; ring++) {
    const theta = (ring / rings) * Math.PI;
    const sinTheta = Math.sin(theta);
    const cosTheta = Math.cos(theta);

    for (let segment = 0; segment <= segments; segment++) {
      const phi = (segment / segments) * 2 * Math.PI;
      const sinPhi = Math.sin(phi);
      const cosPhi = Math.cos(phi);

      // Create faceted appearance by quantizing coordinates
      const facetSize = 0.2;
      const facetedSinTheta = Math.round(sinTheta / facetSize) * facetSize;
      const facetedCosTheta = Math.round(cosTheta / facetSize) * facetSize;
      const facetedSinPhi = Math.round(sinPhi / facetSize) * facetSize;
      const facetedCosPhi = Math.round(cosPhi / facetSize) * facetSize;

      const x = center.x + shieldRadius * facetedSinTheta * facetedCosPhi;
      const y = center.y + shieldRadius * facetedCosTheta;
      const z = center.z + shieldRadius * facetedSinTheta * facetedSinPhi;

      const vertex = new Vector3(x, y, z);
      vertices.push(vertex.clone());
      baseVertices.push(vertex.clone());
    }
  }

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.DEFENSE,
    center: center.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: center.clone(),
      radius: shieldRadius
    },
    rotationSpeed: {
      x: 0.003,
      y: 0.002,
      z: 0.004
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    // Shield properties
    shield: {
      baseRadius: shieldRadius,
      maxExpansion: 1.5, // Maximum expansion factor when reacting
      reactionSpeed: 0.2, // How quickly shield reacts
      recoveryRate: 0.05, // How quickly shield returns to normal
      currentThreatDirection: new Vector3(0, 0, 0),
      currentThreatIntensity: 0,
      expandedSegments: new Set<number>() // Tracks which segments are expanded
    }
  };

  // Add update method for reactive shield behavior
  field.update = function(deltaTime: number, threatInfo?: {direction: Vector3, intensity: number}) {
    // Update threat information if provided
    if (threatInfo) {
      this.shield.currentThreatDirection = threatInfo.direction.clone();
      this.shield.currentThreatIntensity = threatInfo.intensity;
    } else {
      // Gradually reduce threat intensity when no threat is present
      this.shield.currentThreatIntensity = Math.max(
        0,
        this.shield.currentThreatIntensity - this.shield.recoveryRate * deltaTime
      );
    }

    // Apply rotation for general movement
    const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
    const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

    // Clear expanded segments if threat is gone
    if (this.shield.currentThreatIntensity === 0) {
      this.shield.expandedSegments.clear();
    }

    // Process vertices in ring-segment pairs
    for (let ring = 0; ring <= rings; ring++) {
      for (let segment = 0; segment <= segments; segment++) {
        const vertexIndex = ring * (segments + 1) + segment;
        if (vertexIndex >= this.vertices.length) continue;

        // Get base vertex and translate to origin
        const baseVertex = this.baseVertices[vertexIndex].clone();
        const relativeVertex = baseVertex.clone().sub(center);

        // Determine if this segment faces the threat
        const direction = relativeVertex.clone().normalize();
        const dotWithThreat = direction.dot(this.shield.currentThreatDirection);

        // Expand segments facing the threat
        let expansionFactor = 1.0;
        if (dotWithThreat > 0.7 && this.shield.currentThreatIntensity > 0) {
          // Mark this segment as expanded
          this.shield.expandedSegments.add(segment);

          // Calculate expansion based on threat intensity and alignment
          expansionFactor = 1.0 + (this.shield.maxExpansion - 1.0) *
                            this.shield.currentThreatIntensity *
                            Math.pow(dotWithThreat, 2);
        } else if (this.shield.expandedSegments.has(segment)) {
          // Gradually reduce expansion for previously expanded segments
          expansionFactor = 1.0 + (this.shield.maxExpansion - 1.0) *
                            this.shield.currentThreatIntensity * 0.5;
        }

        // Apply expansion
        const expandedVertex = direction.multiplyScalar(relativeVertex.length() * expansionFactor);

        // Apply rotation
        let rotated = expandedVertex;
        rotated = rotationX.multiplyVector(rotated);
        rotated = rotationY.multiplyVector(rotated);
        rotated = rotationZ.multiplyVector(rotated);

        // Translate back to position
        rotated.add(this.center);

        // Update vertex
        this.vertices[vertexIndex].copy(rotated);
      }
    }

    // Update bounding sphere radius based on maximum expansion
    const maxExpansionFactor = 1.0 + (this.shield.maxExpansion - 1.0) * this.shield.currentThreatIntensity;
    this.boundingSphere.radius = this.shield.baseRadius * maxExpansionFactor;
  };

  return field;
}
```

**Characteristics**:
- Faceted, shield-like shape
- Dynamically expands in threat direction
- Creates stronger containment in threatened areas
- Adaptive protection system
- Prioritizes defense of vital areas
- Acts as the "immune system" of the organism

**Role Affinity**: DEFENSE

**Rarity Tier**: Uncommon

### Attack Force Fields

Attack force fields focus on offense, threat detection, and strategic positioning, serving as the offensive system for the creature.

#### Sentry Patrol

```typescript
// Sentry patrol force field - patrols the perimeter and detects threats
function createSentryPatrolField(coreField: ForceField, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate patrol radius (larger than defense fields)
  const patrolRadius = coreField.boundingSphere.radius * 3.0;

  // Generate angular, sentry-like shape
  // Tetrahedron-based shape with extensions

  // Base tetrahedron vertices
  const size = patrolRadius * 0.3;

  // Four vertices of tetrahedron
  const v1 = new Vector3(0, size, 0);
  const v2 = new Vector3(-size, -size, size);
  const v3 = new Vector3(size, -size, size);
  const v4 = new Vector3(0, -size, -size);

  // Add extensions to create more angular, aggressive shape
  const extension = size * 0.7;

  // Extended vertices
  const e1 = new Vector3(0, size + extension, 0);
  const e2 = new Vector3(-size - extension * 0.5, -size, size + extension * 0.5);
  const e3 = new Vector3(size + extension * 0.5, -size, size + extension * 0.5);
  const e4 = new Vector3(0, -size, -size - extension * 0.5);

  // Calculate initial patrol position
  const patrolPosition = new Vector3(
    center.x + patrolRadius,
    center.y,
    center.z
  );

  // Add vertices to arrays, translating to patrol position
  [v1, v2, v3, v4, e1, e2, e3, e4].forEach(v => {
    const translatedVertex = v.clone().add(patrolPosition);
    vertices.push(translatedVertex.clone());
    baseVertices.push(translatedVertex.clone());
  });

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.ATTACK,
    center: patrolPosition.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: patrolPosition.clone(),
      radius: size + extension
    },
    rotationSpeed: {
      x: 0.01,
      y: 0.015,
      z: 0.008
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    // Patrol properties
    patrol: {
      center: center.clone(),
      radius: patrolRadius,
      speed: 0.01,
      angle: 0,
      detectionRange: patrolRadius * 1.5,
      alertLevel: 0, // 0-1 scale of alert status
      detectedThreats: []
    }
  };

  // Add update method for patrol behavior
  field.update = function(deltaTime: number, threatInfo?: {position: Vector3, intensity: number}) {
    // Update patrol angle
    this.patrol.angle += this.patrol.speed * deltaTime;

    // Calculate new patrol position
    const newX = this.patrol.center.x + Math.cos(this.patrol.angle) * this.patrol.radius;
    const newZ = this.patrol.center.z + Math.sin(this.patrol.angle) * this.patrol.radius;

    // Update center position
    this.center.set(newX, this.center.y, newZ);
    this.boundingSphere.center.copy(this.center);

    // Update alert level based on threats
    if (threatInfo) {
      // Calculate distance to threat
      const distanceToThreat = this.center.distanceTo(threatInfo.position);

      // Update alert level if threat is within detection range
      if (distanceToThreat < this.patrol.detectionRange) {
        // Alert level increases with threat intensity and proximity
        const proximityFactor = 1 - (distanceToThreat / this.patrol.detectionRange);
        const newAlertLevel = threatInfo.intensity * proximityFactor;

        // Gradually increase alert level (doesn't drop immediately)
        this.patrol.alertLevel = Math.max(
          this.patrol.alertLevel,
          newAlertLevel
        );

        // Add to detected threats if not already present
        const threatExists = this.patrol.detectedThreats.some(t =>
          t.position.distanceTo(threatInfo.position) < 0.1
        );

        if (!threatExists) {
          this.patrol.detectedThreats.push({
            position: threatInfo.position.clone(),
            intensity: threatInfo.intensity,
            detectedAt: Date.now()
          });
        }
      }
    } else {
      // Gradually decrease alert level when no threats are present
      this.patrol.alertLevel = Math.max(
        0,
        this.patrol.alertLevel - 0.01 * deltaTime
      );

      // Remove old threats
      const currentTime = Date.now();
      this.patrol.detectedThreats = this.patrol.detectedThreats.filter(threat =>
        currentTime - threat.detectedAt < 5000 // Remove threats older than 5 seconds
      );
    }

    // Apply rotation and alert-based transformations
    const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
    const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

    // Calculate alert factor for visual changes
    const alertFactor = 1 + this.patrol.alertLevel * 0.5; // Expand up to 50% when fully alert

    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(patrolPosition);

      // Apply alert-based expansion (more for extended points)
      const isExtendedPoint = i >= 4; // Extended vertices are indices 4-7
      const expansionFactor = isExtendedPoint ? alertFactor : 1 + (alertFactor - 1) * 0.3;

      const direction = relativeVertex.clone().normalize();
      const distance = relativeVertex.length();
      const newDistance = distance * expansionFactor;
      const expandedVertex = direction.multiplyScalar(newDistance);

      // Apply rotation
      let rotated = expandedVertex;
      rotated = rotationX.multiplyVector(rotated);
      rotated = rotationY.multiplyVector(rotated);
      rotated = rotationZ.multiplyVector(rotated);

      // Translate to new center position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }

    // Update bounding sphere radius based on alert level
    this.boundingSphere.radius = (size + extension) * alertFactor;
  };

  return field;
}
```

**Characteristics**:
- Angular, aggressive shape
- Patrols the perimeter of the creature
- Detects and responds to threats
- Expands when alerted
- Communicates threat information to other fields
- Acts as the "sentinel" of the organism

**Role Affinity**: ATTACK

**Rarity Tier**: Common

#### Striker Probe

```typescript
// Striker probe force field - extends to attack or investigate targets
function createStrikerProbeField(coreField: ForceField, sentryField: ForceField, strength: number): ForceField {
  // Define field parameters
  const center = coreField.center.clone();
  const vertices: Vector3[] = [];
  const baseVertices: Vector3[] = [];

  // Calculate initial position (opposite to sentry field)
  const sentryDirection = new Vector3().subVectors(sentryField.center, center).normalize();
  const strikerDirection = sentryDirection.clone().multiplyScalar(-1);

  // Calculate striker position
  const strikerRadius = coreField.boundingSphere.radius * 3.0;
  const strikerPosition = new Vector3(
    center.x + strikerDirection.x * strikerRadius,
    center.y,
    center.z + strikerDirection.z * strikerRadius
  );

  // Generate striker shape (elongated pyramid)
  const width = strikerRadius * 0.2;
  const length = strikerRadius * 0.5;

  // Base pyramid vertices
  baseVertices.push(new Vector3(strikerPosition.x, strikerPosition.y, strikerPosition.z)); // Tip
  baseVertices.push(new Vector3(strikerPosition.x - width, strikerPosition.y - width, strikerPosition.z - length)); // Base corner 1
  baseVertices.push(new Vector3(strikerPosition.x + width, strikerPosition.y - width, strikerPosition.z - length)); // Base corner 2
  baseVertices.push(new Vector3(strikerPosition.x + width, strikerPosition.y + width, strikerPosition.z - length)); // Base corner 3
  baseVertices.push(new Vector3(strikerPosition.x - width, strikerPosition.y + width, strikerPosition.z - length)); // Base corner 4

  // Clone vertices for initial state
  baseVertices.forEach(v => vertices.push(v.clone()));

  // Create force field
  const field: ForceField = {
    id: generateUniqueId(),
    role: ParticleRole.ATTACK,
    center: strikerPosition.clone(),
    vertices,
    baseVertices,
    boundingSphere: {
      center: strikerPosition.clone(),
      radius: Math.sqrt(Math.pow(width, 2) + Math.pow(length, 2))
    },
    rotationSpeed: {
      x: 0.005,
      y: 0.005,
      z: 0.02 // Faster rotation around forward axis
    },
    color: '#FFFFFF', // Will be set based on color palette
    strength,
    associatedFieldId: coreField.id, // Link to parent field
    // Striker properties
    striker: {
      basePosition: strikerPosition.clone(),
      baseLength: length,
      maxExtension: 3.0, // Maximum extension factor
      extensionSpeed: 0.5, // How quickly it extends
      retractionSpeed: 0.2, // How quickly it retracts
      currentExtension: 1.0, // Current extension factor (1.0 = not extended)
      targetPosition: null, // Current target position
      state: 'patrol', // patrol, extending, extended, retracting
      patrolAngle: Math.PI, // Start opposite to sentry
      patrolSpeed: 0.008,
      patrolRadius: strikerRadius
    }
  };

  // Add update method for striker behavior
  field.update = function(deltaTime: number, targetInfo?: {position: Vector3, priority: number}) {
    // Update state based on target information
    if (targetInfo && (this.striker.state === 'patrol' || this.striker.state === 'retracting')) {
      // Begin extending toward target
      this.striker.targetPosition = targetInfo.position.clone();
      this.striker.state = 'extending';
    }

    // State machine for striker behavior
    switch (this.striker.state) {
      case 'patrol':
        // Update patrol angle
        this.striker.patrolAngle += this.striker.patrolSpeed * deltaTime;

        // Calculate new patrol position
        const newX = center.x + Math.cos(this.striker.patrolAngle) * this.striker.patrolRadius;
        const newZ = center.z + Math.sin(this.striker.patrolAngle) * this.striker.patrolRadius;

        // Update center position
        this.center.set(newX, this.center.y, newZ);
        this.boundingSphere.center.copy(this.center);

        // Update base position
        this.striker.basePosition.copy(this.center);
        break;

      case 'extending':
        // Increase extension factor
        this.striker.currentExtension = Math.min(
          this.striker.maxExtension,
          this.striker.currentExtension + this.striker.extensionSpeed * deltaTime
        );

        // Calculate direction to target
        const targetDirection = new Vector3()
          .subVectors(this.striker.targetPosition, center)
          .normalize();

        // Calculate new position based on extension
        const extensionDistance = this.striker.patrolRadius * this.striker.currentExtension;
        const newPosition = new Vector3()
          .addVectors(
            center,
            targetDirection.multiplyScalar(extensionDistance)
          );

        // Update center position
        this.center.copy(newPosition);
        this.boundingSphere.center.copy(this.center);

        // Check if fully extended
        if (this.striker.currentExtension >= this.striker.maxExtension) {
          this.striker.state = 'extended';
        }
        break;

      case 'extended':
        // Stay extended for a short period, then begin retracting
        // In a real implementation, this would include interaction with the target

        // For this example, automatically begin retracting after a delay
        this.striker.extendedTime = (this.striker.extendedTime || 0) + deltaTime;
        if (this.striker.extendedTime > 1.0) { // Stay extended for 1 second
          this.striker.state = 'retracting';
          this.striker.extendedTime = 0;
        }
        break;

      case 'retracting':
        // Decrease extension factor
        this.striker.currentExtension = Math.max(
          1.0,
          this.striker.currentExtension - this.striker.retractionSpeed * deltaTime
        );

        // Calculate direction back to patrol radius
        const centerDirection = new Vector3()
          .subVectors(this.center, center)
          .normalize();

        // Calculate new position based on retraction
        const retractionDistance = this.striker.patrolRadius * this.striker.currentExtension;
        const retractPosition = new Vector3()
          .addVectors(
            center,
            centerDirection.multiplyScalar(retractionDistance)
          );

        // Update center position
        this.center.copy(retractPosition);
        this.boundingSphere.center.copy(this.center);

        // Check if fully retracted
        if (this.striker.currentExtension <= 1.0) {
          this.striker.state = 'patrol';
          this.striker.targetPosition = null;
        }
        break;
    }

    // Apply rotation and extension transformations to vertices
    const rotationX = createRotationMatrixX(this.rotationSpeed.x * deltaTime);
    const rotationY = createRotationMatrixY(this.rotationSpeed.y * deltaTime);
    const rotationZ = createRotationMatrixZ(this.rotationSpeed.z * deltaTime);

    // Calculate extension factor for vertices
    // Tip extends more than base
    for (let i = 0; i < this.vertices.length; i++) {
      // Get base vertex and translate to origin
      const baseVertex = this.baseVertices[i].clone();
      const relativeVertex = baseVertex.clone().sub(strikerPosition);

      // Apply different extension to tip vs base
      let extendedVertex;
      if (i === 0) { // Tip vertex
        // Extend tip forward
        extendedVertex = relativeVertex.clone();
        extendedVertex.z *= this.striker.currentExtension;
      } else { // Base vertices
        // Keep base relatively stable
        extendedVertex = relativeVertex.clone();
        // Slight stretching of base during extension
        extendedVertex.z *= 1 + (this.striker.currentExtension - 1) * 0.2;
      }

      // Apply rotation
      let rotated = extendedVertex;
      rotated = rotationX.multiplyVector(rotated);
      rotated = rotationY.multiplyVector(rotated);
      rotated = rotationZ.multiplyVector(rotated);

      // Translate to new center position
      rotated.add(this.center);

      // Update vertex
      this.vertices[i].copy(rotated);
    }

    // Update bounding sphere radius based on extension
    const baseRadius = Math.sqrt(Math.pow(width, 2) + Math.pow(length, 2));
    this.boundingSphere.radius = baseRadius * (1 + (this.striker.currentExtension - 1) * 0.5);
  };

  return field;
}
```

**Characteristics**:
- Elongated, pointed shape
- Extends rapidly to attack or investigate targets
- Works in coordination with sentry fields
- Rotates around forward axis during extension
- Provides offensive capabilities
- Acts as the "stinger" or "proboscis" of the organism

**Role Affinity**: ATTACK

**Rarity Tier**: Uncommon

## Force Field Properties

Force field properties define the fundamental characteristics that determine how a force field behaves, influences particles, and interacts with other fields. These properties can be combined in various ways to create unique force field behaviors.

### Strength

Strength determines the magnitude of influence a force field exerts on particles. Higher strength values create stronger containment forces and more significant influence on particle movement.

```typescript
// Force field strength implementation
interface ForceFieldStrength {
  baseStrength: number; // Base strength value (0.0-1.0)
  variability: number; // How much strength varies over time (0.0-1.0)
  falloff: number; // How quickly strength diminishes with distance (0.0-1.0)
  pulseFrequency?: number; // Frequency of strength pulsation (if pulsating)
  pulseAmplitude?: number; // Amplitude of strength pulsation (if pulsating)
}

// Calculate effective strength at a given point and time
function calculateEffectiveStrength(
  field: ForceField,
  position: Vector3,
  time: number
): number {
  // Get base strength
  const baseStrength = field.strength.baseStrength;

  // Calculate distance factor
  const distanceToCenter = position.distanceTo(field.center);
  const normalizedDistance = distanceToCenter / field.boundingSphere.radius;
  const falloffFactor = Math.pow(1 - Math.min(normalizedDistance, 1), field.strength.falloff * 3 + 1);

  // Calculate time-based variation
  let variationFactor = 1.0;
  if (field.strength.variability > 0) {
    // Use a smooth noise function based on time
    const noiseValue = (Math.sin(time * 0.5) * 0.5 + 0.5) *
                      (Math.cos(time * 0.3) * 0.5 + 0.5);
    variationFactor = 1 - (field.strength.variability * 0.5 * noiseValue);
  }

  // Calculate pulse factor if applicable
  let pulseFactor = 1.0;
  if (field.strength.pulseFrequency && field.strength.pulseAmplitude) {
    pulseFactor = 1 + Math.sin(time * field.strength.pulseFrequency) * field.strength.pulseAmplitude;
  }

  // Combine all factors
  return baseStrength * falloffFactor * variationFactor * pulseFactor;
}
```

#### Strength Variations

1. **Standard Strength** (Common)
   - Balanced strength with moderate falloff
   - Consistent influence throughout the field
   - Minimal variation over time
   - Suitable for all field roles

2. **Pulsating Strength** (Uncommon)
   - Rhythmic variation in strength over time
   - Creates wave-like effects in particle movement
   - Can synchronize with other pulsating fields
   - Particularly effective for CORE and CONTROL fields

3. **Gradient Strength** (Uncommon)
   - Strength varies based on position within the field
   - Stronger near specific focal points
   - Creates directional flow within the field
   - Well-suited for MOVEMENT and ATTACK fields

4. **Resonant Strength** (Rare)
   - Strength amplifies when interacting with specific frequencies
   - Creates harmonic patterns between multiple fields
   - Can create standing wave patterns
   - Most effective for CONTROL fields

5. **Adaptive Strength** (Rare)
   - Strength adjusts based on environmental conditions
   - Increases in response to threats or stimuli
   - Creates responsive, organic behavior
   - Particularly useful for DEFENSE and ATTACK fields

### Flexibility

Flexibility determines how much a force field can deform, stretch, and adapt its shape. Higher flexibility values allow for more organic, fluid movement and better adaptation to changing conditions.

```typescript
// Force field flexibility implementation
interface ForceFieldFlexibility {
  baseFlexibility: number; // Base flexibility value (0.0-1.0)
  elasticity: number; // How quickly field returns to original shape (0.0-1.0)
  deformationLimit: number; // Maximum allowed deformation (0.0-1.0)
  anisotropy?: number; // Direction-dependent flexibility (0.0-1.0)
  anisotropyDirection?: Vector3; // Direction of maximum flexibility
}

// Calculate vertex deformation based on flexibility
function calculateVertexDeformation(
  field: ForceField,
  vertexIndex: number,
  force: Vector3,
  time: number
): Vector3 {
  // Get base vertex and relative position
  const baseVertex = field.baseVertices[vertexIndex].clone();
  const relativeVertex = baseVertex.clone().sub(field.center);

  // Calculate deformation magnitude based on flexibility
  const deformationMagnitude = force.length() * field.flexibility.baseFlexibility;

  // Apply deformation limit
  const limitedMagnitude = Math.min(
    deformationMagnitude,
    field.boundingSphere.radius * field.flexibility.deformationLimit
  );

  // Calculate deformation direction
  let deformationDirection = force.clone().normalize();

  // Apply anisotropy if defined
  if (field.flexibility.anisotropy && field.flexibility.anisotropyDirection) {
    // Calculate alignment with anisotropy direction
    const direction = field.flexibility.anisotropyDirection.normalize();
    const alignment = Math.abs(deformationDirection.dot(direction));

    // Adjust deformation based on alignment and anisotropy
    const anisotropyFactor = 1 - (field.flexibility.anisotropy * (1 - alignment));
    deformationDirection.multiplyScalar(anisotropyFactor);
  }

  // Calculate final deformation
  const deformation = deformationDirection.multiplyScalar(limitedMagnitude);

  // Apply elasticity (time-based recovery)
  // In a real implementation, this would track deformation over time
  // For this example, we'll use a simple time-based factor
  const elasticityFactor = Math.sin(time * 0.5) * 0.5 + 0.5;
  const elasticDeformation = deformation.multiplyScalar(1 - (field.flexibility.elasticity * elasticityFactor));

  // Return deformed vertex position
  return new Vector3().addVectors(baseVertex, elasticDeformation);
}
```

#### Flexibility Variations

1. **Rigid Flexibility** (Common)
   - Minimal deformation under forces
   - Maintains shape integrity
   - Quick return to original shape
   - Suitable for CORE and CONTROL fields

2. **Elastic Flexibility** (Common)
   - Significant deformation under forces
   - Stretches and compresses easily
   - Gradual return to original shape
   - Well-suited for MOVEMENT fields

3. **Anisotropic Flexibility** (Uncommon)
   - Direction-dependent flexibility
   - More flexible along specific axes
   - Creates directional movement patterns
   - Effective for MOVEMENT and ATTACK fields

4. **Fluid Flexibility** (Uncommon)
   - Highly deformable with flow-like properties
   - Can split and recombine under extreme forces
   - Slow return to original shape
   - Particularly useful for DEFENSE fields

5. **Programmable Flexibility** (Rare)
   - Flexibility changes based on specific conditions
   - Can become rigid or fluid as needed
   - Creates complex, adaptive behaviors
   - Valuable for specialized field applications

### Responsiveness

Responsiveness determines how quickly a force field reacts to changes in its environment, including external forces, threats, and interactions with other fields. Higher responsiveness values create more reactive, alert force fields.

```typescript
// Force field responsiveness implementation
interface ForceFieldResponsiveness {
  baseResponsiveness: number; // Base responsiveness value (0.0-1.0)
  reactionTime: number; // Time delay before response (lower = faster)
  sensitivity: number; // Threshold for detecting changes (lower = more sensitive)
  priorityMatrix: { // Response priorities for different stimuli
    [stimulusType: string]: number; // Priority value (0.0-1.0)
  };
  memoryDuration?: number; // How long field "remembers" stimuli
}

// Calculate response to a stimulus
function calculateFieldResponse(
  field: ForceField,
  stimulus: {
    type: string;
    position: Vector3;
    intensity: number;
    direction?: Vector3;
  },
  time: number,
  deltaTime: number
): {
  responseForce: Vector3;
  responseIntensity: number;
} {
  // Check if stimulus exceeds sensitivity threshold
  if (stimulus.intensity < field.responsiveness.sensitivity) {
    return {
      responseForce: new Vector3(0, 0, 0),
      responseIntensity: 0
    };
  }

  // Get priority for this stimulus type
  const priority = field.responsiveness.priorityMatrix[stimulus.type] || 0.5;

  // Calculate response delay based on reaction time
  // In a real implementation, this would track stimulus over time
  // For this example, we'll use a simple time-based approximation
  const reactionDelay = field.responsiveness.reactionTime * (1 - field.responsiveness.baseResponsiveness);
  const timeElapsed = deltaTime; // Assume this is time since stimulus was first detected

  // Calculate response intensity based on reaction time
  let responseIntensity = 0;
  if (timeElapsed >= reactionDelay) {
    // Ramp up response based on time since reaction delay
    const rampUpTime = 0.5; // Time to reach full response
    const rampUpFactor = Math.min((timeElapsed - reactionDelay) / rampUpTime, 1.0);

    // Calculate final response intensity
    responseIntensity = stimulus.intensity * priority * rampUpFactor * field.responsiveness.baseResponsiveness;
  }

  // Calculate response direction
  let responseDirection;
  if (stimulus.direction) {
    // If stimulus has a direction, respond accordingly
    responseDirection = stimulus.direction.clone();
  } else {
    // Otherwise, respond toward/away from stimulus position
    responseDirection = new Vector3()
      .subVectors(stimulus.position, field.center)
      .normalize();
  }

  // Calculate final response force
  const responseForce = responseDirection.multiplyScalar(responseIntensity);

  return {
    responseForce,
    responseIntensity
  };
}
```

#### Responsiveness Variations

1. **Balanced Responsiveness** (Common)
   - Moderate reaction time and sensitivity
   - Responds proportionally to stimulus intensity
   - Equal priority for different stimuli
   - Suitable for all field roles

2. **Reactive Responsiveness** (Common)
   - Very fast reaction time
   - High sensitivity to changes
   - May overreact to minor stimuli
   - Well-suited for DEFENSE and ATTACK fields

3. **Selective Responsiveness** (Uncommon)
   - Prioritizes specific types of stimuli
   - Ignores or minimizes response to low-priority stimuli
   - Creates specialized behavior patterns
   - Effective for CONTROL fields

4. **Persistent Responsiveness** (Uncommon)
   - Long memory duration for stimuli
   - Continues responding after stimulus ends
   - Creates sustained reaction patterns
   - Useful for DEFENSE fields

5. **Anticipatory Responsiveness** (Rare)
   - Predicts and responds to potential future stimuli
   - Uses pattern recognition to anticipate changes
   - Creates proactive rather than reactive behavior
   - Particularly valuable for CONTROL and ATTACK fields

### Stability

Stability determines how well a force field maintains its integrity and position under stress. Higher stability values create more consistent, reliable force fields that resist disruption and maintain their function even under adverse conditions.

```typescript
// Force field stability implementation
interface ForceFieldStability {
  baseStability: number; // Base stability value (0.0-1.0)
  recoveryRate: number; // How quickly field recovers from disruption (0.0-1.0)
  disruptionThreshold: number; // Force required to disrupt field (0.0-1.0)
  energyEfficiency?: number; // How efficiently field maintains stability (0.0-1.0)
  harmonicResonance?: number; // Stability boost from harmonic frequencies (0.0-1.0)
}

// Calculate stability factor under external force
function calculateStabilityFactor(
  field: ForceField,
  externalForce: Vector3,
  currentDisruption: number,
  deltaTime: number
): {
  stabilityFactor: number;
  newDisruption: number;
} {
  // Calculate force magnitude relative to disruption threshold
  const forceMagnitude = externalForce.length();
  const normalizedForce = forceMagnitude / (field.stability.disruptionThreshold * 10);

  // Calculate new disruption level
  let newDisruption = currentDisruption;

  if (normalizedForce > field.stability.disruptionThreshold) {
    // Field is being disrupted
    const disruptionIncrease = (normalizedForce - field.stability.disruptionThreshold) * (1 - field.stability.baseStability);
    newDisruption = Math.min(1.0, currentDisruption + disruptionIncrease);
  } else {
    // Field is recovering
    const recoveryAmount = field.stability.recoveryRate * deltaTime;
    newDisruption = Math.max(0.0, currentDisruption - recoveryAmount);
  }

  // Apply energy efficiency if defined
  if (field.stability.energyEfficiency) {
    // More efficient fields maintain stability with less energy
    const efficiencyBonus = field.stability.energyEfficiency * 0.5;
    newDisruption *= (1 - efficiencyBonus);
  }

  // Apply harmonic resonance if defined and force has frequency component
  if (field.stability.harmonicResonance && externalForce.frequency) {
    // Check if force frequency is harmonic with field's natural frequency
    const fieldFrequency = field.naturalFrequency || 1.0;
    const forceFrequency = externalForce.frequency;

    // Calculate harmonic ratio (how close to integer multiple)
    const ratio = forceFrequency / fieldFrequency;
    const nearestInteger = Math.round(ratio);
    const harmonicDistance = Math.abs(ratio - nearestInteger);

    if (harmonicDistance < 0.1 && nearestInteger > 0) {
      // Force is harmonic with field - apply resonance bonus
      const resonanceBonus = field.stability.harmonicResonance * (1 - harmonicDistance * 10);
      newDisruption *= (1 - resonanceBonus);
    }
  }

  // Calculate stability factor (inverse of disruption)
  const stabilityFactor = 1 - newDisruption;

  return {
    stabilityFactor,
    newDisruption
  };
}
```

#### Stability Variations

1. **Robust Stability** (Common)
   - High resistance to disruption
   - Maintains shape and function under stress
   - Moderate recovery rate
   - Well-suited for CORE fields

2. **Resilient Stability** (Common)
   - Moderate resistance to disruption
   - Rapid recovery from disruption
   - Quickly returns to optimal function
   - Effective for DEFENSE fields

3. **Efficient Stability** (Uncommon)
   - Maintains stability with minimal energy
   - Lower overall strength but highly sustainable
   - Consistent performance over time
   - Useful for long-duration operations

4. **Harmonic Stability** (Uncommon)
   - Resonates with specific frequencies
   - Enhanced stability when in harmonic balance
   - Creates synchronized field networks
   - Particularly effective for CONTROL fields

5. **Adaptive Stability** (Rare)
   - Adjusts stability parameters based on conditions
   - Sacrifices some properties to maintain others
   - Self-optimizing under varying conditions
   - Valuable for mission-critical applications

## Force Field Dynamics

Force field dynamics describe the patterns of movement, rotation, and interaction that characterize force fields over time. These dynamics create the distinctive behaviors and visual qualities of different force field types.

### Rotation Patterns

Rotation patterns determine how force fields rotate in space, creating gyroscopic effects, orbital movements, and complex spatial relationships between fields.

```typescript
// Force field rotation implementation
interface ForceFieldRotation {
  rotationAxes: Vector3[]; // Axes of rotation (can be multiple)
  rotationSpeeds: number[]; // Speed of rotation around each axis
  rotationPhases: number[]; // Current phase of rotation around each axis
  precessionAxis?: Vector3; // Axis around which rotation axes precess
  precessionSpeed?: number; // Speed of precession
  rotationMode: 'fixed' | 'dynamic' | 'responsive'; // How rotation behaves
}

// Update field rotation
function updateFieldRotation(
  field: ForceField,
  deltaTime: number,
  externalInfluence?: Vector3
): void {
  // Get rotation parameters
  const rotation = field.rotation;

  // Update rotation phases
  for (let i = 0; i < rotation.rotationAxes.length; i++) {
    rotation.rotationPhases[i] += rotation.rotationSpeeds[i] * deltaTime;

    // Normalize phase to 0-2π
    rotation.rotationPhases[i] %= (Math.PI * 2);
  }

  // Apply precession if defined
  if (rotation.precessionAxis && rotation.precessionSpeed) {
    // Create rotation matrix for precession
    const precessionAngle = rotation.precessionSpeed * deltaTime;
    const precessionMatrix = createRotationMatrix(rotation.precessionAxis, precessionAngle);

    // Apply precession to all rotation axes
    for (let i = 0; i < rotation.rotationAxes.length; i++) {
      rotation.rotationAxes[i] = precessionMatrix.multiplyVector(rotation.rotationAxes[i]).normalize();
    }
  }

  // Apply external influence for responsive rotation mode
  if (rotation.rotationMode === 'responsive' && externalInfluence) {
    // Calculate influence magnitude
    const influenceMagnitude = externalInfluence.length();

    // Only apply if influence is significant
    if (influenceMagnitude > 0.1) {
      // Calculate influence direction
      const influenceDirection = externalInfluence.clone().normalize();

      // Adjust rotation speeds based on influence
      for (let i = 0; i < rotation.rotationAxes.length; i++) {
        // Calculate alignment with influence direction
        const alignment = Math.abs(rotation.rotationAxes[i].dot(influenceDirection));

        // Increase speed for axes aligned with influence
        const speedAdjustment = influenceMagnitude * (1 - alignment) * 0.2;
        rotation.rotationSpeeds[i] += speedAdjustment;
      }
    }
  }

  // For dynamic rotation mode, adjust rotation parameters based on field state
  if (rotation.rotationMode === 'dynamic') {
    // Example: adjust rotation based on field energy level
    const energyLevel = field.energy || 0.5;

    for (let i = 0; i < rotation.rotationSpeeds.length; i++) {
      // Scale speeds based on energy level
      rotation.rotationSpeeds[i] = rotation.rotationSpeeds[i] * (0.5 + energyLevel);
    }
  }

  // Apply rotations to field vertices
  applyRotationsToVertices(field, rotation);
}
```

#### Rotation Pattern Variations

1. **Single-Axis Rotation** (Common)
   - Rotation around a single fixed axis
   - Simple, predictable movement
   - Stable and energy-efficient
   - Suitable for CORE and DEFENSE fields

2. **Multi-Axis Rotation** (Common)
   - Rotation around multiple axes simultaneously
   - Complex, gyroscopic movement
   - Creates intricate orbital patterns
   - Well-suited for CONTROL fields

3. **Precessing Rotation** (Uncommon)
   - Rotation axes themselves rotate over time
   - Creates complex, evolving patterns
   - Unpredictable long-term behavior
   - Effective for MOVEMENT fields

4. **Responsive Rotation** (Uncommon)
   - Rotation adapts to external forces
   - Changes speed and direction based on environment
   - Creates adaptive, reactive movement
   - Useful for DEFENSE and ATTACK fields

5. **Harmonic Rotation** (Rare)
   - Multiple rotation components with harmonic relationships
   - Creates complex but ordered patterns
   - Synchronizes with other harmonic fields
   - Particularly effective for coordinated field networks

### Oscillation Patterns

Oscillation patterns determine how force fields expand, contract, and change shape over time, creating pulsations, waves, and rhythmic variations in field properties.

```typescript
// Force field oscillation implementation
interface ForceFieldOscillation {
  oscillationTypes: ('expansion' | 'deformation' | 'intensity' | 'frequency')[]; // What oscillates
  frequencies: number[]; // Frequency of each oscillation type
  amplitudes: number[]; // Amplitude of each oscillation type
  phases: number[]; // Current phase of each oscillation type
  waveforms: ('sine' | 'square' | 'triangle' | 'sawtooth')[]; // Waveform of each oscillation
  harmonics?: number[][]; // Harmonic components for complex waveforms
}

// Update field oscillation
function updateFieldOscillation(
  field: ForceField,
  deltaTime: number
): void {
  // Get oscillation parameters
  const oscillation = field.oscillation;

  // Update oscillation phases
  for (let i = 0; i < oscillation.oscillationTypes.length; i++) {
    oscillation.phases[i] += oscillation.frequencies[i] * deltaTime;

    // Normalize phase to 0-2π
    oscillation.phases[i] %= (Math.PI * 2);
  }

  // Apply oscillations based on type
  for (let i = 0; i < oscillation.oscillationTypes.length; i++) {
    const type = oscillation.oscillationTypes[i];
    const amplitude = oscillation.amplitudes[i];
    const phase = oscillation.phases[i];
    const waveform = oscillation.waveforms[i];

    // Calculate oscillation value based on waveform
    let value = 0;
    switch (waveform) {
      case 'sine':
        value = Math.sin(phase);
        break;
      case 'square':
        value = Math.sin(phase) >= 0 ? 1 : -1;
        break;
      case 'triangle':
        value = 1 - 2 * Math.abs(((phase / Math.PI) % 2) - 1);
        break;
      case 'sawtooth':
        value = (phase % (2 * Math.PI)) / Math.PI - 1;
        break;
    }

    // Apply harmonics if defined
    if (oscillation.harmonics && oscillation.harmonics[i]) {
      const harmonics = oscillation.harmonics[i];
      for (let h = 0; h < harmonics.length; h++) {
        const harmonicAmplitude = harmonics[h];
        const harmonicFrequency = h + 2; // First harmonic is 2x fundamental

        // Add harmonic component
        switch (waveform) {
          case 'sine':
            value += harmonicAmplitude * Math.sin(phase * harmonicFrequency);
            break;
          case 'square':
            value += harmonicAmplitude * (Math.sin(phase * harmonicFrequency) >= 0 ? 1 : -1);
            break;
          case 'triangle':
            value += harmonicAmplitude * (1 - 2 * Math.abs(((phase * harmonicFrequency / Math.PI) % 2) - 1));
            break;
          case 'sawtooth':
            value += harmonicAmplitude * ((phase * harmonicFrequency % (2 * Math.PI)) / Math.PI - 1);
            break;
        }
      }
    }

    // Normalize value to -1 to 1 range
    value = Math.max(-1, Math.min(1, value));

    // Apply oscillation based on type
    switch (type) {
      case 'expansion':
        // Scale field size
        const scaleFactor = 1 + value * amplitude;
        applyFieldScaling(field, scaleFactor);
        break;

      case 'deformation':
        // Deform field shape
        applyFieldDeformation(field, value * amplitude);
        break;

      case 'intensity':
        // Modulate field intensity
        field.currentIntensity = field.baseIntensity * (1 + value * amplitude);
        break;

      case 'frequency':
        // Modulate field frequency
        field.currentFrequency = field.baseFrequency * (1 + value * amplitude);
        break;
    }
  }
}
```

#### Oscillation Pattern Variations

1. **Pulsation Oscillation** (Common)
   - Rhythmic expansion and contraction
   - Simple sine wave pattern
   - Creates heartbeat-like effect
   - Well-suited for CORE fields

2. **Wave Oscillation** (Common)
   - Traveling waves across field surface
   - Creates fluid, organic movement
   - Can propagate information through field
   - Effective for MOVEMENT fields

3. **Harmonic Oscillation** (Uncommon)
   - Complex waveforms with multiple harmonics
   - Creates rich, textured patterns
   - Can synchronize with other oscillating fields
   - Particularly useful for CONTROL fields

4. **Resonant Oscillation** (Uncommon)
   - Amplifies specific frequencies
   - Creates standing wave patterns
   - Highly energy-efficient
   - Suitable for energy transfer applications

5. **Chaotic Oscillation** (Rare)
   - Unpredictable, non-repeating patterns
   - Sensitive to initial conditions
   - Creates complex, emergent behaviors
   - Useful for DEFENSE and ATTACK fields

### Interaction Patterns

Interaction patterns determine how force fields influence and respond to each other, creating complex relationships, emergent behaviors, and coordinated field networks.

```typescript
// Force field interaction implementation
interface ForceFieldInteraction {
  interactionTypes: ('attraction' | 'repulsion' | 'alignment' | 'resonance' | 'dampening')[]; // Types of interaction
  interactionStrengths: number[]; // Strength of each interaction type
  interactionRanges: number[]; // Range of each interaction type
  affinityMatrix: { // Interaction affinities with different field roles
    [role: string]: number; // Affinity value (-1.0 to 1.0)
  };
  hierarchyFactor?: number; // How much hierarchy influences interactions (0.0-1.0)
}

// Calculate interaction between two fields
function calculateFieldInteraction(
  field1: ForceField,
  field2: ForceField,
  deltaTime: number
): {
  forceOnField1: Vector3;
  forceOnField2: Vector3;
} {
  // Initialize result forces
  const forceOnField1 = new Vector3(0, 0, 0);
  const forceOnField2 = new Vector3(0, 0, 0);

  // Get interaction parameters
  const interaction1 = field1.interaction;
  const interaction2 = field2.interaction;

  // Calculate basic properties
  const direction1to2 = new Vector3().subVectors(field2.center, field1.center).normalize();
  const direction2to1 = direction1to2.clone().multiplyScalar(-1);
  const distance = field1.center.distanceTo(field2.center);

  // Process each interaction type for field1
  for (let i = 0; i < interaction1.interactionTypes.length; i++) {
    const type = interaction1.interactionTypes[i];
    const strength = interaction1.interactionStrengths[i];
    const range = interaction1.interactionRanges[i];

    // Check if within range
    if (distance > range) continue;

    // Calculate range factor (stronger at closer distances)
    const rangeFactor = 1 - (distance / range);

    // Get affinity with field2's role
    const affinity = interaction1.affinityMatrix[field2.role] || 0;

    // Apply hierarchy factor if defined
    let hierarchyModifier = 1.0;
    if (interaction1.hierarchyFactor) {
      // Higher role values have higher hierarchy
      const hierarchyDifference = getRoleHierarchyValue(field1.role) - getRoleHierarchyValue(field2.role);
      hierarchyModifier = 1 + (hierarchyDifference * interaction1.hierarchyFactor * 0.2);
    }

    // Calculate base force magnitude
    const forceMagnitude = strength * rangeFactor * affinity * hierarchyModifier;

    // Apply force based on interaction type
    switch (type) {
      case 'attraction':
        // Attract toward other field
        forceOnField1.add(direction1to2.clone().multiplyScalar(forceMagnitude));
        forceOnField2.add(direction2to1.clone().multiplyScalar(forceMagnitude));
        break;

      case 'repulsion':
        // Repel from other field
        forceOnField1.add(direction2to1.clone().multiplyScalar(forceMagnitude));
        forceOnField2.add(direction1to2.clone().multiplyScalar(forceMagnitude));
        break;

      case 'alignment':
        // Align rotation axes
        // This would modify rotation parameters rather than applying direct force
        // For simplicity, we'll just add a small alignment force
        const alignmentForce = calculateAlignmentForce(field1, field2, forceMagnitude);
        forceOnField1.add(alignmentForce.field1Force);
        forceOnField2.add(alignmentForce.field2Force);
        break;

      case 'resonance':
        // Amplify oscillations when frequencies match
        if (field1.oscillation && field2.oscillation) {
          const resonanceEffect = calculateResonanceEffect(field1, field2, forceMagnitude);
          // Resonance typically modifies oscillation parameters rather than applying direct force
          // For this example, we'll convert it to a force
          forceOnField1.add(direction1to2.clone().multiplyScalar(resonanceEffect * 0.5));
          forceOnField2.add(direction2to1.clone().multiplyScalar(resonanceEffect * 0.5));
        }
        break;

      case 'dampening':
        // Reduce oscillations and movements
        // This would typically modify velocity and oscillation parameters
        // For this example, we'll apply a force opposite to current velocity
        if (field1.velocity) {
          forceOnField1.add(field1.velocity.clone().multiplyScalar(-forceMagnitude * 0.2));
        }
        if (field2.velocity) {
          forceOnField2.add(field2.velocity.clone().multiplyScalar(-forceMagnitude * 0.2));
        }
        break;
    }
  }

  // Process interactions from field2 to field1 (similar logic)
  // This would be similar to the above but using field2's interaction parameters
  // Omitted for brevity

  return {
    forceOnField1,
    forceOnField2
  };
}

// Helper function to get role hierarchy value
function getRoleHierarchyValue(role: string): number {
  const hierarchyMap = {
    'CORE': 5,
    'CONTROL': 4,
    'MOVEMENT': 3,
    'DEFENSE': 2,
    'ATTACK': 1
  };

  return hierarchyMap[role] || 0;
}
```

#### Interaction Pattern Variations

1. **Hierarchical Interaction** (Common)
   - Based on role hierarchy (CORE > CONTROL > MOVEMENT > DEFENSE > ATTACK)
   - Higher roles influence lower roles more strongly
   - Creates organized, structured field systems
   - Fundamental to creature organization

2. **Resonant Interaction** (Common)
   - Fields with matching frequencies amplify each other
   - Creates synchronized oscillation patterns
   - Efficient energy transfer between fields
   - Well-suited for CONTROL and MOVEMENT fields

3. **Symbiotic Interaction** (Uncommon)
   - Mutually beneficial field relationships
   - Each field enhances the other's function
   - Creates specialized field pairs
   - Effective for complex, coordinated behaviors

4. **Regulatory Interaction** (Uncommon)
   - One field modulates or controls another
   - Creates feedback loops and homeostasis
   - Maintains balance in field systems
   - Particularly useful for CONTROL fields

5. **Emergent Interaction** (Rare)
   - Complex interactions between multiple fields
   - Creates behaviors not present in individual fields
   - Self-organizing field networks
   - Leads to highly adaptive, intelligent-seeming behavior

## Force Field Implementation

Force field implementation details the technical approaches used to create, update, and optimize force fields in the Bitcoin Protozoa simulation. These implementation strategies ensure efficient, scalable, and visually compelling force field behaviors.

### Gyroscopic Rotation

Gyroscopic rotation is a key implementation technique that creates complex, stable rotational patterns for force fields, mimicking the physics of gyroscopes to create lifelike movement.

```typescript
// Gyroscopic rotation implementation
interface GyroscopicRotation {
  primaryAxis: Vector3; // Main rotation axis
  secondaryAxis: Vector3; // Secondary rotation axis
  tertiaryAxis?: Vector3; // Optional tertiary rotation axis
  primarySpeed: number; // Rotation speed around primary axis
  secondarySpeed: number; // Rotation speed around secondary axis
  tertiarySpeed?: number; // Rotation speed around tertiary axis
  precessionFactor: number; // How much secondary rotation affects primary
  nutationFactor?: number; // How much tertiary rotation affects secondary
}

// Apply gyroscopic rotation to field
function applyGyroscopicRotation(
  field: ForceField,
  deltaTime: number
): void {
  // Get gyroscopic parameters
  const gyro = field.gyroscopicRotation;

  // Update rotation angles
  const primaryAngle = gyro.primarySpeed * deltaTime;
  const secondaryAngle = gyro.secondarySpeed * deltaTime;
  const tertiaryAngle = gyro.tertiarySpeed ? gyro.tertiarySpeed * deltaTime : 0;

  // Create rotation matrices
  const primaryRotation = createRotationMatrix(gyro.primaryAxis, primaryAngle);
  const secondaryRotation = createRotationMatrix(gyro.secondaryAxis, secondaryAngle);
  const tertiaryRotation = gyro.tertiaryAxis ?
    createRotationMatrix(gyro.tertiaryAxis, tertiaryAngle) : null;

  // Apply precession to primary axis
  if (gyro.precessionFactor > 0) {
    // Calculate precession effect
    const precessionAxis = gyro.secondaryAxis.clone();
    const precessionAngle = secondaryAngle * gyro.precessionFactor;
    const precessionMatrix = createRotationMatrix(precessionAxis, precessionAngle);

    // Apply precession to primary axis
    gyro.primaryAxis = precessionMatrix.multiplyVector(gyro.primaryAxis).normalize();
  }

  // Apply nutation to secondary axis
  if (gyro.nutationFactor > 0 && gyro.tertiaryAxis) {
    // Calculate nutation effect
    const nutationAxis = gyro.tertiaryAxis.clone();
    const nutationAngle = tertiaryAngle * gyro.nutationFactor;
    const nutationMatrix = createRotationMatrix(nutationAxis, nutationAngle);

    // Apply nutation to secondary axis
    gyro.secondaryAxis = nutationMatrix.multiplyVector(gyro.secondaryAxis).normalize();
  }

  // Apply rotations to field vertices
  for (let i = 0; i < field.vertices.length; i++) {
    // Get base vertex and translate to origin
    const baseVertex = field.baseVertices[i].clone();
    const relativeVertex = baseVertex.clone().sub(field.center);

    // Apply rotations in sequence
    let rotated = relativeVertex;
    rotated = primaryRotation.multiplyVector(rotated);
    rotated = secondaryRotation.multiplyVector(rotated);
    if (tertiaryRotation) {
      rotated = tertiaryRotation.multiplyVector(rotated);
    }

    // Translate back to field center
    rotated.add(field.center);

    // Update vertex
    field.vertices[i].copy(rotated);
  }

  // Update field orientation vectors if needed
  if (field.orientationVectors) {
    field.orientationVectors.forward = primaryRotation.multiplyVector(field.orientationVectors.forward).normalize();
    field.orientationVectors.up = primaryRotation.multiplyVector(field.orientationVectors.up).normalize();
    field.orientationVectors.right = new Vector3().crossVectors(
      field.orientationVectors.forward,
      field.orientationVectors.up
    ).normalize();
  }
}
```

#### Gyroscopic Rotation Optimization

1. **Quaternion-Based Rotation**
   - Use quaternions instead of matrices for more efficient and stable rotations
   - Avoids gimbal lock issues in complex rotation scenarios
   - Reduces computational overhead for multiple rotations
   - Improves numerical stability for long-running simulations

2. **Adaptive Rotation Complexity**
   - Use simpler rotation models for distant or less important fields
   - Apply full gyroscopic complexity only to visually prominent fields
   - Dynamically adjust rotation complexity based on performance metrics
   - Ensures consistent frame rates across different hardware

### Containment Logic

Containment logic determines how force fields contain and influence particles, creating boundaries, attraction zones, and complex spatial relationships between fields and particles.

```typescript
// Force field containment implementation
interface ForceFieldContainment {
  containmentType: 'hard' | 'soft' | 'permeable' | 'gradient' | 'selective'; // Type of containment
  containmentStrength: number; // Strength of containment force
  falloffExponent: number; // How quickly force diminishes with distance
  innerRadius: number; // Inner radius where containment begins
  outerRadius: number; // Outer radius where containment ends
  permeabilityFactors?: { // For selective containment
    [particleRole: string]: number; // 0.0 (impermeable) to 1.0 (fully permeable)
  };
}

// Calculate containment force for a particle
function calculateContainmentForce(
  field: ForceField,
  particle: Particle
): Vector3 {
  // Get containment parameters
  const containment = field.containment;

  // Calculate distance from particle to field center
  const distanceVector = new Vector3().subVectors(particle.position, field.center);
  const distance = distanceVector.length();

  // Initialize containment force
  const containmentForce = new Vector3(0, 0, 0);

  // Check if particle is within containment range
  if (distance >= containment.innerRadius && distance <= containment.outerRadius) {
    // Calculate normalized distance within containment range
    const normalizedDistance = (distance - containment.innerRadius) /
                              (containment.outerRadius - containment.innerRadius);

    // Calculate base force direction (toward field center)
    const forceDirection = distanceVector.clone().multiplyScalar(-1).normalize();

    // Calculate force magnitude based on containment type
    let forceMagnitude = 0;

    switch (containment.containmentType) {
      case 'hard':
        // Strong force that increases rapidly near the boundary
        forceMagnitude = containment.containmentStrength *
                        Math.pow(normalizedDistance, containment.falloffExponent);
        break;

      case 'soft':
        // Gentle force that gradually increases toward the boundary
        forceMagnitude = containment.containmentStrength *
                        Math.pow(normalizedDistance, 1 / containment.falloffExponent);
        break;

      case 'permeable':
        // Force that allows particles to pass through with resistance
        if (normalizedDistance > 0.8) {
          // Strong resistance near the boundary
          forceMagnitude = containment.containmentStrength *
                          Math.pow((normalizedDistance - 0.8) * 5, 2);
        } else {
          // Minimal resistance within the field
          forceMagnitude = containment.containmentStrength * 0.1 * normalizedDistance;
        }
        break;

      case 'gradient':
        // Force that varies smoothly across the field
        // Creates density gradients rather than sharp boundaries
        forceMagnitude = containment.containmentStrength *
                        (Math.sin(normalizedDistance * Math.PI) * 0.5 + 0.5);
        break;

      case 'selective':
        // Force that affects different particle roles differently
        if (containment.permeabilityFactors) {
          const permeability = containment.permeabilityFactors[particle.role] || 0.5;
          forceMagnitude = containment.containmentStrength *
                          Math.pow(normalizedDistance, containment.falloffExponent) *
                          (1 - permeability);
        } else {
          // Default to hard containment if no permeability factors defined
          forceMagnitude = containment.containmentStrength *
                          Math.pow(normalizedDistance, containment.falloffExponent);
        }
        break;
    }

    // Apply force direction and magnitude
    containmentForce.copy(forceDirection.multiplyScalar(forceMagnitude));
  }

  return containmentForce;
}
```

#### Containment Logic Optimization

1. **Spatial Partitioning**
   - Use spatial hash grids or octrees to efficiently find particles within containment range
   - Reduces unnecessary distance calculations for particles far from field boundaries
   - Scales well with large numbers of particles
   - Particularly important for complex scenes with multiple fields

2. **Force Caching**
   - Cache containment forces for particles that haven't moved significantly
   - Update forces only when particles cross cell boundaries in spatial partitioning
   - Reduces redundant calculations for stable particle configurations
   - Particularly effective for particles in equilibrium states

### Influence Calculation

Influence calculation determines how force fields affect particle behavior beyond simple containment, creating complex movement patterns, behavioral modifications, and emergent group dynamics.

```typescript
// Force field influence implementation
interface ForceFieldInfluence {
  influenceType: 'directional' | 'rotational' | 'oscillatory' | 'behavioral' | 'energetic'; // Type of influence
  influenceStrength: number; // Strength of influence
  influenceRange: number; // Range of influence
  falloffCurve: 'linear' | 'quadratic' | 'exponential' | 'gaussian'; // How influence diminishes with distance
  targetRoles: string[]; // Particle roles affected by this influence
  influenceVector?: Vector3; // Direction of influence (for directional type)
  influenceAxis?: Vector3; // Axis of rotation (for rotational type)
  oscillationParameters?: { // For oscillatory influence
    frequency: number;
    amplitude: number;
    phase: number;
  };
  behavioralParameters?: { // For behavioral influence
    behaviorType: string;
    behaviorStrength: number;
    behaviorDuration: number;
  };
}

// Calculate influence effect on a particle
function calculateInfluenceEffect(
  field: ForceField,
  particle: Particle,
  deltaTime: number
): void {
  // Get influence parameters
  const influence = field.influence;

  // Check if particle role is targeted by this influence
  if (!influence.targetRoles.includes(particle.role)) {
    return;
  }

  // Calculate distance from particle to field center
  const distanceVector = new Vector3().subVectors(particle.position, field.center);
  const distance = distanceVector.length();

  // Check if particle is within influence range
  if (distance > influence.influenceRange) {
    return;
  }

  // Calculate influence factor based on distance and falloff curve
  const normalizedDistance = distance / influence.influenceRange;
  let influenceFactor = 0;

  switch (influence.falloffCurve) {
    case 'linear':
      influenceFactor = 1 - normalizedDistance;
      break;

    case 'quadratic':
      influenceFactor = Math.pow(1 - normalizedDistance, 2);
      break;

    case 'exponential':
      influenceFactor = Math.exp(-5 * normalizedDistance);
      break;

    case 'gaussian':
      influenceFactor = Math.exp(-5 * Math.pow(normalizedDistance, 2));
      break;
  }

  // Apply influence based on type
  switch (influence.influenceType) {
    case 'directional':
      // Apply directional force
      if (influence.influenceVector) {
        const forceVector = influence.influenceVector.clone()
          .multiplyScalar(influence.influenceStrength * influenceFactor);
        particle.acceleration.add(forceVector);
      }
      break;

    case 'rotational':
      // Apply rotational force
      if (influence.influenceAxis) {
        const toParticle = distanceVector.clone().normalize();
        const rotationForce = new Vector3()
          .crossVectors(influence.influenceAxis, toParticle)
          .multiplyScalar(influence.influenceStrength * influenceFactor);
        particle.acceleration.add(rotationForce);
      }
      break;

    case 'oscillatory':
      // Apply oscillating force
      if (influence.oscillationParameters) {
        const { frequency, amplitude, phase } = influence.oscillationParameters;
        const oscillationFactor = Math.sin(phase + frequency * Date.now() * 0.001) * amplitude;

        // Direction is radial by default
        const oscillationDirection = distanceVector.clone().normalize();
        const oscillationForce = oscillationDirection
          .multiplyScalar(oscillationFactor * influence.influenceStrength * influenceFactor);

        particle.acceleration.add(oscillationForce);

        // Update phase for next frame
        influence.oscillationParameters.phase += frequency * deltaTime;
      }
      break;

    case 'behavioral':
      // Modify particle behavior
      if (influence.behavioralParameters) {
        // Store influence on particle for behavior system to process
        if (!particle.behavioralInfluences) {
          particle.behavioralInfluences = [];
        }

        particle.behavioralInfluences.push({
          type: influence.behavioralParameters.behaviorType,
          strength: influence.behavioralParameters.behaviorStrength * influenceFactor,
          duration: influence.behavioralParameters.behaviorDuration,
          source: field.id
        });
      }
      break;

    case 'energetic':
      // Modify particle energy level
      if (!particle.energy) {
        particle.energy = 0.5; // Default energy level
      }

      // Apply energy change
      const energyChange = influence.influenceStrength * influenceFactor * deltaTime;
      particle.energy = Math.max(0, Math.min(1, particle.energy + energyChange));

      // Energy affects particle properties
      particle.speed = particle.baseSpeed * (0.5 + particle.energy * 0.5);
      particle.size = particle.baseSize * (0.8 + particle.energy * 0.4);
      break;
  }
}
```

#### Influence Calculation Optimization

1. **Influence Prioritization**
   - Prioritize influence calculations based on field strength and proximity
   - Apply strongest and closest influences first, potentially skipping weaker ones
   - Use early termination when particle behavior is already dominated by strong influences
   - Ensures most visually important influences are calculated accurately

2. **Batch Processing**
   - Process influences for groups of similar particles together
   - Share influence calculations across particles in the same spatial region
   - Utilize SIMD instructions for parallel influence calculations
   - Significantly improves performance for large particle groups

### Spatial Optimization

Spatial optimization techniques improve the performance and scalability of force field simulations, enabling complex, interactive simulations with large numbers of fields and particles.

```typescript
// Spatial optimization implementation
interface SpatialGrid {
  cellSize: number; // Size of each grid cell
  bounds: { // Grid boundaries
    min: Vector3;
    max: Vector3;
  };
  dimensions: { // Number of cells in each dimension
    x: number;
    y: number;
    z: number;
  };
  cells: Map<string, { // Grid cells indexed by cell coordinates
    particles: Set<Particle>;
    fields: Set<ForceField>;
  }>;
}

// Initialize spatial grid
function initializeSpatialGrid(
  worldBounds: { min: Vector3; max: Vector3 },
  cellSize: number
): SpatialGrid {
  // Calculate grid dimensions
  const dimensions = {
    x: Math.ceil((worldBounds.max.x - worldBounds.min.x) / cellSize),
    y: Math.ceil((worldBounds.max.y - worldBounds.min.y) / cellSize),
    z: Math.ceil((worldBounds.max.z - worldBounds.min.z) / cellSize)
  };

  // Create grid
  return {
    cellSize,
    bounds: worldBounds,
    dimensions,
    cells: new Map()
  };
}

// Get cell key from position
function getCellKey(grid: SpatialGrid, position: Vector3): string {
  // Calculate cell indices
  const x = Math.floor((position.x - grid.bounds.min.x) / grid.cellSize);
  const y = Math.floor((position.y - grid.bounds.min.y) / grid.cellSize);
  const z = Math.floor((position.z - grid.bounds.min.z) / grid.cellSize);

  // Clamp to grid bounds
  const clampedX = Math.max(0, Math.min(grid.dimensions.x - 1, x));
  const clampedY = Math.max(0, Math.min(grid.dimensions.y - 1, y));
  const clampedZ = Math.max(0, Math.min(grid.dimensions.z - 1, z));

  // Create cell key
  return `${clampedX},${clampedY},${clampedZ}`;
}

// Update spatial grid
function updateSpatialGrid(
  grid: SpatialGrid,
  particles: Particle[],
  fields: ForceField[]
): void {
  // Clear grid
  grid.cells.clear();

  // Add particles to grid
  particles.forEach(particle => {
    const cellKey = getCellKey(grid, particle.position);

    // Create cell if it doesn't exist
    if (!grid.cells.has(cellKey)) {
      grid.cells.set(cellKey, {
        particles: new Set(),
        fields: new Set()
      });
    }

    // Add particle to cell
    grid.cells.get(cellKey).particles.add(particle);
  });

  // Add fields to grid (fields can span multiple cells)
  fields.forEach(field => {
    // Get field bounds
    const fieldMin = new Vector3(
      field.center.x - field.boundingSphere.radius,
      field.center.y - field.boundingSphere.radius,
      field.center.z - field.boundingSphere.radius
    );

    const fieldMax = new Vector3(
      field.center.x + field.boundingSphere.radius,
      field.center.y + field.boundingSphere.radius,
      field.center.z + field.boundingSphere.radius
    );

    // Calculate cell indices for field bounds
    const minX = Math.floor((fieldMin.x - grid.bounds.min.x) / grid.cellSize);
    const minY = Math.floor((fieldMin.y - grid.bounds.min.y) / grid.cellSize);
    const minZ = Math.floor((fieldMin.z - grid.bounds.min.z) / grid.cellSize);

    const maxX = Math.floor((fieldMax.x - grid.bounds.min.x) / grid.cellSize);
    const maxY = Math.floor((fieldMax.y - grid.bounds.min.y) / grid.cellSize);
    const maxZ = Math.floor((fieldMax.z - grid.bounds.min.z) / grid.cellSize);

    // Clamp to grid bounds
    const clampedMinX = Math.max(0, minX);
    const clampedMinY = Math.max(0, minY);
    const clampedMinZ = Math.max(0, minZ);

    const clampedMaxX = Math.min(grid.dimensions.x - 1, maxX);
    const clampedMaxY = Math.min(grid.dimensions.y - 1, maxY);
    const clampedMaxZ = Math.min(grid.dimensions.z - 1, maxZ);

    // Add field to all cells it overlaps
    for (let x = clampedMinX; x <= clampedMaxX; x++) {
      for (let y = clampedMinY; y <= clampedMaxY; y++) {
        for (let z = clampedMinZ; z <= clampedMaxZ; z++) {
          const cellKey = `${x},${y},${z}`;

          // Create cell if it doesn't exist
          if (!grid.cells.has(cellKey)) {
            grid.cells.set(cellKey, {
              particles: new Set(),
              fields: new Set()
            });
          }

          // Add field to cell
          grid.cells.get(cellKey).fields.add(field);
        }
      }
    }
  });
}

// Get fields that could affect a particle
function getRelevantFields(
  grid: SpatialGrid,
  particle: Particle
): ForceField[] {
  const cellKey = getCellKey(grid, particle.position);

  // Get fields in particle's cell
  if (grid.cells.has(cellKey)) {
    return Array.from(grid.cells.get(cellKey).fields);
  }

  return [];
}

// Get particles that could be affected by a field
function getRelevantParticles(
  grid: SpatialGrid,
  field: ForceField
): Particle[] {
  const relevantParticles = new Set<Particle>();

  // Get field bounds
  const fieldMin = new Vector3(
    field.center.x - field.boundingSphere.radius,
    field.center.y - field.boundingSphere.radius,
    field.center.z - field.boundingSphere.radius
  );

  const fieldMax = new Vector3(
    field.center.x + field.boundingSphere.radius,
    field.center.y + field.boundingSphere.radius,
    field.center.z + field.boundingSphere.radius
  );

  // Calculate cell indices for field bounds
  const minX = Math.floor((fieldMin.x - grid.bounds.min.x) / grid.cellSize);
  const minY = Math.floor((fieldMin.y - grid.bounds.min.y) / grid.cellSize);
  const minZ = Math.floor((fieldMin.z - grid.bounds.min.z) / grid.cellSize);

  const maxX = Math.floor((fieldMax.x - grid.bounds.min.x) / grid.cellSize);
  const maxY = Math.floor((fieldMax.y - grid.bounds.min.y) / grid.cellSize);
  const maxZ = Math.floor((fieldMax.z - grid.bounds.min.z) / grid.cellSize);

  // Clamp to grid bounds
  const clampedMinX = Math.max(0, minX);
  const clampedMinY = Math.max(0, minY);
  const clampedMinZ = Math.max(0, minZ);

  const clampedMaxX = Math.min(grid.dimensions.x - 1, maxX);
  const clampedMaxY = Math.min(grid.dimensions.y - 1, maxY);
  const clampedMaxZ = Math.min(grid.dimensions.z - 1, maxZ);

  // Collect particles from all cells the field overlaps
  for (let x = clampedMinX; x <= clampedMaxX; x++) {
    for (let y = clampedMinY; y <= clampedMaxY; y++) {
      for (let z = clampedMinZ; z <= clampedMaxZ; z++) {
        const cellKey = `${x},${y},${z}`;

        if (grid.cells.has(cellKey)) {
          const cell = grid.cells.get(cellKey);
          cell.particles.forEach(particle => relevantParticles.add(particle));
        }
      }
    }
  }

  return Array.from(relevantParticles);
}
```

#### Spatial Optimization Techniques

1. **Adaptive Grid Resolution**
   - Use finer grid resolution in areas with high particle density
   - Use coarser grid resolution in sparse areas
   - Dynamically adjust grid resolution based on simulation state
   - Balances precision and performance across different regions

2. **Level of Detail (LOD)**
   - Reduce simulation complexity for distant or less visible fields
   - Simplify field shapes and behaviors based on camera distance
   - Merge similar fields when viewed from a distance
   - Ensures consistent performance while maintaining visual quality

### Deterministic Generation

Deterministic generation ensures that force fields are created consistently based on Bitcoin block data, allowing for reproducible, unique creatures that evolve with their Bitcoin block confirmations.

```typescript
// Deterministic force field generation implementation
interface ForceFieldGenerationParams {
  blockNonce: number; // Bitcoin block nonce
  confirmations: number; // Number of block confirmations
  creatureId: string; // Unique identifier for the creature
  fieldRole: ParticleRole; // Role of the field to generate
  fieldIndex: number; // Index of the field within its role group
}

// Generate a force field deterministically
function generateForceField(
  params: ForceFieldGenerationParams
): ForceField {
  // Create seeded RNG using Mulberry32
  const seed = createSeedFromParams(params);
  const rng = createMulberry32(seed);

  // Determine field type based on role and RNG
  const fieldType = determineFieldType(params.fieldRole, rng);

  // Determine field rarity based on confirmations and RNG
  const rarityTier = determineRarityTier(params.confirmations, rng);

  // Generate field parameters based on type, rarity, and RNG
  const fieldParams = generateFieldParameters(fieldType, rarityTier, rng);

  // Create field based on parameters
  return createFieldFromParameters(fieldParams, params);
}

// Create seed from generation parameters
function createSeedFromParams(params: ForceFieldGenerationParams): number {
  // Combine parameters into a deterministic seed
  let seed = params.blockNonce;

  // Add hash of creature ID
  const creatureIdHash = simpleHash(params.creatureId);
  seed = (seed * 16777619) ^ creatureIdHash;

  // Add role and index
  const roleValue = getRoleValue(params.fieldRole);
  seed = (seed * 16777619) ^ roleValue;
  seed = (seed * 16777619) ^ params.fieldIndex;

  return seed;
}

// Simple string hash function
function simpleHash(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    const char = str.charCodeAt(i);
    hash = ((hash << 5) - hash) + char;
    hash = hash & hash; // Convert to 32bit integer
  }
  return hash >>> 0; // Ensure unsigned
}

// Create Mulberry32 RNG from seed
function createMulberry32(seed: number): () => number {
  return function() {
    seed = (seed + 0x6D2B79F5) | 0;
    let t = Math.imul(seed ^ (seed >>> 15), 1 | seed);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

// Determine field type based on role and RNG
function determineFieldType(role: ParticleRole, rng: () => number): string {
  // Define available field types for each role
  const fieldTypes = {
    [ParticleRole.CORE]: ['spherical', 'pulsating', 'quantum'],
    [ParticleRole.CONTROL]: ['gyroscopic', 'resonant', 'neural'],
    [ParticleRole.MOVEMENT]: ['fin', 'vortex', 'jet'],
    [ParticleRole.DEFENSE]: ['membrane', 'reactive', 'phase'],
    [ParticleRole.ATTACK]: ['sentry', 'striker', 'disruptor']
  };

  // Get available types for this role
  const availableTypes = fieldTypes[role] || ['default'];

  // Select type based on RNG
  const typeIndex = Math.floor(rng() * availableTypes.length);
  return availableTypes[typeIndex];
}

// Determine rarity tier based on confirmations and RNG
function determineRarityTier(confirmations: number, rng: () => number): string {
  // Define rarity tiers and their weights
  const rarityTiers = [
    { tier: 'common', weight: 8, minConfirmations: 0 },
    { tier: 'uncommon', weight: 6, minConfirmations: 10 },
    { tier: 'rare', weight: 4, minConfirmations: 100 },
    { tier: 'epic', weight: 3, minConfirmations: 1000 },
    { tier: 'legendary', weight: 2, minConfirmations: 10000 },
    { tier: 'mythic', weight: 1, minConfirmations: 100000 }
  ];

  // Filter tiers based on confirmations
  const eligibleTiers = rarityTiers.filter(tier => confirmations >= tier.minConfirmations);

  // Calculate total weight
  const totalWeight = eligibleTiers.reduce((sum, tier) => sum + tier.weight, 0);

  // Select tier based on weighted RNG
  let randomValue = rng() * totalWeight;
  for (const tier of eligibleTiers) {
    randomValue -= tier.weight;
    if (randomValue <= 0) {
      return tier.tier;
    }
  }

  // Fallback to common
  return 'common';
}

// Generate field parameters based on type, rarity, and RNG
function generateFieldParameters(
  fieldType: string,
  rarityTier: string,
  rng: () => number
): any {
  // Base parameters common to all fields
  const baseParams = {
    strength: 0.5 + rng() * 0.5, // 0.5 to 1.0
    flexibility: 0.3 + rng() * 0.7, // 0.3 to 1.0
    responsiveness: 0.4 + rng() * 0.6, // 0.4 to 1.0
    stability: 0.6 + rng() * 0.4 // 0.6 to 1.0
  };

  // Apply rarity modifiers
  const rarityModifiers = {
    'common': 1.0,
    'uncommon': 1.2,
    'rare': 1.5,
    'epic': 1.8,
    'legendary': 2.2,
    'mythic': 3.0
  };

  const rarityModifier = rarityModifiers[rarityTier] || 1.0;

  // Apply type-specific parameters
  const typeParams = generateTypeSpecificParameters(fieldType, rng);

  // Combine and apply rarity modifier
  const combinedParams = { ...baseParams, ...typeParams };

  // Apply rarity modifier to numeric parameters
  Object.keys(combinedParams).forEach(key => {
    if (typeof combinedParams[key] === 'number') {
      // Apply modifier with diminishing returns for values close to 1.0
      const value = combinedParams[key];
      if (value < 1.0) {
        // Apply modifier with diminishing returns
        combinedParams[key] = Math.min(1.0, value * Math.sqrt(rarityModifier));
      } else {
        // For values already >= 1.0, apply modifier directly
        combinedParams[key] = value * rarityModifier;
      }
    }
  });

  return combinedParams;
}

// Generate type-specific parameters
function generateTypeSpecificParameters(fieldType: string, rng: () => number): any {
  // Parameters specific to each field type
  switch (fieldType) {
    case 'spherical':
      return {
        radius: 3.0 + rng() * 2.0,
        rotationSpeed: 0.001 + rng() * 0.002
      };

    case 'pulsating':
      return {
        radius: 2.5 + rng() * 2.0,
        pulsationFrequency: 0.03 + rng() * 0.04,
        pulsationAmplitude: 0.1 + rng() * 0.2
      };

    // Additional field types would be defined here
    // ...

    default:
      return {};
  }
}
```

#### Deterministic Generation Principles

1. **Seed Consistency**
   - Use consistent seed derivation from Bitcoin block data
   - Ensure identical results across different devices and implementations
   - Maintain backward compatibility as the system evolves
   - Critical for reproducible creature generation

2. **Evolutionary Progression**
   - Scale field complexity with Bitcoin block confirmations
   - Introduce new field types and behaviors at confirmation milestones
   - Maintain core identity while allowing growth and development
   - Creates meaningful connection between creature and its Bitcoin history

## Force Field Rarity Tiers

Force field rarity tiers define the relative scarcity and power of different force field types, creating a hierarchy of field capabilities that evolves with Bitcoin block confirmations.

### Common Force Fields

Common force fields are the most frequently occurring field types, providing basic functionality and forming the foundation of most creatures. These fields are available from the beginning (0 confirmations).

#### Core Common Fields

- **Spherical Core**: Basic central containment field with minimal rotation
- **Stable Nucleus**: Provides strong central stability with moderate influence range
- **Balanced Hub**: Creates equilibrium between different particle groups

#### Control Common Fields

- **Gyroscopic Control**: Creates stable rotation patterns with moderate influence
- **Directive Field**: Provides basic directional control for movement
- **Coordination Matrix**: Synchronizes movement between different particle groups

#### Movement Common Fields

- **Fin Propulsion**: Creates basic directional movement through oscillation
- **Drift Field**: Enables smooth, floating movement with minimal energy
- **Basic Thruster**: Provides direct propulsion in a single direction

#### Defense Common Fields

- **Barrier Formation**: Creates a simple protective boundary
- **Deflection Field**: Redirects external forces around the creature
- **Absorption Layer**: Reduces impact of external forces

#### Attack Common Fields

- **Sentry Patrol**: Detects and responds to nearby entities
- **Probe Extension**: Investigates surrounding environment
- **Simple Disruptor**: Creates minor disturbances in nearby fields

### Uncommon Force Fields

Uncommon force fields provide enhanced capabilities and more specialized functions. These fields become available with moderate confirmations (10+ confirmations).

#### Core Uncommon Fields

- **Pulsating Core**: Creates rhythmic expansion and contraction with wave effects
- **Resonant Nucleus**: Amplifies specific frequencies throughout the creature
- **Adaptive Hub**: Adjusts properties based on environmental conditions

#### Control Uncommon Fields

- **Resonant Control**: Creates harmonic oscillations that influence other fields
- **Neural Network**: Learns and adapts to repeated stimuli
- **Temporal Regulator**: Synchronizes different time-based behaviors

#### Movement Uncommon Fields

- **Vortex Propulsion**: Creates efficient spiral movement patterns
- **Phase Shifter**: Enables rapid position changes through phase transitions
- **Momentum Field**: Stores and releases kinetic energy efficiently

#### Defense Uncommon Fields

- **Reactive Shield**: Dynamically responds to threats with targeted reinforcement
- **Adaptive Membrane**: Changes permeability based on external conditions
- **Energy Diffuser**: Disperses incoming forces across the creature's structure

#### Attack Uncommon Fields

- **Tactical Striker**: Extends to attack or investigate with precision
- **Disruptive Pulse**: Creates energy waves that interfere with other fields
- **Targeting Matrix**: Improves accuracy and efficiency of offensive actions

### Rare Force Fields

Rare force fields provide advanced capabilities with unique properties. These fields become available with significant confirmations (100+ confirmations).

#### Core Rare Fields

- **Quantum Core**: Creates unpredictable, probabilistic effects with high energy efficiency
- **Fractal Nucleus**: Self-similar structure that creates complex, recursive patterns
- **Dimensional Hub**: Manipulates spatial relationships between particle groups

#### Control Rare Fields

- **Consensus Field**: Creates emergent decision-making across particle groups
- **Quantum Controller**: Utilizes quantum effects for instantaneous coordination
- **Probability Matrix**: Manipulates likelihood of different behavioral outcomes

#### Movement Rare Fields

- **Quantum Propulsion**: Enables teleportation-like movement through quantum effects
- **Spacetime Folder**: Creates shortcuts through local space for rapid movement
- **Inertial Manipulator**: Selectively modifies mass properties for enhanced agility

#### Defense Rare Fields

- **Phase Shifting**: Rapidly shifts between different defensive states
- **Probability Shield**: Creates zones where harmful interactions become improbable
- **Recursive Barrier**: Self-reinforcing structure with fractal properties

#### Attack Rare Fields

- **Quantum Strike**: Creates unpredictable, high-speed attack patterns
- **Dimensional Disruptor**: Interferes with spatial properties of targets
- **Probability Cascade**: Triggers chain reactions of destabilizing effects

### Epic Force Fields

Epic force fields provide exceptional capabilities with dramatic effects. These fields become available with extensive confirmations (1,000+ confirmations).

#### Core Epic Fields

- **Singularity Core**: Creates extreme gravitational-like effects with unique physics
- **Hyperdimensional Nucleus**: Operates partially outside normal spatial dimensions
- **Temporal Anchor**: Stabilizes the creature against temporal fluctuations

#### Control Epic Fields

- **Hivemind Controller**: Creates unified consciousness-like coordination
- **Reality Filter**: Selectively enforces or ignores physical laws
- **Causal Matrix**: Manipulates cause-and-effect relationships

#### Movement Epic Fields

- **Probability Drive**: Collapses quantum states to enable instantaneous repositioning
- **Dimensional Slip**: Moves partially between dimensional states for unique movement
- **Temporal Accelerator**: Manipulates local time flow for extreme speed

#### Defense Epic Fields

- **Probability Fortress**: Creates zones where harmful events cannot occur
- **Dimensional Refuge**: Shifts vulnerable components partially out of normal space
- **Causal Barrier**: Prevents cause-and-effect chains that would damage the creature

#### Attack Epic Fields

- **Reality Shear**: Creates localized breakdowns in physical consistency
- **Dimensional Ripper**: Forcibly separates spatial relationships
- **Probability Collapse**: Forces unfavorable quantum states on targets

### Legendary Force Fields

Legendary force fields provide extraordinary capabilities that fundamentally alter the nature of the creature. These fields become available with exceptional confirmations (10,000+ confirmations).

#### Core Legendary Fields

- **Reality Core**: Defines local physical laws within its influence
- **Cosmic Nucleus**: Connects to fundamental universal forces
- **Eternal Anchor**: Exists partially outside normal temporal flow

#### Control Legendary Fields

- **Universal Controller**: Harmonizes with fundamental forces of reality
- **Cosmic Intelligence**: Develops emergent problem-solving capabilities
- **Fate Matrix**: Influences probability at a fundamental level

#### Movement Legendary Fields

- **Reality Fold**: Creates temporary connections between distant points
- **Cosmic Slip**: Moves through underlying fabric of reality
- **Eternal Engine**: Generates unlimited energy for movement

#### Defense Legendary Fields

- **Reality Exclusion**: Creates zones where harmful effects cannot exist
- **Cosmic Shield**: Draws on fundamental forces for protection
- **Eternal Barrier**: Exists across multiple temporal states simultaneously

#### Attack Legendary Fields

- **Reality Fracture**: Creates cascading breakdowns in target's physical integrity
- **Cosmic Strike**: Channels fundamental forces into devastating attacks
- **Fate Manipulator**: Forces catastrophically unlikely failure states

### Mythic Force Fields

Mythic force fields provide godlike capabilities that transcend normal physics. These fields become available only with extraordinary confirmations (100,000+ confirmations).

#### Core Mythic Fields

- **Creation Core**: Generates new physical properties and possibilities
- **Infinite Nucleus**: Contains potentially unlimited energy and complexity
- **Transcendent Hub**: Exists partially beyond conventional reality

#### Control Mythic Fields

- **Omniscient Controller**: Perceives and processes all relevant information
- **Reality Programmer**: Rewrites local physical laws
- **Divine Matrix**: Creates perfect harmony across all creature systems

#### Movement Mythic Fields

- **Omnipresent Drive**: Exists potentially everywhere simultaneously
- **Reality Swimmer**: Moves through the underlying fabric of existence
- **Infinite Engine**: Transcends conventional energy limitations

#### Defense Mythic Fields

- **Divine Shield**: Perfect protection against conventional forces
- **Reality Bubble**: Creates pocket universe with favorable physics
- **Transcendent Barrier**: Exists beyond the reach of conventional attacks

#### Attack Mythic Fields

- **Reality Sundering**: Fundamentally alters the nature of targets
- **Divine Strike**: Channels seemingly unlimited energy
- **Existential Cascade**: Creates chain reactions that transcend normal physics

## Related Documents

- [Traits Overview](00_summary.md) - Overview of all trait systems
- [Color Palettes](01_color_palettes.md) - Color palettes for particle groups
- [Particle Shapes](02_particle_shapes.md) - Shape variations for particles
- [Formation Patterns](03_formation_patterns.md) - Formation patterns for particle groups
- [Behavior Traits](04_behavior_traits.md) - Behavior traits for particle groups
- [Physics System](../engine/02_physics_system.md) - Core physics implementation
- [Particle System](../engine/03_particle_system.md) - Particle system implementation
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - Integration with Bitcoin blockchain
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - Evolution based on confirmations
 
``` 
 
--- 
 
### 06_trait_system.md 
 
```.md 
# Trait System

This document outlines the trait system for particle creatures in the Bitcoin Protozoa project, including the different categories of traits, how they're assigned, and how they affect the behavior and appearance of creatures.

## Table of Contents

1. [Overview](#overview) [Line 10]
2. [Core Concepts](#core-concepts) [Line 20]
   - [Deterministic RNG-Based Trait Assignment](#deterministic-rng-based-trait-assignment) [Line 25]
   - [Group-Based Trait Application](#group-based-trait-application) [Line 50]
3. [Group Attributes](#group-attributes) [Line 75]
   - [Physical Attributes](#physical-attributes) [Line 80]
   - [Visual Attributes](#visual-attributes) [Line 100]
   - [Force Calculation Attributes](#force-calculation-attributes) [Line 120]
4. [Trait Categories](#trait-categories) [Line 140]
   - [Visual Traits](#visual-traits) [Line 150]
   - [Formation Traits](#formation-traits) [Line 200]
   - [Behavior Traits](#behavior-traits) [Line 250]
   - [Force Calculation Traits](#force-calculation-traits) [Line 300]
5. [Trait Assignment Process](#trait-assignment-process) [Line 350]
   - [Deterministic RNG-Based Assignment](#deterministic-rng-based-assignment) [Line 360]
   - [Rarity Determination](#rarity-determination) [Line 380]
   - [Trait Selection](#trait-selection) [Line 400]
6. [Implementation Considerations](#implementation-considerations) [Line 450]
   - [Trait Data Structure](#trait-data-structure) [Line 460]
   - [Trait Visualization](#trait-visualization) [Line 480]
   - [Behavior Implementation](#behavior-implementation) [Line 500]
7. [Future Expansion](#future-expansion) [Line 520]
8. [Related Documents](#related-documents) [Line 550]

## Overview

The trait system is a core component of the Bitcoin Protozoa project, responsible for defining the characteristics, behaviors, and appearances of particle creatures. Traits are deterministically generated based on Bitcoin block data, ensuring that creatures are unique but reproducible given the same block height.

Each particle creature consists of five distinct particle groups (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK), with each group having its own set of traits that influence its appearance, behavior, and interactions with other groups.

## Core Concepts

### Deterministic RNG-Based Trait Assignment

All traits are assigned using a deterministic RNG chain based on the Bitcoin block nonce:

```typescript
// Start with block nonce as seed
const initialSeed = blockData.nonce;
const rng = mulberry32(initialSeed);

// Create a chain of RNG values for different trait categories
const traitRNG = {
  visual: createChainRNG(rng(), 'visual'),
  formation: createChainRNG(rng(), 'formation'),
  behavior: createChainRNG(rng(), 'behavior'),
  force: createChainRNG(rng(), 'force')
};

// Function to create a chained RNG for a specific trait category
function createChainRNG(seed: number, purpose: string): () => number {
  let currentSeed = seed;
  return () => {
    currentSeed = mulberry32(currentSeed)();
    return currentSeed;
  };
}
```

This approach ensures that:
- Traits are deterministically generated from the block nonce
- Different trait categories have independent but deterministic RNG streams
- The same block always produces the same traits

### Group-Based Trait Application

Traits are applied at the group level, with each of the five role groups receiving their own set of traits:

```typescript
// Assign traits to each group
Object.keys(groups).forEach(groupId => {
  const group = groups[groupId];
  assignTraitsToGroup(group, traitRNG);
});

function assignTraitsToGroup(group: ParticleGroup, traitRNG: TraitRNG) {
  // Assign traits based on group role
  const roleSpecificTraits = getRoleSpecificTraitOptions(group.role);

  // Assign visual traits
  group.visualTraits = selectTraitFromArray(
    roleSpecificTraits.visualOptions,
    traitRNG.visual()
  );

  // Assign formation traits
  group.formationTraits = selectTraitFromArray(
    roleSpecificTraits.formationOptions,
    traitRNG.formation()
  );

  // Assign behavior traits
  group.behaviorTraits = selectTraitFromArray(
    roleSpecificTraits.behaviorOptions,
    traitRNG.behavior()
  );

  // Assign force calculation traits
  group.forceTraits = selectTraitFromArray(
    roleSpecificTraits.forceOptions,
    traitRNG.force()
  );
}
```

This group-based approach allows for:
- Role-specific trait options
- Independent trait selection for each group
- Complex emergent behaviors from group interactions

## Group Attributes

Each particle group has the following core attributes:

### Physical Attributes

1. **Perception**: Defines the interaction radius for the group
   - Determines how far the group can "sense" other groups
   - Affects interaction behaviors
   - Role-specific base values with RNG variation

2. **Force Field Shape**: Defines the boundary container for the group
   - Invisible in the final rendering
   - Affects particle containment and movement
   - Role-specific options selected by RNG

3. **Scale**: Defines the overall size of the group
   - Affects visual appearance and physics interactions
   - Role-specific base values with RNG variation

4. **Particle Shape**: Defines the shape of individual particles
   - Affects visual appearance
   - Role-specific options selected by RNG

### Visual Attributes

1. **Color**: Defines the color scheme for the group
   - RGB values determined by RNG
   - Role-specific base colors with variation
   - May be affected by mutations

2. **Visual Effects**: Special visual properties
   - Selected from an array of possible effects by RNG
   - Organized in preset combinations
   - Examples: trails, glow, pulse effects, etc.

### Force Calculation Attributes

1. **Attraction/Repulsion Values**: Defines how the group interacts with other groups
   - Matrix of values between -1 (repulsion) and 1 (attraction)
   - Each group has values for interaction with each other group
   - Creates complex emergent behaviors

## Trait Categories

Traits are organized into categories and rarity tiers, with each tier having a specific probability of occurrence:

- **Common**: 40% chance (8 variations per category)
- **Uncommon**: 30% chance (6 variations per category)
- **Rare**: 20% chance (4 variations per category)
- **Epic**: 8% chance (3 variations per category)
- **Legendary**: 1.5% chance (2 variations per category)
- **Mythic**: 0.5% chance (2 variations per category)

### Visual Traits

Visual traits define the appearance of particles and are organized by rarity tiers:

1. **Particle Shape Traits**:
   - Common: Sphere, Cube (8 variations)
   - Uncommon: Tetrahedron, Octahedron (6 variations)
   - Rare: Icosahedron, Dodecahedron (4 variations)
   - Epic: Star, Torus (3 variations)
   - Legendary: Crystal, Nebula (2 variations)
   - Mythic: Quantum (shape-shifting) (2 variations)

2. **Color Scheme Traits**:
   - Common: Basic colors (Red, Blue, Green, Yellow, Purple, Orange, Cyan, Magenta)
   - Uncommon: Dual-tone gradients (6 variations)
   - Rare: Tri-color schemes (4 variations)
   - Epic: Iridescent, Metallic, Neon (3 variations)
   - Legendary: Prismatic (rainbow shifting), Void (2 variations)
   - Mythic: Dimensional (color beyond normal spectrum) (2 variations)

3. **Visual Effect Traits**:
   - Common: Basic glow, Simple trails, Soft pulse, Faint aura, Subtle shimmer, Gentle wave, Light haze, Mild distortion
   - Uncommon: Pulse effects, Smoke trails, Energy ribbons, Particle emission, Soft sparkle, Halo effect
   - Rare: Sparkle, Electricity, Flame, Plasma
   - Epic: Aura, Ripple effects, Echo
   - Legendary: Distortion, Reality warping
   - Mythic: Dimensional shift, Quantum effects

### Formation Traits

Formation traits define how particles are arranged within their force field, organized by role and rarity:

#### CORE Formations
- Common: Dense Sphere, Simple Core (8 variations)
- Uncommon: Crystalline Structure, Rotating Core (6 variations)
- Rare: Pulsating Core, Fractal Core (4 variations)
- Epic: Quantum Core, Nested Core, Vortex Core (3 variations)
- Legendary: Singularity Core, Hyperdimensional Core (2 variations)
- Mythic: Dimensional Core, Transcendent Core (2 variations)

#### CONTROL Formations
- Common: Command Sphere, Simple Ring, Basic Network, Central Hub, Orbital Control, Radial Array, Nodal Grid, Axial Formation (8 variations)
- Uncommon: Gyroscopic Ring, Satellite Array, Neural Web, Distributed Command, Hierarchical Network, Adaptive Control (6 variations)
- Rare: Neural Network, Distributed Nodes, Quantum Relay, Synaptic Web (4 variations)
- Epic: Quantum Network, Hive Mind, Omniscient Array (3 variations)
- Legendary: Omniscient Array, Transcendent Network (2 variations)
- Mythic: Transcendent Control, Cosmic Awareness (2 variations)

#### MOVEMENT Formations
- Common: Simple Propulsion, Basic Fins, Thrust Array, Directional Pods, Momentum Drivers, Kinetic Formation, Velocity Grid, Propulsion Network (8 variations)
- Uncommon: Wave Formation, Thrust Vectors, Oscillating Drive, Pulsed Propulsion, Harmonic Movement, Resonant Thrust (6 variations)
- Rare: Directional Grid, Propulsion Array, Quantum Drive, Vortex Propulsion (4 variations)
- Epic: Quantum Propulsion, Telekinetic Drive, Gravity Manipulation (3 variations)
- Legendary: Warp Drive, Spacetime Manipulation (2 variations)
- Mythic: Dimensional Shift Drive, Reality Folding (2 variations)

#### DEFENSE Formations
- Common: Simple Barrier, Basic Shield, Protective Shell, Defensive Wall, Barrier Grid, Shielding Array, Protective Sphere, Defensive Lattice (8 variations)
- Uncommon: Spherical Shell, Mesh Network, Reactive Barrier, Adaptive Shield, Reinforced Membrane, Layered Protection (6 variations)
- Rare: Toroidal Shield, Layered Defense, Quantum Barrier, Phased Defense (4 variations)
- Epic: Adaptive Shield, Reactive Barrier, Dimensional Shield (3 variations)
- Legendary: Impenetrable Fortress, Absolute Defense (2 variations)
- Mythic: Dimensional Barrier, Reality Anchor (2 variations)

#### ATTACK Formations
- Common: Simple Strike, Basic Patrol, Offensive Array, Hunter Formation, Striker Pattern, Assault Configuration, Tactical Formation, Combat Grid (8 variations)
- Uncommon: Swarm Pattern, Orbital Strikers, Pincer Attack, Flanking Formation, Envelopment Strategy, Tactical Strike (6 variations)
- Rare: Predator Formation, Ambush Configuration, Phantom Strike, Stealth Attack (4 variations)
- Epic: Phantom Strike, Ghost Protocol, Overwhelming Force (3 variations)
- Legendary: Devastator Array, Annihilation Pattern (2 variations)
- Mythic: Annihilation Formation, Reality Sunder (2 variations)

### Behavior Traits

Behavior traits define how particles move and interact, organized by rarity:

1. **Emergent Behaviors**:
   - Common: Basic Flocking, Simple Pulsation, Gentle Rotation, Mild Oscillation, Subtle Drift, Slow Spin, Gradual Expansion, Soft Contraction (8 variations)
   - Uncommon: Advanced Flocking, Complex Pulsation, Multi-axis Rotation, Harmonic Oscillation, Wave Propagation, Resonant Movement (6 variations)
   - Rare: Bifurcation, Synchronized Movement, Quantum Fluctuation, Phase Shifting (4 variations)
   - Epic: Synchronized Pulsing, Consensus Movement, Collective Intelligence (3 variations)
   - Legendary: Adaptive Learning, Pattern Recognition (2 variations)
   - Mythic: Collective Intelligence, Temporal Manipulation (2 variations)

2. **Role-Specific Behaviors**:

   #### CORE Behaviors
   - Common: Stability, Central Positioning, Gentle Pulsing, Slow Rotation, Energy Conservation, Balanced Movement, Harmonic Oscillation, Subtle Vibration
   - Uncommon: Enhanced Stability, Dynamic Centering, Resonant Pulsing, Multi-axis Rotation, Energy Cycling, Adaptive Positioning
   - Rare: Perfect Balance, Quantum Stability, Dimensional Anchoring, Temporal Stability
   - Epic: Reality Anchoring, Dimensional Stability, Quantum Centering
   - Legendary: Absolute Stability, Transcendent Balance
   - Mythic: Cosmic Anchoring, Universal Stability

   #### CONTROL Behaviors
   - Common: Directional Influence, Basic Decision-making, Simple Coordination, Predictive Movement, Response Patterns, Tactical Positioning, Strategic Rotation, Command Presence
   - Uncommon: Enhanced Coordination, Complex Decision-making, Tactical Awareness, Strategic Planning, Adaptive Leadership, Predictive Analysis
   - Rare: Perfect Coordination, Quantum Decision-making, Tactical Brilliance, Strategic Mastery
   - Epic: Omniscient Awareness, Perfect Strategy, Transcendent Coordination
   - Legendary: Absolute Command, Perfect Awareness
   - Mythic: Cosmic Awareness, Universal Coordination

   #### MOVEMENT Behaviors
   - Common: Basic Propulsion, Simple Navigation, Directional Thrust, Momentum Conservation, Path Following, Velocity Control, Acceleration Management, Drift Correction
   - Uncommon: Enhanced Propulsion, Complex Navigation, Efficient Thrust, Momentum Optimization, Advanced Pathfinding, Velocity Modulation
   - Rare: Perfect Navigation, Quantum Propulsion, Efficient Movement, Optimal Pathfinding
   - Epic: Telekinetic Movement, Gravity Manipulation, Spacetime Navigation
   - Legendary: Warp Movement, Reality Shifting
   - Mythic: Dimensional Movement, Cosmic Navigation

   #### DEFENSE Behaviors
   - Common: Protective Positioning, Basic Barrier Formation, Shield Maintenance, Perimeter Patrol, Threat Assessment, Defensive Stance, Barrier Reinforcement, Shield Regeneration
   - Uncommon: Enhanced Protection, Complex Barrier Formation, Adaptive Shielding, Reactive Defense, Threat Prioritization, Defensive Coordination
   - Rare: Perfect Protection, Quantum Shielding, Impenetrable Barrier, Adaptive Defense
   - Epic: Dimensional Shielding, Perfect Defense, Absolute Protection
   - Legendary: Invulnerable Defense, Reality Barrier
   - Mythic: Cosmic Shield, Universal Protection

   #### ATTACK Behaviors
   - Common: Basic Patrol, Simple Targeting, Threat Response, Offensive Positioning, Strike Preparation, Attack Coordination, Tactical Movement, Strategic Positioning
   - Uncommon: Enhanced Patrol, Complex Targeting, Efficient Strikes, Tactical Maneuvering, Threat Neutralization, Coordinated Assault
   - Rare: Perfect Targeting, Quantum Strike, Devastating Attack, Tactical Brilliance
   - Epic: Ghost Strike, Phantom Attack, Overwhelming Force
   - Legendary: Annihilation Strike, Reality Sundering
   - Mythic: Cosmic Strike, Universal Force

### Force Calculation Traits

Force calculation traits define the physics interactions between groups, organized by rarity:

1. **Attraction/Repulsion Profiles**:
   - Common: Standard profiles (8 variations)
     - Balanced: Moderate attraction/repulsion values
     - Attractive: Higher attraction values overall
     - Repulsive: Higher repulsion values overall
     - Selective: Strong attraction to some, repulsion to others
     - Neutral: Minimal interaction with other groups
     - Cohesive: Strong attraction to same role
     - Divisive: Strong repulsion from same role
     - Random: Varied values with no clear pattern
   - Uncommon: Enhanced profiles (6 variations)
     - Harmonic: Creates rhythmic movement patterns
     - Resonant: Amplifies certain interactions
     - Adaptive: Slowly changes based on proximity
     - Pulsing: Alternates between attraction and repulsion
     - Orbital: Creates stable orbital patterns
     - Hierarchical: Stronger influence on lower-tier roles
   - Rare: Specialized profiles (4 variations)
     - Quantum: Creates unpredictable but stable patterns
     - Vortex: Creates spiral movement patterns
     - Crystalline: Creates lattice-like arrangements
     - Fluid: Creates flowing, liquid-like movement
   - Epic: Dynamic profiles (3 variations)
     - Chaotic: Creates complex, unpredictable patterns
     - Harmonic Cascade: Creates beautiful, complex patterns
     - Dimensional: Influences beyond normal space
   - Legendary: Adaptive profiles (2 variations)
     - Sentient: Appears to make intelligent decisions
     - Reality Warping: Distorts normal physics
   - Mythic: Reality-bending profiles (2 variations)
     - Cosmic: Transcends normal physics
     - Universal: Creates perfect harmony

2. **Force Field Properties**:
   - Common: Basic properties (8 variations)
     - Standard: Balanced strength, flexibility, responsiveness
     - Rigid: High strength, low flexibility
     - Elastic: Low strength, high flexibility
     - Responsive: High responsiveness, average other properties
     - Stable: Low responsiveness, high strength
     - Balanced: Equal values for all properties
     - Specialized: One high value, others low
     - Adaptive: Slowly changes based on conditions
   - Uncommon: Enhanced properties (6 variations)
     - Resonant: Creates harmonic oscillations
     - Pulsing: Strength varies rhythmically
     - Layered: Multiple fields with different properties
     - Adaptive: Changes based on external forces
     - Reactive: Responds quickly to threats
     - Efficient: Optimized for energy conservation
   - Rare: Specialized properties (4 variations)
     - Quantum: Probabilistic field behavior
     - Crystalline: Forms rigid geometric patterns
     - Fluid: Flows and adapts like a liquid
     - Plasma: High energy, dynamic field
   - Epic: Dynamic properties (3 variations)
     - Intelligent: Appears to make decisions
     - Dimensional: Operates beyond normal space
     - Reality Distortion: Warps physics locally
   - Legendary: Adaptive properties (2 variations)
     - Sentient: Appears to have consciousness
     - Reality Anchor: Stabilizes surrounding space
   - Mythic: Reality-bending properties (2 variations)
     - Cosmic: Transcends normal physics
     - Universal: Perfect field properties

## Trait Assignment Process

### Deterministic RNG-Based Assignment

1. **Initialize RNG Chain**:
```typescript
// Start with block nonce as seed
const initialSeed = blockData.nonce;
const rng = mulberry32(initialSeed);

// Create a chain of RNG values for different trait categories
const traitRNG = {
  visual: createChainRNG(rng(), 'visual'),
  formation: createChainRNG(rng(), 'formation'),
  behavior: createChainRNG(rng(), 'behavior'),
  force: createChainRNG(rng(), 'force')
};

// Function to create a chained RNG for a specific trait category
function createChainRNG(seed: number, purpose: string): () => number {
  let currentSeed = seed;
  return () => {
    currentSeed = mulberry32(currentSeed)();
    return currentSeed;
  };
}
```

### Rarity Determination

```typescript
function determineRarity(rng: () => number): Rarity {
  const roll = rng();

  if (roll < 0.005) return Rarity.MYTHIC;       // 0.5% chance
  if (roll < 0.02) return Rarity.LEGENDARY;     // 1.5% chance
  if (roll < 0.10) return Rarity.EPIC;          // 8% chance
  if (roll < 0.30) return Rarity.RARE;          // 20% chance
  if (roll < 0.60) return Rarity.UNCOMMON;      // 30% chance
  return Rarity.COMMON;                         // 40% chance
}
```

### Trait Selection

```typescript
function selectTraitByRarity(category: string, role: ParticleRole, rarity: Rarity, rng: () => number): Trait {
  // Get available traits for this category, role, and rarity
  const availableTraits = getTraitsForCategoryRoleRarity(category, role, rarity);

  // Select a random trait from available options
  const traitIndex = Math.floor(rng() * availableTraits.length);
  return availableTraits[traitIndex];
}

function assignTraitsToGroup(group: ParticleGroup, traitRNG: TraitRNG) {
  // Determine rarity for each trait category
  const visualRarity = determineRarity(traitRNG.visual());
  const formationRarity = determineRarity(traitRNG.formation());
  const behaviorRarity = determineRarity(traitRNG.behavior());
  const forceRarity = determineRarity(traitRNG.force());

  // Assign visual traits
  group.visualTraits = {
    shape: selectTraitByRarity('particleShape', group.role, visualRarity, traitRNG.visual()),
    color: selectTraitByRarity('colorScheme', group.role, visualRarity, traitRNG.visual()),
    effects: selectTraitByRarity('visualEffects', group.role, visualRarity, traitRNG.visual())
  };

  // Assign formation traits
  group.formationTraits = selectTraitByRarity(
    'formation',
    group.role,
    formationRarity,
    traitRNG.formation()
  );

  // Assign behavior traits
  group.behaviorTraits = selectTraitByRarity(
    'behavior',
    group.role,
    behaviorRarity,
    traitRNG.behavior()
  );

  // Assign force calculation traits
  group.forceTraits = {
    attractionProfile: selectTraitByRarity('attractionProfile', group.role, forceRarity, traitRNG.force()),
    fieldProperties: selectTraitByRarity('fieldProperties', group.role, forceRarity, traitRNG.force())
  };
}
```

## Implementation Considerations

### Trait Data Structure

```typescript
enum Rarity {
  COMMON = 'common',
  UNCOMMON = 'uncommon',
  RARE = 'rare',
  EPIC = 'epic',
  LEGENDARY = 'legendary',
  MYTHIC = 'mythic'
}

interface Trait {
  id: string;
  name: string;
  description: string;
  rarity: Rarity;
  value: any;
  properties?: Record<string, any>;
}

interface GroupTraits {
  // Physical traits
  perception: number;
  forceFieldShape: Trait;
  scale: number;
  particleShape: Trait;

  // Visual traits
  visualTraits: {
    shape: Trait;
    color: Trait;
    effects: Trait;
  };

  // Formation traits
  formationTraits: Trait;

  // Behavior traits
  behaviorTraits: Trait;

  // Force calculation traits
  forceTraits: {
    attractionProfile: Trait;
    fieldProperties: Trait;
  };

  // Interaction matrix
  interactionMatrix: Record<string, number>; // Group ID -> attraction/repulsion value
}
```

### Trait Visualization

Visual traits should be implemented with clear visual distinctions based on rarity:

```typescript
// Apply shape based on trait
const geometry = geometries[group.visualTraits.shape.value];

// Apply color scheme based on trait
const colorScheme = group.visualTraits.color.value;

// Create material based on rarity
let material;
switch (group.visualTraits.color.rarity) {
  case Rarity.COMMON:
  case Rarity.UNCOMMON:
    // Simple material for common/uncommon
    material = new THREE.MeshStandardMaterial({
      color: new THREE.Color(colorScheme.r, colorScheme.g, colorScheme.b),
      emissive: new THREE.Color(colorScheme.r * 0.5, colorScheme.g * 0.5, colorScheme.b * 0.5),
      emissiveIntensity: 0.5
    });
    break;

  case Rarity.RARE:
  case Rarity.EPIC:
    // Advanced material for rare/epic
    material = createAdvancedMaterial(colorScheme);
    break;

  case Rarity.LEGENDARY:
  case Rarity.MYTHIC:
    // Custom shader material for legendary/mythic
    material = createCustomShaderMaterial(colorScheme, group.visualTraits.color.rarity);
    break;
}
```

### Behavior Implementation

Behaviors should be implemented as modular components with rarity-based complexity:

```typescript
function applyBehavior(group: ParticleGroup, behaviorTrait: Trait) {
  const behaviorType = behaviorTrait.value;
  const properties = behaviorTrait.properties || {};
  const rarity = behaviorTrait.rarity;

  // Base implementation
  let behaviorImplementation;

  switch (behaviorType) {
    case 'flocking':
      behaviorImplementation = createFlockingBehavior(properties);
      break;

    case 'pulsation':
      behaviorImplementation = createPulsationBehavior(properties);
      break;

    case 'rotation':
      behaviorImplementation = createRotationBehavior(properties);
      break;

    // Other behavior types
  }

  // Enhance based on rarity
  if (rarity >= Rarity.RARE) {
    behaviorImplementation = enhanceBehavior(behaviorImplementation, rarity);
  }

  // Apply to group
  group.addBehavior(behaviorImplementation);
}
```

## Future Expansion

The trait system is designed to be expandable for future features:

1. **Combat Attributes**: For future combat mechanics
   - Damage output
   - Defense rating
   - Special abilities
   - Status effects

2. **Special Abilities**: For future interactive features
   - Temporary boosts
   - Area effects
   - Transformation abilities
   - Environmental interactions

3. **Advanced Behaviors**: For more complex creature interactions
   - Learning behaviors
   - Adaptive strategies
   - Complex decision-making
   - Environmental awareness

4. **Environmental Adaptations**: For interactions with different environments
   - Terrain adaptations
   - Weather responses
   - Resource gathering
   - Territory marking

## Related Documents

- [RNG System](../bitcoin/03_rng_system.md) - For details on the deterministic random number generation system
- [Evolution Mechanics](../bitcoin/02_evolution_mechanics.md) - For details on the confirmation-based mutation system
- [Blockchain Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin blockchain integration
- [Particle System](../particles/01_particle_system.md) - For details on the particle system architecture
- [Force Calculations](../physics/02_force_calculations.md) - For details on force calculation formulas
- [Color Palettes](01_color_palettes.md) - For details on color palette generation
- [Particle Shapes](02_particle_shapes.md) - For details on particle shape implementation
- [Formation Patterns](03_formation_patterns.md) - For details on formation pattern implementation
- [Behavior Traits](04_behavior_traits.md) - For details on behavior trait implementation
- [Force Field Traits](05_force_field_traits.md) - For details on force field trait implementation
 
``` 
 
--- 
 
