# Bitcoin Integration Summary

This directory contains documentation on the Bitcoin blockchain integration and evolution mechanics for the Bitcoin Protozoa project.

## Key Documents

- [Blockchain Integration](01_blockchain_integration.md) - Bitcoin blockchain integration approach
- [Evolution Mechanics](02_evolution_mechanics.md) - Confirmation-based mutation system
- [RNG System](03_rng_system.md) - Deterministic random number generation
- [Bitcoin Integration Approach](04_bitcoin_integration_approach.md) - Integration strategy and API usage
- [Bitcoin Integration Details - Part 1](05_bitcoin_integration_details_part1.md) - Data structures and API integration
- [Bitcoin Integration Details - Part 2](06_bitcoin_integration_details_part2.md) - Implementation code and technical details

## Bitcoin Integration Overview

The Bitcoin Protozoa project integrates with the Bitcoin blockchain in several ways:

1. **Block Data Retrieval**: Fetching Bitcoin block data for particle generation
2. **Nonce-Based RNG**: Using block nonce as seed for deterministic RNG
3. **Confirmation Tracking**: Monitoring block confirmations for evolution triggers
4. **Ordinals Inscription**: Deploying the application as Bitcoin Ordinals inscriptions
5. **Recursive Inscriptions**: Using recursive inscriptions for code organization

## Evolution Mechanics

The evolution mechanics system enables Bitcoin Protozoa to evolve based on blockchain confirmations:

1. **Confirmation Milestones**: Evolution triggers at specific confirmation counts
2. **Mutation System**: Random mutations based on confirmation milestones
3. **Rarity System**: Tiered rarity system for mutations
4. **Group Selection**: Selection of particle groups for mutation
5. **Multi-Group Mutations**: Mutations affecting multiple particle groups

## Confirmation Milestones

Evolution is triggered at specific confirmation milestones:

1. **10,000 Confirmations**: ~70 days (Common mutations)
2. **50,000 Confirmations**: ~347 days (Uncommon mutations)
3. **100,000 Confirmations**: ~694 days (Rare mutations)
4. **250,000 Confirmations**: ~1,736 days (Epic mutations)
5. **500,000 Confirmations**: ~3,472 days (Legendary mutations)
6. **1,000,000 Confirmations**: ~6,944 days (Mythic mutations)

## Ordinals Deployment

The application is deployed on Bitcoin using the Ordinals protocol:

1. **Build Optimization**: Optimizing code for inscription
2. **Chunk Preparation**: Splitting the application into optimal chunks
3. **Inscription Order**: Planning the order of inscriptions
4. **Recursive Loading**: Loading dependencies using recursive inscriptions
5. **Fallback Mechanisms**: Handling inscription loading failures

## Related Documentation

- [Development Workflow](../deployment/01_development_workflow.md) - For details on development process
- [Deployment Pipeline](../deployment/02_deployment_pipeline.md) - For details on deployment process
- [RNG System](03_rng_system.md) - For details on nonce-based RNG
