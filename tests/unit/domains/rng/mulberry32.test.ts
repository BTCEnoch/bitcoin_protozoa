import { describe, it, expect } from 'vitest';
import { mulberry32, createChainRng } from '@/domains/rng/utils/mulberry32';

describe('mulberry32', () => {
  it('should generate deterministic random numbers', () => {
    const rng = mulberry32(12345);

    // Generate a sequence of random numbers
    const numbers = Array.from({ length: 5 }, () => rng());

    // Generate the same sequence again with the same seed
    const rng2 = mulberry32(12345);
    const numbers2 = Array.from({ length: 5 }, () => rng2());

    // The sequences should be identical
    expect(numbers).toEqual(numbers2);
  });

  it('should generate different sequences with different seeds', () => {
    const rng1 = mulberry32(12345);
    const rng2 = mulberry32(67890);

    // Generate sequences
    const numbers1 = Array.from({ length: 5 }, () => rng1());
    const numbers2 = Array.from({ length: 5 }, () => rng2());

    // The sequences should be different
    expect(numbers1).not.toEqual(numbers2);
  });
});

describe('createChainRng', () => {
  it('should create a chain of RNGs', () => {
    const generators = createChainRng(12345, 3);

    // Should create the specified number of generators
    expect(generators.length).toBe(3);

    // Each generator should produce a different sequence
    const seq1 = Array.from({ length: 3 }, () => generators[0]());
    const seq2 = Array.from({ length: 3 }, () => generators[1]());
    const seq3 = Array.from({ length: 3 }, () => generators[2]());

    expect(seq1).not.toEqual(seq2);
    expect(seq1).not.toEqual(seq3);
    expect(seq2).not.toEqual(seq3);
  });
});
