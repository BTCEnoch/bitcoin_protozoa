/**
 * Custom test assertions
 */
import { expect } from 'vitest';

/**
 * Assert that a value is close to another value within a tolerance
 */
export const expectToBeCloseTo = (actual: number, expected: number, precision = 2) => {
  const tolerance = Math.pow(10, -precision) / 2;
  expect(Math.abs(actual - expected)).toBeLessThanOrEqual(tolerance);
};

/**
 * Assert that a vector is close to another vector within a tolerance
 */
export const expectVectorToBeCloseTo = (
  actual: { x: number; y: number; z: number },
  expected: { x: number; y: number; z: number },
  precision = 2
) => {
  expectToBeCloseTo(actual.x, expected.x, precision);
  expectToBeCloseTo(actual.y, expected.y, precision);
  expectToBeCloseTo(actual.z, expected.z, precision);
};
