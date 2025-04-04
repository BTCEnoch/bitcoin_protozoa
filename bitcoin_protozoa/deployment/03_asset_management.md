# Asset Management

This document outlines the asset management strategy for the Bitcoin Protozoa project, focusing on how to organize, load, and manage assets for optimal performance and compatibility with Bitcoin Ordinals inscription.

## Table of Contents

1. [Asset Management Philosophy](#asset-management-philosophy) [Line 20]
2. [Type Definitions](#type-definitions) [Line 30]
   - [Core Types](#core-types) [Line 35]
   - [Particle Types](#particle-types) [Line 107]
   - [Physics Types](#physics-types) [Line 184]
   - [RNG Types](#rng-types) [Line 231]
3. [Asset Organization](#asset-organization) [Line 257]
4. [Class Implementations](#class-implementations) [Line 295]
   - [Core Classes](#core-classes) [Line 305]
   - [Particle Classes](#particle-classes) [Line 519]
   - [Physics Classes](#physics-classes) [Line 650]
5. [Service Implementations](#service-implementations) [Line 865]
   - [Core Services](#core-services) [Line 875]
   - [Particle Services](#particle-services) [Line 1024]
   - [Physics Services](#physics-services) [Line 1202]
   - [Bitcoin Services](#bitcoin-services) [Line 1335]
6. [Related Documents](#related-documents) [Line 1477]

## Asset Management Philosophy

The asset management strategy for Bitcoin Protozoa follows these core principles:

1. **Pre-defined Types**: All types are pre-defined and documented before implementation
2. **Immutable Resources**: Assets are designed to be immutable for Bitcoin Ordinals inscription
3. **Minimal Dependencies**: External dependencies are minimized and carefully managed
4. **Optimized Loading**: Assets are loaded efficiently to minimize initial load time
5. **Versioned Assets**: Assets are versioned to ensure compatibility

The goal is to create a clean, maintainable codebase that can be efficiently inscribed on Bitcoin while providing optimal performance and user experience.

## Type Definitions

All types are pre-defined to ensure consistency and type safety throughout the application. These type definitions serve as the foundation for the entire codebase.

### Core Types

```typescript
// src/types/core.ts

/**
 * Entity interface - base for all entities in the system
 */
export interface Entity {
  id: string;
  type: string;
  created: number;
  updated: number;
}

/**
 * Vector3 interface - represents a 3D vector
 */
export interface Vector3 {
  x: number;
  y: number;
  z: number;
}

/**
 * Color interface - represents an RGB color
 */
export interface Color {
  r: number;
  g: number;
  b: number;
}

/**
 * BlockInfo interface - represents Bitcoin block information
 * Only includes blockNumber (for reference), nonce, and confirmations
 */
export interface BlockInfo {
  blockNumber: number; // Only used for reference/lookup
  nonce: number;       // Used for RNG seed
  confirmations: number; // Used for evolution triggers
}

/**
 * Identifiable interface - base for objects with IDs
 */
export interface Identifiable {
  id: string;
}

/**
 * Named interface - base for objects with names
 */
export interface Named {
  name: string;
}

/**
 * Updateable interface - base for objects that can be updated
 */
export interface Updateable {
  update(deltaTime: number): void;
}

/**
 * Disposable interface - base for objects that need cleanup
 */
export interface Disposable {
  dispose(): void;
}
```

### Particle Types

```typescript
// src/types/particle.ts
import { Entity, Vector3, Color } from './core';

/**
 * Particle roles enum
 */
export enum ParticleRole {
  CORE = 'core',
  CONTROL = 'control',
  MOVEMENT = 'movement',
  DEFENSE = 'defense',
  ATTACK = 'attack'
}

/**
 * Particle interface - represents a single particle
 */
export interface Particle extends Entity {
  position: Vector3;
  velocity: Vector3;
  acceleration: Vector3;
  mass: number;
  radius: number;
  color: Color;
  role: ParticleRole;
  groupId: string;
  active: boolean;
}

/**
 * Particle group interface - represents a group of particles
 */
export interface ParticleGroup extends Entity {
  role: ParticleRole;
  count: number;
  color: Color;
  scale: number;
  center: Vector3;
  particles: string[]; // Array of particle IDs
}

/**
 * Particle system interface - represents the entire particle system
 */
export interface ParticleSystem extends Entity {
  particles: Particle[];
  groups: ParticleGroup[];
  forceRules: ForceRuleMatrix;
  forceFields: ForceField[];
}

/**
 * Force rule matrix - defines attraction/repulsion between particle groups
 */
export interface ForceRuleMatrix {
  [sourceGroupId: string]: {
    [targetGroupId: string]: number;
  };
}

/**
 * Force field interface - represents a force field
 */
export interface ForceField extends Entity {
  center: Vector3;
  radius: number;
  strength: number;
  role: ParticleRole;
  vertices: Vector3[];
  rotation: Vector3;
}
```

### Physics Types

```typescript
// src/types/physics.ts
import { Entity, Vector3 } from './core';
import { Particle, ForceField, ForceRuleMatrix } from './particle';

/**
 * Physics engine interface - handles physics calculations
 */
export interface PhysicsEngine extends Entity {
  cutoffDistance: number;
  timeScale: number;
  viscosity: number;
  collisionRadius: number;

  calculateForces(
    particles: Particle[],
    forceRules: ForceRuleMatrix,
    forceFields: ForceField[]
  ): void;

  applyForceFields(
    particles: Particle[],
    forceFields: ForceField[]
  ): void;

  handleCollisions(
    particles: Particle[]
  ): void;

  update(deltaTime: number): void;
}

/**
 * Spatial grid interface - for efficient spatial partitioning
 */
export interface SpatialGrid {
  cellSize: number;

  addParticle(particle: Particle): void;
  getNeighbors(position: Vector3, radius: number): Particle[];
  update(particles: Particle[]): void;
  clear(): void;
}
```

### RNG Types

```typescript
// src/types/rng.ts

/**
 * RNG function type - represents a random number generator function
 */
export type RNGFunction = () => number;

/**
 * RNG stream type - represents a named RNG stream
 */
export interface RNGStream {
  name: string;
  rng: RNGFunction;
}

/**
 * RNG system interface - manages multiple RNG streams
 */
export interface RNGSystem {
  getStream(name: string): RNGFunction;
  createStream(name: string, seed: number): RNGFunction;
  removeStream(name: string): void;
}
```

## Asset Organization

Assets are organized into logical domains to ensure clean separation of concerns and maintainability:

### Domain-Based Organization

```
src/
├── domains/         # Domain-specific code
├── services/        # Service layer
├── utils/           # Utility functions
├── factories/       # Factory functions
├── types/           # Type definitions
├── constants/       # Constant values
├── hooks/           # React hooks
├── components/      # React components
└── workers/         # Web workers
```

### Asset Sets

Assets are grouped into logical sets:

1. **Type Definitions**: Interfaces, types, and enums
2. **Class Implementations**: Concrete implementations of interfaces
3. **Utility Functions**: Helper functions and utilities
4. **Factory Functions**: Functions for creating instances
5. **Service Implementations**: Service layer implementations
6. **Component Implementations**: React component implementations
7. **Worker Implementations**: Web worker implementations

## Class Implementations

The class implementation strategy for Bitcoin Protozoa follows these core principles:

1. **Interface-First**: All classes implement pre-defined interfaces
2. **Minimal Dependencies**: Classes have minimal dependencies on other classes
3. **Immutable Properties**: Properties are immutable where possible
4. **Memory Efficiency**: Classes are designed for memory efficiency
5. **Performance Optimization**: Classes are optimized for performance

### Core Classes

#### Entity Class

The base class for all entities in the system:

```typescript
// src/domains/core/Entity.ts
import { Entity as IEntity } from '../../types/core';

/**
 * Base entity class
 */
export class Entity implements IEntity {
  public readonly id: string;
  public readonly type: string;
  public readonly created: number;
  public updated: number;

  constructor(id: string, type: string) {
    this.id = id;
    this.type = type;
    this.created = Date.now();
    this.updated = this.created;
  }

  /**
   * Update the entity
   */
  public update(): void {
    this.updated = Date.now();
  }

  /**
   * Create a JSON representation of the entity
   */
  public toJSON(): object {
    return {
      id: this.id,
      type: this.type,
      created: this.created,
      updated: this.updated
    };
  }

  /**
   * Create an entity from a JSON object
   */
  public static fromJSON(json: any): Entity {
    const entity = new Entity(json.id, json.type);
    entity.updated = json.updated;
    return entity;
  }
}
```

#### Vector3 Class

A class for 3D vector operations:

```typescript
// src/domains/core/Vector3.ts
import { Vector3 as IVector3 } from '../../types/core';

/**
 * 3D vector class
 */
export class Vector3 implements IVector3 {
  public x: number;
  public y: number;
  public z: number;

  constructor(x: number = 0, y: number = 0, z: number = 0) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  /**
   * Create a copy of this vector
   */
  public clone(): Vector3 {
    return new Vector3(this.x, this.y, this.z);
  }

  /**
   * Calculate the length of this vector
   */
  public length(): number {
    return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
  }

  /**
   * Calculate the squared length of this vector
   */
  public lengthSquared(): number {
    return this.x * this.x + this.y * this.y + this.z * this.z;
  }

  /**
   * Normalize this vector
   */
  public normalize(): Vector3 {
    const length = this.length();
    if (length > 0) {
      this.x /= length;
      this.y /= length;
      this.z /= length;
    }
    return this;
  }

  /**
   * Add another vector to this vector
   */
  public add(v: Vector3): Vector3 {
    this.x += v.x;
    this.y += v.y;
    this.z += v.z;
    return this;
  }

  /**
   * Subtract another vector from this vector
   */
  public subtract(v: Vector3): Vector3 {
    this.x -= v.x;
    this.y -= v.y;
    this.z -= v.z;
    return this;
  }

  /**
   * Multiply this vector by a scalar
   */
  public multiplyScalar(s: number): Vector3 {
    this.x *= s;
    this.y *= s;
    this.z *= s;
    return this;
  }

  /**
   * Divide this vector by a scalar
   */
  public divideScalar(s: number): Vector3 {
    if (s !== 0) {
      this.x /= s;
      this.y /= s;
      this.z /= s;
    }
    return this;
  }

  /**
   * Calculate the dot product with another vector
   */
  public dot(v: Vector3): number {
    return this.x * v.x + this.y * v.y + this.z * v.z;
  }

  /**
   * Calculate the cross product with another vector
   */
  public cross(v: Vector3): Vector3 {
    const x = this.y * v.z - this.z * v.y;
    const y = this.z * v.x - this.x * v.z;
    const z = this.x * v.y - this.y * v.x;
    this.x = x;
    this.y = y;
    this.z = z;
    return this;
  }

  /**
   * Calculate the distance to another vector
   */
  public distanceTo(v: Vector3): number {
    const dx = this.x - v.x;
    const dy = this.y - v.y;
    const dz = this.z - v.z;
    return Math.sqrt(dx * dx + dy * dy + dz * dz);
  }

  /**
   * Calculate the squared distance to another vector
   */
  public distanceToSquared(v: Vector3): number {
    const dx = this.x - v.x;
    const dy = this.y - v.y;
    const dz = this.z - v.z;
    return dx * dx + dy * dy + dz * dz;
  }

  /**
   * Create a JSON representation of this vector
   */
  public toJSON(): object {
    return {
      x: this.x,
      y: this.y,
      z: this.z
    };
  }

  /**
   * Create a vector from a JSON object
   */
  public static fromJSON(json: any): Vector3 {
    return new Vector3(json.x, json.y, json.z);
  }
}
```

### Particle Classes

#### Particle Class

A class representing a single particle:

```typescript
// src/domains/particle/Particle.ts
import { Entity } from '../core/Entity';
import { Vector3 } from '../core/Vector3';
import { Particle as IParticle, ParticleRole } from '../../types/particle';
import { Color } from '../../types/core';

/**
 * Particle class
 */
export class Particle extends Entity implements IParticle {
  public position: Vector3;
  public velocity: Vector3;
  public acceleration: Vector3;
  public mass: number;
  public radius: number;
  public color: Color;
  public role: ParticleRole;
  public groupId: string;
  public active: boolean;

  constructor(
    id: string,
    position: Vector3,
    velocity: Vector3,
    mass: number,
    radius: number,
    color: Color,
    role: ParticleRole,
    groupId: string
  ) {
    super(id, 'particle');
    this.position = position;
    this.velocity = velocity;
    this.acceleration = new Vector3();
    this.mass = mass;
    this.radius = radius;
    this.color = color;
    this.role = role;
    this.groupId = groupId;
    this.active = true;
  }

  /**
   * Update the particle
   */
  public update(deltaTime: number): void {
    super.update();

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
  }

  /**
   * Apply a force to the particle
   */
  public applyForce(force: Vector3): void {
    // F = ma, so a = F/m
    this.acceleration.add(
      new Vector3(
        force.x / this.mass,
        force.y / this.mass,
        force.z / this.mass
      )
    );
  }

  /**
   * Create a JSON representation of the particle
   */
  public toJSON(): object {
    return {
      ...super.toJSON(),
      position: this.position.toJSON(),
      velocity: this.velocity.toJSON(),
      acceleration: this.acceleration.toJSON(),
      mass: this.mass,
      radius: this.radius,
      color: this.color,
      role: this.role,
      groupId: this.groupId,
      active: this.active
    };
  }

  /**
   * Create a particle from a JSON object
   */
  public static fromJSON(json: any): Particle {
    const particle = new Particle(
      json.id,
      Vector3.fromJSON(json.position),
      Vector3.fromJSON(json.velocity),
      json.mass,
      json.radius,
      json.color,
      json.role,
      json.groupId
    );
    particle.active = json.active;
    return particle;
  }
}
```

### Physics Classes

#### PhysicsEngine Class

A class for handling physics calculations:

```typescript
// src/domains/physics/PhysicsEngine.ts
import { Entity } from '../core/Entity';
import { Vector3 } from '../core/Vector3';
import { PhysicsEngine as IPhysicsEngine } from '../../types/physics';
import { Particle, ForceField, ForceRuleMatrix } from '../../types/particle';

/**
 * Physics engine class
 */
export class PhysicsEngine extends Entity implements IPhysicsEngine {
  public cutoffDistance: number;
  public timeScale: number;
  public viscosity: number;
  public collisionRadius: number;

  constructor(
    id: string,
    cutoffDistance: number,
    timeScale: number,
    viscosity: number,
    collisionRadius: number
  ) {
    super(id, 'physics-engine');
    this.cutoffDistance = cutoffDistance;
    this.timeScale = timeScale;
    this.viscosity = viscosity;
    this.collisionRadius = collisionRadius;
  }

  /**
   * Calculate forces between particles
   */
  public calculateForces(
    particles: Particle[],
    forceRules: ForceRuleMatrix,
    forceFields: ForceField[]
  ): void {
    // For each particle
    for (let i = 0; i < particles.length; i++) {
      const a = particles[i];

      // Skip inactive particles
      if (!a.active) continue;

      // Calculate forces from other particles
      for (let j = 0; j < particles.length; j++) {
        // Skip self
        if (i === j) continue;

        const b = particles[j];

        // Skip inactive particles
        if (!b.active) continue;

        // Get force rule between particle groups
        const forceRule = forceRules[a.groupId][b.groupId];

        // Calculate distance vector
        const dx = a.position.x - b.position.x;
        const dy = a.position.y - b.position.y;
        const dz = a.position.z - b.position.z;

        // Calculate squared distance
        const distanceSquared = dx * dx + dy * dy + dz * dz;

        // Skip if beyond cutoff distance
        if (distanceSquared > this.cutoffDistance * this.cutoffDistance) continue;

        // Calculate force magnitude
        const distance = Math.sqrt(distanceSquared);
        const forceMagnitude = forceRule / distance;

        // Apply force
        a.applyForce(
          new Vector3(
            dx * forceMagnitude,
            dy * forceMagnitude,
            dz * forceMagnitude
          )
        );
      }
    }
  }

  /**
   * Apply force fields to particles
   */
  public applyForceFields(
    particles: Particle[],
    forceFields: ForceField[]
  ): void {
    // For each particle
    for (const particle of particles) {
      // Skip inactive particles
      if (!particle.active) continue;

      // For each force field
      for (const field of forceFields) {
        // Calculate distance to field center
        const distance = particle.position.distanceTo(field.center);

        // Skip if beyond field radius
        if (distance > field.radius) continue;

        // Calculate force direction
        const direction = new Vector3(
          field.center.x - particle.position.x,
          field.center.y - particle.position.y,
          field.center.z - particle.position.z
        ).normalize();

        // Calculate force magnitude
        const forceMagnitude = field.strength * (1 - distance / field.radius);

        // Apply force
        particle.applyForce(
          new Vector3(
            direction.x * forceMagnitude,
            direction.y * forceMagnitude,
            direction.z * forceMagnitude
          )
        );
      }
    }
  }

  /**
   * Handle collisions between particles
   */
  public handleCollisions(
    particles: Particle[]
  ): void {
    // For each particle
    for (let i = 0; i < particles.length; i++) {
      const a = particles[i];

      // Skip inactive particles
      if (!a.active) continue;

      // Check collisions with other particles
      for (let j = i + 1; j < particles.length; j++) {
        const b = particles[j];

        // Skip inactive particles
        if (!b.active) continue;

        // Calculate distance vector
        const dx = a.position.x - b.position.x;
        const dy = a.position.y - b.position.y;
        const dz = a.position.z - b.position.z;

        // Calculate squared distance
        const distanceSquared = dx * dx + dy * dy + dz * dz;

        // Check for collision
        const minDistance = a.radius + b.radius;
        if (distanceSquared < minDistance * minDistance) {
          // Calculate collision response
          const distance = Math.sqrt(distanceSquared);
          const overlap = minDistance - distance;

          // Calculate collision normal
          const nx = dx / distance;
          const ny = dy / distance;
          const nz = dz / distance;

          // Calculate collision force
          const forceMagnitude = overlap * this.collisionRadius;

          // Apply collision force
          a.applyForce(
            new Vector3(
              nx * forceMagnitude,
              ny * forceMagnitude,
              nz * forceMagnitude
            )
          );

          b.applyForce(
            new Vector3(
              -nx * forceMagnitude,
              -ny * forceMagnitude,
              -nz * forceMagnitude
            )
          );
        }
      }
    }
  }

  /**
   * Update the physics engine
   */
  public update(deltaTime: number): void {
    super.update();

    // Apply time scale
    const scaledDeltaTime = deltaTime * this.timeScale;

    // Apply viscosity
    const viscosityFactor = 1 - this.viscosity;

    // Update particles
    // Note: This would be done in the particle system, not here
  }
}
```

## Service Implementations

The service implementation strategy for Bitcoin Protozoa follows these core principles:

1. **Singleton Pattern**: Services are implemented as singletons
2. **Dependency Injection**: Services receive dependencies through constructors
3. **Event-Based Communication**: Services communicate through events
4. **Lazy Initialization**: Services are initialized on first use
5. **Clean Separation**: Services have clear responsibilities

### Core Services

#### EntityService

A service for managing entities:

```typescript
// src/services/entityService.ts
import { Entity } from '../domains/core/Entity';

/**
 * Entity service
 */
export class EntityService {
  private static instance: EntityService;
  private entities: Map<string, Entity> = new Map();

  private constructor() {
    // Private constructor for singleton pattern
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): EntityService {
    if (!EntityService.instance) {
      EntityService.instance = new EntityService();
    }
    return EntityService.instance;
  }

  /**
   * Register an entity
   */
  public registerEntity(entity: Entity): void {
    this.entities.set(entity.id, entity);
  }

  /**
   * Unregister an entity
   */
  public unregisterEntity(id: string): void {
    this.entities.delete(id);
  }

  /**
   * Get an entity by ID
   */
  public getEntity(id: string): Entity | undefined {
    return this.entities.get(id);
  }

  /**
   * Get all entities
   */
  public getAllEntities(): Entity[] {
    return Array.from(this.entities.values());
  }

  /**
   * Get entities by type
   */
  public getEntitiesByType(type: string): Entity[] {
    return Array.from(this.entities.values()).filter(entity => entity.type === type);
  }

  /**
   * Clear all entities
   */
  public clearEntities(): void {
    this.entities.clear();
  }
}
```

#### EventService

A service for event-based communication:

```typescript
// src/services/eventService.ts

/**
 * Event service
 */
export class EventService {
  private static instance: EventService;
  private listeners: Map<string, Function[]> = new Map();

  private constructor() {
    // Private constructor for singleton pattern
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): EventService {
    if (!EventService.instance) {
      EventService.instance = new EventService();
    }
    return EventService.instance;
  }

  /**
   * Add an event listener
   */
  public on(event: string, listener: Function): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, []);
    }
    this.listeners.get(event)!.push(listener);
  }

  /**
   * Remove an event listener
   */
  public off(event: string, listener: Function): void {
    if (!this.listeners.has(event)) {
      return;
    }
    const listeners = this.listeners.get(event)!;
    const index = listeners.indexOf(listener);
    if (index !== -1) {
      listeners.splice(index, 1);
    }
  }

  /**
   * Emit an event
   */
  public emit(event: string, ...args: any[]): void {
    if (!this.listeners.has(event)) {
      return;
    }
    const listeners = this.listeners.get(event)!;
    for (const listener of listeners) {
      listener(...args);
    }
  }

  /**
   * Clear all listeners
   */
  public clearListeners(): void {
    this.listeners.clear();
  }
}
```

### Particle Services

#### ParticleService

A service for managing particles:

```typescript
// src/services/particleService.ts
import { EntityService } from './entityService';
import { EventService } from './eventService';
import { Particle } from '../domains/particle/Particle';
import { ParticleGroup } from '../domains/particle/ParticleGroup';
import { Vector3 } from '../domains/core/Vector3';
import { ParticleRole } from '../types/particle';
import { Color } from '../types/core';

/**
 * Particle service
 */
export class ParticleService {
  private static instance: ParticleService;
  private entityService: EntityService;
  private eventService: EventService;

  private constructor() {
    // Private constructor for singleton pattern
    this.entityService = EntityService.getInstance();
    this.eventService = EventService.getInstance();
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): ParticleService {
    if (!ParticleService.instance) {
      ParticleService.instance = new ParticleService();
    }
    return ParticleService.instance;
  }

  /**
   * Create a particle
   */
  public createParticle(
    position: Vector3,
    velocity: Vector3,
    mass: number,
    radius: number,
    color: Color,
    role: ParticleRole,
    groupId: string
  ): Particle {
    // Generate a unique ID
    const id = `particle-${Date.now()}-${Math.floor(Math.random() * 1000000)}`;

    // Create the particle
    const particle = new Particle(
      id,
      position,
      velocity,
      mass,
      radius,
      color,
      role,
      groupId
    );

    // Register the particle
    this.entityService.registerEntity(particle);

    // Emit an event
    this.eventService.emit('particle:created', particle);

    return particle;
  }

  /**
   * Create a particle group
   */
  public createParticleGroup(
    role: ParticleRole,
    count: number,
    color: Color,
    scale: number,
    center: Vector3
  ): ParticleGroup {
    // Generate a unique ID
    const id = `group-${Date.now()}-${Math.floor(Math.random() * 1000000)}`;

    // Create the group
    const group = new ParticleGroup(
      id,
      role,
      count,
      color,
      scale,
      center
    );

    // Register the group
    this.entityService.registerEntity(group);

    // Emit an event
    this.eventService.emit('group:created', group);

    return group;
  }

  /**
   * Get all particles
   */
  public getAllParticles(): Particle[] {
    return this.entityService.getEntitiesByType('particle') as Particle[];
  }

  /**
   * Get all particle groups
   */
  public getAllParticleGroups(): ParticleGroup[] {
    return this.entityService.getEntitiesByType('particle-group') as ParticleGroup[];
  }

  /**
   * Get particles by group
   */
  public getParticlesByGroup(groupId: string): Particle[] {
    return this.getAllParticles().filter(particle => particle.groupId === groupId);
  }

  /**
   * Update a particle
   */
  public updateParticle(particle: Particle, deltaTime: number): void {
    particle.update(deltaTime);
    this.eventService.emit('particle:updated', particle);
  }

  /**
   * Update all particles
   */
  public updateAllParticles(deltaTime: number): void {
    const particles = this.getAllParticles();
    for (const particle of particles) {
      this.updateParticle(particle, deltaTime);
    }
  }

  /**
   * Remove a particle
   */
  public removeParticle(id: string): void {
    const particle = this.entityService.getEntity(id) as Particle;
    if (particle) {
      this.entityService.unregisterEntity(id);
      this.eventService.emit('particle:removed', particle);
    }
  }

  /**
   * Remove a particle group
   */
  public removeParticleGroup(id: string): void {
    const group = this.entityService.getEntity(id) as ParticleGroup;
    if (group) {
      // Remove all particles in the group
      const particles = this.getParticlesByGroup(id);
      for (const particle of particles) {
        this.removeParticle(particle.id);
      }

      // Remove the group
      this.entityService.unregisterEntity(id);
      this.eventService.emit('group:removed', group);
    }
  }
}
```

### Physics Services

#### PhysicsService

A service for physics calculations:

```typescript
// src/services/physicsService.ts
import { EntityService } from './entityService';
import { EventService } from './eventService';
import { ParticleService } from './particleService';
import { PhysicsEngine } from '../domains/physics/PhysicsEngine';
import { ForceField } from '../domains/physics/ForceField';
import { ForceRuleMatrix } from '../types/particle';

/**
 * Physics service
 */
export class PhysicsService {
  private static instance: PhysicsService;
  private entityService: EntityService;
  private eventService: EventService;
  private particleService: ParticleService;
  private physicsEngine: PhysicsEngine | null = null;
  private forceFields: ForceField[] = [];
  private forceRules: ForceRuleMatrix = {};

  private constructor() {
    // Private constructor for singleton pattern
    this.entityService = EntityService.getInstance();
    this.eventService = EventService.getInstance();
    this.particleService = ParticleService.getInstance();
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): PhysicsService {
    if (!PhysicsService.instance) {
      PhysicsService.instance = new PhysicsService();
    }
    return PhysicsService.instance;
  }

  /**
   * Initialize the physics engine
   */
  public initializePhysicsEngine(
    cutoffDistance: number,
    timeScale: number,
    viscosity: number,
    collisionRadius: number
  ): PhysicsEngine {
    // Generate a unique ID
    const id = `physics-engine-${Date.now()}`;

    // Create the physics engine
    this.physicsEngine = new PhysicsEngine(
      id,
      cutoffDistance,
      timeScale,
      viscosity,
      collisionRadius
    );

    // Register the physics engine
    this.entityService.registerEntity(this.physicsEngine);

    // Emit an event
    this.eventService.emit('physics:initialized', this.physicsEngine);

    return this.physicsEngine;
  }

  /**
   * Set force rules
   */
  public setForceRules(forceRules: ForceRuleMatrix): void {
    this.forceRules = forceRules;
    this.eventService.emit('physics:forceRulesUpdated', forceRules);
  }

  /**
   * Add a force field
   */
  public addForceField(forceField: ForceField): void {
    this.forceFields.push(forceField);
    this.entityService.registerEntity(forceField);
    this.eventService.emit('physics:forceFieldAdded', forceField);
  }

  /**
   * Remove a force field
   */
  public removeForceField(id: string): void {
    const index = this.forceFields.findIndex(field => field.id === id);
    if (index !== -1) {
      const forceField = this.forceFields[index];
      this.forceFields.splice(index, 1);
      this.entityService.unregisterEntity(id);
      this.eventService.emit('physics:forceFieldRemoved', forceField);
    }
  }

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

    // Emit an event
    this.eventService.emit('physics:updated', deltaTime);
  }
}
```

### Bitcoin Services

#### BitcoinService

A service for Bitcoin integration:

```typescript
// src/services/bitcoinService.ts
import { EventService } from './eventService';
import { BlockInfo } from '../types/core';

/**
 * Bitcoin service
 */
export class BitcoinService {
  private static instance: BitcoinService;
  private eventService: EventService;
  private blockCache: Map<number, BlockInfo> = new Map();
  private currentBlockHeight: number = 0;

  private constructor() {
    // Private constructor for singleton pattern
    this.eventService = EventService.getInstance();
  }

  /**
   * Get the singleton instance
   */
  public static getInstance(): BitcoinService {
    if (!BitcoinService.instance) {
      BitcoinService.instance = new BitcoinService();
    }
    return BitcoinService.instance;
  }

  /**
   * Fetch block info
   */
  public async fetchBlockInfo(blockNumber: number): Promise<BlockInfo> {
    // Check cache
    if (this.blockCache.has(blockNumber)) {
      return this.blockCache.get(blockNumber)!;
    }

    // Fetch from API - ONLY use ordinals.com API, no fallbacks
    try {
      // Use appropriate endpoint based on environment
      const endpoint = process.env.NODE_ENV === 'development'
        ? `https://ordinals.com/r/blockinfo/${blockNumber}`
        : `/r/blockinfo/${blockNumber}`;

      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const data = await response.json();

      // Create block info - ONLY use nonce and confirmations
      const blockInfo: BlockInfo = {
        blockNumber: blockNumber, // We already know this from the input
        nonce: data.nonce,
        confirmations: data.confirmations
      };

      // Cache the result
      this.blockCache.set(blockNumber, blockInfo);

      // Emit an event
      this.eventService.emit('bitcoin:blockFetched', blockInfo);

      return blockInfo;
    } catch (error) {
      // No fallback - if the API fails, we fail
      console.error(`Failed to fetch block ${blockNumber}:`, error);
      throw new Error(`Failed to fetch block ${blockNumber}: ${error.message}`);
    }
  }

  /**
   * Get current block height
   */
  public async getCurrentBlockHeight(): Promise<number> {
    try {
      // Use appropriate endpoint based on environment
      // ONLY use ordinals.com API, no fallbacks
      const endpoint = process.env.NODE_ENV === 'development'
        ? 'https://ordinals.com/r/blockinfo/0'
        : '/r/blockinfo/0';

      // We'll use block 0 and then check the confirmations to determine current height
      const response = await fetch(endpoint);

      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }

      const data = await response.json();
      this.currentBlockHeight = data.confirmations - 1; // Block 0 confirmations minus 1 gives current height

      // Emit an event
      this.eventService.emit('bitcoin:heightUpdated', this.currentBlockHeight);

      return this.currentBlockHeight;
    } catch (error) {
      // No fallback - if the API fails, we fail
      console.error('Failed to fetch current block height:', error);
      throw new Error(`Failed to fetch current block height: ${error.message}`);
    }
  }

  /**
   * Get confirmations for a block
   */
  public async getConfirmations(blockNumber: number): Promise<number> {
    try {
      const currentHeight = await this.getCurrentBlockHeight();
      const confirmations = currentHeight - blockNumber + 1;

      // Emit an event
      this.eventService.emit('bitcoin:confirmationsUpdated', {
        blockNumber,
        confirmations
      });

      return confirmations;
    } catch (error) {
      console.error(`Failed to calculate confirmations for block ${blockNumber}:`, error);
      throw new Error(`Failed to calculate confirmations: ${error.message}`);
    }
  }

  /**
   * Clear cache
   */
  public clearCache(): void {
    this.blockCache.clear();
  }
}
```

## Related Documents

- [Development Workflow](01_development_workflow.md) - For details on the development process
- [Deployment Pipeline](02_deployment_pipeline.md) - For details on the deployment pipeline
- [Module Structure](../core/03_module_structure.md) - For details on module organization
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Physics Engine](../physics/01_physics_engine.md) - For details on the physics engine
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
