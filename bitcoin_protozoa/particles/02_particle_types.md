# Particle Types and Roles

This document provides detailed information about the different particle types, roles, and their characteristics in the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [Particle Roles](#particle-roles)
3. [Role Characteristics](#role-characteristics)
4. [Role Hierarchy](#role-hierarchy)
5. [Role Relationships](#role-relationships)
6. [Particle Shapes](#particle-shapes)
7. [Deterministic Generation](#deterministic-generation)
8. [Implementation Details](#implementation-details)
9. [Related Documents](#related-documents)

## Overview

The particle system in Bitcoin Protozoa is built around a role-based hierarchy that determines the behavior, appearance, and interactions of particles. Each particle is assigned a specific role that defines its purpose within the creature.

The five primary roles are:
- **CORE**: Acts as the nucleus/center point
- **CONTROL**: Acts as the "head" or brain of the creature
- **MOVEMENT**: Propels the entire structure like fins or phylanges
- **DEFENSE**: Creates a membrane-like protective boundary
- **ATTACK**: Patrols the perimeter and interacts with external entities

## Particle Roles

### CORE Particles

- **Purpose**: Acts as the nucleus/center point of the creature
- **Appearance**: Golden color scheme (r: 1.0, g: 0.8, b: 0.2)
- **Visual Effects**: Gentle pulsing glow
- **Behavior**: Foundation of the system, balanced energy consumption
- **Trail Properties**: Moderate trail length
- **Hierarchy**: Smallest, central position
- **Force Field**: Dense, central polygonal force field with brightest illumination
- **Influence**: Influences all other roles

### CONTROL Particles

- **Purpose**: Acts as the "head" or brain of the creature
- **Appearance**: Blue-white color scheme
- **Visual Effects**: Dynamic, gyroscopic motion
- **Behavior**: Directs other particles, orbits close to the core
- **Trail Properties**: Medium trail length with distinctive pattern
- **Hierarchy**: Small, orbits close to the core
- **Force Field**: Gyroscopic polygonal force field (rotating in 3D)
- **Influence**: Influences ATTACK, DEFENSE, and MOVEMENT roles

### MOVEMENT Particles

- **Purpose**: Acts like fins or phylanges for direction
- **Appearance**: Green-blue color scheme
- **Visual Effects**: Directional indicators
- **Behavior**: Propels the entire structure
- **Trail Properties**: Long, directional trails
- **Hierarchy**: Medium size, positioned at periphery
- **Force Field**: Elongated polygon force fields with subtle illumination
- **Influence**: Determines overall direction of the creature

### DEFENSE Particles

- **Purpose**: Creates a membrane-like boundary
- **Appearance**: Blue-purple color scheme
- **Visual Effects**: Semi-transparent protective boundary
- **Behavior**: Forms protective barriers around the core
- **Trail Properties**: Short, membrane-like trails
- **Hierarchy**: Large, surrounds the core structure
- **Force Field**: Regular polygon force field with medium illumination
- **Influence**: Protects CORE from external forces

### ATTACK Particles

- **Purpose**: Patrols the perimeter
- **Appearance**: Red color scheme (r: 1.0, g: 0.2, b: 0.2)
- **Visual Effects**: Intense pulsing glow
- **Behavior**: Aggressive and energetic, higher energy consumption
- **Trail Properties**: Longer trails
- **Hierarchy**: Largest, positioned at strategic locations
- **Force Field**: Angular polygon force fields with bright, sharper illumination
- **Influence**: Influences external entities and secondarily protects other roles

## Role Characteristics

Each role has distinct visual and behavioral characteristics that define its appearance and function within the creature:

### Visual Characteristics

| Role | Color Scheme | Glow Intensity | Trail Length | Pulse Rate | Scale |
|------|--------------|----------------|--------------|------------|-------|
| CORE | Golden | High | Moderate | Slow | Smallest |
| CONTROL | Blue-white | Medium-high | Medium | Variable | Small |
| MOVEMENT | Green-blue | Medium | Long | Directional | Medium |
| DEFENSE | Blue-purple | Medium-low | Short | Steady | Large |
| ATTACK | Red | High | Long | Rapid | Largest |

### Behavioral Characteristics

| Role | Energy Consumption | Interaction Radius | Movement Pattern | Primary Function |
|------|-------------------|-------------------|------------------|------------------|
| CORE | Balanced | Small | Stable | Foundation |
| CONTROL | Medium | Medium | Gyroscopic | Direction |
| MOVEMENT | High | Medium | Directional | Propulsion |
| DEFENSE | Low | Large | Surrounding | Protection |
| ATTACK | Highest | Large | Patrolling | Offense/Defense |

## Role Hierarchy

The role hierarchy defines which roles can influence others and establishes the power structure within the creature:

1. **Dominance Relationships**:
   - CORE influences all other roles
   - CONTROL influences ATTACK, DEFENSE, and MOVEMENT
   - DEFENSE protects CORE from external forces
   - ATTACK influences external entities
   - MOVEMENT determines overall direction

2. **Protective Relationships**:
   - DEFENSE primarily protects CORE
   - ATTACK secondarily protects all other roles
   - CORE strengthens all other roles

3. **Movement Relationships**:
   - CONTROL directs MOVEMENT
   - MOVEMENT propels the entire structure
   - ATTACK can adjust position based on external threats

## Role Relationships

Interactions between particles of different roles are governed by a force matrix that determines attraction and repulsion:

```
                  | Core | Control | Movement | Defense | Attack
--------------------|------|---------|----------|---------|--------
Core particle       | +0.5 |   +0.8  |   +0.3   |   +0.2  |  -0.1
Control particle    | +0.8 |   +0.3  |   +0.6   |   +0.4  |  +0.2
Movement particle   | +0.3 |   +0.6  |   +0.2   |   +0.3  |  +0.5
Defense particle    | +0.2 |   +0.4  |   +0.3   |   +0.4  |  +0.7
Attack particle     | -0.1 |   +0.2  |   +0.5   |   +0.7  |  +0.3
```

Positive values indicate attraction, negative values indicate repulsion, and the magnitude represents the strength of the interaction.

### Force Field Role Enforcement

Force fields enforce role hierarchy through:

1. **Containment Rules**: A force field can only contain particles of roles it can influence
2. **Influence Strength**: The strength of influence decreases with role distance in the hierarchy

## Particle Shapes

Particles can have different shapes that contribute to their visual appearance and behavior:

```typescript
enum ParticleShape {
  SPHERE = 'sphere',
  CUBE = 'cube',
  TETRAHEDRON = 'tetrahedron',
  OCTAHEDRON = 'octahedron',
  DODECAHEDRON = 'dodecahedron',
  ICOSAHEDRON = 'icosahedron',
  TORUS = 'torus'
}
```

Each shape has different visual properties and can be assigned to particles based on their role and traits.

## Deterministic Generation

All role distributions and behaviors are generated deterministically from Bitcoin block data:

```typescript
function determineRoleFromBlockData(particleId: string, blockData: BlockData): ParticleRole {
  // Use particle ID and block data to deterministically assign role
  const hash = deterministicHash(particleId + blockData.merkleRoot);
  const value = normalizeHash(hash, 0, 100);

  if (value < 10) return ParticleRole.CORE;      // 10% chance
  if (value < 25) return ParticleRole.CONTROL;   // 15% chance
  if (value < 45) return ParticleRole.ATTACK;    // 20% chance
  if (value < 70) return ParticleRole.DEFENSE;   // 25% chance
  return ParticleRole.MOVEMENT;                  // 30% chance
}
```

### Particle Distribution

The 500 total particles per creature are distributed as follows:
- **Base allocation**: 40 particles per role (200 total)
- **Dynamic allocation**: 300 remaining particles distributed via RNG

The distribution algorithm:
1. Assign 40 base particles to each of the 5 roles (200 total)
2. For the remaining 300 particles:
   a. Generate 5 random values between 0.1 and 0.3 (10-30%)
   b. Normalize these values to sum to 1.0
   c. Multiply each by 300 to get additional particles per role
   d. Round to integers while ensuring total remains 300

## Implementation Details

### TypeScript Type Definitions

```typescript
// Particle roles enum
export enum ParticleRole {
  CORE = 'core',
  CONTROL = 'control',
  ATTACK = 'attack',
  DEFENSE = 'defense',
  MOVEMENT = 'movement'
}

// Particle interface
export interface Particle {
  id: ID;
  position: Vector3;
  velocity: Vector3;
  acceleration: Vector3;
  role: ParticleRole;
  group: number;
  shape: ParticleShape;
  color: string;
  scale: number;
  mass: number;
  age: number;
  active: boolean;
}
```

### Factory Functions

```typescript
// Create a new particle
export function createParticle(
  id: ID,
  position: Vector3,
  velocity: Vector3,
  role: ParticleRole,
  group: number,
  shape: ParticleShape,
  color: string,
  scale: number = 1,
  mass: number = 1
): Particle {
  return {
    id,
    position,
    velocity,
    acceleration: createVector3(),
    role,
    group,
    shape,
    color,
    scale,
    mass,
    age: 0,
    active: true
  };
}
```

### Role Compatibility Functions

```typescript
// Check if a field role can contain a particle role
function canContain(fieldRole: ParticleRole, particleRole: ParticleRole): boolean {
  switch (fieldRole) {
    case ParticleRole.CORE:
      return true; // Can contain any role
    case ParticleRole.CONTROL:
      return particleRole !== ParticleRole.CORE;
    case ParticleRole.DEFENSE:
      return particleRole === ParticleRole.DEFENSE;
    case ParticleRole.ATTACK:
      return particleRole === ParticleRole.ATTACK;
    case ParticleRole.MOVEMENT:
      return particleRole === ParticleRole.MOVEMENT;
    default:
      return false;
  }
}

// Get influence strength between roles
function getInfluenceStrength(fieldRole: ParticleRole, particleRole: ParticleRole): number {
  if (!canContain(fieldRole, particleRole)) return 0;

  // Define strength based on role relationship
  if (fieldRole === ParticleRole.CORE) {
    if (particleRole === ParticleRole.CORE) return 1.0;
    if (particleRole === ParticleRole.CONTROL) return 0.9;
    return 0.8; // Other roles
  }

  if (fieldRole === ParticleRole.CONTROL) {
    if (particleRole === ParticleRole.MOVEMENT) return 0.9;
    if (particleRole === ParticleRole.ATTACK) return 0.8;
    return 0.7; // DEFENSE
  }

  // Same role interactions
  return 0.6;
}
```

## Related Documents

- [Particle System](01_particle_system.md) - Overview of the particle system
- [Particle Lifecycle](03_particle_lifecycle.md) - Details on particle lifecycle management
- [Force Field System](../physics/03_force_field_system.md) - Information on force field interactions
- [Role Hierarchy](04_role_hierarchy.md) - Detailed information on role relationships
