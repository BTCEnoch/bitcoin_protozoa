/**
 * Test fixtures
 */

/**
 * Create a mock particle
 */
export const createMockParticle = (id: number, role: string) => ({
  id,
  role,
  position: { x: 0, y: 0, z: 0 },
  velocity: { x: 0, y: 0, z: 0 },
  acceleration: { x: 0, y: 0, z: 0 },
  mass: 1,
  radius: 0.1,
});

/**
 * Create a mock block data response
 */
export const createMockBlockData = (blockNumber: number) => ({
  height: blockNumber,
  hash: "00000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f",
  nonce: 2083236893 + blockNumber,
  confirmations: 1000,
  time: 1231006505 + blockNumber * 600,
});
