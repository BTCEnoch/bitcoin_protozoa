# Particle Distribution Method

This document addresses the issue with using decimal percentages for particle distribution and proposes an improved method that ensures whole-number particles and exact totals.

## The Problem with Percentage-Based Distribution

In the original balancing system, particles are distributed as follows:
- Each of the five roles (CORE, CONTROL, MOVEMENT, DEFENSE, ATTACK) starts with 40 base particles (totaling 200).
- An additional 300 particles are distributed using five random percentages that sum to 100%, ranging from 0.3% to 60%.

This approach has a fundamental issue: when applying percentages to 300 particles, we often get fractional results:
- 0.3% of 300 = 0.9 particles (not a whole number)
- 60% of 300 = 180 particles (whole number)

Since particles must be whole numbers (you can't have a fraction of a particle), this leads to rounding issues and potentially inaccurate totals.

## Improved Approach: Direct Particle Distribution

To resolve this issue, we'll replace the percentage-based approach with direct particle distribution:

### 1. Set Boundaries for Each Role

- **Minimum Additional Particles**: Each role receives at least 3 additional particles.
- **Maximum Additional Particles**: No role can receive more than 180 additional particles (equivalent to the original 60% cap).

### 2. Initial Allocation

- Give each of the five roles 3 additional particles to start.
- 5 roles × 3 particles = 15 particles allocated initially.
- This leaves 300 - 15 = 285 particles to distribute.

### 3. Distribute Remaining Particles

- Randomly assign the remaining 285 particles one by one to the roles.
- Only assign a particle to a role if it hasn't yet reached the maximum of 180 additional particles.
- Continue until all 285 particles are assigned.

## Example Distribution

Let's walk through an example:

1. **Initial Allocation**: Each role gets 3 additional particles: [3, 3, 3, 3, 3].

2. **Random Distribution of Remaining 285 Particles**:
   - CORE gets 70 more → 3 + 70 = 73 additional particles.
   - CONTROL gets 60 more → 3 + 60 = 63 additional particles.
   - ATTACK gets 80 more → 3 + 80 = 83 additional particles.
   - DEFENSE gets 50 more → 3 + 50 = 53 additional particles.
   - MOVEMENT gets 25 more → 3 + 25 = 28 additional particles.

3. **Verify Total**: 73 + 63 + 83 + 53 + 28 = 300 additional particles.

4. **Final Counts (Base + Additional)**:
   - CORE: 40 + 73 = 113 particles.
   - CONTROL: 40 + 63 = 103 particles.
   - ATTACK: 40 + 83 = 123 particles.
   - DEFENSE: 40 + 53 = 93 particles.
   - MOVEMENT: 40 + 28 = 68 particles.

This adds up perfectly to 500 total particles (200 base + 300 additional), all in whole numbers.

## Advantages of This Approach

1. **No Fractions**: By assigning particles directly instead of using percentages, we avoid decimals entirely.

2. **Exact Total**: The method guarantees the additional particles sum to exactly 300.

3. **Fairness**: Every role gets at least 3 additional particles, and the random assignment keeps the distribution varied and unpredictable.

4. **Control**: The maximum cap (180) prevents any role from getting too extreme, while the minimum ensures no role is left too weak.

## Implementation in Code

Here's how this could be implemented in TypeScript:

```typescript
/**
 * Distributes 300 additional particles across the five roles
 * @returns An array of five numbers representing additional particles per role
 */
function distributeAdditionalParticles(): number[] {
  // Initialize with minimum particles per role
  const minParticlesPerRole = 3;
  const additionalParticles: number[] = Array(5).fill(minParticlesPerRole);
  
  // Calculate remaining particles to distribute
  let remainingParticles = 300 - (minParticlesPerRole * 5);
  
  // Maximum additional particles per role
  const maxAdditionalPerRole = 180;
  
  // Distribute remaining particles randomly
  while (remainingParticles > 0) {
    // Pick a random role (0-4)
    const roleIndex = Math.floor(Math.random() * 5);
    
    // Check if this role has reached the maximum
    if (additionalParticles[roleIndex] < maxAdditionalPerRole) {
      // Add one particle to this role
      additionalParticles[roleIndex]++;
      remainingParticles--;
    }
    // If the role is at max, the loop will try again with a different random role
  }
  
  return additionalParticles;
}

/**
 * Distributes particles deterministically based on a seed
 * @param seed A number used to seed the RNG
 * @returns An array of five numbers representing additional particles per role
 */
function distributeParticlesDeterministic(seed: number): number[] {
  // Create a seeded RNG
  const rng = createDeterministicRNG(seed);
  
  // Initialize with minimum particles per role
  const minParticlesPerRole = 3;
  const additionalParticles: number[] = Array(5).fill(minParticlesPerRole);
  
  // Calculate remaining particles to distribute
  let remainingParticles = 300 - (minParticlesPerRole * 5);
  
  // Maximum additional particles per role
  const maxAdditionalPerRole = 180;
  
  // Distribute remaining particles using the seeded RNG
  while (remainingParticles > 0) {
    // Pick a random role (0-4) using the seeded RNG
    const roleIndex = Math.floor(rng() * 5);
    
    // Check if this role has reached the maximum
    if (additionalParticles[roleIndex] < maxAdditionalPerRole) {
      // Add one particle to this role
      additionalParticles[roleIndex]++;
      remainingParticles--;
    }
    // If the role is at max, the loop will try again with a different random role
  }
  
  return additionalParticles;
}

/**
 * Creates a deterministic RNG based on a seed
 * @param seed The seed for the RNG
 * @returns A function that returns a deterministic random number between 0 and 1
 */
function createDeterministicRNG(seed: number): () => number {
  let state = seed;
  
  // Simple mulberry32 implementation
  return function() {
    state += 0x6D2B79F5;
    let t = state;
    t = Math.imul(t ^ t >>> 15, t | 1);
    t ^= t + Math.imul(t ^ t >>> 7, t | 61);
    return ((t ^ t >>> 14) >>> 0) / 4294967296;
  };
}
```

## Fine-Tuning Options

The distribution method can be adjusted based on balance preferences:

1. **Adjust Minimum Particles**:
   - Increase the minimum to 10 particles per role to avoid very weak roles.
   - This would use 50 particles initially, leaving 250 to distribute randomly.

2. **Adjust Maximum Particles**:
   - Reduce the maximum to 150 additional particles to prevent overly dominant roles.
   - This would create more balanced creatures with less extreme specialization.

3. **Weighted Distribution**:
   - Implement a weighted random selection to make certain roles more likely to receive particles.
   - This could be used to create "class tendencies" in the distribution.

## Conclusion

By replacing the percentage-based approach with direct particle distribution, we solve the fractional particle problem while maintaining the spirit of the original system. This method ensures:

1. All particles are whole numbers
2. The total is exactly 500 particles (200 base + 300 additional)
3. The distribution remains random and varied
4. Boundaries prevent extreme imbalances

This approach should be implemented in the particle distribution system to ensure accurate and balanced creature generation.
