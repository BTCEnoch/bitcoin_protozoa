# Role Hierarchy System

This document details the role hierarchy system in the Bitcoin Protozoa project, including role relationships, influence patterns, visual hierarchy, and behavioral hierarchy.

## Table of Contents

1. [Overview](#overview)
2. [Role Relationships](#role-relationships)
3. [Influence Patterns](#influence-patterns)
4. [Visual Hierarchy](#visual-hierarchy)
5. [Behavioral Hierarchy](#behavioral-hierarchy)
6. [Implementation Details](#implementation-details)
7. [Related Documents](#related-documents)

## Overview

The Role Hierarchy System defines the relationships between different types of particles and force fields within the Bitcoin Protozoa ecosystem. This hierarchy determines:

- Which roles can influence other roles
- How particles and force fields interact based on their roles
- The visual and behavioral characteristics of each role

The five primary roles in the hierarchy are:

1. **CORE**: Acts as the nucleus/center point
2. **CONTROL**: Acts as the "head" or brain of the creature
3. **MOVEMENT**: Propels the entire structure like fins or phylanges
4. **DEFENSE**: Creates a membrane-like protective boundary
5. **ATTACK**: Patrols the perimeter and interacts with external entities

## Role Relationships

The hierarchy defines three key types of relationships between roles:

### Dominance Relationships

Dominance relationships determine which roles can influence others:

- **CORE** influences all other roles
- **CONTROL** influences ATTACK, DEFENSE, and MOVEMENT
- **DEFENSE** protects CORE from external forces
- **ATTACK** influences external entities
- **MOVEMENT** determines overall direction

This hierarchy can be visualized as:

```
       CORE
        │
        ▼
     CONTROL
     ┌─┼─┐
     │ │ │
     ▼ ▼ ▼
ATTACK DEFENSE MOVEMENT
```

### Protective Relationships

Protective relationships determine which roles protect others:

- **DEFENSE** primarily protects CORE
- **ATTACK** secondarily protects all other roles
- **CORE** strengthens all other roles

This can be visualized as:

```
       CORE
      ┌─┴─┐
      │   │
      ▼   │
   DEFENSE │
      │    │
      ▼    │
 Other Roles◄───ATTACK
```

### Movement Relationships

Movement relationships determine how roles affect the creature's movement:

- **CONTROL** directs MOVEMENT
- **MOVEMENT** propels the entire structure
- **ATTACK** can adjust position based on external threats

This can be visualized as:

```
   CONTROL
      │
      ▼
  MOVEMENT
      │
      ▼
Entire Structure◄───ATTACK
```

## Influence Patterns

### Force Matrix

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

#### 1. Containment Rules

A force field can only contain particles of roles it can influence:

```typescript
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
```

#### 2. Influence Strength

The strength of influence decreases with role distance in the hierarchy:

```typescript
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

### Gyroscopic Movement

The CONTROL force field demonstrates leadership through its unique gyroscopic movement pattern:

1. The CONTROL force field rotates around its center point in 3D space
2. This rotation creates a constantly changing polygonal boundary
3. The movement is deterministic, based on blockchain data
4. The CONTROL field orbits around the CORE
5. Other fields follow the direction established by CONTROL

## Visual Hierarchy

Each role has distinct visual characteristics that establish a clear visual hierarchy:

### Size Hierarchy

The size hierarchy from smallest to largest is:
1. **CORE**: Smallest, central position
2. **CONTROL**: Small, orbits close to the core
3. **MOVEMENT**: Medium size, positioned at periphery
4. **DEFENSE**: Large, surrounds the core structure
5. **ATTACK**: Largest, positioned at strategic locations

### Color Scheme

Each role has a distinctive color scheme:

```typescript
function getRoleColor(role: ParticleRole): string {
  switch(role) {
    case ParticleRole.CORE:
      return '#F7931A'; // Bitcoin Orange/Golden
    case ParticleRole.CONTROL:
      return '#00A3FF'; // Blue-white
    case ParticleRole.MOVEMENT:
      return '#00E676'; // Green-blue
    case ParticleRole.DEFENSE:
      return '#7B1FA2'; // Blue-purple
    case ParticleRole.ATTACK:
      return '#FF1744'; // Red
    default:
      return '#FFFFFF'; // White
  }
}
```

### Visual Effects

Visual effects also follow the hierarchy:

| Role | Glow Intensity | Trail Length | Pulse Rate | Visual Effect |
|------|----------------|--------------|------------|---------------|
| CORE | High | Moderate | Slow | Gentle pulsing glow |
| CONTROL | Medium-high | Medium | Variable | Dynamic, gyroscopic motion |
| MOVEMENT | Medium | Long | Directional | Directional indicators |
| DEFENSE | Medium-low | Short | Steady | Semi-transparent protective boundary |
| ATTACK | High | Long | Rapid | Intense pulsing glow |

### Force Field Visualization

Each role's force field has a distinctive visual representation:

1. **CORE**:
   - Dense, central polygonal force field
   - Brightest illumination
   - Distinctive color based on blockchain signature data

2. **CONTROL**:
   - Gyroscopic polygonal force field (rotating in 3D)
   - Orbits around the CORE at a slight distance
   - Bright illumination with dynamic effects

3. **DEFENSE**:
   - Regular polygon force field surrounding the CORE
   - Medium illumination
   - Semi-transparent protective boundary

4. **ATTACK**:
   - Angular polygon force fields
   - Bright, sharper illumination
   - Positioned at strategic locations around the structure

5. **MOVEMENT**:
   - Elongated polygon force fields
   - Subtle illumination with directional indicators
   - Positioned at the periphery like fins or phylanges

## Behavioral Hierarchy

The behavioral hierarchy defines how each role behaves within the creature:

### Energy Consumption

Energy consumption follows this hierarchy:
1. **ATTACK**: Highest energy consumption
2. **MOVEMENT**: High energy consumption
3. **CONTROL**: Medium energy consumption
4. **CORE**: Balanced energy consumption
5. **DEFENSE**: Low energy consumption

### Interaction Radius

Interaction radius follows this hierarchy:
1. **DEFENSE**: Largest interaction radius
2. **ATTACK**: Large interaction radius
3. **CONTROL**: Medium interaction radius
4. **MOVEMENT**: Medium interaction radius
5. **CORE**: Small interaction radius

### Movement Patterns

Each role has a distinctive movement pattern:

| Role | Movement Pattern | Description |
|------|------------------|-------------|
| CORE | Stable | Maintains central position with minimal movement |
| CONTROL | Gyroscopic | Rotates around its center point while orbiting the CORE |
| MOVEMENT | Directional | Moves in specific directions to propel the creature |
| DEFENSE | Surrounding | Forms a protective barrier around the CORE |
| ATTACK | Patrolling | Moves around the perimeter, responding to external threats |

### Primary Functions

Each role has a primary function within the creature:

1. **CORE**: Foundation of the system
2. **CONTROL**: Direction and decision-making
3. **MOVEMENT**: Propulsion and locomotion
4. **DEFENSE**: Protection and stability
5. **ATTACK**: Offense and external interaction

## Implementation Details

### Role Distribution

Roles are distributed deterministically based on Bitcoin block data:

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

### Role-Based Behavior Implementation

Role-based behaviors are implemented using the strategy pattern:

```typescript
interface RoleBehavior {
  execute(particle: Particle, deltaTime: number): void;
}

class CoreBehavior implements RoleBehavior {
  execute(particle: Particle, deltaTime: number): void {
    // Maintain central position
    // Influence all other roles
  }
}

class ControlBehavior implements RoleBehavior {
  execute(particle: Particle, deltaTime: number): void {
    // Orbit around the core
    // Direct other particles
  }
}

class MovementBehavior implements RoleBehavior {
  execute(particle: Particle, deltaTime: number): void {
    // Propel the entire structure
    // Respond to CONTROL
  }
}

class DefenseBehavior implements RoleBehavior {
  execute(particle: Particle, deltaTime: number): void {
    // Form protective barriers around the CORE
    // Maintain stable position
  }
}

class AttackBehavior implements RoleBehavior {
  execute(particle: Particle, deltaTime: number): void {
    // Patrol the perimeter
    // Respond to external threats
  }
}

// Factory to create behavior based on role
function createBehaviorForRole(role: ParticleRole): RoleBehavior {
  switch (role) {
    case ParticleRole.CORE:
      return new CoreBehavior();
    case ParticleRole.CONTROL:
      return new ControlBehavior();
    case ParticleRole.MOVEMENT:
      return new MovementBehavior();
    case ParticleRole.DEFENSE:
      return new DefenseBehavior();
    case ParticleRole.ATTACK:
      return new AttackBehavior();
    default:
      throw new Error(`Unknown role: ${role}`);
  }
}
```

### Implementation Guidelines

When implementing the role hierarchy:

1. Always check role compatibility before processing interactions
2. Ensure visual distinctions between roles are clear and consistent
3. Maintain the deterministic nature of all role-based behaviors
4. Balance the influence strengths to create engaging emergent behaviors
5. Use the role system to drive meaningful interactions in the particle system

## Related Documents

- [Particle System](01_particle_system.md) - Overview of the particle system
- [Particle Types](02_particle_types.md) - Details on particle types and roles
- [Particle Lifecycle](03_particle_lifecycle.md) - Details on particle lifecycle management
- [Force Field System](../physics/03_force_field_system.md) - Details on force field interactions
