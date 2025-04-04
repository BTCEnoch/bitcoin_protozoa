/**
 * Vector utility functions for 3D mathematics
 */

/**
 * Calculate the distance between two 3D points
 */
export const distance = (x1: number, y1: number, z1: number, x2: number, y2: number, z2: number): number => {
  const dx = x2 - x1;
  const dy = y2 - y1;
  const dz = z2 - z1;
  return Math.sqrt(dx * dx + dy * dy + dz * dz);
};

/**
 * Calculate the squared distance between two 3D points (faster than distance)
 */
export const distanceSquared = (x1: number, y1: number, z1: number, x2: number, y2: number, z2: number): number => {
  const dx = x2 - x1;
  const dy = y2 - y1;
  const dz = z2 - z1;
  return dx * dx + dy * dy + dz * dz;
};

/**
 * Normalize a 3D vector
 */
export const normalize = (x: number, y: number, z: number): [number, number, number] => {
  const length = Math.sqrt(x * x + y * y + z * z);
  if (length === 0) return [0, 0, 0];
  return [x / length, y / length, z / length];
};
