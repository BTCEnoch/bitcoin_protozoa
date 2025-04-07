# Role Hierarchy

This document describes the hierarchical structure of particle roles and how they interact within the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [Hierarchical Structure](#hierarchical-structure)
3. [Force Calculation Matrix](#force-calculation-matrix)
4. [Influence Propagation](#influence-propagation)
5. [Containment Rules](#containment-rules)
6. [Implementation Details](#implementation-details)

## Overview

The role hierarchy in Bitcoin Protozoa establishes a clear chain of influence among the five particle roles. This hierarchy determines how particles interact, how forces are calculated, and how behaviors propagate through the system. The hierarchical structure creates complex, emergent behaviors that mimic natural organisms.

## Hierarchical Structure

The role hierarchy is organized with the CORE at the top, exerting influence over all other roles:

```
                CORE
                  |
               CONTROL
              /   |   \
    MOVEMENT  DEFENSE  ATTACK
```

- **CORE**: The central authority, influencing all subordinate roles.
- **CONTROL**: Directly influenced by CORE, it governs MOVEMENT, DEFENSE, and ATTACK.
- **MOVEMENT**: Controlled by CONTROL, it drives the creature's locomotion.
- **DEFENSE**: Under CONTROL's influence, it safeguards the CORE and other roles.
- **ATTACK**: Also influenced by CONTROL, it handles external interactions.

This hierarchy creates a natural flow of influence from the central CORE outward to the peripheral roles, similar to how a brain (CONTROL) directs limbs (MOVEMENT) or immune responses (DEFENSE).

## Force Calculation Matrix

The force calculation matrix defines the attraction (positive values) and repulsion (negative values) between roles. This matrix is fundamental to how particles interact based on their roles:

| Source \ Target | CORE  | CONTROL | MOVEMENT | DEFENSE | ATTACK |
|-----------------|-------|---------|----------|---------|--------|
| CORE            | +0.5  | +0.8    | +0.3     | +0.2    | -0.1   |
| CONTROL         | +0.8  | +0.3    | +0.6     | +0.4    | +0.2   |
| MOVEMENT        | +0.3  | +0.6    | +0.2     | +0.3    | +0.5   |
| DEFENSE         | +0.2  | +0.4    | +0.3     | +0.4    | +0.7   |
| ATTACK          | -0.1  | +0.2    | +0.5     | +0.7    | +0.3   |

Reading the matrix:
- The source role is on the left (rows)
- The target role is on the top (columns)
- The value indicates the force exerted by the source on the target
- Positive values indicate attraction
- Negative values indicate repulsion

For example:
- CORE particles strongly attract CONTROL particles (+0.8)
- CORE particles slightly repel ATTACK particles (-0.1)
- DEFENSE particles strongly attract ATTACK particles (+0.7)

These values are further modified by the influence modifier of each role (e.g., CORE: 1.5, CONTROL: 1.2) to calculate the final force.

## Influence Propagation

Influence propagates through the hierarchy as follows:

1. **Direct Influence**: Each role directly influences roles immediately below it in the hierarchy.
   - CORE → CONTROL
   - CONTROL → MOVEMENT, DEFENSE, ATTACK

2. **Indirect Influence**: Higher roles indirectly influence roles further down the hierarchy.
   - CORE → MOVEMENT, DEFENSE, ATTACK (via CONTROL)

3. **Influence Strength**: Influence weakens as it propagates down the hierarchy.
   - CORE influence on CONTROL: 100%
   - CORE influence on MOVEMENT, DEFENSE, ATTACK: ~70%

4. **Feedback Loops**: Lower roles can provide feedback to higher roles, creating complex dynamics.
   - MOVEMENT, DEFENSE, ATTACK → CONTROL (weak feedback)
   - CONTROL → CORE (moderate feedback)

This influence propagation creates a dynamic system where changes at the top of the hierarchy cascade down to affect the entire creature.

## Containment Rules

Force fields can only contain particles of roles they are designed to influence, based on the hierarchy:

1. **CORE Force Fields**: Can contain and influence all roles.
2. **CONTROL Force Fields**: Can contain and influence CONTROL, MOVEMENT, DEFENSE, and ATTACK roles.
3. **MOVEMENT Force Fields**: Can contain and influence only MOVEMENT roles.
4. **DEFENSE Force Fields**: Can contain and influence only DEFENSE roles.
5. **ATTACK Force Fields**: Can contain and influence only ATTACK roles.

These containment rules ensure that the hierarchy is maintained in the spatial organization of the creature.

## Implementation Details

The role hierarchy is implemented through the following components:

1. **Hierarchy Manager**: Manages the hierarchical relationships between roles.
2. **Force Calculator**: Calculates forces between particles based on the force calculation matrix and role modifiers.
3. **Influence Propagator**: Propagates influence through the hierarchy.
4. **Containment System**: Enforces containment rules for force fields.

These components work together to create a complex, hierarchical system that drives the behavior and organization of the particle creature.
