/**
 * Boundary Utilities
 *
 * @description Utility functions for handling world boundaries
 */

import { Particle } from '../../particle/types';
import { BoundaryConditionType, WorldBounds } from '../types';
import { DEFAULT_WORLD_BOUNDS } from '../constants';

/**
 * Apply boundary conditions to a particle
 * @param particle - Particle to apply boundary conditions to
 * @param bounds - World bounds
 * @returns Whether the particle is still active after boundary check
 */
export const applyBoundaryConditions = (
  particle: Particle,
  bounds: WorldBounds = DEFAULT_WORLD_BOUNDS
): boolean => {
  const { minX, maxX, minY, maxY, minZ, maxZ, boundaryCondition } = bounds;
  let isActive = particle.isActive;

  // Handle boundary conditions based on type
  switch (boundaryCondition) {
    case BoundaryConditionType.WRAP:
      // Wrap around boundaries
      if (particle.position.x < minX) particle.position.x = maxX;
      if (particle.position.x > maxX) particle.position.x = minX;
      if (particle.position.y < minY) particle.position.y = maxY;
      if (particle.position.y > maxY) particle.position.y = minY;
      if (particle.position.z < minZ) particle.position.z = maxZ;
      if (particle.position.z > maxZ) particle.position.z = minZ;
      break;

    case BoundaryConditionType.BOUNCE:
      // Bounce off boundaries
      if (particle.position.x < minX) {
        particle.position.x = minX;
        particle.velocity.x *= -1;
      }
      if (particle.position.x > maxX) {
        particle.position.x = maxX;
        particle.velocity.x *= -1;
      }
      if (particle.position.y < minY) {
        particle.position.y = minY;
        particle.velocity.y *= -1;
      }
      if (particle.position.y > maxY) {
        particle.position.y = maxY;
        particle.velocity.y *= -1;
      }
      if (particle.position.z < minZ) {
        particle.position.z = minZ;
        particle.velocity.z *= -1;
      }
      if (particle.position.z > maxZ) {
        particle.position.z = maxZ;
        particle.velocity.z *= -1;
      }
      break;

    case BoundaryConditionType.DESTROY:
      // Destroy particles that leave the boundaries
      if (particle.position.x < minX || particle.position.x > maxX ||
          particle.position.y < minY || particle.position.y > maxY ||
          particle.position.z < minZ || particle.position.z > maxZ) {
        isActive = false;
      }
      break;
  }

  return isActive;
};

/**
 * Check if a particle is within the world bounds
 * @param particle - Particle to check
 * @param bounds - World bounds
 * @returns Whether the particle is within bounds
 */
export const isWithinBounds = (
  particle: Particle,
  bounds: WorldBounds = DEFAULT_WORLD_BOUNDS
): boolean => {
  const { minX, maxX, minY, maxY, minZ, maxZ } = bounds;

  return (
    particle.position.x >= minX && particle.position.x <= maxX &&
    particle.position.y >= minY && particle.position.y <= maxY &&
    particle.position.z >= minZ && particle.position.z <= maxZ
  );
};

/**
 * Calculate distance to nearest boundary
 * @param particle - Particle to check
 * @param bounds - World bounds
 * @returns Distance to nearest boundary
 */
export const distanceToBoundary = (
  particle: Particle,
  bounds: WorldBounds = DEFAULT_WORLD_BOUNDS
): number => {
  const { minX, maxX, minY, maxY, minZ, maxZ } = bounds;

  // Calculate distance to each boundary
  const distX = Math.min(particle.position.x - minX, maxX - particle.position.x);
  const distY = Math.min(particle.position.y - minY, maxY - particle.position.y);
  const distZ = Math.min(particle.position.z - minZ, maxZ - particle.position.z);

  // Return minimum distance
  return Math.min(distX, distY, distZ);
};

/**
 * Apply containment force to keep particles within bounds
 * @param particle - Particle to apply force to
 * @param bounds - World bounds
 * @param strength - Strength of containment force
 * @returns Force vector to apply
 */
export const calculateContainmentForce = (
  particle: Particle,
  bounds: WorldBounds = DEFAULT_WORLD_BOUNDS,
  strength: number = 1.0
): { fx: number; fy: number; fz: number } => {
  const { minX, maxX, minY, maxY, minZ, maxZ } = bounds;
  const result = { fx: 0, fy: 0, fz: 0 };

  // Calculate distance to each boundary and apply force if close
  const boundaryThreshold = 10; // Distance at which containment force starts

  // X-axis containment
  const distToMinX = particle.position.x - minX;
  const distToMaxX = maxX - particle.position.x;
  if (distToMinX < boundaryThreshold) {
    result.fx += strength * (1.0 - distToMinX / boundaryThreshold);
  }
  if (distToMaxX < boundaryThreshold) {
    result.fx -= strength * (1.0 - distToMaxX / boundaryThreshold);
  }

  // Y-axis containment
  const distToMinY = particle.position.y - minY;
  const distToMaxY = maxY - particle.position.y;
  if (distToMinY < boundaryThreshold) {
    result.fy += strength * (1.0 - distToMinY / boundaryThreshold);
  }
  if (distToMaxY < boundaryThreshold) {
    result.fy -= strength * (1.0 - distToMaxY / boundaryThreshold);
  }

  // Z-axis containment
  const distToMinZ = particle.position.z - minZ;
  const distToMaxZ = maxZ - particle.position.z;
  if (distToMinZ < boundaryThreshold) {
    result.fz += strength * (1.0 - distToMinZ / boundaryThreshold);
  }
  if (distToMaxZ < boundaryThreshold) {
    result.fz -= strength * (1.0 - distToMaxZ / boundaryThreshold);
  }

  return result;
};
