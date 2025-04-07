# Role Behaviors

This document describes the specific behaviors associated with each particle role in the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [CORE Role Behaviors](#core-role-behaviors)
3. [CONTROL Role Behaviors](#control-role-behaviors)
4. [MOVEMENT Role Behaviors](#movement-role-behaviors)
5. [DEFENSE Role Behaviors](#defense-role-behaviors)
6. [ATTACK Role Behaviors](#attack-role-behaviors)
7. [Behavior Interactions](#behavior-interactions)
8. [Implementation Details](#implementation-details)

## Overview

Each particle role in Bitcoin Protozoa exhibits unique behaviors that contribute to the creature's overall movement, appearance, and interaction with its environment. These behaviors are deterministically generated from Bitcoin block data, ensuring that each creature has a unique but consistent set of behaviors.

## CORE Role Behaviors

CORE particles exhibit behaviors focused on stability and centrality:

### Gravitational Center
- Acts as a gravitational center for other particles
- Maintains position at the creature's center of mass
- Resists external forces that would displace it

### Pulsation
- Rhythmic expansion and contraction
- Influences the pulsation of the entire creature
- Frequency and amplitude determined by Bitcoin nonce

### Rotational Stability
- Maintains orientation relative to the creature's movement
- Counteracts rotational forces
- Provides a stable reference point for other roles

### Energy Distribution
- Distributes "energy" (influence) to other roles
- Modulates energy levels based on creature state
- Acts as a central hub for influence propagation

## CONTROL Role Behaviors

CONTROL particles exhibit behaviors focused on coordination and direction:

### Orbital Motion
- Orbits around CORE particles
- Forms complex orbital patterns
- Orbit parameters determined by Bitcoin nonce

### Signal Propagation
- Transmits "signals" (influence) to other roles
- Coordinates group behaviors
- Modulates signal strength based on environmental factors

### Directional Influence
- Influences the direction of MOVEMENT particles
- Coordinates defensive formations with DEFENSE particles
- Directs ATTACK particles toward external targets

### Adaptive Response
- Adapts behavior based on environmental stimuli
- Modifies creature behavior in response to changes
- Serves as the "decision-making" center

## MOVEMENT Role Behaviors

MOVEMENT particles exhibit behaviors focused on locomotion and propulsion:

### Propulsive Thrust
- Generates forward thrust for the creature
- Forms fin-like or appendage-like structures
- Coordinates with other MOVEMENT particles for efficient propulsion

### Directional Control
- Changes direction based on CONTROL particle signals
- Adjusts thrust vectors for turning
- Maintains stability during direction changes

### Wave Propagation
- Forms wave-like patterns for efficient movement
- Propagates waves from CONTROL to the periphery
- Wave parameters determined by Bitcoin nonce

### Burst Acceleration
- Capable of sudden acceleration for evasive maneuvers
- Coordinates with other MOVEMENT particles for burst movement
- Triggered by specific CONTROL signals

## DEFENSE Role Behaviors

DEFENSE particles exhibit behaviors focused on protection and stability:

### Barrier Formation
- Forms protective barriers around CORE and CONTROL particles
- Adjusts barrier density based on external threats
- Maintains optimal spacing for effective protection

### Structural Reinforcement
- Reinforces the creature's overall structure
- Distributes forces to prevent structural damage
- Maintains relative positions during movement

### Adaptive Shielding
- Concentrates particles in response to external threats
- Forms temporary shields in threatened areas
- Coordinates with CONTROL particles to optimize protection

### Homeostasis Maintenance
- Maintains stable internal conditions
- Counteracts disruptive forces
- Preserves the creature's integrity during stress

## ATTACK Role Behaviors

ATTACK particles exhibit behaviors focused on external interaction and aggression:

### Perimeter Patrol
- Patrols the creature's perimeter
- Extends beyond the main body
- Forms the first line of interaction with the environment

### Probing Extension
- Extends outward to probe the environment
- Forms tentacle-like or antenna-like structures
- Gathers information about surroundings

### Aggressive Advance
- Advances toward external entities
- Forms concentrated groups for focused interaction
- Exhibits rapid, directed movement

### Tactical Positioning
- Positions for optimal interaction with the environment
- Coordinates with CONTROL particles for tactical advantage
- Adapts positioning based on environmental conditions

## Behavior Interactions

Role behaviors interact in complex ways to create emergent creature behaviors:

### Coordinated Movement
- CONTROL coordinates MOVEMENT for efficient locomotion
- DEFENSE maintains structure during movement
- ATTACK adjusts positioning during movement

### Defensive Response
- CONTROL detects threats
- DEFENSE forms protective barriers
- ATTACK positions to counter threats
- MOVEMENT adjusts for evasive action

### Environmental Interaction
- ATTACK probes the environment
- CONTROL processes environmental information
- CORE and DEFENSE adjust internal state
- MOVEMENT responds with appropriate locomotion

### Group Dynamics
- Roles form sub-groups with specialized functions
- Sub-groups coordinate through the hierarchy
- Complex behaviors emerge from simple role interactions

## Implementation Details

Role behaviors are implemented through the following components:

1. **Behavior System**: Defines and manages role-specific behaviors.
2. **Behavior Parameters**: Deterministically generated from Bitcoin data.
3. **Behavior Coordinator**: Coordinates interactions between role behaviors.
4. **Behavior Visualizer**: Translates behaviors into visual effects.

These components work together to create a complex, dynamic system of role behaviors that form the foundation of the creature's movement and interaction with its environment.
