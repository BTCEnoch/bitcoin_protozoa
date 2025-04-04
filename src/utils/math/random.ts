/**
 * Random number utility functions
 */

/**
 * Generate a random number between min and max (inclusive)
 */
export const randomRange = (min: number, max: number): number => {
  return Math.random() * (max - min) + min;
};

/**
 * Generate a random integer between min and max (inclusive)
 */
export const randomInt = (min: number, max: number): number => {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

/**
 * Generate a random boolean with the given probability
 */
export const randomBool = (probability = 0.5): boolean => {
  return Math.random() < probability;
};

/**
 * Choose a random item from an array
 */
export const randomItem = <T>(array: T[]): T => {
  return array[Math.floor(Math.random() * array.length)];
};
