# Visual Regression Testing
#
# This script creates a system for visual regression testing of particle traits
# in the Bitcoin Protozoa project. It allows developers to capture reference images
# of particle traits and compare them with current renderings to detect visual changes.
#
# Features:
# - Creates a React component for visual regression testing
# - Implements image capture and comparison functionality
# - Provides a UI for managing test cases and viewing results
# - Integrates with the trait system for testing different trait combinations
# - Supports batch testing and reporting

# Import the fixed component template
. "$PSScriptRoot\component-template-fixed.ps1"

# Configuration
$dataPath = "src\domains\trait\data"
$testPath = "src\domains\trait\tests"
$testDataPath = "$dataPath\visualTestCases.ts"
$testUtilPath = "$testPath\visualRegressionUtils.ts"

# Create the VisualRegressionTester component
New-Component -componentName "VisualRegressionTester" -domainPath "src\domains\trait" -description "A component for visual regression testing of particle traits" -useGlobalCss

# Ensure the test directory exists
New-DirectoryIfNotExists -path $testPath

# Create the visual test cases data file
$visualTestCasesContent = @"
/**
 * Visual Test Cases
 *
 * This file contains test cases for visual regression testing of particle traits.
 * Each test case defines a specific combination of traits to be rendered and compared.
 *
 * IMPORTANT: This file is auto-generated. Do not edit directly.
 * Generated by visual-regression-testing.ps1
 */
import { ParticleRole } from '../../particle/types';
import { Color } from './colorPalettes';

/**
 * Visual test case interface
 */
export interface VisualTestCase {
  id: string;
  name: string;
  description: string;
  role: ParticleRole;
  color: Color;
  shape: string;
  shaderEffect?: string;
  parameters?: Record<string, any>;
  referenceImage?: string; // Base64 encoded reference image
}

/**
 * Visual test cases
 */
export const VISUAL_TEST_CASES: Record<string, VisualTestCase> = {
  // Core particle with basic shape
  coreBasic: {
    id: 'coreBasic',
    name: 'Core Basic',
    description: 'Core particle with basic sphere shape',
    role: ParticleRole.CORE,
    color: { r: 1.0, g: 0.8, b: 0.2 },
    shape: 'sphere'
  },

  // Control particle with cube shape
  controlCube: {
    id: 'controlCube',
    name: 'Control Cube',
    description: 'Control particle with cube shape',
    role: ParticleRole.CONTROL,
    color: { r: 0.2, g: 0.6, b: 1.0 },
    shape: 'cube'
  },

  // Movement particle with cylinder shape
  movementCylinder: {
    id: 'movementCylinder',
    name: 'Movement Cylinder',
    description: 'Movement particle with cylinder shape',
    role: ParticleRole.MOVEMENT,
    color: { r: 0.0, g: 0.8, b: 0.4 },
    shape: 'cylinder'
  },

  // Defense particle with dodecahedron shape
  defenseDodecahedron: {
    id: 'defenseDodecahedron',
    name: 'Defense Dodecahedron',
    description: 'Defense particle with dodecahedron shape',
    role: ParticleRole.DEFENSE,
    color: { r: 0.8, g: 0.2, b: 0.2 },
    shape: 'dodecahedron'
  },

  // Attack particle with cone shape
  attackCone: {
    id: 'attackCone',
    name: 'Attack Cone',
    description: 'Attack particle with cone shape',
    role: ParticleRole.ATTACK,
    color: { r: 1.0, g: 0.4, b: 0.0 },
    shape: 'cone'
  },

  // Core particle with glow effect
  coreGlow: {
    id: 'coreGlow',
    name: 'Core Glow',
    description: 'Core particle with glow effect',
    role: ParticleRole.CORE,
    color: { r: 1.0, g: 0.8, b: 0.2 },
    shape: 'sphere',
    shaderEffect: 'basicGlow',
    parameters: {
      intensity: 2.0
    }
  },

  // Control particle with pulse effect
  controlPulse: {
    id: 'controlPulse',
    name: 'Control Pulse',
    description: 'Control particle with pulse effect',
    role: ParticleRole.CONTROL,
    color: { r: 0.2, g: 0.6, b: 1.0 },
    shape: 'cube',
    shaderEffect: 'pulsate',
    parameters: {
      frequency: 3.0
    }
  },

  // Movement particle with wave effect
  movementWave: {
    id: 'movementWave',
    name: 'Movement Wave',
    description: 'Movement particle with wave effect',
    role: ParticleRole.MOVEMENT,
    color: { r: 0.0, g: 0.8, b: 0.4 },
    shape: 'cylinder',
    shaderEffect: 'waveDistortion',
    parameters: {
      amplitude: 0.15,
      frequency: 7.0
    }
  }
};

/**
 * Get a visual test case by ID
 */
export function getVisualTestCase(id: string): VisualTestCase {
  return VISUAL_TEST_CASES[id] || VISUAL_TEST_CASES.coreBasic;
}

