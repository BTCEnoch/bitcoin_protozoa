# Force Calculations

This document details the implementation of force calculations for particle formations in the Bitcoin Protozoa project. The force calculations are the core mechanism that drives particle movement and creates emergent behaviors in the simulation.

## Table of Contents

1. [Core Concepts](#core-concepts)
2. [Force Calculation Formula](#force-calculation-formula)
3. [Force Rule Generation](#force-rule-generation)
4. [Enhanced Force Calculations](#enhanced-force-calculations)
5. [Formation Calculations](#formation-calculations)
6. [Performance Optimizations](#performance-optimizations)
7. [Integration with Bitcoin Data](#integration-with-bitcoin-data)
8. [Implementation Plan](#implementation-plan)
9. [Related Documents](#related-documents)

## Core Concepts

### Force-Based Particle Interaction

The particle system uses a force-based approach where particles exert forces on each other based on:
1. Their role/group (CORE, CONTROL, ATTACK, DEFENSE, MOVEMENT)
2. Distance between particles
3. Force rules defined by deterministic RNG from Bitcoin block data

The interaction between particles creates emergent behaviors such as:
- Flocking
- Pulsation
- Rotation
- Oscillation
- Bifurcation

## Force Calculation Formula

The basic force calculation between two particles follows this pattern:

```typescript
// For each particle a
for (const a of particles) {
  let fx = 0, fy = 0, fz = 0;

  // Calculate forces from all other particles
  for (const b of particles) {
    // Get force rule between particle groups
    const forceRule = forceRules[a.group][b.group];

    // Calculate distance vector
    const dx = a.position.x - b.position.x;
    const dy = a.position.y - b.position.y;
    const dz = a.position.z - b.position.z;

    // Skip self-interaction
    if (dx !== 0 || dy !== 0 || dz !== 0) {
      const distanceSquared = dx*dx + dy*dy + dz*dz;

      // Apply force if within cutoff distance
      if (distanceSquared < CUTOFF_DISTANCE_SQUARED) {
        // Force magnitude inversely proportional to distance
        const forceMagnitude = forceRule / Math.sqrt(distanceSquared);

        // Apply force in direction of distance vector
        fx += forceMagnitude * dx;
        fy += forceMagnitude * dy;
        fz += forceMagnitude * dz;
      }
    }
  }

  // Apply accumulated forces to velocity with viscosity damping
  const viscosityFactor = 1.0 - VISCOSITY;
  a.velocity.x = a.velocity.x * viscosityFactor + fx * TIME_SCALE;
  a.velocity.y = a.velocity.y * viscosityFactor + fy * TIME_SCALE;
  a.velocity.z = a.velocity.z * viscosityFactor + fz * TIME_SCALE;
}
```

## Force Rule Generation

Force rules determine how particles of different groups interact with each other. These rules are generated deterministically from the Bitcoin block nonce:

```typescript
function generateForceRules(nonce: number, groups: ParticleGroup[]): ForceRuleMatrix {
  const random = mulberry32(nonce);
  const rules: ForceRuleMatrix = {};

  // Initialize rules for each group
  groups.forEach(sourceGroup => {
    rules[sourceGroup.id] = {};

    // Set rules for interaction with each target group
    groups.forEach(targetGroup => {
      // Generate a value between -1 and 1
      // Negative values: repulsion, Positive values: attraction
      rules[sourceGroup.id][targetGroup.id] = random() * 2 - 1;
    });
  });

  return rules;
}
```

## Enhanced Force Calculations

Our implementation extends the basic force model with several enhancements:

### 1. Role-Based Force Modifiers

Force calculations are modified based on particle roles:

```typescript
// Role-specific force modifiers
const ROLE_FORCE_MODIFIERS = {
  [ParticleRole.CORE]: 1.5,     // Core particles have stronger influence
  [ParticleRole.CONTROL]: 1.2,  // Control particles have moderate-high influence
  [ParticleRole.ATTACK]: 1.0,   // Attack particles have standard influence
  [ParticleRole.DEFENSE]: 0.8,  // Defense particles have moderate influence
  [ParticleRole.MOVEMENT]: 0.6  // Movement particles have lower influence
};

// Apply role-based modifier to force calculation
const forceMagnitude = forceRule * ROLE_FORCE_MODIFIERS[a.role] / Math.sqrt(distanceSquared);
```

### 2. Force Field Influence

Particles are also influenced by invisible force fields that create formation structures:

```typescript
function calculateForceFieldInfluence(particle: Particle, forceFields: ForceField[]): Vector3 {
  const influence = new Vector3(0, 0, 0);

  for (const field of forceFields) {
    // Skip fields that don't influence this particle's role
    if (!field.influencesRole(particle.role)) continue;

    // Calculate distance to field center
    const distanceToField = particle.position.distanceTo(field.center);

    // Calculate containment force (stronger as particles move away from field)
    if (distanceToField > field.radius * 0.8) {
      const containmentDirection = field.center.clone().sub(particle.position).normalize();
      const containmentStrength = Math.pow((distanceToField - field.radius * 0.8) / field.radius, 2) * field.strength;

      influence.add(
        containmentDirection.multiplyScalar(containmentStrength)
      );
    }

    // Calculate role-specific formation forces
    if (field.role === particle.role) {
      // Add formation-specific forces (e.g., orbital, lattice, etc.)
      const formationForce = calculateFormationForce(particle, field);
      influence.add(formationForce);
    }
  }

  return influence;
}
```

### 3. Oscillation and Time-Varying Forces

Forces can oscillate over time to create dynamic behaviors:

```typescript
// Add time-based oscillation to force rules
const oscillationFactor = OSCILLATION_AMPLITUDE * Math.sin(time * OSCILLATION_FREQUENCY);
const adjustedForceRule = forceRule + oscillationFactor;
```

### 4. Collision Handling

Particles have collision detection and response:

```typescript
// Collision handling
if (distanceSquared < COLLISION_RADIUS_SQUARED) {
  const overlap = COLLISION_RADIUS - Math.sqrt(distanceSquared);
  fx += (overlap * dx) / Math.sqrt(distanceSquared);
  fy += (overlap * dy) / Math.sqrt(distanceSquared);
  fz += (overlap * dz) / Math.sqrt(distanceSquared);
}
```

## Formation Calculations

Formations are created by combining force fields with particle role assignments:

### 1. Role-Based Formations

Each role has specific formation behaviors:

```typescript
function calculateFormationForce(particle: Particle, field: ForceField): Vector3 {
  switch (particle.role) {
    case ParticleRole.CORE:
      return calculateCoreFormation(particle, field);
    case ParticleRole.CONTROL:
      return calculateControlFormation(particle, field);
    case ParticleRole.ATTACK:
      return calculateAttackFormation(particle, field);
    case ParticleRole.DEFENSE:
      return calculateDefenseFormation(particle, field);
    case ParticleRole.MOVEMENT:
      return calculateMovementFormation(particle, field);
    default:
      return new Vector3(0, 0, 0);
  }
}
```

### 2. Formation Types

Different formation patterns are implemented for each role:

#### Core Formation (Dense Cluster)

```typescript
function calculateCoreFormation(particle: Particle, field: ForceField): Vector3 {
  // Core particles form a dense, spherical cluster
  const distanceToCenter = particle.position.distanceTo(field.center);
  const directionToCenter = field.center.clone().sub(particle.position).normalize();

  // Attraction to center with some spacing
  const optimalDistance = field.radius * 0.4;
  const distanceFactor = (distanceToCenter - optimalDistance) / optimalDistance;

  return directionToCenter.multiplyScalar(distanceFactor * field.strength * 0.8);
}
```

#### Control Formation (Orbital)

```typescript
function calculateControlFormation(particle: Particle, field: ForceField): Vector3 {
  // Control particles orbit in a gyroscopic pattern
  const force = new Vector3(0, 0, 0);

  // Calculate position relative to field center
  const relativePos = particle.position.clone().sub(field.center);

  // Create orbital plane based on particle's unique ID
  const planeNormal = new Vector3(
    Math.sin(particle.id * 0.1),
    Math.cos(particle.id * 0.1),
    Math.sin(particle.id * 0.3)
  ).normalize();

  // Project relative position onto orbital plane
  const projectedPos = relativePos.clone().projectOnPlane(planeNormal);

  // Calculate tangential force for orbit
  const tangent = new Vector3().crossVectors(planeNormal, projectedPos).normalize();
  force.add(tangent.multiplyScalar(field.strength * 0.5));

  // Add force to maintain optimal orbital distance
  const optimalDistance = field.radius * 0.7;
  const currentDistance = projectedPos.length();
  const radialForce = (optimalDistance - currentDistance) / optimalDistance;

  force.add(projectedPos.normalize().multiplyScalar(radialForce * field.strength * 0.3));

  return force;
}
```

#### Attack Formation (Spiked)

```typescript
function calculateAttackFormation(particle: Particle, field: ForceField): Vector3 {
  // Attack particles form spike-like formations
  const force = new Vector3(0, 0, 0);

  // Calculate angle-based position in formation
  const particleAngle = (particle.id % 20) / 20 * Math.PI * 2;
  const targetX = Math.cos(particleAngle) * field.radius * 0.9;
  const targetY = Math.sin(particleAngle) * field.radius * 0.9;
  const targetZ = ((particle.id % 5) / 5 - 0.5) * field.radius;

  const targetPosition = field.center.clone().add(new Vector3(targetX, targetY, targetZ));

  // Force toward target position
  const directionToTarget = targetPosition.clone().sub(particle.position);
  const distanceToTarget = directionToTarget.length();

  force.add(directionToTarget.normalize().multiplyScalar(distanceToTarget * field.strength * 0.4));

  return force;
}
```

## Performance Optimizations

Several optimizations are implemented to ensure the force calculations remain efficient:

1. **Spatial Partitioning**: Using a grid-based approach to only check interactions between nearby particles
2. **Distance Cutoff**: Only calculating forces between particles within a certain distance
3. **Web Workers**: Offloading force calculations to a separate thread
4. **SIMD Operations**: Using SIMD when available for parallel force calculations
5. **Batch Processing**: Processing particles in batches for better cache utilization

## Integration with Bitcoin Data

Force rules and formations are generated deterministically from Bitcoin block data:

```typescript
async function generateCreatureFromBlock(blockNumber: number): Promise<Creature> {
  // Fetch block data - ONLY need nonce and confirmations
  const blockData = await fetchBlockData(blockNumber);

  // Use nonce for deterministic generation
  const nonce = blockData.nonce;

  // Store confirmations for evolution tracking
  const confirmations = blockData.confirmations;

  // Generate particle groups
  const groups = generateParticleGroups(nonce);

  // Generate force rules
  const forceRules = generateForceRules(nonce, groups);

  // Generate force fields
  const forceFields = generateForceFields(nonce, groups);

  // Create and return creature
  return new Creature(blockNumber, nonce, confirmations, groups, forceRules, forceFields);
}
```

## Implementation Plan

1. Implement basic force calculation system
2. Add role-based force modifiers
3. Implement force fields for each role
4. Add formation calculations for each role
5. Implement performance optimizations
6. Integrate with Bitcoin data
7. Add time-varying forces and oscillations
8. Implement collision handling
9. Add debugging and visualization tools

## Related Documents

- [Physics Engine](01_physics_engine.md) - For details on the physics engine
- [Force Field System](03_force_field_system.md) - For details on force field implementation
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
