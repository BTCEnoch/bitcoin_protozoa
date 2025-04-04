/**
 * Physics Domain Types
 *
 * @description Type definitions for the physics domain
 */

import { Vector3 } from 'three';
import { Particle, ParticleRole } from '../particle/types';

/**
 * Force Field Type Enum
 * Defines the different types of force fields
 */
export enum ForceFieldType {
  SPHERICAL = 'SPHERICAL',
  CYLINDRICAL = 'CYLINDRICAL',
  PLANAR = 'PLANAR',
  TOROIDAL = 'TOROIDAL',
  VORTEX = 'VORTEX'
}

/**
 * Force Field Interface
 * Defines the properties of a force field in the system
 */
export interface ForceField {
  id: string;
  type: ForceFieldType;
  role: ParticleRole;
  center: Vector3;
  radius: number;
  strength: number;
  rotation: Vector3;
  influencedRoles: ParticleRole[];

  // Methods
  influencesRole(role: ParticleRole): boolean;
  getForceAt(position: Vector3, role: ParticleRole): Vector3;
}

/**
 * Spatial Grid Interface
 * Defines the properties of a spatial grid for efficient collision detection
 */
export interface SpatialGrid {
  cellSize: number;
  cells: Map<string, Particle[]>;

  // Methods
  getCellKey(position: Vector3): string;
  addParticle(particle: Particle): void;
  getNeighbors(position: Vector3, radius: number): Particle[];
  update(particles: Particle[]): void;
}

/**
 * Physics Configuration
 */
export interface PhysicsConfig {
  // Configuration options for physics
  timeStep: number;
  iterations: number;
  damping: number;
  collisionElasticity: number;
  forceFieldStrength: number;
  viscosity: number;
  cutoffDistance: number;
  collisionRadius: number;
  spatialGridCellSize: number;
  useVerletIntegration: boolean;
  useGPUAcceleration: boolean;
  useWebWorkers: boolean;
}

/**
 * Physics State
 */
export interface PhysicsState {
  // State properties for physics
  forceFields: ForceField[];
  spatialGrid: SpatialGrid;
  timeScale: number;
  isPaused: boolean;
  collisionCount: number;
  totalForce: number;
}

/**
 * Role Force Modifiers
 * Defines how different roles modify force calculations
 */
export interface RoleForceModifiers {
  [role: string]: number;
}

/**
 * Force Calculation Result
 * Result of a force calculation between particles
 */
export interface ForceCalculationResult {
  fx: number;
  fy: number;
  fz: number;
  collisionCount: number;
}

/**
 * Boundary Condition Type
 * Defines how particles interact with world boundaries
 */
export enum BoundaryConditionType {
  WRAP = 'WRAP',
  BOUNCE = 'BOUNCE',
  DESTROY = 'DESTROY'
}

/**
 * World Bounds
 * Defines the boundaries of the simulation world
 */
export interface WorldBounds {
  minX: number;
  maxX: number;
  minY: number;
  maxY: number;
  minZ: number;
  maxZ: number;
  boundaryCondition: BoundaryConditionType;
}
