# Particle Lifecycle Management

This document details the lifecycle management of particles in the Bitcoin Protozoa project, including creation, update cycles, destruction, memory management, and performance considerations.

## Table of Contents

1. [Overview](#overview)
2. [Creation Process](#creation-process)
3. [Update Cycle](#update-cycle)
4. [Destruction Process](#destruction-process)
5. [Memory Management](#memory-management)
6. [Performance Considerations](#performance-considerations)
7. [Implementation Details](#implementation-details)
8. [Related Documents](#related-documents)

## Overview

The particle lifecycle management system handles the complete lifecycle of particles from creation to destruction, ensuring efficient memory usage and optimal performance. The system is designed to handle 500 particles per creature while maintaining 60 FPS on standard PC hardware.

The lifecycle consists of three main phases:
1. **Creation Process**: How particles are spawned and initialized
2. **Update Cycle**: How particles are updated during their active life
3. **Destruction Process**: How particles are removed and resources reclaimed

## Creation Process

### Spawn Triggers

Particles are created based on one of the following triggers:
- **Initialization**: When a creature is first created from Bitcoin block data
- **Event-based**: In response to specific events within the simulation
- **Blockchain-based**: When new confirmations trigger mutations

### Role Assignment

During creation, each particle is assigned a role based on deterministic calculations from Bitcoin block data:

```typescript
function determineRoleFromBlockData(particleId: string, blockData: BlockData): ParticleRole {
  const hash = deterministicHash(particleId + blockData.merkleRoot);
  const value = normalizeHash(hash, 0, 100);
  
  if (value < 10) return ParticleRole.CORE;      // 10% chance
  if (value < 25) return ParticleRole.CONTROL;   // 15% chance
  if (value < 45) return ParticleRole.ATTACK;    // 20% chance
  if (value < 70) return ParticleRole.DEFENSE;   // 25% chance
  return ParticleRole.MOVEMENT;                  // 30% chance
}
```

### Initial Property Configuration

Each particle is initialized with the following properties:
- **Position**: Determined by role and group formation
- **Velocity**: Initially small random values
- **Acceleration**: Initially zero
- **Mass**: Based on role (CORE: lightest, ATTACK: heaviest)
- **Size**: Based on role (CORE: smallest, ATTACK: largest)
- **Color**: Based on role and group color scheme
- **Visual Effects**: Based on role (glow, trail, etc.)

### Spatial Partitioning

Newly created particles are added to a spatial partitioning system for efficient collision detection and force calculations:

```typescript
// Add particle to spatial grid
grid.addParticle(particle);
```

### Visual Effect Initialization

Visual effects are initialized for each particle based on its role:
- **CORE**: Gentle pulsing glow
- **CONTROL**: Dynamic, gyroscopic motion
- **MOVEMENT**: Directional indicators
- **DEFENSE**: Semi-transparent protective boundary
- **ATTACK**: Intense pulsing glow

## Update Cycle

The update cycle is executed for each active particle during each frame of the simulation.

### Physics Update

The physics update process includes:

1. **Position Update**: Using Verlet integration for stability
   ```typescript
   // Update position based on velocity
   particle.position.add(
     new Vector3(
       particle.velocity.x * deltaTime,
       particle.velocity.y * deltaTime,
       particle.velocity.z * deltaTime
     )
   );
   ```

2. **Velocity Update**: Based on accumulated forces
   ```typescript
   // Update velocity based on acceleration
   particle.velocity.add(
     new Vector3(
       particle.acceleration.x * deltaTime,
       particle.acceleration.y * deltaTime,
       particle.acceleration.z * deltaTime
     )
   );
   ```

3. **Acceleration Reset**: After applying forces
   ```typescript
   // Reset acceleration
   particle.acceleration.x = 0;
   particle.acceleration.y = 0;
   particle.acceleration.z = 0;
   ```

### Behavior Execution

Each particle executes behavior based on its role:

1. **CORE**: Maintains central position, influences all other roles
2. **CONTROL**: Directs other particles, orbits close to the core
3. **MOVEMENT**: Propels the entire structure, responds to CONTROL
4. **DEFENSE**: Forms protective barriers around the CORE
5. **ATTACK**: Patrols the perimeter, responds to external threats

### Particle Interactions

During the update cycle, particles interact with:

1. **Other Particles**: Through the force matrix
   ```
                    | Core | Control | Movement | Defense | Attack
   --------------------|------|---------|----------|---------|--------
   Core particle       | +0.5 |   +0.8  |   +0.3   |   +0.2  |  -0.1
   Control particle    | +0.8 |   +0.3  |   +0.6   |   +0.4  |  +0.2
   Movement particle   | +0.3 |   +0.6  |   +0.2   |   +0.3  |  +0.5
   Defense particle    | +0.2 |   +0.4  |   +0.3   |   +0.4  |  +0.7
   Attack particle     | -0.1 |   +0.2  |   +0.5   |   +0.7  |  +0.3
   ```

2. **Force Fields**: Through role-specific interactions
   ```typescript
   // Apply force field influence
   forceField.applyToParticle(particle, deltaTime);
   ```

3. **Boundaries**: To keep particles within the simulation space
   ```typescript
   // Check and handle boundary collisions
   if (particle.position.x < bounds.min.x || particle.position.x > bounds.max.x) {
     particle.velocity.x *= -0.8; // Bounce with energy loss
   }
   ```

### Energy Consumption

Particles consume energy based on:
- **Role**: ATTACK consumes most, DEFENSE consumes least
- **Activity**: Higher velocity and acceleration increase consumption
- **Interactions**: Interactions with other particles and force fields

### Visual Effect Updates

Visual effects are updated based on:
- **Current state**: Position, velocity, energy level
- **Role**: Each role has unique visual effects
- **Age**: Effects may change as particles age

## Destruction Process

### Death Triggers

Particles can be destroyed based on:
1. **Energy Depletion**: When energy level reaches zero
2. **Lifetime Expiration**: When maximum age is reached
3. **Event-based**: In response to specific events
4. **Mutation**: When creature structure changes due to Bitcoin confirmations

### Visual Fade-Out

Before complete removal, particles undergo a visual fade-out:
```typescript
// Fade out particle
particle.opacity -= deltaTime * fadeRate;
if (particle.opacity <= 0) {
  // Complete removal
  removeParticle(particle);
}
```

### Spatial Partition Removal

Particles are removed from the spatial partitioning system:
```typescript
// Remove from spatial grid
grid.removeParticle(particle);
```

### Resource Reclamation

Resources are reclaimed through the object pool system:
```typescript
// Return particle to pool
particlePool.release(particle);
```

### Event Notification

Events are emitted to notify other systems of particle destruction:
```typescript
// Emit destruction event
eventSystem.emit('particle:destroyed', { id: particle.id, role: particle.role });
```

## Memory Management

### Particle Pool

The particle pool system pre-allocates and reuses particle objects to reduce garbage collection:

```typescript
class ObjectPool<T> {
  private pool: T[] = [];
  private factory: () => T;
  private reset: (obj: T) => void;
  
  constructor(factory: () => T, reset: (obj: T) => void, initialSize: number = 0) {
    this.factory = factory;
    this.reset = reset;
    
    // Pre-allocate objects
    for (let i = 0; i < initialSize; i++) {
      this.pool.push(this.factory());
    }
  }
  
  get(): T {
    if (this.pool.length > 0) {
      return this.pool.pop()!;
    }
    
    return this.factory();
  }
  
  release(obj: T): void {
    this.reset(obj);
    this.pool.push(obj);
  }
}
```

Key features of the particle pool:
- **Pre-allocated Memory**: Reduces allocation overhead during runtime
- **Configurable Pool Size**: Default of 20 buffers, adjustable based on requirements
- **Automatic Expansion/Contraction**: Dynamically adjusts based on demand
- **Efficient Reuse**: Particles are reset and reused rather than created anew

### Vector Buffer Management

Vector buffers are optimized for efficient storage and processing:

1. **Typed Arrays**: Using typed arrays for position, velocity, and acceleration data
   ```typescript
   const positionArray = new Float32Array(particleCount * 3);
   // Update particles
   for (let i = 0; i < particleCount; i++) {
     const index = i * 3;
     positionArray[index] = x;     // x
     positionArray[index + 1] = y; // y
     positionArray[index + 2] = z; // z
   }
   ```

2. **Batch Processing**: Processing vectors in batches for better cache utilization
3. **Cache-friendly Memory Layout**: Organizing data for optimal memory access patterns

## Performance Considerations

### Spatial Partitioning

Spatial partitioning is used to optimize collision detection and force calculations:

```typescript
const grid = new SpatialGrid(cellSize, worldBounds);

// Add particles to the grid
particles.forEach(particle => {
  grid.addParticle(particle);
});

// For each particle, only check nearby particles
particles.forEach(particle => {
  const nearbyParticles = grid.getNearbyParticles(particle.position);
  // Check interactions with nearby particles only
});
```

### Web Workers

Physics calculations are offloaded to Web Workers to prevent UI freezing:

```typescript
// Main thread
const physicsWorker = new Worker('./physicsWorker.ts');
physicsWorker.postMessage({
  type: 'UPDATE',
  deltaTime: 16.7 // ms for 60fps
});

physicsWorker.onmessage = (e) => {
  const { particleData } = e.data;
  // Update renderer with new particle positions
};

// Physics worker thread
self.onmessage = (e) => {
  const { type, deltaTime } = e.data;
  if (type === 'UPDATE') {
    // Update particle positions based on physics
    self.postMessage({
      particleData: serializeParticles(particles)
    });
  }
};
```

### Instanced Rendering

Instanced rendering is used for efficient particle rendering:

```typescript
// Create one instanced mesh per particle role
const instancedMesh = new THREE.InstancedMesh(
  geometry,
  material,
  particleCount
);

// Use a single dummy object for matrix updates
const dummy = new THREE.Object3D();

// Batch update matrices
for (let i = 0; i < particleCount; i++) {
  dummy.position.copy(particles[i].position);
  dummy.updateMatrix();
  instancedMesh.setMatrixAt(i, dummy.matrix);
}

// Only update buffer once per frame
instancedMesh.instanceMatrix.needsUpdate = true;
```

### Fixed Timestep

A fixed timestep is used for physics updates to ensure consistent behavior:

```typescript
// In animation loop:
physicsAccumulator += adjustedDelta;
while (physicsAccumulator >= PHYSICS_TIMESTEP) {
  particleSystemService().update(PHYSICS_TIMESTEP);
  physicsAccumulator -= PHYSICS_TIMESTEP;
}
```

### Frustum Culling

Frustum culling is used to avoid rendering particles outside the camera view:

```typescript
// Enable frustum culling for better performance
const frustum = new THREE.Frustum();
frustum.setFromProjectionMatrix(
  new THREE.Matrix4().multiplyMatrices(
    camera.projectionMatrix,
    camera.matrixWorldInverse
  )
);

// Only render visible particles
particles.forEach(particle => {
  if (frustum.containsPoint(particle.position)) {
    // Render particle
    updateParticleInstance(particle);
  }
});
```

## Implementation Details

### Particle Update Method

```typescript
/**
 * Update the particle
 */
public update(deltaTime: number): void {
  // Update age
  this.age += deltaTime;
  
  // Update position based on velocity
  this.position.add(
    new Vector3(
      this.velocity.x * deltaTime,
      this.velocity.y * deltaTime,
      this.velocity.z * deltaTime
    )
  );
  
  // Update velocity based on acceleration
  this.velocity.add(
    new Vector3(
      this.acceleration.x * deltaTime,
      this.acceleration.y * deltaTime,
      this.acceleration.z * deltaTime
    )
  );
  
  // Reset acceleration
  this.acceleration.x = 0;
  this.acceleration.y = 0;
  this.acceleration.z = 0;
  
  // Check if particle should be destroyed
  if (this.energy <= 0 || this.age >= this.maxAge) {
    this.active = false;
  }
}
```

### Particle Service Update Method

```typescript
/**
 * Update all particles
 */
public updateAllParticles(deltaTime: number): void {
  const particles = this.getAllParticles();
  for (const particle of particles) {
    // Skip inactive particles
    if (!particle.active) continue;
    
    // Update particle
    this.updateParticle(particle, deltaTime);
    
    // Check if particle is now inactive
    if (!particle.active) {
      this.destroyParticle(particle);
    }
  }
}
```

### Physics Service Update Method

```typescript
/**
 * Update physics
 */
public update(deltaTime: number): void {
  if (!this.physicsEngine) {
    return;
  }

  // Get all particles
  const particles = this.particleService.getAllParticles();

  // Calculate forces
  this.physicsEngine.calculateForces(particles, this.forceRules, this.forceFields);

  // Apply force fields
  this.physicsEngine.applyForceFields(particles, this.forceFields);

  // Handle collisions
  this.physicsEngine.handleCollisions(particles);

  // Update physics engine
  this.physicsEngine.update(deltaTime);
}
```

## Related Documents

- [Particle System](01_particle_system.md) - Overview of the particle system
- [Particle Types](02_particle_types.md) - Details on particle types and roles
- [Physics Engine](../physics/01_physics_engine.md) - Details on the physics engine
- [Force Field System](../physics/03_force_field_system.md) - Details on force field interactions
- [Memory and Worker Systems](../core/04_memory_worker_systems.md) - Details on memory management
- [Performance Optimization](../core/05_performance_optimization.md) - Details on performance optimization
