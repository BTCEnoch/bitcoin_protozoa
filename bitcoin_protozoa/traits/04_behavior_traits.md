# Behavior Traits

This document outlines the various behavior traits used in the Bitcoin Protozoa project, detailing how particles move and interact based on their roles and traits.

## Table of Contents

1. [Behavior Philosophy](#behavior-philosophy) [Line 20]
2. [Behavior Categories](#behavior-categories) [Line 40]
   - [Core Behaviors](#core-behaviors) [Line 45]
   - [Control Behaviors](#control-behaviors) [Line 100]
   - [Movement Behaviors](#movement-behaviors) [Line 150]
   - [Defense Behaviors](#defense-behaviors) [Line 200]
   - [Attack Behaviors](#attack-behaviors) [Line 250]
3. [Behavior Properties](#behavior-properties) [Line 300]
   - [Strength](#strength) [Line 305]
   - [Range](#range) [Line 330]
   - [Priority](#priority) [Line 355]
   - [Persistence](#persistence) [Line 380]
4. [Behavior Dynamics](#behavior-dynamics) [Line 410]
   - [Behavior Transitions](#behavior-transitions) [Line 415]
   - [Behavior Combinations](#behavior-combinations) [Line 450]
   - [Emergent Behaviors](#emergent-behaviors) [Line 485]
5. [Behavior Implementation](#behavior-implementation) [Line 520]
   - [Flocking Behavior](#flocking-behavior) [Line 525]
   - [Pulsation Behavior](#pulsation-behavior) [Line 560]
   - [Rotation Behavior](#rotation-behavior) [Line 595]
   - [Oscillation Behavior](#oscillation-behavior) [Line 630]
   - [Bifurcation Behavior](#bifurcation-behavior) [Line 665]
6. [Behavior Rarity Tiers](#behavior-rarity-tiers) [Line 700]
   - [Common Behaviors](#common-behaviors) [Line 705]
   - [Uncommon Behaviors](#uncommon-behaviors) [Line 740]
   - [Rare Behaviors](#rare-behaviors) [Line 775]
   - [Epic Behaviors](#epic-behaviors) [Line 810]
   - [Legendary Behaviors](#legendary-behaviors) [Line 845]
   - [Mythic Behaviors](#mythic-behaviors) [Line 880]
7. [Related Documents](#related-documents) [Line 915]

## Behavior Philosophy

Behavior traits in Bitcoin Protozoa define how particles move and interact, creating the dynamic and lifelike qualities of the creature. These behaviors are not simple animations but complex systems that respond to internal and external forces while maintaining their fundamental characteristics.

The behavior system follows these core principles:

1. **Role-Based Behaviors**: Each particle group exhibits behaviors appropriate to its functional role
2. **Emergent Complexity**: Simple behavioral rules lead to complex, emergent patterns and interactions
3. **Dynamic Adaptation**: Behaviors adapt to changing conditions while maintaining their core purpose
4. **Deterministic Generation**: Behavior traits are assigned deterministically based on the Bitcoin block nonce
5. **Visual Distinctiveness**: Each behavior type creates visually unique movement patterns for the creature

Behaviors influence not only the movement of particle groups but also their interactions with other groups and the environment. Different behaviors have different advantages in terms of efficiency, responsiveness, and coordination capabilities.

## Behavior Categories

Behavior categories are organized by particle role, with each role having behaviors that align with its function in the overall organism. These behaviors determine how particles move, respond to stimuli, and interact with other particles.

### Core Behaviors

Core behaviors focus on stability, influence, and coordination, serving as the central organizing force for the entire creature.

#### Central Pulsation

```typescript
// Central pulsation behavior - rhythmic expansion and contraction
function centralPulsationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define pulsation parameters
  const frequency = 0.05; // Oscillations per frame
  const amplitude = strength * 0.2; // Maximum displacement
  const phase = Date.now() * 0.001; // Time-based phase

  particles.forEach(particle => {
    // Calculate distance from center
    const distanceToCenter = particle.position.distanceTo(center);

    // Calculate pulsation factor based on time
    const pulseFactor = Math.sin(phase * frequency) * amplitude;

    // Direction from center to particle
    const direction = new Vector3().subVectors(particle.position, center).normalize();

    // Apply pulsation force
    const pulseForce = direction.multiplyScalar(pulseFactor);
    particle.acceleration.add(pulseForce);

    // Set behavior-specific properties
    particle.behaviorType = 'pulsation';
    particle.pulsationPhase = phase;
    particle.pulsationAmplitude = amplitude;
    particle.pulsationFrequency = frequency;
  });
}
```

**Characteristics**:
- Rhythmic expansion and contraction
- Synchronized movement
- Stable central position
- Influence radiates outward

**Role Affinity**: CORE

**Rarity Tier**: Common

#### Orbital Influence

```typescript
// Orbital influence behavior - particles orbit while exerting influence
function orbitalInfluenceBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define orbital parameters
  const orbitSpeed = strength * 0.03; // Rotation speed
  const influenceRadius = 5.0; // Radius of influence

  particles.forEach(particle => {
    // Calculate current angle and distance
    const toParticle = new Vector3().subVectors(particle.position, center);
    const distance = toParticle.length();
    const currentAngle = Math.atan2(toParticle.z, toParticle.x);

    // Calculate new angle
    const newAngle = currentAngle + orbitSpeed;

    // Calculate new position
    const newX = center.x + Math.cos(newAngle) * distance;
    const newZ = center.z + Math.sin(newAngle) * distance;

    // Create target position
    const targetPosition = new Vector3(newX, particle.position.y, newZ);

    // Calculate direction to target
    const direction = new Vector3().subVectors(targetPosition, particle.position).normalize();

    // Apply orbital force
    const orbitalForce = direction.multiplyScalar(strength);
    particle.acceleration.add(orbitalForce);

    // Influence nearby particles
    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const distanceToOther = particle.position.distanceTo(otherParticle.position);

      if (distanceToOther < influenceRadius) {
        // Calculate influence strength (stronger at closer distances)
        const influenceStrength = strength * 0.5 * (1 - distanceToOther / influenceRadius);

        // Direction from particle to other
        const influenceDirection = new Vector3().subVectors(particle.position, otherParticle.position).normalize();

        // Apply influence force
        otherParticle.acceleration.add(influenceDirection.multiplyScalar(influenceStrength));
      }
    });

    // Set behavior-specific properties
    particle.behaviorType = 'orbital';
    particle.orbitalAngle = newAngle;
    particle.orbitalDistance = distance;
    particle.influenceRadius = influenceRadius;
  });
}
```

**Characteristics**:
- Stable orbital movement
- Influence on surrounding particles
- Gravitational-like effects
- Coordinated group movement

**Role Affinity**: CORE

**Rarity Tier**: Uncommon

#### Quantum Fluctuation

```typescript
// Quantum fluctuation behavior - unpredictable micro-movements with stabilizing influence
function quantumFluctuationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define fluctuation parameters
  const fluctuationScale = strength * 0.1; // Scale of random movements
  const stabilizationFactor = 0.7; // How quickly fluctuations stabilize
  const influenceRadius = 4.0; // Radius of stabilizing influence

  particles.forEach(particle => {
    // Generate pseudo-random fluctuation using particle ID and time
    const seed = particle.id * 0.1 + Date.now() * 0.0001;
    const noise = new Vector3(
      Math.sin(seed * 0.7) * 2 - 1,
      Math.sin(seed * 1.3) * 2 - 1,
      Math.sin(seed * 2.1) * 2 - 1
    );

    // Apply fluctuation force
    const fluctuationForce = noise.multiplyScalar(fluctuationScale);
    particle.acceleration.add(fluctuationForce);

    // Calculate distance from center
    const distanceToCenter = particle.position.distanceTo(center);

    // Apply stabilizing force toward center
    const toCenter = new Vector3().subVectors(center, particle.position).normalize();
    const stabilizingForce = toCenter.multiplyScalar(distanceToCenter * stabilizationFactor * strength);
    particle.acceleration.add(stabilizingForce);

    // Stabilizing influence on nearby particles
    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const distanceToOther = particle.position.distanceTo(otherParticle.position);

      if (distanceToOther < influenceRadius) {
        // Calculate stabilizing influence (stronger at closer distances)
        const influenceStrength = strength * 0.3 * (1 - distanceToOther / influenceRadius);

        // Direction from particle to other
        const influenceDirection = new Vector3().subVectors(particle.position, otherParticle.position).normalize();

        // Apply stabilizing influence
        otherParticle.acceleration.add(influenceDirection.multiplyScalar(influenceStrength));
      }
    });

    // Set behavior-specific properties
    particle.behaviorType = 'quantum';
    particle.fluctuationScale = fluctuationScale;
    particle.stabilizationFactor = stabilizationFactor;
    particle.influenceRadius = influenceRadius;
  });
}
```

**Characteristics**:
- Unpredictable micro-movements
- Overall stability maintained
- Complex, quantum-like behavior
- Subtle influence on surrounding particles

**Role Affinity**: CORE

**Rarity Tier**: Rare

### Control Behaviors

Control behaviors focus on coordination, direction, and regulation, serving as the decision-making system for the creature.

#### Gyroscopic Rotation

```typescript
// Gyroscopic rotation behavior - stable rotation with directional influence
function gyroscopicRotationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define rotation parameters
  const rotationSpeed = strength * 0.04; // Base rotation speed
  const axisVariation = 0.2; // Variation in rotation axis
  const influenceStrength = strength * 0.6; // Strength of directional influence

  // Calculate rotation axis (slightly randomized)
  const seed = Date.now() * 0.0001;
  const rotationAxis = new Vector3(
    Math.sin(seed * 1.1) * axisVariation,
    1.0, // Primary rotation around Y axis
    Math.sin(seed * 0.7) * axisVariation
  ).normalize();

  particles.forEach(particle => {
    // Calculate vector from center to particle
    const toParticle = new Vector3().subVectors(particle.position, center);

    // Calculate rotation force (cross product with rotation axis)
    const rotationForce = new Vector3().crossVectors(rotationAxis, toParticle).normalize();

    // Apply rotation force
    particle.acceleration.add(rotationForce.multiplyScalar(rotationSpeed));

    // Calculate directional influence
    // This creates a tendency for the entire creature to move in a specific direction
    const movementDirection = new Vector3(Math.sin(seed * 2.3), 0, Math.cos(seed * 2.3)).normalize();
    particle.acceleration.add(movementDirection.multiplyScalar(influenceStrength * 0.1));

    // Set behavior-specific properties
    particle.behaviorType = 'gyroscopic';
    particle.rotationAxis = rotationAxis.clone();
    particle.rotationSpeed = rotationSpeed;
    particle.influenceDirection = movementDirection.clone();
  });
}
```

**Characteristics**:
- Stable rotation around a central axis
- Directional influence on creature movement
- Gyroscope-like stabilizing effect
- Coordinated group movement

**Role Affinity**: CONTROL

**Rarity Tier**: Common

#### Harmonic Oscillation

```typescript
// Harmonic oscillation behavior - coordinated wave-like movements
function harmonicOscillationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define oscillation parameters
  const baseFrequency = 0.04 * strength; // Base oscillation frequency
  const amplitude = 0.3 * strength; // Oscillation amplitude
  const phaseOffset = 0.5; // Phase offset between particles
  const time = Date.now() * 0.001; // Current time for oscillation

  // Sort particles by distance from center for wave propagation
  const sortedParticles = [...particles].sort((a, b) => {
    const distA = a.position.distanceTo(center);
    const distB = b.position.distanceTo(center);
    return distA - distB;
  });

  // Calculate average position for group coordination
  const avgPosition = new Vector3();
  particles.forEach(p => avgPosition.add(p.position));
  avgPosition.divideScalar(particles.length);

  // Apply oscillation to each particle
  sortedParticles.forEach((particle, index) => {
    // Calculate phase based on index (creates wave effect)
    const phase = index / sortedParticles.length * Math.PI * 2 * phaseOffset;

    // Calculate oscillation factor
    const oscillationFactor = Math.sin(time * baseFrequency + phase) * amplitude;

    // Calculate oscillation direction (perpendicular to radius)
    const toParticle = new Vector3().subVectors(particle.position, center);
    const oscillationDir = new Vector3().crossVectors(toParticle, new Vector3(0, 1, 0)).normalize();

    // Apply oscillation force
    const oscillationForce = oscillationDir.multiplyScalar(oscillationFactor);
    particle.acceleration.add(oscillationForce);

    // Apply cohesion force toward average position (keeps group together)
    const toAvg = new Vector3().subVectors(avgPosition, particle.position);
    const cohesionForce = toAvg.multiplyScalar(0.01 * strength);
    particle.acceleration.add(cohesionForce);

    // Set behavior-specific properties
    particle.behaviorType = 'harmonic';
    particle.oscillationPhase = phase;
    particle.oscillationAmplitude = amplitude;
    particle.oscillationFrequency = baseFrequency;
  });
}
```

**Characteristics**:
- Wave-like oscillating movement
- Coordinated group behavior
- Rhythmic, harmonic patterns
- Maintains group cohesion

**Role Affinity**: CONTROL

**Rarity Tier**: Uncommon

#### Consensus Movement

```typescript
// Consensus movement behavior - group decision-making for movement direction
function consensusMovementBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define consensus parameters
  const decisionThreshold = 0.7; // Threshold for consensus
  const influenceRadius = 4.0; // Radius of influence
  const maxSpeed = strength * 0.5; // Maximum movement speed
  const time = Date.now() * 0.001; // Current time

  // Calculate current consensus direction (changes slowly over time)
  const consensusDirection = new Vector3(
    Math.sin(time * 0.1),
    Math.sin(time * 0.07) * 0.3, // Less vertical movement
    Math.cos(time * 0.1)
  ).normalize();

  // Track individual particle directions
  const particleDirections = new Map<number, Vector3>();

  // First pass: determine individual preferred directions
  particles.forEach(particle => {
    // Calculate preferred direction based on particle properties
    const particleId = particle.id;
    const seed = particleId * 0.1 + time * 0.2;

    // Individual preference with some randomness
    const preferredDirection = new Vector3(
      Math.sin(seed * 1.1),
      Math.sin(seed * 0.7) * 0.2, // Less vertical movement
      Math.cos(seed * 1.1)
    ).normalize();

    // Store preferred direction
    particleDirections.set(particleId, preferredDirection);
  });

  // Second pass: calculate consensus and apply movement
  particles.forEach(particle => {
    // Get this particle's preferred direction
    const preferredDirection = particleDirections.get(particle.id);

    // Initialize influence vectors
    let influenceCount = 1; // Count self
    const aggregateDirection = preferredDirection.clone();

    // Consider nearby particles' directions
    particles.forEach(otherParticle => {
      if (particle === otherParticle) return;

      const distance = particle.position.distanceTo(otherParticle.position);

      if (distance < influenceRadius) {
        // Get other particle's direction
        const otherDirection = particleDirections.get(otherParticle.id);

        // Add to aggregate (weighted by distance)
        const weight = 1 - (distance / influenceRadius);
        aggregateDirection.add(otherDirection.clone().multiplyScalar(weight));
        influenceCount += weight;
      }
    });

    // Normalize aggregate direction
    aggregateDirection.divideScalar(influenceCount);

    // Blend with consensus direction based on threshold
    const finalDirection = new Vector3()
      .addVectors(
        aggregateDirection.multiplyScalar(1 - decisionThreshold),
        consensusDirection.multiplyScalar(decisionThreshold)
      )
      .normalize();

    // Apply movement force
    const movementForce = finalDirection.multiplyScalar(maxSpeed);
    particle.acceleration.add(movementForce);

    // Set behavior-specific properties
    particle.behaviorType = 'consensus';
    particle.consensusThreshold = decisionThreshold;
    particle.preferredDirection = preferredDirection.clone();
    particle.finalDirection = finalDirection.clone();
  });
}
```

**Characteristics**:
- Group decision-making for movement
- Balance between individual and group preferences
- Coordinated directional changes
- Emergent leadership dynamics

**Role Affinity**: CONTROL

**Rarity Tier**: Rare

### Movement Behaviors

Movement behaviors focus on propulsion, navigation, and mobility, serving as the locomotion system for the creature.

#### Flocking

```typescript
// Flocking behavior - coordinated group movement based on separation, alignment, and cohesion
function flockingBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define flocking parameters
  const perceptionRadius = 3.0; // How far a particle can "see" others
  const separationWeight = 1.5 * strength; // Weight for separation force
  const alignmentWeight = 1.0 * strength; // Weight for alignment force
  const cohesionWeight = 1.0 * strength; // Weight for cohesion force
  const maxSpeed = 0.5 * strength; // Maximum speed

  particles.forEach(particle => {
    // Initialize forces
    const separation = new Vector3();
    const alignment = new Vector3();
    const cohesion = new Vector3();

    // Count neighbors for averaging
    let separationCount = 0;
    let alignmentCount = 0;
    let cohesionCount = 0;

    // Check interactions with other particles
    particles.forEach(other => {
      if (other === particle) return;

      const distance = particle.position.distanceTo(other.position);

      if (distance < perceptionRadius) {
        // Separation: steer away from nearby particles
        if (distance < perceptionRadius * 0.5) {
          const diff = new Vector3().subVectors(particle.position, other.position);
          diff.divideScalar(distance); // Weight by distance (closer = stronger)
          separation.add(diff);
          separationCount++;
        }

        // Alignment: steer towards average heading of neighbors
        alignment.add(other.velocity);
        alignmentCount++;

        // Cohesion: steer towards center of mass of neighbors
        cohesion.add(other.position);
        cohesionCount++;
      }
    });

    // Calculate final forces
    if (separationCount > 0) {
      separation.divideScalar(separationCount);
      separation.normalize().multiplyScalar(separationWeight);
    }

    if (alignmentCount > 0) {
      alignment.divideScalar(alignmentCount);
      alignment.normalize().multiplyScalar(alignmentWeight);
    }

    if (cohesionCount > 0) {
      cohesion.divideScalar(cohesionCount);
      cohesion.sub(particle.position); // Direction to center of mass
      cohesion.normalize().multiplyScalar(cohesionWeight);
    }

    // Apply combined flocking force
    const flockingForce = new Vector3().add(separation).add(alignment).add(cohesion);

    // Limit to max speed
    if (flockingForce.length() > maxSpeed) {
      flockingForce.normalize().multiplyScalar(maxSpeed);
    }

    // Apply force
    particle.acceleration.add(flockingForce);

    // Set behavior-specific properties
    particle.behaviorType = 'flocking';
    particle.separationWeight = separationWeight;
    particle.alignmentWeight = alignmentWeight;
    particle.cohesionWeight = cohesionWeight;
    particle.perceptionRadius = perceptionRadius;
  });
}
```

**Characteristics**:
- Coordinated group movement
- Natural, organic motion
- Emergent patterns
- Adaptive navigation

**Role Affinity**: MOVEMENT

**Rarity Tier**: Common

#### Wave Propagation

```typescript
// Wave propagation behavior - movement in wave-like patterns
function wavePropagationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define wave parameters
  const waveSpeed = 0.05 * strength; // Wave propagation speed
  const waveAmplitude = 0.4 * strength; // Wave height
  const waveLength = 10.0; // Wave length
  const time = Date.now() * 0.001; // Current time

  // Sort particles by distance from center for wave propagation
  const sortedParticles = [...particles].sort((a, b) => {
    const distA = a.position.distanceTo(center);
    const distB = b.position.distanceTo(center);
    return distA - distB;
  });

  // Apply wave movement to each particle
  sortedParticles.forEach((particle, index) => {
    // Calculate phase based on index and time
    const phase = (index / sortedParticles.length) * Math.PI * 2 - time * waveSpeed;

    // Calculate wave displacement
    const displacement = Math.sin(phase) * waveAmplitude;

    // Calculate wave direction (perpendicular to radius)
    const toParticle = new Vector3().subVectors(particle.position, center);
    const distance = toParticle.length();

    // Primary wave direction (vertical)
    const waveDir = new Vector3(0, 1, 0);

    // Secondary wave direction (circular)
    const circularDir = new Vector3().crossVectors(toParticle.normalize(), waveDir).normalize();

    // Combine directions based on distance from center
    const combinedDir = new Vector3()
      .addVectors(
        waveDir.clone().multiplyScalar(0.7),
        circularDir.multiplyScalar(0.3)
      )
      .normalize();

    // Apply wave force
    const waveForce = combinedDir.multiplyScalar(displacement);
    particle.acceleration.add(waveForce);

    // Forward propagation force (moves the entire group)
    const propagationDir = new Vector3(Math.sin(time * 0.2), 0, Math.cos(time * 0.2)).normalize();
    const propagationForce = propagationDir.multiplyScalar(0.02 * strength);
    particle.acceleration.add(propagationForce);

    // Set behavior-specific properties
    particle.behaviorType = 'wave';
    particle.wavePhase = phase;
    particle.waveAmplitude = waveAmplitude;
    particle.waveSpeed = waveSpeed;
  });
}
```

**Characteristics**:
- Wave-like movement patterns
- Coordinated propagation
- Fluid, organic motion
- Directional group movement

**Role Affinity**: MOVEMENT

**Rarity Tier**: Uncommon

#### Quantum Propulsion

```typescript
// Quantum propulsion behavior - rapid teleportation-like movement
function quantumPropulsionBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define quantum propulsion parameters
  const jumpProbability = 0.01 * strength; // Probability of quantum jump per frame
  const maxJumpDistance = 2.0 * strength; // Maximum jump distance
  const recoveryTime = 30; // Frames to recover between jumps
  const time = Date.now() * 0.001; // Current time

  // Calculate group direction (changes slowly over time)
  const groupDirection = new Vector3(
    Math.sin(time * 0.1),
    Math.sin(time * 0.07) * 0.2, // Less vertical movement
    Math.cos(time * 0.1)
  ).normalize();

  particles.forEach(particle => {
    // Initialize or update particle's quantum state
    if (!particle.quantumState) {
      particle.quantumState = {
        lastJumpTime: 0,
        recoveryCounter: 0,
        jumpDirection: new Vector3()
      };
    }

    // Update recovery counter
    if (particle.quantumState.recoveryCounter > 0) {
      particle.quantumState.recoveryCounter--;
    }

    // Determine if particle should jump
    const shouldJump = Math.random() < jumpProbability && particle.quantumState.recoveryCounter === 0;

    if (shouldJump) {
      // Calculate jump direction (biased toward group direction)
      const randomFactor = 0.3; // How much randomness to add
      const jumpDirection = new Vector3()
        .addVectors(
          groupDirection.clone().multiplyScalar(1 - randomFactor),
          new Vector3(
            Math.random() * 2 - 1,
            (Math.random() * 2 - 1) * 0.2, // Less vertical
            Math.random() * 2 - 1
          ).normalize().multiplyScalar(randomFactor)
        )
        .normalize();

      // Calculate jump distance (random within max)
      const jumpDistance = Math.random() * maxJumpDistance;

      // Apply "teleportation" by adding a very strong impulse
      const jumpForce = jumpDirection.multiplyScalar(jumpDistance * 5.0);
      particle.acceleration.add(jumpForce);

      // Store jump data
      particle.quantumState.lastJumpTime = time;
      particle.quantumState.recoveryCounter = recoveryTime;
      particle.quantumState.jumpDirection = jumpDirection.clone();

      // Visual effect - store for rendering
      particle.jumpEffect = {
        active: true,
        startTime: time,
        direction: jumpDirection.clone(),
        distance: jumpDistance
      };
    } else {
      // Normal movement - follow group with some randomness
      const normalForce = groupDirection.clone().multiplyScalar(0.05 * strength);

      // Add small random movement
      const randomForce = new Vector3(
        (Math.random() * 2 - 1) * 0.01,
        (Math.random() * 2 - 1) * 0.005,
        (Math.random() * 2 - 1) * 0.01
      );

      particle.acceleration.add(normalForce).add(randomForce);

      // Clear jump effect
      if (particle.jumpEffect) {
        particle.jumpEffect.active = false;
      }
    }

    // Set behavior-specific properties
    particle.behaviorType = 'quantum-propulsion';
    particle.jumpProbability = jumpProbability;
    particle.maxJumpDistance = maxJumpDistance;
  });
}
```

**Characteristics**:
- Rapid, teleportation-like movement
- Unpredictable jumps with overall direction
- Coordinated group quantum leaps
- Energy-efficient long-distance travel

**Role Affinity**: MOVEMENT

**Rarity Tier**: Rare

### Defense Behaviors

Defense behaviors focus on protection, resilience, and threat response, serving as the protective system for the creature.

#### Phase Shifting

```typescript
// Phase shifting behavior - rapidly shifts between different defensive states
function phaseShiftingBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define phase shifting parameters
  const phaseCount = 3; // Number of different phases
  const phaseDuration = 2.0; // Duration of each phase in seconds
  const transitionSpeed = 0.3 * strength; // Speed of transition between phases
  const time = Date.now() * 0.001; // Current time

  // Calculate current phase and transition progress
  const phaseTime = time % (phaseCount * phaseDuration);
  const currentPhase = Math.floor(phaseTime / phaseDuration);
  const nextPhase = (currentPhase + 1) % phaseCount;
  const phaseProgress = (phaseTime % phaseDuration) / phaseDuration;

  // Define phase configurations
  const phaseConfigs = [
    { // Phase 0: Spherical barrier
      shape: 'sphere',
      radius: 5.0,
      density: 1.0
    },
    { // Phase 1: Expanded disk
      shape: 'disk',
      radius: 7.0,
      thickness: 1.0,
      density: 0.7
    },
    { // Phase 2: Dual-layer barrier
      shape: 'dual-sphere',
      innerRadius: 4.0,
      outerRadius: 6.0,
      density: 0.8
    }
  ];

  // Get current and next phase configs
  const currentConfig = phaseConfigs[currentPhase];
  const nextConfig = phaseConfigs[nextPhase];

  // Apply phase-shifting behavior to particles
  particles.forEach(particle => {
    // Calculate particle's target position based on current phase
    let currentTarget = new Vector3();
    let nextTarget = new Vector3();

    // Calculate particle index and ratio for position determination
    const particleIndex = particle.id % particles.length;
    const particleRatio = particleIndex / particles.length;

    // Calculate positions for current phase
    switch (currentConfig.shape) {
      case 'sphere':
        // Spherical distribution
        const phi1 = particleRatio * Math.PI * 2;
        const theta1 = Math.acos(2 * (particleIndex / particles.length) - 1);
        currentTarget.set(
          center.x + currentConfig.radius * Math.sin(theta1) * Math.cos(phi1),
          center.y + currentConfig.radius * Math.cos(theta1),
          center.z + currentConfig.radius * Math.sin(theta1) * Math.sin(phi1)
        );
        break;

      case 'disk':
        // Disk distribution
        const diskAngle = particleRatio * Math.PI * 2;
        const diskRadius = currentConfig.radius * Math.sqrt(Math.random()); // For even distribution
        const diskHeight = (Math.random() - 0.5) * currentConfig.thickness;
        currentTarget.set(
          center.x + diskRadius * Math.cos(diskAngle),
          center.y + diskHeight,
          center.z + diskRadius * Math.sin(diskAngle)
        );
        break;

      case 'dual-sphere':
        // Dual-layer spherical distribution
        const phi2 = particleRatio * Math.PI * 2;
        const theta2 = Math.acos(2 * (particleIndex / particles.length) - 1);
        const useInnerSphere = particleIndex < particles.length * 0.4; // 40% on inner sphere
        const sphereRadius = useInnerSphere ? currentConfig.innerRadius : currentConfig.outerRadius;
        currentTarget.set(
          center.x + sphereRadius * Math.sin(theta2) * Math.cos(phi2),
          center.y + sphereRadius * Math.cos(theta2),
          center.z + sphereRadius * Math.sin(theta2) * Math.sin(phi2)
        );
        break;
    }

    // Calculate positions for next phase (similar logic)
    // ... (similar switch statement for nextTarget based on nextConfig)

    // For brevity, we'll just use a simplified version for the example
    const nextPhi = particleRatio * Math.PI * 2;
    const nextTheta = Math.acos(2 * (particleIndex / particles.length) - 1);
    const nextRadius = nextConfig.shape === 'disk' ? nextConfig.radius :
                      (nextConfig.shape === 'dual-sphere' ?
                       (particleIndex < particles.length * 0.4 ? nextConfig.innerRadius : nextConfig.outerRadius) :
                       nextConfig.radius);

    nextTarget.set(
      center.x + nextRadius * Math.sin(nextTheta) * Math.cos(nextPhi),
      center.y + (nextConfig.shape === 'disk' ? (Math.random() - 0.5) * nextConfig.thickness : nextRadius * Math.cos(nextTheta)),
      center.z + nextRadius * Math.sin(nextTheta) * Math.sin(nextPhi)
    );

    // Interpolate between current and next target based on phase progress
    const targetPosition = new Vector3().lerpVectors(currentTarget, nextTarget, phaseProgress);

    // Calculate force toward target position
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const targetDistance = toTarget.length();

    // Apply force toward target position
    const forceMagnitude = Math.min(targetDistance * 0.2, 1.0) * strength * transitionSpeed;
    const phaseForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(phaseForce);

    // Set behavior-specific properties
    particle.behaviorType = 'phase-shift';
    particle.currentPhase = currentPhase;
    particle.phaseProgress = phaseProgress;
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Shifts between multiple defensive formations
- Unpredictable protection patterns
- Adaptive to different threat types
- Energy-efficient defense system

**Role Affinity**: DEFENSE

**Rarity Tier**: Rare

#### Reactive Shielding

```typescript
// Reactive shielding behavior - responds dynamically to threats
function reactiveShieldingBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define shielding parameters
  const baseRadius = 4.0; // Base radius of the shield
  const maxExpansion = 2.0; // Maximum expansion when reacting
  const reactionSpeed = 0.2 * strength; // How quickly shield reacts
  const recoveryRate = 0.05; // How quickly shield returns to normal
  const time = Date.now() * 0.001; // Current time

  // Simulate threat detection
  // In a real implementation, this would come from an actual threat detection system
  const threatDirection = new Vector3(
    Math.sin(time * 0.3),
    Math.sin(time * 0.2),
    Math.cos(time * 0.3)
  ).normalize();

  const threatIntensity = (Math.sin(time * 0.5) + 1) * 0.5; // 0 to 1
  const threatDistance = 10 + Math.sin(time * 0.2) * 5; // Distance of threat

  // Calculate shield expansion based on threat
  const shieldExpansion = threatIntensity * maxExpansion;

  // Group particles by their position relative to the threat
  particles.forEach(particle => {
    // Calculate particle's position relative to center
    const relativePos = new Vector3().subVectors(particle.position, center);
    const distance = relativePos.length();
    const direction = relativePos.clone().normalize();

    // Calculate dot product with threat direction to determine if particle
    // is on the threat-facing side
    const dotWithThreat = direction.dot(threatDirection);

    // Calculate target radius - expand more on threat-facing side
    let targetRadius = baseRadius;
    if (dotWithThreat > 0) {
      // Expand more in threat direction
      targetRadius += shieldExpansion * dotWithThreat;
    }

    // Calculate target position
    const targetPosition = new Vector3()
      .addVectors(
        center,
        direction.multiplyScalar(targetRadius)
      );

    // Calculate force toward target position
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const targetDistance = toTarget.length();

    // Stronger force when further from target position
    const forceMagnitude = Math.min(targetDistance * 0.2, 1.0) * strength;
    const shieldForce = toTarget.normalize().multiplyScalar(forceMagnitude);

    // Apply shield force
    particle.acceleration.add(shieldForce);

    // If on threat-facing side, add additional behaviors
    if (dotWithThreat > 0.2) {
      // Increase density in threat direction
      const densityForce = direction.clone().multiplyScalar(0.05 * strength * dotWithThreat);
      particle.acceleration.add(densityForce);

      // Add slight oscillation for energy field effect
      const oscillation = Math.sin(time * 5 + particle.id * 0.1) * 0.02 * strength;
      const oscillationForce = direction.clone().multiplyScalar(oscillation);
      particle.acceleration.add(oscillationForce);
    }

    // Set behavior-specific properties
    particle.behaviorType = 'reactive-shield';
    particle.shieldRadius = targetRadius;
    particle.threatResponse = dotWithThreat > 0 ? 'active' : 'passive';
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Dynamically responds to threats
- Concentrates particles in threat direction
- Energy field-like oscillation
- Adaptive protection system

**Role Affinity**: DEFENSE

**Rarity Tier**: Uncommon

#### Barrier Formation

```typescript
// Barrier formation behavior - creates protective barriers around vital areas
function barrierFormationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define barrier parameters
  const barrierRadius = 5.0; // Radius of the protective barrier
  const barrierThickness = 1.0; // Thickness of the barrier
  const barrierStrength = strength * 2.0; // Strength of the barrier
  const rotationSpeed = 0.01 * strength; // Rotation speed of the barrier
  const time = Date.now() * 0.001; // Current time

  // Determine what to protect (typically the CORE)
  const protectionTarget = center;

  // Calculate rotation angle
  const rotationAngle = time * rotationSpeed;

  particles.forEach(particle => {
    // Calculate ideal position on the barrier
    // Use particle's ID to determine its position on the barrier
    const particleIndex = particle.id % particles.length;
    const particleRatio = particleIndex / particles.length;

    // Calculate position on sphere using spherical coordinates
    const phi = particleRatio * Math.PI * 2; // Horizontal angle
    const theta = Math.acos(2 * Math.random() - 1); // Vertical angle for even distribution

    // Apply rotation over time
    const rotatedPhi = phi + rotationAngle;

    // Convert to Cartesian coordinates
    const x = protectionTarget.x + barrierRadius * Math.sin(theta) * Math.cos(rotatedPhi);
    const y = protectionTarget.y + barrierRadius * Math.cos(theta);
    const z = protectionTarget.z + barrierRadius * Math.sin(theta) * Math.sin(rotatedPhi);

    // Create target position
    const targetPosition = new Vector3(x, y, z);

    // Calculate direction and distance to target
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const distance = toTarget.length();

    // Apply force toward target position (stronger when further away)
    const forceMagnitude = Math.min(distance * 0.1, 0.5) * barrierStrength;
    const barrierForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(barrierForce);

    // Detect and respond to threats
    // This is a simplified threat detection - in a real implementation,
    // you would have a threat detection system that identifies external threats
    const threatDirection = new Vector3(
      Math.sin(time * 0.3),
      Math.sin(time * 0.2),
      Math.cos(time * 0.3)
    ).normalize();

    // Calculate if this particle is on the threat-facing side of the barrier
    const particleDirection = new Vector3().subVectors(particle.position, protectionTarget).normalize();
    const dotProduct = particleDirection.dot(threatDirection);

    // If particle is on the threat-facing side, strengthen the barrier
    if (dotProduct > 0.2) {
      // Move slightly outward to intercept threat
      const interceptForce = particleDirection.multiplyScalar(0.1 * strength);
      particle.acceleration.add(interceptForce);

      // Increase density in threat direction
      const lateralForce = new Vector3().crossVectors(particleDirection, new Vector3(0, 1, 0))
        .normalize()
        .multiplyScalar(0.05 * strength * (1 - dotProduct));
      particle.acceleration.add(lateralForce);
    }

    // Set behavior-specific properties
    particle.behaviorType = 'barrier';
    particle.barrierRadius = barrierRadius;
    particle.barrierStrength = barrierStrength;
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Forms protective spherical barrier
- Adapts to threat direction
- Rotates to provide complete coverage
- Prioritizes defense of vital areas

**Role Affinity**: DEFENSE

**Rarity Tier**: Common

### Attack Behaviors

Attack behaviors focus on offense, threat detection, and strategic positioning, serving as the offensive system for the creature.

#### Patrol Formation

```typescript
// Patrol formation behavior - systematic movement to detect threats
function patrolFormationBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define patrol parameters
  const patrolRadius = 8.0; // Radius of patrol area
  const patrolSpeed = 0.05 * strength; // Speed of patrol movement
  const formationSpread = 2.0; // Spread of particles in formation
  const time = Date.now() * 0.001; // Current time

  // Calculate patrol center (moves in a circular pattern)
  const patrolCenterX = center.x + Math.sin(time * 0.2) * patrolRadius;
  const patrolCenterZ = center.z + Math.cos(time * 0.2) * patrolRadius;
  const patrolCenter = new Vector3(patrolCenterX, center.y, patrolCenterZ);

  // Calculate patrol direction (tangent to circle)
  const patrolDirection = new Vector3(
    Math.cos(time * 0.2),
    0,
    -Math.sin(time * 0.2)
  ).normalize();

  // Apply patrol behavior to particles
  particles.forEach((particle, index) => {
    // Calculate position in formation
    // Use particle index to determine position in formation
    const formationIndex = index % 3; // Simple 3-position formation
    const rowIndex = Math.floor(index / 3);

    // Calculate offset based on formation position
    let offsetX = 0;
    let offsetZ = 0;

    // V-shaped formation
    switch (formationIndex) {
      case 0: // Center
        offsetX = 0;
        offsetZ = -rowIndex * formationSpread * 0.5;
        break;
      case 1: // Left wing
        offsetX = -formationSpread * (rowIndex + 1);
        offsetZ = -rowIndex * formationSpread * 0.5;
        break;
      case 2: // Right wing
        offsetX = formationSpread * (rowIndex + 1);
        offsetZ = -rowIndex * formationSpread * 0.5;
        break;
    }

    // Calculate formation direction vectors
    const forward = patrolDirection.clone();
    const right = new Vector3().crossVectors(forward, new Vector3(0, 1, 0)).normalize();

    // Calculate target position in formation
    const targetPosition = new Vector3()
      .addVectors(
        patrolCenter,
        new Vector3()
          .addVectors(
            right.clone().multiplyScalar(offsetX),
            forward.clone().multiplyScalar(offsetZ)
          )
      );

    // Calculate direction and distance to target
    const toTarget = new Vector3().subVectors(targetPosition, particle.position);
    const distance = toTarget.length();

    // Apply force toward target position
    const forceMagnitude = Math.min(distance * 0.1, 0.5) * strength;
    const patrolForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(patrolForce);

    // Add threat detection behavior
    // Simulate threat detection by scanning the environment
    const scanRadius = 10.0;
    const scanDirection = new Vector3(
      Math.sin(time * 0.5 + index * 0.1),
      0,
      Math.cos(time * 0.5 + index * 0.1)
    ).normalize();

    // Set behavior-specific properties
    particle.behaviorType = 'patrol';
    particle.patrolPosition = formationIndex;
    particle.scanDirection = scanDirection.clone();
    particle.scanRadius = scanRadius;
    particle.targetPosition = targetPosition.clone();
  });
}
```

**Characteristics**:
- Organized patrol movement
- Systematic threat detection
- Formation-based positioning
- Coordinated group movement

**Role Affinity**: ATTACK

**Rarity Tier**: Common

#### Tactical Strike

```typescript
// Tactical strike behavior - coordinated attack movement
function tacticalStrikeBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define strike parameters
  const strikeRange = 12.0; // Maximum strike distance
  const strikeSpeed = 0.8 * strength; // Speed of strike movement
  const recoverySpeed = 0.3 * strength; // Speed of recovery movement
  const formationSpread = 1.5; // Spread of particles in formation
  const time = Date.now() * 0.001; // Current time

  // Simulate target detection
  // In a real implementation, this would come from an actual target detection system
  const targetDirection = new Vector3(
    Math.sin(time * 0.3),
    Math.sin(time * 0.2) * 0.3, // Less vertical movement
    Math.cos(time * 0.3)
  ).normalize();

  const targetDistance = 8 + Math.sin(time * 0.5) * 4; // Distance to target
  const targetPosition = new Vector3()
    .addVectors(
      center,
      targetDirection.clone().multiplyScalar(targetDistance)
    );

  // Determine strike phase (attack, hold, or recover)
  const cycleTime = 5.0; // Complete cycle time in seconds
  const attackTime = 1.0; // Time spent in attack phase
  const holdTime = 1.5; // Time spent in hold phase

  const phaseTime = time % cycleTime;
  let phase;
  if (phaseTime < attackTime) {
    phase = 'attack';
  } else if (phaseTime < attackTime + holdTime) {
    phase = 'hold';
  } else {
    phase = 'recover';
  }

  // Apply tactical strike behavior to particles
  particles.forEach((particle, index) => {
    // Calculate position in formation
    const formationIndex = index % 5; // 5-position formation
    const rowIndex = Math.floor(index / 5);

    // Calculate formation position
    let formationPosition;
    switch (phase) {
      case 'attack':
        // Concentrated attack formation - arrowhead
        switch (formationIndex) {
          case 0: // Leader
            formationPosition = new Vector3(0, 0, -rowIndex * formationSpread * 0.5);
            break;
          case 1: // Left close
            formationPosition = new Vector3(-formationSpread * 0.7, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 0.7);
            break;
          case 2: // Right close
            formationPosition = new Vector3(formationSpread * 0.7, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 0.7);
            break;
          case 3: // Left far
            formationPosition = new Vector3(-formationSpread * 1.5, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 1.5);
            break;
          case 4: // Right far
            formationPosition = new Vector3(formationSpread * 1.5, 0, -rowIndex * formationSpread * 0.5 - formationSpread * 1.5);
            break;
        }
        break;

      case 'hold':
        // Surrounding formation - encircle target
        const angle = (formationIndex / 5) * Math.PI * 2 + rowIndex * 0.2;
        const holdRadius = formationSpread * 2;
        formationPosition = new Vector3(
          Math.sin(angle) * holdRadius,
          0,
          Math.cos(angle) * holdRadius
        );
        break;

      case 'recover':
        // Dispersed formation - prepare for next attack
        const recoverAngle = (formationIndex / 5) * Math.PI * 2 + rowIndex * 0.5;
        const recoverRadius = formationSpread * 3 + rowIndex * formationSpread * 0.5;
        formationPosition = new Vector3(
          Math.sin(recoverAngle) * recoverRadius,
          0,
          Math.cos(recoverAngle) * recoverRadius
        );
        break;
    }

    // Calculate world-space target position
    // Rotate formation to face target
    const forward = targetDirection.clone();
    const right = new Vector3().crossVectors(forward, new Vector3(0, 1, 0)).normalize();
    const up = new Vector3().crossVectors(right, forward).normalize();

    // Transform formation position to world space
    const worldOffset = new Vector3()
      .addScaledVector(right, formationPosition.x)
      .addScaledVector(up, formationPosition.y)
      .addScaledVector(forward, formationPosition.z);

    // Calculate final target position
    let finalTargetPosition;
    switch (phase) {
      case 'attack':
        // Move toward target
        finalTargetPosition = new Vector3().addVectors(targetPosition, worldOffset);
        break;

      case 'hold':
        // Hold position around target
        finalTargetPosition = new Vector3().addVectors(targetPosition, worldOffset);
        break;

      case 'recover':
        // Move back toward center
        const recoverProgress = (phaseTime - (attackTime + holdTime)) / (cycleTime - attackTime - holdTime);
        const recoverPosition = new Vector3().lerpVectors(
          targetPosition,
          center,
          recoverProgress
        );
        finalTargetPosition = new Vector3().addVectors(recoverPosition, worldOffset);
        break;
    }

    // Calculate direction and distance to target
    const toTarget = new Vector3().subVectors(finalTargetPosition, particle.position);
    const distance = toTarget.length();

    // Apply force toward target position
    let forceMagnitude;
    switch (phase) {
      case 'attack':
        forceMagnitude = Math.min(distance * 0.2, 1.0) * strikeSpeed;
        break;
      case 'hold':
        forceMagnitude = Math.min(distance * 0.3, 0.8) * strength;
        break;
      case 'recover':
        forceMagnitude = Math.min(distance * 0.15, 0.6) * recoverySpeed;
        break;
    }

    const strikeForce = toTarget.normalize().multiplyScalar(forceMagnitude);
    particle.acceleration.add(strikeForce);

    // Set behavior-specific properties
    particle.behaviorType = 'tactical-strike';
    particle.strikePhase = phase;
    particle.formationPosition = formationIndex;
    particle.targetPosition = finalTargetPosition.clone();
  });
}
```

**Characteristics**:
- Coordinated attack movements
- Tactical positioning
- Phase-based strike patterns
- Target-focused behavior

**Role Affinity**: ATTACK

**Rarity Tier**: Uncommon

#### Quantum Strike

```typescript
// Quantum strike behavior - unpredictable, high-speed attack patterns
function quantumStrikeBehavior(particles: Particle[], center: Vector3, strength: number): void {
  // Define quantum strike parameters
  const strikeRange = 15.0; // Maximum strike distance
  const strikeSpeed = 1.2 * strength; // Speed of strike movement
  const phaseShiftProbability = 0.02 * strength; // Probability of phase shift per frame
  const maxPhaseShifts = 3; // Maximum number of phase shifts per cycle
  const time = Date.now() * 0.001; // Current time

  // Simulate target detection
  // In a real implementation, this would come from an actual target detection system
  const targetDirection = new Vector3(
    Math.sin(time * 0.3),
    Math.sin(time * 0.2) * 0.3, // Less vertical movement
    Math.cos(time * 0.3)
  ).normalize();

  const targetDistance = 10 + Math.sin(time * 0.5) * 5; // Distance to target
  const targetPosition = new Vector3()
    .addVectors(
      center,
      targetDirection.clone().multiplyScalar(targetDistance)
    );

  // Group particles into strike teams
  const teamSize = Math.ceil(particles.length / 3); // 3 teams
  const teams = [[], [], []];

  particles.forEach((particle, index) => {
    const teamIndex = Math.floor(index / teamSize);
    if (teamIndex < 3) {
      teams[teamIndex].push(particle);
    } else {
      // Overflow particles go to team 0
      teams[0].push(particle);
    }
  });

  // Apply quantum strike behavior to each team
  teams.forEach((team, teamIndex) => {
    // Each team has its own phase state
    if (!team.phaseState) {
      team.phaseState = {
        currentPhase: 'prepare',
        phaseStartTime: time,
        phaseShiftCount: 0,
        strikeTarget: targetPosition.clone(),
        strikeDirection: targetDirection.clone()
      };
    }

    // Update phase state
    const phaseState = team.phaseState;
    const phaseTime = time - phaseState.phaseStartTime;

    // Determine if phase shift should occur
    let shouldShift = false;

    switch (phaseState.currentPhase) {
      case 'prepare':
        // Prepare phase lasts 1-2 seconds
        if (phaseTime > 1 + Math.random()) {
          shouldShift = true;
        }
        break;

      case 'strike':
        // Strike phase is brief (0.5 seconds)
        if (phaseTime > 0.5) {
          shouldShift = true;
        }
        break;

      case 'reposition':
        // Reposition phase lasts 0.5-1.5 seconds
        if (phaseTime > 0.5 + Math.random()) {
          shouldShift = true;
        }
        break;

      case 'recover':
        // Recovery phase lasts 2-3 seconds
        if (phaseTime > 2 + Math.random()) {
          shouldShift = true;
          // Reset phase shift count after recovery
          phaseState.phaseShiftCount = 0;
        }
        break;
    }

    // Random phase shifts during strike and reposition (quantum behavior)
    if (['strike', 'reposition'].includes(phaseState.currentPhase)) {
      if (Math.random() < phaseShiftProbability && phaseState.phaseShiftCount < maxPhaseShifts) {
        shouldShift = true;
      }
    }

    // Perform phase shift if needed
    if (shouldShift) {
      // Determine next phase
      let nextPhase;
      switch (phaseState.currentPhase) {
        case 'prepare':
          nextPhase = 'strike';
          // Update strike target
          phaseState.strikeTarget = new Vector3()
            .addVectors(
              targetPosition,
              new Vector3(
                (Math.random() * 2 - 1) * 3,
                (Math.random() * 2 - 1) * 1,
                (Math.random() * 2 - 1) * 3
              )
            );
          break;

        case 'strike':
          nextPhase = 'reposition';
          phaseState.phaseShiftCount++;
          break;

        case 'reposition':
          // Either strike again or recover based on phase shift count
          if (phaseState.phaseShiftCount >= maxPhaseShifts) {
            nextPhase = 'recover';
          } else {
            nextPhase = 'strike';
            // Update strike target
            phaseState.strikeTarget = new Vector3()
              .addVectors(
                targetPosition,
                new Vector3(
                  (Math.random() * 2 - 1) * 3,
                  (Math.random() * 2 - 1) * 1,
                  (Math.random() * 2 - 1) * 3
                )
              );
          }
          break;

        case 'recover':
          nextPhase = 'prepare';
          break;
      }

      // Update phase state
      phaseState.currentPhase = nextPhase;
      phaseState.phaseStartTime = time;
    }

    // Apply behavior based on current phase
    team.forEach((particle, particleIndex) => {
      // Calculate particle's position in team formation
      const formationIndex = particleIndex % 5; // 5-position formation
      const rowIndex = Math.floor(particleIndex / 5);

      // Calculate target position based on phase
      let targetPosition;
      let forceMagnitude;

      switch (phaseState.currentPhase) {
        case 'prepare':
          // Circular formation around center, offset by team index
          const prepareAngle = (formationIndex / 5) * Math.PI * 2 + (teamIndex * Math.PI * 2 / 3);
          const prepareRadius = 6 + rowIndex * 0.5;
          targetPosition = new Vector3(
            center.x + Math.sin(prepareAngle) * prepareRadius,
            center.y,
            center.z + Math.cos(prepareAngle) * prepareRadius
          );
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.15, 0.6) * strength;
          break;

        case 'strike':
          // Concentrated formation moving toward strike target
          // Calculate formation offset
          const strikeOffset = new Vector3(
            (formationIndex - 2) * 0.5,
            rowIndex * 0.2,
            -rowIndex * 0.5
          );

          // Rotate offset to face strike direction
          const strikeDir = new Vector3().subVectors(phaseState.strikeTarget, center).normalize();
          const strikeRight = new Vector3().crossVectors(strikeDir, new Vector3(0, 1, 0)).normalize();
          const strikeUp = new Vector3().crossVectors(strikeRight, strikeDir).normalize();

          const rotatedOffset = new Vector3()
            .addScaledVector(strikeRight, strikeOffset.x)
            .addScaledVector(strikeUp, strikeOffset.y)
            .addScaledVector(strikeDir, strikeOffset.z);

          targetPosition = new Vector3().addVectors(phaseState.strikeTarget, rotatedOffset);
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.25, 1.0) * strikeSpeed;
          break;

        case 'reposition':
          // Dispersed formation, preparing for next strike
          const repositionAngle = (formationIndex / 5) * Math.PI * 2 + (teamIndex * Math.PI * 2 / 3) + time * 0.5;
          const repositionRadius = 4 + Math.random() * 2;
          targetPosition = new Vector3(
            targetPosition.x + Math.sin(repositionAngle) * repositionRadius,
            targetPosition.y + (Math.random() - 0.5) * 2,
            targetPosition.z + Math.cos(repositionAngle) * repositionRadius
          );
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.2, 0.8) * strength;
          break;

        case 'recover':
          // Return to center in loose formation
          const recoverAngle = (formationIndex / 5) * Math.PI * 2 + (teamIndex * Math.PI * 2 / 3);
          const recoverRadius = 8 + rowIndex * 0.5;
          targetPosition = new Vector3(
            center.x + Math.sin(recoverAngle) * recoverRadius,
            center.y,
            center.z + Math.cos(recoverAngle) * recoverRadius
          );
          forceMagnitude = Math.min(particle.position.distanceTo(targetPosition) * 0.1, 0.5) * strength;
          break;
      }

      // Calculate direction to target
      const toTarget = new Vector3().subVectors(targetPosition, particle.position);
      const distance = toTarget.length();

      // Apply force toward target position
      const strikeForce = toTarget.normalize().multiplyScalar(forceMagnitude);
      particle.acceleration.add(strikeForce);

      // Add quantum fluctuation in strike and reposition phases
      if (['strike', 'reposition'].includes(phaseState.currentPhase)) {
        const fluctuation = new Vector3(
          (Math.random() * 2 - 1) * 0.05 * strength,
          (Math.random() * 2 - 1) * 0.05 * strength,
          (Math.random() * 2 - 1) * 0.05 * strength
        );
        particle.acceleration.add(fluctuation);
      }

      // Set behavior-specific properties
      particle.behaviorType = 'quantum-strike';
      particle.strikePhase = phaseState.currentPhase;
      particle.teamIndex = teamIndex;
      particle.formationPosition = formationIndex;
      particle.targetPosition = targetPosition.clone();
    });
  });
}
```

**Characteristics**:
- Unpredictable attack patterns
- High-speed strike capabilities
- Coordinated team-based tactics
- Quantum-like phase shifting

**Role Affinity**: ATTACK

**Rarity Tier**: Rare
