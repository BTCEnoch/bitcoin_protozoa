/**
 * Shared Worker Utilities
 *
 * @description Utility functions for shared worker functionality
 */

/**
 * Create a worker message
 */
export const createWorkerMessage = (type: string, payload?: any) => {
  return { type, payload };
};

/**
 * Create a worker response
 */
export const createWorkerResponse = (type: string, payload?: any, error?: string) => {
  return { type, payload, error };
};
