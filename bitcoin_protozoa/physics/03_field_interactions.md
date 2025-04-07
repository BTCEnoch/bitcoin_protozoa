# Field Interactions

This document describes how force fields interact with particles and with each other in the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [Field-Particle Interactions](#field-particle-interactions)
3. [Field-Field Interactions](#field-field-interactions)
4. [Hierarchical Influence](#hierarchical-influence)
5. [Dynamic Field Adaptation](#dynamic-field-adaptation)
6. [Visualization for Development](#visualization-for-development)
7. [Implementation Details](#implementation-details)

## Overview

Force fields in Bitcoin Protozoa are invisible influence zones that shape particle behavior. They interact with particles and with other fields to create complex, emergent behaviors. These interactions are deterministically generated from Bitcoin block data, ensuring that each creature has unique but consistent behavior.

## Field-Particle Interactions

Force fields interact with particles in several ways:

### Containment

Force fields exert containment forces to keep particles within their boundaries:

- **Boundary Forces**: Particles near the field boundary experience forces pushing them back toward the center
- **Role-Based Containment**: Fields primarily contain particles of their own role
- **Hierarchical Containment**: Higher-level fields (e.g., CORE) can contain particles of multiple roles
- **Permeability**: Fields have varying permeability, allowing some particles to pass through while containing others

The containment force increases as particles approach the field boundary:

```
containmentForce = fieldStrength * (1 - (distanceFromCenter / fieldRadius)^2) * roleCompatibilityFactor
```

### Influence

Fields influence particle behavior beyond simple containment:

- **Directional Influence**: Fields guide particles in specific directions (e.g., MOVEMENT fields create propulsive patterns)
- **Behavioral Influence**: Fields trigger specific behaviors in particles (e.g., CONTROL fields induce orbital motion)
- **Formation Influence**: Fields shape particles into specific formations (e.g., DEFENSE fields create barrier-like formations)
- **Temporal Influence**: Fields can create rhythmic or pulsating behaviors by varying their influence over time

The influence force depends on the field's purpose and the particle's role:

```
influenceForce = fieldStrength * influencePattern(position) * roleInfluenceFactor
```

### Role Compatibility

The interaction between fields and particles depends on role compatibility:

| Field Role | CORE Particles | CONTROL Particles | MOVEMENT Particles | DEFENSE Particles | ATTACK Particles |
|------------|---------------|------------------|-------------------|------------------|-----------------|
| CORE       | Strong        | Strong           | Moderate          | Moderate         | Weak            |
| CONTROL    | Weak          | Strong           | Strong            | Strong           | Strong          |
| MOVEMENT   | None          | None             | Strong            | None             | None            |
| DEFENSE    | None          | None             | None              | Strong           | None            |
| ATTACK     | None          | None             | None              | None             | Strong          |

This compatibility ensures that fields maintain the role hierarchy and specialized functions.

## Field-Field Interactions

Force fields interact with each other, creating complex force landscapes:

### Overlap Effects

When fields overlap, their influences combine:

- **Reinforcement**: Overlapping fields of the same role reinforce each other
- **Interference**: Fields of different roles can interfere, creating complex force patterns
- **Dominance**: Higher-level fields can dominate lower-level fields in areas of overlap
- **Channeling**: Fields can create channels or pathways for particle movement

The combined influence in overlap areas follows this general pattern:

```
combinedInfluence = sum(fieldInfluence * hierarchyFactor) for all overlapping fields
```

### Spatial Relationships

Fields maintain specific spatial relationships:

- **Nesting**: CORE fields are nested within the creature's center
- **Orbiting**: CONTROL fields orbit around CORE fields
- **Extending**: MOVEMENT fields extend outward in fin-like or appendage-like formations
- **Layering**: DEFENSE fields form layers around the core structure
- **Probing**: ATTACK fields extend beyond the main body in tentacle-like formations

These spatial relationships create the overall structure of the creature.

### Dynamic Interactions

Fields interact dynamically as the creature moves and evolves:

- **Coordination**: Fields coordinate their influences to create coherent movement
- **Adaptation**: Fields adjust their properties based on interactions with other fields
- **Resonance**: Fields can enter resonant states, creating amplified effects
- **Phase Relationships**: Fields maintain specific phase relationships for coordinated behaviors

## Hierarchical Influence

The role hierarchy determines how fields influence each other:

### Influence Flow

Influence flows through the hierarchy:

1. **CORE Fields**: Influence all other fields, establishing the creature's central structure
2. **CONTROL Fields**: Influenced by CORE fields, they direct MOVEMENT, DEFENSE, and ATTACK fields
3. **MOVEMENT, DEFENSE, ATTACK Fields**: Respond to CONTROL field direction while maintaining their specialized functions

### Override Mechanisms

Higher-level fields can override lower-level fields:

- **Emergency Override**: CORE fields can override all other fields in response to threats
- **Directional Override**: CONTROL fields can override MOVEMENT fields to change direction
- **Protective Override**: DEFENSE fields can temporarily override other fields to protect the creature
- **Tactical Override**: ATTACK fields can be overridden by CONTROL fields for coordinated actions

### Feedback Loops

Lower-level fields provide feedback to higher-level fields:

- **Environmental Feedback**: ATTACK fields send information about the environment to CONTROL fields
- **Structural Feedback**: DEFENSE fields inform CORE fields about structural integrity
- **Locomotion Feedback**: MOVEMENT fields provide feedback about movement efficiency to CONTROL fields

This feedback creates a dynamic, adaptive system.

## Dynamic Field Adaptation

Force fields adapt to changing conditions:

### Responsive Adaptation

Fields respond to environmental conditions:

- **Threat Response**: Fields adjust to protect vulnerable areas
- **Movement Optimization**: Fields adapt to optimize locomotion efficiency
- **Environmental Interaction**: Fields adjust to interact with the environment

### Evolution-Based Adaptation

Fields evolve based on Bitcoin confirmations:

- **Strength Evolution**: Field strength can increase or decrease
- **Shape Evolution**: Field shape can change
- **Behavioral Evolution**: Field influence patterns can evolve

### Coordinated Adaptation

Fields adapt in coordination with each other:

- **Synchronized Changes**: Related fields change together
- **Compensatory Adaptation**: When one field changes, others adjust to maintain balance
- **Cascading Adaptation**: Changes in higher-level fields trigger adaptations in lower-level fields

## Visualization for Development

While force fields are invisible in the final rendering, visualization tools are provided for development:

### Field Boundary Visualization

- Toggle to display field boundaries as wireframe outlines
- Color-coded by field role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK)
- Opacity indicates field strength

### Influence Visualization

- Heat map visualization of field influence
- Vector field visualization showing force directions
- Particle trail visualization showing the effect of fields on particle movement

### Interaction Visualization

- Highlight areas of field overlap
- Visualize field-field interactions
- Show hierarchical relationships between fields

These visualization tools aid in development and debugging without affecting the end-user experience.

## Implementation Details

Field interactions are implemented through the following components:

1. **Field Interaction Manager**: Calculates and manages interactions between fields and particles
2. **Hierarchical Influence System**: Implements the hierarchical flow of influence
3. **Field Adaptation Controller**: Manages dynamic field adaptation
4. **Visualization Tools**: Provides development visualization options

These components work together to create a complex, dynamic system of field interactions that drive the behavior and appearance of the particle creature.
