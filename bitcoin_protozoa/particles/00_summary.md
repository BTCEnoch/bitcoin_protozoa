# Particle System Summary

This directory contains documentation on the particle system design and implementation for the Bitcoin Protozoa project.

## Key Documents

- [Particle System](01_particle_system.md) - Particle system design and overview
- [Particle Types](02_particle_types.md) - Particle types, roles, and properties
- [Particle Lifecycle](03_particle_lifecycle.md) - Particle lifecycle management and memory optimization
- [Role Hierarchy](04_role_hierarchy.md) - Role relationships and hierarchy
- [Particle System Design Decisions](05_particle_system_design_decisions.md) - Design decisions and implementation approach

## Particle System Overview

The particle system is the core component of the Bitcoin Protozoa project, responsible for:

1. **Particle Creation**: Generating particles based on Bitcoin block data
2. **Particle Properties**: Managing particle attributes, roles, and visual characteristics
3. **Particle Groups**: Organizing particles into functional groups with specific behaviors
4. **Particle Interactions**: Handling interactions between particles and force fields
5. **Memory Management**: Optimizing memory usage for efficient performance

## Particle Types and Roles

Each particle belongs to one of five roles, each with distinct behaviors and visual characteristics:

1. **CORE**: Central particles that define the creature's identity
2. **CONTROL**: Particles that influence the behavior of other particles
3. **ATTACK**: Particles that exhibit aggressive or expansive behavior
4. **DEFENSE**: Particles that protect or stabilize the creature
5. **MOVEMENT**: Particles that drive the creature's locomotion

## Particle Properties

Each particle has the following properties:

- **Position**: 3D coordinates in space
- **Velocity**: Direction and speed of movement
- **Acceleration**: Rate of change in velocity
- **Role**: Functional role in the creature
- **Group**: Group membership for collective behavior
- **Shape**: Visual representation
- **Color**: Visual appearance based on role and group
- **Scale**: Size relative to other particles
- **Mass**: Influence on physics calculations
- **Age**: Time since creation
- **Active**: Whether the particle is currently active

## Memory Optimization

The particle system uses several optimization techniques:

1. **Object Pooling**: Reusing particle objects to reduce garbage collection
2. **Typed Arrays**: Using efficient data structures for position and velocity data
3. **Instanced Rendering**: Optimizing rendering performance with instanced meshes
4. **Spatial Partitioning**: Optimizing collision detection and force calculations
5. **Worker Offloading**: Moving intensive calculations to web workers

## Related Documentation

- [Physics Engine](../physics/00_summary.md) - For details on force calculations
- [Force Field System](../physics/03_force_field_system.md) - For details on force field interactions
- [RNG System](../bitcoin/03_rng_system.md) - For details on deterministic particle generation