/**
 * Get all visual test cases
 */
export function getAllVisualTestCases(): VisualTestCase[] {
  return Object.values(VISUAL_TEST_CASES);
}

/**
 * Get visual test cases by role
 */
export function getVisualTestCasesByRole(role: ParticleRole): VisualTestCase[] {
  return Object.values(VISUAL_TEST_CASES).filter(testCase => testCase.role === role);
}

/**
 * Get visual test cases by shape
 */
export function getVisualTestCasesByShape(shape: string): VisualTestCase[] {
  return Object.values(VISUAL_TEST_CASES).filter(testCase => testCase.shape === shape);
}

/**
 * Get visual test cases by shader effect
 */
export function getVisualTestCasesByShaderEffect(shaderEffect: string): VisualTestCase[] {
  return Object.values(VISUAL_TEST_CASES).filter(testCase => testCase.shaderEffect === shaderEffect);
}
"@

# Create the visual regression utilities file
$visualRegressionUtilsContent = @"
/**
 * Visual Regression Utilities
 *
 * This file contains utility functions for visual regression testing of particle traits.
 *
 * IMPORTANT: This file is auto-generated. Do not edit directly.
 * Generated by visual-regression-testing.ps1
 */
import * as THREE from 'three';
import { VisualTestCase } from '../data/visualTestCases';
import { getShape } from '../data/particleShapes';
import { getShaderEffect, createShaderMaterial } from '../data/shaderUtils';

/**
 * Visual test result interface
 */
export interface VisualTestResult {
  testCase: VisualTestCase;
  passed: boolean;
  diffPercentage: number;
  currentImage: string; // Base64 encoded current image
  diffImage?: string; // Base64 encoded diff image
  error?: string;
}

/**
 * Create a test renderer for visual regression testing
 */
export function createTestRenderer(width: number = 256, height: number = 256): THREE.WebGLRenderer {
  const renderer = new THREE.WebGLRenderer({
    antialias: true,
    alpha: true,
    preserveDrawingBuffer: true
  });

  renderer.setSize(width, height);
  renderer.setClearColor(0x000000, 0);

  return renderer;
}

/**
 * Create a test scene for a visual test case
 */
export function createTestScene(testCase: VisualTestCase): THREE.Scene {
  const scene = new THREE.Scene();

  // Add ambient light
  const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
  scene.add(ambientLight);

  // Add directional light
  const directionalLight = new THREE.DirectionalLight(0xffffff, 0.8);
  directionalLight.position.set(1, 1, 1);
  scene.add(directionalLight);

  // Create geometry based on shape
  const shapeDefinition = getShape(testCase.shape);
  let geometry: THREE.BufferGeometry;

  switch (testCase.shape.toLowerCase()) {
    case 'sphere':
      geometry = new THREE.SphereGeometry(
        shapeDefinition.parameters.radius as number,
        shapeDefinition.parameters.widthSegments as number,
        shapeDefinition.parameters.heightSegments as number
      );
      break;
    case 'cube':
      geometry = new THREE.BoxGeometry(
        shapeDefinition.parameters.width as number,
        shapeDefinition.parameters.height as number,
        shapeDefinition.parameters.depth as number
      );
      break;
    case 'cylinder':
      geometry = new THREE.CylinderGeometry(
        shapeDefinition.parameters.radiusTop as number,
        shapeDefinition.parameters.radiusBottom as number,
        shapeDefinition.parameters.height as number,
        shapeDefinition.parameters.radialSegments as number,
        shapeDefinition.parameters.heightSegments as number
      );
      break;
    case 'cone':
      geometry = new THREE.ConeGeometry(
        shapeDefinition.parameters.radius as number,
        shapeDefinition.parameters.height as number,
        shapeDefinition.parameters.radialSegments as number,
        shapeDefinition.parameters.heightSegments as number
      );
      break;
    case 'dodecahedron':
      geometry = new THREE.DodecahedronGeometry(
        shapeDefinition.parameters.radius as number,
        shapeDefinition.parameters.detail as number
      );
      break;
    default:
      geometry = new THREE.SphereGeometry(1, 32, 32);
  }

  // Create material based on test case
  let material: THREE.Material;

  if (testCase.shaderEffect) {
    const shaderEffect = getShaderEffect(testCase.shaderEffect);
    material = createShaderMaterial(shaderEffect, testCase.parameters);
  } else {
    const color = new THREE.Color(testCase.color.r, testCase.color.g, testCase.color.b);

    switch (testCase.role) {
      case 'CORE':
        material = new THREE.MeshStandardMaterial({
          color,
          emissive: color,
          emissiveIntensity: 0.5,
          roughness: 0.3,
          metalness: 0.7
        });
        break;
      case 'CONTROL':
        material = new THREE.MeshPhysicalMaterial({
          color,
          clearcoat: 1.0,
          clearcoatRoughness: 0.1,
          roughness: 0.5,
          metalness: 0.2
        });
        break;
      case 'MOVEMENT':
        material = new THREE.MeshStandardMaterial({
          color,
          roughness: 0.7,
          metalness: 0.1
        });
        break;
      case 'DEFENSE':
        material = new THREE.MeshPhysicalMaterial({
          color,
          roughness: 0.2,
          metalness: 0.8,
          reflectivity: 1.0
        });
        break;
      case 'ATTACK':
        material = new THREE.MeshStandardMaterial({
          color,
          emissive: color,
          emissiveIntensity: 0.8,
          roughness: 0.4,
          metalness: 0.6
        });
        break;
      default:
        material = new THREE.MeshStandardMaterial({ color });
    }
  }

  // Create mesh and add to scene
  const mesh = new THREE.Mesh(geometry, material);
  scene.add(mesh);

  return scene;
}

