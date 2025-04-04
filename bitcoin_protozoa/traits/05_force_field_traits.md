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
