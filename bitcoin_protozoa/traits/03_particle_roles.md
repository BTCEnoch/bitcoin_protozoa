# Particle Roles

This document provides detailed information about the five particle roles implemented in the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [Role Types](#role-types)
   - [CORE Role](#core-role)
   - [CONTROL Role](#control-role)
   - [MOVEMENT Role](#movement-role)
   - [DEFENSE Role](#defense-role)
   - [ATTACK Role](#attack-role)
3. [Role Assignment](#role-assignment)
4. [Role Properties](#role-properties)
5. [Implementation Details](#implementation-details)

## Overview

Particle roles are a fundamental aspect of the Bitcoin Protozoa project. Each particle in a creature is assigned one of five distinct roles, each with unique behaviors, properties, and functions within the creature's ecosystem. These roles work together to create complex, lifelike behaviors and visual characteristics.

## Role Types

### CORE Role

The CORE role represents the central, foundational particles that define the creature's identity and stability.

**Characteristics:**
- Acts as the nucleus of the particle system
- Exhibits high stability and low variance in traits
- Exerts strong influence over other particles
- Maintains the creature's structural integrity

**Visual Traits:**
- Dense, central positioning
- Slower movement compared to other roles
- Distinctive coloration (typically the most vibrant)
- Larger size relative to other particles

**Behavioral Traits:**
- Minimal movement, serving as an anchor point
- Attracts other particles, especially CONTROL particles
- Resistant to external forces
- Maintains position relative to the creature's center of mass

### CONTROL Role

The CONTROL role represents particles that direct and influence the behavior of other particles.

**Characteristics:**
- Functions as the "brain" or command center
- Exhibits moderate variance in traits
- Directs the actions of other roles
- Coordinates complex behaviors

**Visual Traits:**
- Positioned in proximity to CORE particles
- Moderate movement speed
- Distinctive shape or pattern
- Medium size relative to other particles

**Behavioral Traits:**
- Gyroscopic or orbital movements around the CORE
- Influences the movement patterns of other roles
- Responds to environmental stimuli
- Coordinates group behaviors

### MOVEMENT Role

The MOVEMENT role represents particles responsible for the creature's locomotion.

**Characteristics:**
- Resembles fins or appendages that drive motion
- Exhibits high variance in speed and direction
- Enables propulsion and navigation
- Adapts to environmental conditions

**Visual Traits:**
- Positioned at the periphery of the creature
- High movement speed
- Elongated or streamlined shape
- Smaller size relative to CORE and CONTROL particles

**Behavioral Traits:**
- Rapid, directional movement
- Creates propulsive forces
- Forms patterns resembling fins or appendages
- Responds quickly to CONTROL particle directions

### DEFENSE Role

The DEFENSE role represents protective particles that stabilize the creature.

**Characteristics:**
- Forms a membrane-like boundary around the core
- Exhibits moderate variance in traits
- Protects the CORE and other roles
- Maintains structural integrity

**Visual Traits:**
- Positioned between the CORE and the exterior
- Moderate movement speed
- Regular, uniform shape
- Medium size relative to other particles

**Behavioral Traits:**
- Maintains fixed positions relative to the CORE
- Forms protective barriers or shields
- Absorbs or deflects external forces
- Reinforces the creature's structure

### ATTACK Role

The ATTACK role represents aggressive particles that exhibit expansive behavior.

**Characteristics:**
- Patrols the perimeter of the creature
- Exhibits high variance in traits
- Engages with external entities
- Extends beyond the creature's main body

**Visual Traits:**
- Positioned at the outermost regions
- High movement speed
- Angular or pointed shape
- Variable size, often smaller than CORE particles

**Behavioral Traits:**
- Aggressive, outward movement
- Extends beyond the main particle group
- Patrols or interacts with the environment
- Responds to external stimuli

## Role Assignment

Particle roles are assigned deterministically using the Bitcoin block nonce, ensuring uniqueness for each creature:

1. **Base Allocation**: Each of the five roles starts with 40 particles, totaling 200 particles.
2. **Dynamic Allocation**: The remaining 300 particles (out of 500 total) are distributed based on random number generator (RNG) values derived from the block nonce.

The distribution algorithm is as follows:
1. Assign 40 base particles to each role (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK).
2. Generate five RNG values between 0.1 and 0.3 using the block nonce.
3. Normalize these values to sum to 1.0.
4. Multiply each normalized value by 300 to calculate additional particles per role.
5. Round to integers, adjusting as needed to ensure the total equals 300.

This method guarantees a consistent yet varied role distribution tied to each creature's Bitcoin block data.

## Role Properties

Each role has specific properties that affect its behavior and interactions:

| Role    | Influence Modifier | Variance | Speed | Size Modifier | Position |
|---------|-------------------|----------|-------|---------------|----------|
| CORE    | 1.5               | Low      | Low   | 1.2           | Central  |
| CONTROL | 1.2               | Moderate | Moderate | 1.0       | Near Core |
| MOVEMENT| 0.8               | High     | High  | 0.8           | Peripheral |
| DEFENSE | 1.0               | Moderate | Moderate | 1.1       | Middle Layer |
| ATTACK  | 0.7               | High     | High  | 0.9           | Outermost |

## Implementation Details

The role system is implemented through the following components:

1. **Role Enum**: Defines the five role types as an enumeration.
2. **Role Manager**: Assigns and manages roles for particles.
3. **Role Behavior**: Implements role-specific behaviors and interactions.
4. **Role Visualization**: Handles visual representation of different roles.
5. **Role Evolution**: Manages how roles evolve based on Bitcoin confirmations.

These components work together to create a complex, dynamic system of particle roles that form the foundation of the creature's behavior and appearance.