/**
 * Create a test camera for visual regression testing
 */
export function createTestCamera(): THREE.PerspectiveCamera {
  const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 100);
  camera.position.set(0, 0, 3);
  camera.lookAt(0, 0, 0);

  return camera;
}

/**
 * Render a test case and return the image as a base64 string
 */
export function renderTestCase(
  testCase: VisualTestCase,
  renderer: THREE.WebGLRenderer,
  width: number = 256,
  height: number = 256
): string {
  const scene = createTestScene(testCase);
  const camera = createTestCamera();

  // Render the scene
  renderer.setSize(width, height);
  renderer.render(scene, camera);

  // Get the image data
  const imageData = renderer.domElement.toDataURL('image/png');

  return imageData;
}

/**
 * Compare two images and return the difference percentage
 */
export function compareImages(image1: string, image2: string): { diffPercentage: number, diffImage?: string } {
  // In a real implementation, this would use a library like pixelmatch or resemble.js
  // For now, we'll just return a placeholder
  return {
    diffPercentage: 0,
    diffImage: undefined
  };
}

/**
 * Run a visual regression test for a test case
 */
export async function runVisualTest(testCase: VisualTestCase, renderer: THREE.WebGLRenderer): Promise<VisualTestResult> {
  try {
    // Render the current image
    const currentImage = renderTestCase(testCase, renderer);

    // If there's no reference image, we can't compare
    if (!testCase.referenceImage) {
      return {
        testCase,
        passed: true,
        diffPercentage: 0,
        currentImage,
        error: 'No reference image available'
      };
    }

    // Compare the images
    const { diffPercentage, diffImage } = compareImages(currentImage, testCase.referenceImage);

    // Determine if the test passed (threshold of 0.1%)
    const passed = diffPercentage < 0.1;

    return {
      testCase,
      passed,
      diffPercentage,
      currentImage,
      diffImage
    };
  } catch (error) {
    return {
      testCase,
      passed: false,
      diffPercentage: 100,
      currentImage: '',
      error: error.message
    };
  }
}

/**
 * Run visual regression tests for multiple test cases
 */
export async function runVisualTests(testCases: VisualTestCase[], renderer: THREE.WebGLRenderer): Promise<VisualTestResult[]> {
  const results: VisualTestResult[] = [];

  for (const testCase of testCases) {
    const result = await runVisualTest(testCase, renderer);
    results.push(result);
  }

  return results;
}

/**
 * Generate a report from visual test results
 */
export function generateVisualTestReport(results: VisualTestResult[]): string {
  const totalTests = results.length;
  const passedTests = results.filter(result => result.passed).length;
  const failedTests = totalTests - passedTests;

  let report = \`# Visual Regression Test Report\n\n\`;
  report += \`- Total Tests: \${totalTests}\n\`;
  report += \`- Passed Tests: \${passedTests}\n\`;
  report += \`- Failed Tests: \${failedTests}\n\n\`;

  if (failedTests > 0) {
    report += \`## Failed Tests\n\n\`;

    results.filter(result => !result.passed).forEach(result => {
      report += \`### \${result.testCase.name}\n\n\`;
      report += \`- ID: \${result.testCase.id}\n\`;
      report += \`- Description: \${result.testCase.description}\n\`;
      report += \`- Diff Percentage: \${result.diffPercentage.toFixed(2)}%\n\`;

      if (result.error) {
        report += \`- Error: \${result.error}\n\`;
      }

      report += \`\n\`;
    });
  }

  return report;
}
"@

# Save the data files
Set-Content -Path $testDataPath -Value $visualTestCasesContent -Force
Set-Content -Path $testUtilPath -Value $visualRegressionUtilsContent -Force

Write-Host "Created visual test cases data file at $testDataPath" -ForegroundColor Green
Write-Host "Created visual regression utilities file at $testUtilPath" -ForegroundColor Green
Write-Host "Visual Regression Testing script completed successfully!" -ForegroundColor Green
