# Particle Shapes

This document outlines the various particle shapes used in the Bitcoin Protozoa project, detailing their visual characteristics, implementation, and rarity tiers.

## Table of Contents

1. [Shape Philosophy](#shape-philosophy) [Line 20]
2. [Shape Categories](#shape-categories) [Line 40]
   - [Basic Shapes](#basic-shapes) [Line 45]
   - [Complex Shapes](#complex-shapes) [Line 100]
   - [Composite Shapes](#composite-shapes) [Line 150]
   - [Animated Shapes](#animated-shapes) [Line 200]
3. [Shape Properties](#shape-properties) [Line 250]
   - [Size](#size) [Line 255]
   - [Geometry](#geometry) [Line 280]
   - [Material](#material) [Line 310]
   - [Texture](#texture) [Line 340]
4. [Shape Variations](#shape-variations) [Line 370]
   - [Role-Based Variations](#role-based-variations) [Line 375]
   - [Group-Based Variations](#group-based-variations) [Line 410]
   - [Mutation-Based Variations](#mutation-based-variations) [Line 440]
5. [Shape Implementation](#shape-implementation) [Line 470]
   - [Three.js Implementation](#threejs-implementation) [Line 475]
   - [Instanced Meshes](#instanced-meshes) [Line 510]
   - [Performance Considerations](#performance-considerations) [Line 540]
6. [Shape Rarity Tiers](#shape-rarity-tiers) [Line 570]
   - [Common Shapes](#common-shapes) [Line 575]
   - [Uncommon Shapes](#uncommon-shapes) [Line 600]
   - [Rare Shapes](#rare-shapes) [Line 625]
   - [Epic Shapes](#epic-shapes) [Line 650]
   - [Legendary Shapes](#legendary-shapes) [Line 675]
   - [Mythic Shapes](#mythic-shapes) [Line 700]
7. [Related Documents](#related-documents) [Line 730]

## Shape Philosophy

The particle shapes in Bitcoin Protozoa are designed to create visually distinctive and engaging creatures while maintaining optimal performance. The shape system follows these core principles:

1. **Visual Distinction**: Each shape category provides a unique visual identity
2. **Role Appropriateness**: Shapes are designed to visually represent their functional role
3. **Performance Efficiency**: Shapes are optimized for rendering performance
4. **Deterministic Generation**: Shapes are assigned deterministically based on the Bitcoin block nonce
5. **Rarity Hierarchy**: Shapes are organized into rarity tiers for visual variety

The shape of a particle influences not only its visual appearance but also how it interacts with other particles and the environment. More complex shapes may have different collision behaviors, visual effects, and movement patterns.

## Shape Categories

Particle shapes are organized into four main categories, each with distinct visual characteristics and implementation approaches.

### Basic Shapes

Basic shapes are the fundamental building blocks of the particle system, offering excellent performance and clear visual identity.

#### Sphere

```typescript
// Standard sphere shape
const geometry = new THREE.SphereGeometry(radius, 16, 12);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Smooth, rounded appearance
- Uniform from all angles
- Simple light interaction
- Clear silhouette

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Common

#### Cube

```typescript
// Standard cube shape
const geometry = new THREE.BoxGeometry(size, size, size);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Sharp, angular appearance
- Distinct faces and edges
- Interesting light interaction with flat surfaces
- Strong, structured silhouette

**Role Affinity**: DEFENSE, ATTACK

**Rarity Tier**: Common

#### Tetrahedron

```typescript
// Standard tetrahedron shape
const geometry = new THREE.TetrahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pyramid-like shape with triangular faces
- Sharp points and edges
- Dynamic appearance that changes significantly with rotation
- Distinctive triangular silhouette

**Role Affinity**: ATTACK, MOVEMENT

**Rarity Tier**: Common

#### Octahedron

```typescript
// Standard octahedron shape
const geometry = new THREE.OctahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Diamond-like shape with triangular faces
- Multiple points and edges
- Balanced between angular and rounded appearance
- Symmetrical from multiple angles

**Role Affinity**: CONTROL, MOVEMENT

**Rarity Tier**: Common

#### Cylinder

```typescript
// Standard cylinder shape
const geometry = new THREE.CylinderGeometry(radius, radius, height, 16);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pill-like shape with circular ends
- Directional appearance with clear orientation
- Smooth curved surface with flat ends
- Distinctive when viewed from different angles

**Role Affinity**: MOVEMENT, DEFENSE

**Rarity Tier**: Common

### Complex Shapes

Complex shapes offer more visual interest and uniqueness, with slightly higher performance cost but greater visual distinction.

#### Torus

```typescript
// Torus (donut) shape
const geometry = new THREE.TorusGeometry(radius, tubeRadius, 16, 24);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Ring or donut-like shape with a hole in the center
- Smooth curved surface
- Interesting silhouette that changes dramatically with viewing angle
- Distinctive negative space

**Role Affinity**: CONTROL, CORE

**Rarity Tier**: Uncommon

#### Icosahedron

```typescript
// Icosahedron shape (20-sided polyhedron)
const geometry = new THREE.IcosahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Many triangular faces (20)
- Nearly spherical appearance with faceted surface
- Complex light interaction with multiple faces
- Detailed silhouette with many edges

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Uncommon

#### Dodecahedron

```typescript
// Dodecahedron shape (12-sided polyhedron)
const geometry = new THREE.DodecahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pentagonal faces (12)
- Rounded but still faceted appearance
- Distinctive pentagon patterns visible when rotating
- Balanced between angular and spherical

**Role Affinity**: DEFENSE, CORE

**Rarity Tier**: Uncommon

#### Cone

```typescript
// Cone shape
const geometry = new THREE.ConeGeometry(radius, height, 16);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Pointed top with circular base
- Highly directional appearance
- Distinctive silhouette from all angles
- Clear orientation in space

**Role Affinity**: ATTACK, MOVEMENT

**Rarity Tier**: Uncommon

#### Torusknot

```typescript
// Torusknot shape (pretzel-like)
const geometry = new THREE.TorusKnotGeometry(radius, tubeRadius, 64, 8, 2, 3);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);
```

**Visual Characteristics**:
- Twisted, knotted appearance
- Complex, intertwined structure
- Dramatic changes in appearance when rotating
- Unique, eye-catching form

**Role Affinity**: CORE, MOVEMENT

**Rarity Tier**: Rare

### Composite Shapes

Composite shapes combine multiple geometries to create more complex and unique forms, offering high visual distinction at a moderate performance cost.

#### Gyroscope

```typescript
// Gyroscope-like composite shape
const group = new THREE.Group();

// Inner ring
const innerRing = new THREE.Mesh(
  new THREE.TorusGeometry(radius * 0.8, radius * 0.1, 8, 24),
  new THREE.MeshStandardMaterial({ color })
);
group.add(innerRing);

// Outer ring
const outerRing = new THREE.Mesh(
  new THREE.TorusGeometry(radius, radius * 0.1, 8, 24),
  new THREE.MeshStandardMaterial({ color })
);
outerRing.rotation.x = Math.PI / 2;
group.add(outerRing);

// Core sphere
const core = new THREE.Mesh(
  new THREE.SphereGeometry(radius * 0.3, 8, 6),
  new THREE.MeshStandardMaterial({ color })
);
group.add(core);
```

**Visual Characteristics**:
- Multiple intersecting rings with central sphere
- Complex, mechanical appearance
- Interesting negative space
- Distinctive from all viewing angles

**Role Affinity**: CONTROL, CORE

**Rarity Tier**: Rare

#### Satellite

```typescript
// Satellite-like composite shape
const group = new THREE.Group();

// Main body
const body = new THREE.Mesh(
  new THREE.CylinderGeometry(radius * 0.5, radius * 0.5, radius * 1.5, 8),
  new THREE.MeshStandardMaterial({ color })
);
group.add(body);

// Solar panels
const panel1 = new THREE.Mesh(
  new THREE.BoxGeometry(radius * 2, radius * 0.1, radius * 0.8),
  new THREE.MeshStandardMaterial({ color })
);
panel1.position.x = radius * 1.2;
group.add(panel1);

const panel2 = new THREE.Mesh(
  new THREE.BoxGeometry(radius * 2, radius * 0.1, radius * 0.8),
  new THREE.MeshStandardMaterial({ color })
);
panel2.position.x = -radius * 1.2;
group.add(panel2);

// Antenna
const antenna = new THREE.Mesh(
  new THREE.ConeGeometry(radius * 0.2, radius * 0.8, 8),
  new THREE.MeshStandardMaterial({ color })
);
antenna.position.y = radius * 1.1;
group.add(antenna);
```

**Visual Characteristics**:
- Central body with extending panels
- Asymmetrical, technological appearance
- Multiple distinct components
- Clear directional orientation

**Role Affinity**: DEFENSE, ATTACK

**Rarity Tier**: Rare

#### Molecular

```typescript
// Molecular structure composite shape
const group = new THREE.Group();

// Central atom
const center = new THREE.Mesh(
  new THREE.SphereGeometry(radius * 0.5, 12, 8),
  new THREE.MeshStandardMaterial({ color })
);
group.add(center);

// Orbital atoms
const positions = [
  new THREE.Vector3(radius, 0, 0),
  new THREE.Vector3(-radius, 0, 0),
  new THREE.Vector3(0, radius, 0),
  new THREE.Vector3(0, -radius, 0),
  new THREE.Vector3(0, 0, radius),
  new THREE.Vector3(0, 0, -radius)
];

positions.forEach(position => {
  // Atom
  const atom = new THREE.Mesh(
    new THREE.SphereGeometry(radius * 0.3, 8, 6),
    new THREE.MeshStandardMaterial({ color })
  );
  atom.position.copy(position);
  group.add(atom);

  // Connection rod
  const direction = position.clone().normalize();
  const rod = new THREE.Mesh(
    new THREE.CylinderGeometry(radius * 0.1, radius * 0.1, position.length(), 6),
    new THREE.MeshStandardMaterial({ color })
  );

  // Position and orient the rod
  rod.position.copy(position.clone().multiplyScalar(0.5));
  rod.lookAt(position);
  rod.rotateX(Math.PI / 2);

  group.add(rod);
});
```

**Visual Characteristics**:
- Central sphere with connected smaller spheres
- Atom-like or molecular structure
- Symmetrical arrangement
- Complex but organized appearance

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Epic

### Animated Shapes

Animated shapes incorporate movement and transformation into their geometry, creating dynamic and eye-catching visuals at a higher performance cost.

#### Pulsating Sphere

```typescript
// Pulsating sphere with animation
const geometry = new THREE.SphereGeometry(radius, 16, 12);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);

// Animation function
function animate(time) {
  const scale = 1 + Math.sin(time * 2) * 0.2; // Pulsate between 0.8 and 1.2 scale
  mesh.scale.set(scale, scale, scale);
}
```

**Visual Characteristics**:
- Sphere that grows and shrinks rhythmically
- Breathing-like animation
- Draws attention through movement
- Maintains basic sphere shape

**Role Affinity**: CORE

**Rarity Tier**: Rare

#### Rotating Crystal

```typescript
// Rotating crystal with animation
const geometry = new THREE.OctahedronGeometry(radius);
const material = new THREE.MeshStandardMaterial({
  color,
  flatShading: true
});
const mesh = new THREE.Mesh(geometry, material);

// Animation function
function animate(time) {
  mesh.rotation.x = time * 0.5;
  mesh.rotation.y = time * 0.3;
}
```

**Visual Characteristics**:
- Crystal-like shape that rotates continuously
- Changing silhouette as it rotates
- Catches light differently throughout rotation
- Dynamic appearance with constant motion

**Role Affinity**: MOVEMENT, ATTACK

**Rarity Tier**: Rare

#### Morphing Cube

```typescript
// Morphing cube with animation
const geometry = new THREE.BoxGeometry(size, size, size);
const material = new THREE.MeshStandardMaterial({ color });
const mesh = new THREE.Mesh(geometry, material);

// Animation function
function animate(time) {
  // Morph between cube and sphere by adjusting vertex positions
  const vertices = geometry.attributes.position.array;

  for (let i = 0; i < vertices.length; i += 3) {
    const x = vertices[i];
    const y = vertices[i + 1];
    const z = vertices[i + 2];

    // Calculate original distance from center
    const length = Math.sqrt(x * x + y * y + z * z);

    // Normalize to get direction
    const nx = x / length;
    const ny = y / length;
    const nz = z / length;

    // Mix between cube and sphere based on time
    const morphFactor = (Math.sin(time) + 1) / 2; // 0 to 1

    // Update vertex position
    vertices[i] = x * (1 - morphFactor) + nx * size * 0.5 * morphFactor;
    vertices[i + 1] = y * (1 - morphFactor) + ny * size * 0.5 * morphFactor;
    vertices[i + 2] = z * (1 - morphFactor) + nz * size * 0.5 * morphFactor;
  }

  geometry.attributes.position.needsUpdate = true;
}
```

**Visual Characteristics**:
- Shape that transitions between cube and sphere
- Continuous transformation
- Fluid, organic movement
- Visually captivating metamorphosis

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Epic

#### Orbiting Satellites

```typescript
// Main body with orbiting satellites
const group = new THREE.Group();

// Core
const core = new THREE.Mesh(
  new THREE.SphereGeometry(radius * 0.5, 12, 8),
  new THREE.MeshStandardMaterial({ color })
);
group.add(core);

// Orbiting satellites
const satellites = [];
for (let i = 0; i < 3; i++) {
  const satellite = new THREE.Mesh(
    new THREE.SphereGeometry(radius * 0.2, 8, 6),
    new THREE.MeshStandardMaterial({ color })
  );

  // Create orbit ring (invisible)
  const orbitRing = new THREE.Object3D();
  orbitRing.rotation.x = Math.PI * Math.random();
  orbitRing.rotation.y = Math.PI * Math.random();

  // Position satellite on ring
  satellite.position.set(radius * 1.2, 0, 0);

  // Add to hierarchy
  orbitRing.add(satellite);
  group.add(orbitRing);
  satellites.push({ satellite, orbitRing });
}

// Animation function
function animate(time) {
  satellites.forEach((obj, i) => {
    obj.orbitRing.rotation.y += 0.01 * (i + 1); // Different speeds
  });
}
```

**Visual Characteristics**:
- Central body with smaller objects orbiting around it
- Planetary or atomic appearance
- Dynamic movement with multiple elements
- Complex, system-like visual

**Role Affinity**: CORE, CONTROL

**Rarity Tier**: Legendary

## Shape Properties

Shape properties define the specific visual characteristics of each particle shape, affecting their appearance and behavior.

### Size

Particle size influences visual impact, collision behavior, and performance. Size is typically determined by the particle's role and rarity.

#### Size Ranges

```typescript
// Size ranges by role
const sizeRanges = {
  CORE: { min: 0.8, max: 1.2 },      // Larger, central particles
  CONTROL: { min: 0.6, max: 0.9 },    // Medium-sized particles
  MOVEMENT: { min: 0.4, max: 0.7 },   // Smaller, faster particles
  DEFENSE: { min: 0.7, max: 1.0 },    // Medium-large particles
  ATTACK: { min: 0.5, max: 0.8 }      // Medium-small particles
};

// Size calculation based on role and random factor
function calculateSize(role, randomFactor) {
  const range = sizeRanges[role];
  return range.min + (range.max - range.min) * randomFactor;
}
```

#### Size Variation

Size variation within particle groups creates visual interest and hierarchy:

```typescript
// Size variation within a group
function createParticlesWithSizeVariation(group, count, baseSize) {
  const particles = [];

  for (let i = 0; i < count; i++) {
    // Calculate variation factor
    // Core particles have less variation, movement particles have more
    const variationRange = group.role === ParticleRole.CORE ? 0.2 : 0.4;
    const variation = 1 - variationRange/2 + Math.random() * variationRange;

    // Apply variation to base size
    const size = baseSize * variation;

    // Create particle with calculated size
    const particle = createParticle(group.role, size);
    particles.push(particle);
  }

  return particles;
}
```

#### Size Impact on Physics

Particle size affects physical interactions:

```typescript
// Physics calculations based on size
function calculatePhysicsProperties(particle) {
  // Mass increases with the cube of the radius (volume)
  particle.mass = particle.radius ** 3 * DENSITY_FACTOR;

  // Larger particles experience more drag
  particle.dragCoefficient = BASE_DRAG * particle.radius;

  // Collision radius is slightly larger than visual radius
  particle.collisionRadius = particle.radius * 1.1;

  return particle;
}
```

### Geometry

Geometry defines the structure and complexity of particle shapes, affecting both visual appearance and performance.

#### Geometry Detail Levels

Geometry detail is adjusted based on performance requirements:

```typescript
// Detail levels for different shapes
const geometryDetailLevels = {
  LOW: {
    sphere: { widthSegments: 8, heightSegments: 6 },
    box: { widthSegments: 1, heightSegments: 1, depthSegments: 1 },
    cylinder: { radialSegments: 8, heightSegments: 1 },
    cone: { radialSegments: 8, heightSegments: 1 },
    torus: { tubularSegments: 16, radialSegments: 8 }
  },
  MEDIUM: {
    sphere: { widthSegments: 16, heightSegments: 12 },
    box: { widthSegments: 2, heightSegments: 2, depthSegments: 2 },
    cylinder: { radialSegments: 16, heightSegments: 2 },
    cone: { radialSegments: 16, heightSegments: 2 },
    torus: { tubularSegments: 24, radialSegments: 12 }
  },
  HIGH: {
    sphere: { widthSegments: 32, heightSegments: 24 },
    box: { widthSegments: 3, heightSegments: 3, depthSegments: 3 },
    cylinder: { radialSegments: 32, heightSegments: 4 },
    cone: { radialSegments: 32, heightSegments: 4 },
    torus: { tubularSegments: 48, radialSegments: 24 }
  }
};

// Function to create geometry with appropriate detail level
function createGeometry(shape, size, detailLevel = 'MEDIUM') {
  const details = geometryDetailLevels[detailLevel][shape];

  switch (shape) {
    case 'sphere':
      return new THREE.SphereGeometry(
        size,
        details.widthSegments,
        details.heightSegments
      );
    case 'box':
      return new THREE.BoxGeometry(
        size, size, size,
        details.widthSegments,
        details.heightSegments,
        details.depthSegments
      );
    case 'cylinder':
      return new THREE.CylinderGeometry(
        size, size, size * 2,
        details.radialSegments,
        details.heightSegments
      );
    case 'cone':
      return new THREE.ConeGeometry(
        size, size * 2,
        details.radialSegments,
        details.heightSegments
      );
    case 'torus':
      return new THREE.TorusGeometry(
        size, size * 0.3,
        details.radialSegments,
        details.tubularSegments
      );
    default:
      return new THREE.SphereGeometry(size, 16, 12);
  }
}
```

#### Geometry Modifiers

Geometry modifiers alter the base shapes to create more variety:

```typescript
// Apply modifiers to geometry
function applyGeometryModifiers(geometry, modifiers) {
  const position = geometry.attributes.position;
  const normal = geometry.attributes.normal;

  for (let i = 0; i < position.count; i++) {
    const x = position.getX(i);
    const y = position.getY(i);
    const z = position.getZ(i);

    // Apply noise modifier
    if (modifiers.noise) {
      const noiseScale = modifiers.noise.scale || 0.1;
      const noise = (Math.random() - 0.5) * noiseScale;

      position.setX(i, x + noise);
      position.setY(i, y + noise);
      position.setZ(i, z + noise);
    }

    // Apply twist modifier
    if (modifiers.twist) {
      const twistAmount = modifiers.twist.amount || 0.2;
      const angle = y * twistAmount;

      const cosAngle = Math.cos(angle);
      const sinAngle = Math.sin(angle);

      const newX = x * cosAngle - z * sinAngle;
      const newZ = x * sinAngle + z * cosAngle;

      position.setX(i, newX);
      position.setZ(i, newZ);
    }

    // Apply bulge modifier
    if (modifiers.bulge) {
      const bulgeAmount = modifiers.bulge.amount || 0.3;
      const bulgeCenter = modifiers.bulge.center || new THREE.Vector3(0, 0, 0);

      const dx = x - bulgeCenter.x;
      const dy = y - bulgeCenter.y;
      const dz = z - bulgeCenter.z;

      const distance = Math.sqrt(dx * dx + dy * dy + dz * dz);
      const normalizedDistance = distance / geometry.boundingSphere.radius;

      const bulgeFactor = 1 + bulgeAmount * (1 - normalizedDistance);

      position.setX(i, bulgeCenter.x + dx * bulgeFactor);
      position.setY(i, bulgeCenter.y + dy * bulgeFactor);
      position.setZ(i, bulgeCenter.z + dz * bulgeFactor);
    }
  }

  // Update geometry
  position.needsUpdate = true;
  geometry.computeVertexNormals();

  return geometry;
}
```

### Material

Material properties define the surface appearance of particles, affecting how they interact with light and appear visually.

#### Material Types

Different material types create distinct visual styles:

```typescript
// Material types for particles
const materialTypes = {
  STANDARD: 'standard',   // Default physically-based material
  BASIC: 'basic',         // Simple, unlit material
  PHONG: 'phong',         // Classic shiny material
  TOON: 'toon',           // Cartoon-style material
  GLASS: 'glass'          // Transparent, refractive material
};

// Function to create material based on type
function createMaterial(type, color, options = {}) {
  switch (type) {
    case materialTypes.STANDARD:
      return new THREE.MeshStandardMaterial({
        color,
        roughness: options.roughness || 0.7,
        metalness: options.metalness || 0.3,
        flatShading: options.flatShading || false
      });

    case materialTypes.BASIC:
      return new THREE.MeshBasicMaterial({
        color,
        wireframe: options.wireframe || false
      });

    case materialTypes.PHONG:
      return new THREE.MeshPhongMaterial({
        color,
        shininess: options.shininess || 30,
        specular: options.specular || 0x111111
      });

    case materialTypes.TOON:
      return new THREE.MeshToonMaterial({
        color,
        gradientMap: options.gradientMap || null
      });

    case materialTypes.GLASS:
      return new THREE.MeshPhysicalMaterial({
        color,
        transmission: 0.9,
        transparent: true,
        roughness: 0.1,
        thickness: 0.5,
        clearcoat: 1.0,
        clearcoatRoughness: 0.1
      });

    default:
      return new THREE.MeshStandardMaterial({ color });
  }
}
```

#### Material Properties

Material properties are adjusted based on particle role and rarity:

```typescript
// Material properties by role
const materialProperties = {
  CORE: {
    roughness: 0.3,
    metalness: 0.7,
    flatShading: false
  },
  CONTROL: {
    roughness: 0.5,
    metalness: 0.5,
    flatShading: false
  },
  MOVEMENT: {
    roughness: 0.2,
    metalness: 0.3,
    flatShading: false
  },
  DEFENSE: {
    roughness: 0.8,
    metalness: 0.4,
    flatShading: true
  },
  ATTACK: {
    roughness: 0.4,
    metalness: 0.6,
    flatShading: true
  }
};

// Material property adjustments based on rarity
function adjustMaterialForRarity(material, rarity) {
  switch (rarity) {
    case 'COMMON':
      // No adjustments for common
      break;

    case 'UNCOMMON':
      material.roughness = Math.max(0.1, material.roughness - 0.1);
      material.metalness = Math.min(0.9, material.metalness + 0.1);
      break;

    case 'RARE':
      material.roughness = Math.max(0.1, material.roughness - 0.2);
      material.metalness = Math.min(0.9, material.metalness + 0.2);
      break;

    case 'EPIC':
      material.roughness = 0.1;
      material.metalness = 0.9;
      material.clearcoat = 1.0;
      break;

    case 'LEGENDARY':
      material.roughness = 0.05;
      material.metalness = 1.0;
      material.clearcoat = 1.0;
      material.clearcoatRoughness = 0.1;
      break;

    case 'MYTHIC':
      material.roughness = 0.0;
      material.metalness = 1.0;
      material.clearcoat = 1.0;
      material.clearcoatRoughness = 0.0;
      material.emissive = material.color.clone();
      material.emissiveIntensity = 0.2;
      break;
  }

  return material;
}
```

### Texture

Textures add detail and visual interest to particle surfaces without increasing geometry complexity.

#### Procedural Textures

Procedurally generated textures provide unique visual details:

```typescript
// Create procedural texture
function createProceduralTexture(type, resolution = 256, options = {}) {
  // Create canvas for texture generation
  const canvas = document.createElement('canvas');
  canvas.width = resolution;
  canvas.height = resolution;
  const ctx = canvas.getContext('2d');

  switch (type) {
    case 'noise':
      // Create noise texture
      const scale = options.scale || 20;
      const color1 = options.color1 || '#ffffff';
      const color2 = options.color2 || '#000000';

      for (let x = 0; x < resolution; x++) {
        for (let y = 0; y < resolution; y++) {
          const value = Math.random();
          ctx.fillStyle = value > 0.5 ? color1 : color2;
          ctx.fillRect(x, y, 1, 1);
        }
      }
      break;

    case 'gradient':
      // Create gradient texture
      const gradient = ctx.createLinearGradient(0, 0, resolution, resolution);
      gradient.addColorStop(0, options.color1 || '#ffffff');
      gradient.addColorStop(1, options.color2 || '#000000');

      ctx.fillStyle = gradient;
      ctx.fillRect(0, 0, resolution, resolution);
      break;

    case 'cells':
      // Create cellular pattern
      const cellSize = options.cellSize || 32;
      const cellColor = options.cellColor || '#ffffff';
      const backgroundColor = options.backgroundColor || '#000000';

      ctx.fillStyle = backgroundColor;
      ctx.fillRect(0, 0, resolution, resolution);

      ctx.fillStyle = cellColor;
      for (let x = 0; x < resolution; x += cellSize) {
        for (let y = 0; y < resolution; y += cellSize) {
          const size = cellSize * 0.8;
          const offsetX = (cellSize - size) / 2;
          const offsetY = (cellSize - size) / 2;

          ctx.fillRect(x + offsetX, y + offsetY, size, size);
        }
      }
      break;
  }

  // Create texture from canvas
  const texture = new THREE.CanvasTexture(canvas);
  texture.wrapS = THREE.RepeatWrapping;
  texture.wrapT = THREE.RepeatWrapping;

  return texture;
}
```

#### Texture Mapping

Texture mapping applies textures to particle materials:

```typescript
// Apply texture to material
function applyTexture(material, textureType, options = {}) {
  // Create texture
  const texture = createProceduralTexture(textureType, options.resolution, options);

  // Apply texture based on mapping type
  switch (options.mapping || 'color') {
    case 'color':
      material.map = texture;
      break;

    case 'normal':
      material.normalMap = texture;
      material.normalScale = new THREE.Vector2(options.normalScale || 1, options.normalScale || 1);
      break;

    case 'roughness':
      material.roughnessMap = texture;
      break;

    case 'metalness':
      material.metalnessMap = texture;
      break;

    case 'emissive':
      material.emissiveMap = texture;
      material.emissive = new THREE.Color(options.emissiveColor || 0xffffff);
      material.emissiveIntensity = options.emissiveIntensity || 1.0;
      break;
  }

  // Update material
  material.needsUpdate = true;

  return material;
}
```

## Shape Variations

Shape variations create visual diversity within the particle system, with different variations based on role, group, and mutations.

### Role-Based Variations

Different particle roles have different shape tendencies:

```typescript
// Shape probabilities by role
const shapesByRole = {
  CORE: {
    sphere: 0.3,
    icosahedron: 0.2,
    torus: 0.2,
    dodecahedron: 0.15,
    molecular: 0.1,
    pulsatingSphere: 0.05
  },
  CONTROL: {
    torus: 0.25,
    octahedron: 0.2,
    gyroscope: 0.2,
    sphere: 0.15,
    cube: 0.1,
    morphingCube: 0.1
  },
  MOVEMENT: {
    tetrahedron: 0.25,
    cylinder: 0.2,
    cone: 0.2,
    octahedron: 0.15,
    rotatingCrystal: 0.1,
    torusknot: 0.1
  },
  DEFENSE: {
    cube: 0.3,
    dodecahedron: 0.2,
    cylinder: 0.2,
    satellite: 0.15,
    sphere: 0.1,
    icosahedron: 0.05
  },
  ATTACK: {
    tetrahedron: 0.3,
    cone: 0.25,
    cube: 0.15,
    rotatingCrystal: 0.15,
    satellite: 0.1,
    torusknot: 0.05
  }
};

// Select shape based on role and random factor
function selectShapeForRole(role, randomFactor) {
  const shapes = shapesByRole[role];
  let cumulativeProbability = 0;

  for (const [shape, probability] of Object.entries(shapes)) {
    cumulativeProbability += probability;

    if (randomFactor <= cumulativeProbability) {
      return shape;
    }
  }

  // Default fallback
  return 'sphere';
}
```

### Group-Based Variations

Particles within the same group share shape characteristics for visual cohesion:

```typescript
// Apply group-based shape variations
function applyGroupShapeVariations(group, particles) {
  // Determine base shape for the group
  const baseShape = group.shapeType || 'sphere';

  // Determine material type for the group
  const materialType = group.materialType || materialTypes.STANDARD;

  // Determine if the group has special modifiers
  const hasModifiers = group.hasModifiers || false;

  // Apply consistent shapes to all particles in the group
  particles.forEach(particle => {
    // Use the same base shape for all particles in the group
    particle.shapeType = baseShape;

    // Use the same material type for all particles in the group
    particle.materialType = materialType;

    // Apply role-specific variations within the group
    if (particle.role === ParticleRole.CORE) {
      // Core particles might be slightly larger
      particle.scale = 1.2;
    } else if (particle.role === ParticleRole.MOVEMENT) {
      // Movement particles might have more dynamic shapes
      if (baseShape === 'sphere') {
        particle.shapeType = 'tetrahedron';
      }
    } else if (particle.role === ParticleRole.DEFENSE) {
      // Defense particles might have more angular shapes
      if (baseShape === 'sphere') {
        particle.shapeType = 'cube';
      }
    }

    // Apply modifiers if the group has them
    if (hasModifiers) {
      particle.modifiers = group.modifiers;
    }
  });

  return particles;
}
```

### Mutation-Based Variations

Mutations introduce new shape variations as creatures evolve with Bitcoin confirmations:

```typescript
// Apply mutation-based shape variations
function applyShapeMutation(particle, confirmations) {
  // Determine mutation tier based on confirmations
  let mutationTier = 0;

  if (confirmations >= 100000) {
    mutationTier = 5; // Mythic
  } else if (confirmations >= 50000) {
    mutationTier = 4; // Legendary
  } else if (confirmations >= 10000) {
    mutationTier = 3; // Epic
  } else if (confirmations >= 5000) {
    mutationTier = 2; // Rare
  } else if (confirmations >= 1000) {
    mutationTier = 1; // Uncommon
  }

  // No mutations for tier 0
  if (mutationTier === 0) {
    return particle;
  }

  // Apply mutations based on tier
  switch (mutationTier) {
    case 1: // Uncommon
      // Slight material enhancement
      particle.material.roughness = Math.max(0.1, particle.material.roughness - 0.1);
      particle.material.metalness = Math.min(0.9, particle.material.metalness + 0.1);
      break;

    case 2: // Rare
      // Add texture or slight shape modification
      if (Math.random() < 0.5) {
        // Add texture
        applyTexture(particle.material, 'noise', {
          mapping: 'normal',
          normalScale: 0.5
        });
      } else {
        // Add shape modifier
        particle.modifiers = particle.modifiers || {};
        particle.modifiers.noise = { scale: 0.1 };
      }
      break;

    case 3: // Epic
      // More significant shape or material change
      if (Math.random() < 0.3) {
        // Change to more complex shape in same category
        if (particle.shapeType === 'sphere') {
          particle.shapeType = 'icosahedron';
        } else if (particle.shapeType === 'cube') {
          particle.shapeType = 'dodecahedron';
        }
      } else {
        // Add emissive effect
        applyTexture(particle.material, 'gradient', {
          mapping: 'emissive',
          emissiveColor: particle.material.color.clone(),
          emissiveIntensity: 0.3
        });
      }
      break;

    case 4: // Legendary
      // Animated shape or special effect
      if (particle.role === ParticleRole.CORE || particle.role === ParticleRole.CONTROL) {
        // Change to animated shape
        particle.shapeType = 'pulsatingSphere';
      } else if (particle.role === ParticleRole.MOVEMENT) {
        particle.shapeType = 'rotatingCrystal';
      } else {
        // Add special material effect
        particle.materialType = materialTypes.GLASS;
      }
      break;

    case 5: // Mythic
      // Complete transformation to special shape
      if (particle.role === ParticleRole.CORE) {
        particle.shapeType = 'molecular';
      } else if (particle.role === ParticleRole.CONTROL) {
        particle.shapeType = 'gyroscope';
      } else if (particle.role === ParticleRole.MOVEMENT) {
        particle.shapeType = 'torusknot';
      } else if (particle.role === ParticleRole.DEFENSE) {
        particle.shapeType = 'satellite';
      } else {
        particle.shapeType = 'morphingCube';
      }
      break;
  }

  return particle;
}
```

## Shape Implementation

The implementation of particle shapes focuses on performance and visual quality, using Three.js for rendering.

### Three.js Implementation

Three.js provides efficient 3D rendering capabilities for particle shapes:

```typescript
// Create particle mesh with Three.js
function createParticleMesh(particle) {
  // Create geometry based on shape type
  let geometry;

  switch (particle.shapeType) {
    case 'sphere':
      geometry = new THREE.SphereGeometry(particle.radius, 16, 12);
      break;

    case 'cube':
      geometry = new THREE.BoxGeometry(
        particle.radius * 2,
        particle.radius * 2,
        particle.radius * 2
      );
      break;

    case 'tetrahedron':
      geometry = new THREE.TetrahedronGeometry(particle.radius);
      break;

    case 'octahedron':
      geometry = new THREE.OctahedronGeometry(particle.radius);
      break;

    case 'icosahedron':
      geometry = new THREE.IcosahedronGeometry(particle.radius);
      break;

    case 'dodecahedron':
      geometry = new THREE.DodecahedronGeometry(particle.radius);
      break;

    case 'cylinder':
      geometry = new THREE.CylinderGeometry(
        particle.radius,
        particle.radius,
        particle.radius * 2,
        16
      );
      break;

    case 'cone':
      geometry = new THREE.ConeGeometry(
        particle.radius,
        particle.radius * 2,
        16
      );
      break;

    case 'torus':
      geometry = new THREE.TorusGeometry(
        particle.radius,
        particle.radius * 0.3,
        16,
        24
      );
      break;

    case 'torusknot':
      geometry = new THREE.TorusKnotGeometry(
        particle.radius,
        particle.radius * 0.3,
        64,
        8,
        2,
        3
      );
      break;

    default:
      // Default to sphere
      geometry = new THREE.SphereGeometry(particle.radius, 16, 12);
  }

  // Apply geometry modifiers if any
  if (particle.modifiers) {
    geometry = applyGeometryModifiers(geometry, particle.modifiers);
  }

  // Create material
  const material = createMaterial(
    particle.materialType || materialTypes.STANDARD,
    particle.color,
    {
      roughness: particle.roughness || 0.7,
      metalness: particle.metalness || 0.3,
      flatShading: particle.flatShading || false
    }
  );

  // Create mesh
  const mesh = new THREE.Mesh(geometry, material);

  // Set initial position
  mesh.position.copy(particle.position);

  // Store reference to particle data
  mesh.userData.particle = particle;

  return mesh;
}
```

### Instanced Meshes

Instanced meshes improve performance for large numbers of similar particles:

```typescript
// Create instanced mesh for particles
function createInstancedParticleMesh(particles, shapeType) {
  // Filter particles by shape type
  const filteredParticles = particles.filter(p => p.shapeType === shapeType);

  if (filteredParticles.length === 0) {
    return null;
  }

  // Create base geometry
  let geometry;

  switch (shapeType) {
    case 'sphere':
      geometry = new THREE.SphereGeometry(1, 16, 12);
      break;

    case 'cube':
      geometry = new THREE.BoxGeometry(2, 2, 2);
      break;

    case 'tetrahedron':
      geometry = new THREE.TetrahedronGeometry(1);
      break;

    // Add other shape types as needed

    default:
      geometry = new THREE.SphereGeometry(1, 16, 12);
  }

  // Create material
  const material = new THREE.MeshStandardMaterial();

  // Create instanced mesh
  const instancedMesh = new THREE.InstancedMesh(
    geometry,
    material,
    filteredParticles.length
  );

  // Set up instances
  const matrix = new THREE.Matrix4();
  const color = new THREE.Color();

  filteredParticles.forEach((particle, i) => {
    // Position
    matrix.setPosition(particle.position.x, particle.position.y, particle.position.z);

    // Scale
    const scale = particle.radius || 1;
    matrix.scale(new THREE.Vector3(scale, scale, scale));

    // Apply to instance
    instancedMesh.setMatrixAt(i, matrix);

    // Color
    instancedMesh.setColorAt(i, color.set(particle.color));
  });

  // Update instance matrices
  instancedMesh.instanceMatrix.needsUpdate = true;

  // Update instance colors
  if (instancedMesh.instanceColor) {
    instancedMesh.instanceColor.needsUpdate = true;
  }

  return instancedMesh;
}
```

### Performance Considerations

Performance optimizations for particle shapes ensure smooth rendering:

```typescript
// Performance optimization strategies
const performanceStrategies = {
  // Automatically adjust detail level based on particle count
  autoAdjustDetailLevel(particleCount) {
    if (particleCount > 1000) {
      return 'LOW';
    } else if (particleCount > 500) {
      return 'MEDIUM';
    } else {
      return 'HIGH';
    }
  },

  // Use instanced meshes for particles with the same shape
  useInstancedMeshes(particles) {
    // Group particles by shape type
    const shapeGroups = {};

    particles.forEach(particle => {
      const shapeType = particle.shapeType || 'sphere';
      if (!shapeGroups[shapeType]) {
        shapeGroups[shapeType] = [];
      }
      shapeGroups[shapeType].push(particle);
    });

    // Create instanced meshes for groups with more than 10 particles
    const meshes = [];

    for (const [shapeType, groupParticles] of Object.entries(shapeGroups)) {
      if (groupParticles.length > 10) {
        const instancedMesh = createInstancedParticleMesh(groupParticles, shapeType);
        if (instancedMesh) {
          meshes.push(instancedMesh);
        }
      } else {
        // Create individual meshes for small groups
        groupParticles.forEach(particle => {
          meshes.push(createParticleMesh(particle));
        });
      }
    }

    return meshes;
  },

  // Implement level of detail (LOD) for particles
  implementLOD(particle, camera) {
    // Calculate distance to camera
    const distance = particle.position.distanceTo(camera.position);

    // Adjust detail level based on distance
    let detailLevel;

    if (distance > 50) {
      detailLevel = 'LOW';
    } else if (distance > 20) {
      detailLevel = 'MEDIUM';
    } else {
      detailLevel = 'HIGH';
    }

    return detailLevel;
  },

  // Cull particles that are not visible
  cullInvisibleParticles(particles, camera, frustum) {
    return particles.filter(particle => {
      // Skip if particle is not active
      if (!particle.active) return false;

      // Check if particle is in camera frustum
      const position = new THREE.Vector3(
        particle.position.x,
        particle.position.y,
        particle.position.z
      );

      return frustum.containsPoint(position);
    });
  }
};
```

## Shape Rarity Tiers

Shape rarity tiers define the relative frequency and visual distinctiveness of different particle shapes.

### Common Shapes

Common shapes are the most frequently occurring and serve as the foundation for particle visuals:

```typescript
// Common shapes (50% probability)
const commonShapes = {
  sphere: {
    name: 'Sphere',
    probability: 0.15,
    description: 'A basic spherical shape with smooth surface.',
    complexity: 'low',
    performance: 'high'
  },
  cube: {
    name: 'Cube',
    probability: 0.15,
    description: 'A six-sided box shape with flat faces.',
    complexity: 'low',
    performance: 'high'
  },
  tetrahedron: {
    name: 'Tetrahedron',
    probability: 0.1,
    description: 'A four-sided pyramid shape with triangular faces.',
    complexity: 'low',
    performance: 'high'
  },
  octahedron: {
    name: 'Octahedron',
    probability: 0.05,
    description: 'An eight-sided shape with triangular faces.',
    complexity: 'low',
    performance: 'high'
  },
  cylinder: {
    name: 'Cylinder',
    probability: 0.05,
    description: 'A cylindrical shape with circular ends.',
    complexity: 'low',
    performance: 'high'
  }
};
```

### Uncommon Shapes

Uncommon shapes occur less frequently and offer more visual interest:

```typescript
// Uncommon shapes (30% probability)
const uncommonShapes = {
  cone: {
    name: 'Cone',
    probability: 0.1,
    description: 'A cone shape with circular base and pointed top.',
    complexity: 'low',
    performance: 'high'
  },
  torus: {
    name: 'Torus',
    probability: 0.08,
    description: 'A donut-shaped ring with a hole in the center.',
    complexity: 'medium',
    performance: 'medium'
  },
  icosahedron: {
    name: 'Icosahedron',
    probability: 0.07,
    description: 'A twenty-sided polyhedron with triangular faces.',
    complexity: 'medium',
    performance: 'medium'
  },
  dodecahedron: {
    name: 'Dodecahedron',
    probability: 0.05,
    description: 'A twelve-sided polyhedron with pentagonal faces.',
    complexity: 'medium',
    performance: 'medium'
  }
};
```

### Rare Shapes

Rare shapes are visually distinctive and occur infrequently:

```typescript
// Rare shapes (15% probability)
const rareShapes = {
  torusknot: {
    name: 'Torus Knot',
    probability: 0.05,
    description: 'A complex knot-like shape twisted in 3D space.',
    complexity: 'high',
    performance: 'medium'
  },
  pulsatingSphere: {
    name: 'Pulsating Sphere',
    probability: 0.04,
    description: 'A sphere that rhythmically grows and shrinks.',
    complexity: 'medium',
    performance: 'medium',
    animated: true
  },
  rotatingCrystal: {
    name: 'Rotating Crystal',
    probability: 0.03,
    description: 'A crystalline shape that continuously rotates.',
    complexity: 'medium',
    performance: 'medium',
    animated: true
  },
  gyroscope: {
    name: 'Gyroscope',
    probability: 0.03,
    description: 'A complex shape with intersecting rings and a central sphere.',
    complexity: 'high',
    performance: 'medium',
    composite: true
  }
};
```

### Epic Shapes

Epic shapes are rare and visually impressive:

```typescript
// Epic shapes (3% probability)
const epicShapes = {
  satellite: {
    name: 'Satellite',
    probability: 0.01,
    description: 'A complex shape resembling a satellite with extending panels.',
    complexity: 'high',
    performance: 'medium',
    composite: true
  },
  morphingCube: {
    name: 'Morphing Cube',
    probability: 0.01,
    description: 'A cube that smoothly morphs between different shapes.',
    complexity: 'high',
    performance: 'low',
    animated: true
  },
  molecular: {
    name: 'Molecular',
    probability: 0.01,
    description: 'A molecular structure with a central atom and orbiting particles.',
    complexity: 'high',
    performance: 'medium',
    composite: true
  }
};
```

### Legendary Shapes

Legendary shapes are extremely rare and visually spectacular:

```typescript
// Legendary shapes (1.5% probability)
const legendaryShapes = {
  orbitingSatellites: {
    name: 'Orbiting Satellites',
    probability: 0.01,
    description: 'A central body with smaller objects orbiting around it.',
    complexity: 'very high',
    performance: 'low',
    animated: true,
    composite: true
  },
  crystalCluster: {
    name: 'Crystal Cluster',
    probability: 0.005,
    description: 'A complex arrangement of interconnected crystal formations.',
    complexity: 'very high',
    performance: 'low',
    composite: true
  }
};
```

### Mythic Shapes

Mythic shapes are the rarest and most visually stunning:

```typescript
// Mythic shapes (0.5% probability)
const mythicShapes = {
  vortex: {
    name: 'Vortex',
    probability: 0.003,
    description: 'A swirling, animated vortex with particles flowing through it.',
    complexity: 'extreme',
    performance: 'very low',
    animated: true,
    composite: true,
    special: true
  },
  quantumFlux: {
    name: 'Quantum Flux',
    probability: 0.002,
    description: 'A constantly shifting, ethereal form that defies conventional geometry.',
    complexity: 'extreme',
    performance: 'very low',
    animated: true,
    special: true
  }
};

// Combined shape registry with all rarity tiers
const shapeRegistry = {
  ...commonShapes,
  ...uncommonShapes,
  ...rareShapes,
  ...epicShapes,
  ...legendaryShapes,
  ...mythicShapes
};
```

## Related Documents

- [Color Palettes](01_color_palettes.md) - For details on particle color palettes
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
- [Physics Engine](../physics/01_physics_engine.md) - For details on physics calculations
- [Trait System](../bitcoin/07_trait_system.md) - For details on the trait system architecture