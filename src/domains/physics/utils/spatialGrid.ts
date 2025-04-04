/**
 * Spatial Grid Utilities
 *
 * @description Implementation of the spatial grid for efficient collision detection
 */

import { Vector3 } from 'three';
import { Particle } from '../../particle/types';
import { SpatialGrid } from '../types';
import { PERFORMANCE_PARAMETERS } from '../constants';

/**
 * SpatialGridImpl class
 * Implements the SpatialGrid interface for efficient collision detection
 */
export class SpatialGridImpl implements SpatialGrid {
  public cellSize: number;
  public cells: Map<string, Particle[]>;

  /**
   * Constructor
   * @param cellSize - Size of each cell in the grid
   */
  constructor(cellSize: number = PERFORMANCE_PARAMETERS.spatialGridCellSize) {
    this.cellSize = cellSize;
    this.cells = new Map<string, Particle[]>();
  }

  /**
   * Get cell key for a position
   * @param position - Position to get cell key for
   * @returns Cell key string
   */
  public getCellKey(position: Vector3): string {
    const x = Math.floor(position.x / this.cellSize);
    const y = Math.floor(position.y / this.cellSize);
    const z = Math.floor(position.z / this.cellSize);
    return `${x},${y},${z}`;
  }

  /**
   * Add particle to grid
   * @param particle - Particle to add to grid
   */
  public addParticle(particle: Particle): void {
    const key = this.getCellKey(particle.position);
    if (!this.cells.has(key)) {
      this.cells.set(key, []);
    }
    this.cells.get(key)!.push(particle);
  }

  /**
   * Get neighboring particles
   * @param position - Position to get neighbors for
   * @param radius - Radius to search for neighbors
   * @returns Array of neighboring particles
   */
  public getNeighbors(position: Vector3, radius: number): Particle[] {
    const neighbors: Particle[] = [];
    const cellRadius = Math.ceil(radius / this.cellSize);
    
    // Get center cell
    const centerX = Math.floor(position.x / this.cellSize);
    const centerY = Math.floor(position.y / this.cellSize);
    const centerZ = Math.floor(position.z / this.cellSize);
    
    // Check neighboring cells
    for (let x = centerX - cellRadius; x <= centerX + cellRadius; x++) {
      for (let y = centerY - cellRadius; y <= centerY + cellRadius; y++) {
        for (let z = centerZ - cellRadius; z <= centerZ + cellRadius; z++) {
          const key = `${x},${y},${z}`;
          if (this.cells.has(key)) {
            neighbors.push(...this.cells.get(key)!);
          }
        }
      }
    }
    
    return neighbors;
  }

  /**
   * Update grid with new particle positions
   * @param particles - Array of particles to update grid with
   */
  public update(particles: Particle[]): void {
    this.cells.clear();
    for (const particle of particles) {
      if (particle.isActive) {
        this.addParticle(particle);
      }
    }
  }

  /**
   * Get all particles in the grid
   * @returns Array of all particles in the grid
   */
  public getAllParticles(): Particle[] {
    const allParticles: Particle[] = [];
    for (const particles of this.cells.values()) {
      allParticles.push(...particles);
    }
    return allParticles;
  }

  /**
   * Get number of cells in the grid
   * @returns Number of cells in the grid
   */
  public getCellCount(): number {
    return this.cells.size;
  }

  /**
   * Get number of particles in the grid
   * @returns Number of particles in the grid
   */
  public getParticleCount(): number {
    let count = 0;
    for (const particles of this.cells.values()) {
      count += particles.length;
    }
    return count;
  }
}

/**
 * Create a new spatial grid
 * @param cellSize - Size of each cell in the grid
 * @returns New spatial grid instance
 */
export const createSpatialGrid = (cellSize?: number): SpatialGrid => {
  return new SpatialGridImpl(cellSize);
};
