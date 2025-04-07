# Force Fields

This document provides detailed information about the force field system implemented in the Bitcoin Protozoa project.

## Table of Contents

1. [Overview](#overview)
2. [Force Field Types](#force-field-types)
   - [CORE Force Fields](#core-force-fields)
   - [CONTROL Force Fields](#control-force-fields)
   - [MOVEMENT Force Fields](#movement-force-fields)
   - [DEFENSE Force Fields](#defense-force-fields)
   - [ATTACK Force Fields](#attack-force-fields)
3. [Force Field Properties](#force-field-properties)
4. [Force Field Generation](#force-field-generation)
5. [Implementation Details](#implementation-details)

## Overview

Force fields are invisible influence zones that shape particle behavior within the Bitcoin Protozoa creatures. Each force field is associated with a specific particle role and exerts forces on particles based on their roles and positions. Force fields are fundamental to creating the complex, emergent behaviors that make each creature unique.

## Force Field Types

### CORE Force Fields

CORE force fields are central, stabilizing fields that anchor the creature.

**Characteristics:**
- Dense, central polygonal fields
- Minimal movement
- High influence strength
- Affects all particle roles

**Shape and Structure:**
- Regular polygonal shape (typically hexagonal or octagonal)
- Centered on the creature's core
- Multiple overlapping fields for complex influence patterns
- Size proportional to the number of CORE particles

**Influence Pattern:**
- Strong attraction for CORE and CONTROL particles
- Moderate attraction for MOVEMENT and DEFENSE particles
- Weak attraction or slight repulsion for ATTACK particles
- Influence decreases with distance from the center

**Function:**
- Anchors the creature's central structure
- Provides stability and cohesion
- Serves as the reference point for other force fields
- Maintains the creature's identity during movement and interaction

### CONTROL Force Fields

CONTROL force fields are gyroscopic fields that direct and coordinate other particles.

**Characteristics:**
- Gyroscopic polygonal fields
- 3D rotation around the CORE
- Moderate influence strength
- Primarily affects MOVEMENT, DEFENSE, and ATTACK particles

**Shape and Structure:**
- Elliptical or irregular polygonal shape
- Orbits around the CORE fields
- Multiple fields with different rotation planes
- Size proportional to the number of CONTROL particles

**Influence Pattern:**
- Strong attraction for CONTROL particles
- Strong directional influence on MOVEMENT particles
- Moderate influence on DEFENSE and ATTACK particles
- Creates orbital and rotational patterns

**Function:**
- Directs the movement and behavior of other particles
- Coordinates complex behaviors across the creature
- Transmits influence from the CORE to peripheral particles
- Adapts the creature's behavior to environmental conditions

### MOVEMENT Force Fields

MOVEMENT force fields are elongated fields that enable locomotion.

**Characteristics:**
- Elongated polygonal fields
- Directional orientation
- Moderate influence strength
- Primarily affects MOVEMENT particles

**Shape and Structure:**
- Elongated, fin-like or appendage-like shape
- Extends from the creature's body
- Multiple fields in different orientations
- Size and shape vary based on the creature's movement needs

**Influence Pattern:**
- Strong directional influence on MOVEMENT particles
- Creates wave-like or undulating patterns
- Generates propulsive forces
- Coordinates with other MOVEMENT fields for efficient locomotion

**Function:**
- Enables the creature's locomotion
- Provides directional control
- Forms appendage-like structures for movement
- Adapts to the creature's movement needs

### DEFENSE Force Fields

DEFENSE force fields form protective barriers around the creature.

**Characteristics:**
- Regular polygonal fields
- Stable positioning
- Moderate influence strength
- Primarily affects DEFENSE particles

**Shape and Structure:**
- Regular, membrane-like shape
- Forms a layer between the core and the exterior
- Multiple overlapping fields for comprehensive coverage
- Size and density proportional to the number of DEFENSE particles

**Influence Pattern:**
- Strong cohesive forces for DEFENSE particles
- Creates barrier-like formations
- Maintains structural integrity
- Adapts to protect vulnerable areas

**Function:**
- Protects the creature's core and vital functions
- Maintains structural integrity during movement
- Absorbs or deflects external forces
- Forms adaptive protective barriers

### ATTACK Force Fields

ATTACK force fields extend outward for environmental interaction.

**Characteristics:**
- Angular polygonal fields
- Dynamic positioning
- Lower influence strength
- Primarily affects ATTACK particles

**Shape and Structure:**
- Angular, pointed, or tentacle-like shape
- Extends beyond the creature's main body
- Multiple independent fields for versatile interaction
- Size and shape vary based on the creature's interaction needs

**Influence Pattern:**
- Directs ATTACK particles outward
- Creates probing or aggressive formations
- Enables interaction with the environment
- Coordinates with CONTROL fields for tactical positioning

**Function:**
- Enables the creature to interact with its environment
- Forms probing or aggressive structures
- Gathers information about surroundings
- Positions ATTACK particles for optimal interaction

## Force Field Properties

Each force field has specific properties that determine its behavior and influence:

| Property | Description | Range | Determination |
|----------|-------------|-------|--------------|
| Strength | The maximum force exerted by the field | 0.1 - 2.0 | Bitcoin nonce |
| Range | The distance over which the field exerts influence | 1.0 - 10.0 | Bitcoin nonce |
| Shape | The geometric shape of the field | Various | Bitcoin merkle root |
| Rotation | The rotation speed and pattern of the field | 0.0 - 1.0 | Bitcoin nonce |
| Elasticity | How the field responds to deformation | 0.1 - 1.0 | Bitcoin nonce |
| Permeability | How easily particles can move through the field boundary | 0.0 - 1.0 | Bitcoin nonce |

## Force Field Generation

Force fields are generated deterministically using the Bitcoin block nonce and merkle root:

```typescript
function determineForceFieldProperty(
  fieldId: string,
  property: string,
  blockData: BlockData
): number {
  const hash = deterministicHash(fieldId + property + blockData.merkleRoot);
  return normalizeHash(hash, 0, 1);
}
```

The generation process follows these steps:

1. **Field Count Determination**: The number of fields for each role is determined based on the number of particles in that role.
2. **Property Generation**: Each field's properties are generated using the Bitcoin block data.
3. **Positioning**: Fields are positioned based on their role and the creature's structure.
4. **Interaction Setup**: Field interactions are established based on the role hierarchy.

This process ensures that each creature has a unique but consistent set of force fields tied to its Bitcoin block data.

## Implementation Details

The force field system is implemented through the following components:

1. **Field Generator**: Creates force fields based on Bitcoin data.
2. **Field Manager**: Manages and updates force fields.
3. **Field Influencer**: Calculates and applies forces from fields to particles.
4. **Field Visualizer**: Provides visualization tools for development and debugging.

These components work together to create a complex, dynamic system of force fields that shape the behavior and appearance of the particle creature.
