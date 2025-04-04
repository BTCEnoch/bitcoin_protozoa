/**
 * Particle Shapes
 *
 * This file contains shape definitions for particles.
 * Each shape has parameters that can be used to create a Three.js geometry.
 *
 * IMPORTANT: This file is auto-generated. Do not edit directly.
 * Generated by shape-mesh-generator.ps1
 */

/**
 * Shape parameter interface
 */
export interface ShapeParameters {
  [key: string]: number | string;
}

/**
 * Shape modifier interface
 */
export interface ShapeModifier {
  name: string;
  description: string;
  parameters: ShapeParameters;
}

/**
 * Shape definition interface
 */
export interface ShapeDefinition {
  name: string;
  category: string;
  description: string;
  complexity: number;
  rarity: string;
  parameters: ShapeParameters;
  modifiers: ShapeModifier[];
}

/**
 * Shape modifiers
 */
export const SHAPE_MODIFIERS: Record<string, ShapeModifier> = {  bend: {
    name: "Bend",
    description: "Bends the shape along an axis",
    parameters: {
      "axis": "x",
      "angle": 0.5,
    }
  },
  scale: {
    name: "Scale",
    description: "Scales the shape uniformly or non-uniformly",
    parameters: {
      "y": 1,
      "z": 1,
      "x": 1,
    }
  },
  noise: {
    name: "Noise",
    description: "Applies noise to the shape vertices",
    parameters: {
      "frequency": 1,
      "seed": 0,
      "amplitude": 0.1,
    }
  },
  taper: {
    name: "Taper",
    description: "Tapers the shape along an axis",
    parameters: {
      "axis": "y",
      "factor": 0.5,
    }
  },
  twist: {
    name: "Twist",
    description: "Twists the shape around an axis",
    parameters: {
      "axis": "y",
      "angle": 0.5,
    }
  },
};

/**
 * Shape definitions
 */
export const SHAPE_DEFINITIONS: Record<string, ShapeDefinition> = {  tetrahedron: {
    name: "Tetrahedron",
    category: "Crystal",
    description: "Regular tetrahedron shape",
    complexity: 3,
    rarity: "Rare",
    parameters: {
      "detail": 0,
      "radius": 1,
    },
    modifiers: []
  },
  cone: {
    name: "Cone",
    category: "Geometric",
    description: "Standard cone shape",
    complexity: 2,
    rarity: "Uncommon",
    parameters: {
      "radius": 1,
      "heightSegments": 1,
      "radialSegments": 16,
      "height": 2,
    },
    modifiers: []
  },
  cylinder: {
    name: "Cylinder",
    category: "Basic",
    description: "Standard cylinder shape",
    complexity: 1,
    rarity: "Common",
    parameters: {
      "radiusTop": 1,
      "radiusBottom": 1,
      "heightSegments": 1,
      "radialSegments": 16,
      "height": 2,
    },
    modifiers: []
  },
  icosahedron: {
    name: "Icosahedron",
    category: "Geometric",
    description: "Regular icosahedron shape",
    complexity: 2,
    rarity: "Uncommon",
    parameters: {
      "detail": 0,
      "radius": 1,
    },
    modifiers: []
  },
  gyroscope: {
    name: "Gyroscope",
    category: "Abstract",
    description: "Complex gyroscope-like shape",
    complexity: 5,
    rarity: "Mythic",
    parameters: {
      "radius": 1,
      "detail": 1,
      "rings": 3,
    },
    modifiers: []
  },
  torus: {
    name: "Torus",
    category: "Organic",
    description: "Standard torus shape",
    complexity: 4,
    rarity: "Epic",
    parameters: {
      "radius": 1,
      "tube": 0.4,
      "radialSegments": 16,
      "tubularSegments": 32,
    },
    modifiers: []
  },
  dodecahedron: {
    name: "Dodecahedron",
    category: "Geometric",
    description: "Regular dodecahedron shape",
    complexity: 2,
    rarity: "Uncommon",
    parameters: {
      "detail": 0,
      "radius": 1,
    },
    modifiers: []
  },
  octahedron: {
    name: "Octahedron",
    category: "Crystal",
    description: "Regular octahedron shape",
    complexity: 3,
    rarity: "Rare",
    parameters: {
      "detail": 0,
      "radius": 1,
    },
    modifiers: []
  },
  torusKnot: {
    name: "TorusKnot",
    category: "Organic",
    description: "Complex torus knot shape",
    complexity: 5,
    rarity: "Legendary",
    parameters: {
      "tubularSegments": 64,
      "radialSegments": 8,
      "radius": 1,
      "tube": 0.4,
      "q": 3,
      "p": 2,
    },
    modifiers: []
  },
  sphere: {
    name: "Sphere",
    category: "Basic",
    description: "Standard sphere shape",
    complexity: 1,
    rarity: "Common",
    parameters: {
      "radius": 1,
      "heightSegments": 12,
      "widthSegments": 16,
    },
    modifiers: []
  },
  cube: {
    name: "Cube",
    category: "Basic",
    description: "Standard cube shape",
    complexity: 1,
    rarity: "Common",
    parameters: {
      "widthSegments": 1,
      "width": 1,
      "depthSegments": 1,
      "heightSegments": 1,
      "depth": 1,
      "height": 1,
    },
    modifiers: []
  },
};

/**
 * Get a shape by name
 */
export function getShape(name: string): ShapeDefinition {
  const shapes = Object.values(SHAPE_DEFINITIONS);
  const shape = shapes.find(s => s.name === name);
  return shape || SHAPE_DEFINITIONS.sphere;
}

/**
 * Get shapes by category
 */
export function getShapesByCategory(category: string): ShapeDefinition[] {
  return Object.values(SHAPE_DEFINITIONS).filter(shape => shape.category === category);
}

/**
 * Get shapes by rarity
 */
export function getShapesByRarity(rarity: string): ShapeDefinition[] {
  return Object.values(SHAPE_DEFINITIONS).filter(shape => shape.rarity === rarity);
}

/**
 * Apply a modifier to a shape
 */
export function applyModifier(shape: ShapeDefinition, modifierName: string, parameters?: Partial<ShapeParameters>): ShapeDefinition {
  const modifier = SHAPE_MODIFIERS[modifierName];
  if (!modifier) {
    return shape;
  }

  // Create a copy of the shape
  const newShape = { ...shape };

  // Create a copy of the modifiers array
  newShape.modifiers = [...shape.modifiers];

  // Create a new modifier with custom parameters
  const newModifier = {
    name: modifier.name,
    description: modifier.description,
    parameters: { ...modifier.parameters, ...parameters }
  };

  // Add the modifier to the shape
  newShape.modifiers.push(newModifier);

  return newShape;
}
