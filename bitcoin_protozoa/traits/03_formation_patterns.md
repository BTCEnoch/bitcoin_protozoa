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