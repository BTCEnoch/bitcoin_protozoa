# Visual Trait Previewer
#
# This script creates a tool to preview visual traits in isolation and combination
# for the Bitcoin Protozoa project. It allows developers to visualize how different
# traits will appear when applied to particles.
#
# Features:
# - Creates a React component for previewing visual traits
# - Implements trait combination visualization
# - Provides a UI for selecting and previewing traits
# - Supports different rendering modes (isolated, combined)
# - Integrates with the trait system for real-time preview

# Configuration
$componentPath = "src\domains\trait\components\TraitVisualizer"
$indexPath = "$componentPath\index.tsx"
$typesPath = "$componentPath\types.ts"
$stylesPath = "$componentPath\styles.ts"

# Ensure the directory exists
function Ensure-Directory {
    param (
        [string]$path
    )

    if (-not (Test-Path -Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created directory: $path"
    }
}

# Create the component directory
Ensure-Directory -path $componentPath

# Create the types file
$typesContent = @"
/**
 * Types for TraitVisualizer component
 *
 * This file contains type definitions for the TraitVisualizer component,
 * which is used to preview visual traits in isolation and combination.
 */
import { Color } from '../../data/colorPalettes';
import { ShapeDefinition, ShapeModifier } from '../../data/particleShapes';
import { ParticleRole } from '../../../particle/types';

/**
 * Trait visualizer props
 */
export interface TraitVisualizerProps {
  /**
   * Initial particle role to display
   */
  initialRole?: ParticleRole;

  /**
   * Initial color to display
   */
  initialColor?: Color;

  /**
   * Initial shape to display
   */
  initialShape?: string;

  /**
   * Whether to show controls for selecting traits
   */
  showControls?: boolean;

  /**
   * Whether to show all roles at once
   */
  showAllRoles?: boolean;

  /**
   * Callback when a trait is selected
   */
  onTraitSelect?: (role: ParticleRole, color: Color, shape: string) => void;

  /**
   * Custom class name
   */
  className?: string;
}

/**
 * Visualization mode
 */
export enum VisualizationMode {
  /**
   * Show traits in isolation
   */
  ISOLATED = 'isolated',

  /**
   * Show traits in combination
   */
  COMBINED = 'combined'
}

/**
 * Trait combination
 */
export interface TraitCombination {
  /**
   * Particle role
   */
  role: ParticleRole;

  /**
   * Color for the role
   */
  color: Color;

  /**
   * Shape for the role
   */
  shape: string;

  /**
   * Shape modifiers
   */
  modifiers?: ShapeModifier[];
}
"@

# Create the styles file
$stylesContent = @"
/**
 * Styles for TraitVisualizer component
 */
import { css } from '@emotion/react';

export const TraitVisualizerStyles = css\`
  .trait-visualizer {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    min-height: 400px;
    background-color: #1a1a1a;
    border-radius: 8px;
    overflow: hidden;
  }

  .trait-visualizer__header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px;
    background-color: #2a2a2a;
    border-bottom: 1px solid #3a3a3a;
  }

  .trait-visualizer__title {
    font-size: 18px;
    font-weight: 600;
    color: #f7931a;
    margin: 0;
  }

  .trait-visualizer__controls {
    display: flex;
    flex-wrap: wrap;
    gap: 16px;
    padding: 16px;
    background-color: #2a2a2a;
    border-bottom: 1px solid #3a3a3a;
  }

  .trait-visualizer__control-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  .trait-visualizer__label {
    font-size: 14px;
    font-weight: 500;
    color: #ffffff;
  }

  .trait-visualizer__select {
    padding: 8px 12px;
    background-color: #3a3a3a;
    border: 1px solid #4a4a4a;
    border-radius: 4px;
    color: #ffffff;
    font-size: 14px;
    min-width: 150px;
  }

  .trait-visualizer__canvas-container {
    flex: 1;
    position: relative;
    overflow: hidden;
  }

  .trait-visualizer__canvas {
    width: 100%;
    height: 100%;
  }

  .trait-visualizer__info-panel {
    position: absolute;
    bottom: 16px;
    right: 16px;
    background-color: rgba(0, 0, 0, 0.7);
    padding: 12px;
    border-radius: 4px;
    color: #ffffff;
    font-size: 14px;
    max-width: 300px;
  }

  .trait-visualizer__info-title {
    font-weight: 600;
    margin-bottom: 8px;
    color: #f7931a;
  }

  .trait-visualizer__info-item {
    margin-bottom: 4px;
  }

  .trait-visualizer__color-preview {
    display: inline-block;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    margin-right: 8px;
    vertical-align: middle;
  }

  .trait-visualizer__tabs {
    display: flex;
    background-color: #2a2a2a;
    border-bottom: 1px solid #3a3a3a;
  }

  .trait-visualizer__tab {
    padding: 12px 16px;
    font-size: 14px;
    font-weight: 500;
    color: #cccccc;
    cursor: pointer;
    border-bottom: 2px solid transparent;
    transition: all 0.2s ease;
  }

  .trait-visualizer__tab--active {
    color: #f7931a;
    border-bottom-color: #f7931a;
  }

  .trait-visualizer__tab:hover {
    color: #ffffff;
  }
\`;
"@

# First part of the index file
$indexContent1 = @"
/**
 * TraitVisualizer Component
 *
 * This component provides a visual preview of particle traits,
 * allowing developers to see how different traits will appear
 * when applied to particles.
 */
import React, { useEffect, useRef, useState } from 'react';
import { Canvas, useFrame } from '@react-three/fiber';
import { OrbitControls } from '@react-three/drei';
import * as THREE from 'three';
import { TraitVisualizerProps, VisualizationMode, TraitCombination } from './types';
import { TraitVisualizerStyles } from './styles';
import { ParticleRole } from '../../../particle/types';
import { COLOR_PALETTES, getPalette, getAllPalettes } from '../../data/colorPalettes';
import { SHAPE_DEFINITIONS, getShape, getShapesByCategory } from '../../data/particleShapes';

/**
 * Particle mesh component for rendering a single particle
 */
const ParticleMesh: React.FC<{
  role: ParticleRole;
  color: { r: number; g: number; b: number };
  shape: string;
  position?: [number, number, number];
  rotation?: [number, number, number];
  scale?: number;
}> = ({ role, color, shape, position = [0, 0, 0], rotation = [0, 0, 0], scale = 1 }) => {
  const meshRef = useRef<THREE.Mesh>(null);
  const shapeDefinition = getShape(shape);

  // Rotate the particle slowly
  useFrame(() => {
    if (meshRef.current) {
      meshRef.current.rotation.x += 0.005;
      meshRef.current.rotation.y += 0.01;
    }
  });

  // Create geometry based on shape definition
  const getGeometry = () => {
    const params = shapeDefinition.parameters;

    switch (shape.toLowerCase()) {
      case 'sphere':
        return (
          <sphereGeometry
            args={[
              params.radius as number,
              params.widthSegments as number,
              params.heightSegments as number
            ]}
          />
        );
      case 'cube':
        return (
          <boxGeometry
            args={[
              params.width as number,
              params.height as number,
              params.depth as number
            ]}
          />
        );
      case 'cylinder':
        return (
          <cylinderGeometry
            args={[
              params.radiusTop as number,
              params.radiusBottom as number,
              params.height as number,
              params.radialSegments as number,
              params.heightSegments as number
            ]}
          />
        );
      case 'cone':
        return (
          <coneGeometry
            args={[
              params.radius as number,
              params.height as number,
              params.radialSegments as number,
              params.heightSegments as number
            ]}
          />
        );
      case 'torus':
        return (
          <torusGeometry
            args={[
              params.radius as number,
              params.tube as number,
              params.radialSegments as number,
              params.tubularSegments as number
            ]}
          />
        );
      case 'torusknot':
        return (
          <torusKnotGeometry
            args={[
              params.radius as number,
              params.tube as number,
              params.tubularSegments as number,
              params.radialSegments as number,
              params.p as number,
              params.q as number
            ]}
          />
        );
      default:
        return <sphereGeometry args={[1, 32, 32]} />;
    }
  };
"@

# Second part of the index file
$indexContent2 = @"
  // Create material based on role and color
  const getMaterial = () => {
    const threeColor = new THREE.Color(color.r, color.g, color.b);

    // Apply different material based on role
    switch (role) {
      case ParticleRole.CORE:
        return (
          <meshStandardMaterial
            color={threeColor}
            emissive={threeColor}
            emissiveIntensity={0.5}
            roughness={0.3}
            metalness={0.7}
          />
        );
      case ParticleRole.CONTROL:
        return (
          <meshPhysicalMaterial
            color={threeColor}
            clearcoat={1.0}
            clearcoatRoughness={0.1}
            roughness={0.5}
            metalness={0.2}
          />
        );
      case ParticleRole.MOVEMENT:
        return (
          <meshStandardMaterial
            color={threeColor}
            roughness={0.7}
            metalness={0.1}
          />
        );
      case ParticleRole.DEFENSE:
        return (
          <meshPhysicalMaterial
            color={threeColor}
            roughness={0.2}
            metalness={0.8}
            reflectivity={1.0}
          />
        );
      case ParticleRole.ATTACK:
        return (
          <meshStandardMaterial
            color={threeColor}
            emissive={threeColor}
            emissiveIntensity={0.8}
            roughness={0.4}
            metalness={0.6}
          />
        );
      default:
        return <meshStandardMaterial color={threeColor} />;
    }
  };

  return (
    <mesh
      ref={meshRef}
      position={position}
      rotation={rotation}
      scale={[scale, scale, scale]}
    >
      {getGeometry()}
      {getMaterial()}
    </mesh>
  );
};

/**
 * Scene component for rendering multiple particles
 */
const ParticleScene: React.FC<{
  combinations: TraitCombination[];
  mode: VisualizationMode;
}> = ({ combinations, mode }) => {
  // Position particles based on mode
  const getParticlePosition = (index: number, total: number): [number, number, number] => {
    if (mode === VisualizationMode.ISOLATED) {
      // Position in a horizontal line
      const spacing = 3;
      const offset = (total - 1) * spacing / 2;
      return [index * spacing - offset, 0, 0];
    } else {
      // Position in a formation
      const radius = 3;
      const angle = (index / total) * Math.PI * 2;
      return [
        Math.sin(angle) * radius,
        0,
        Math.cos(angle) * radius
      ];
    }
  };

  return (
    <>
      <ambientLight intensity={0.5} />
      <pointLight position={[10, 10, 10]} intensity={1.0} />
      <pointLight position={[-10, -10, -10]} intensity={0.5} />

      {combinations.map((combo, index) => (
        <ParticleMesh
          key={\`\${combo.role}-\${index}\`}
          role={combo.role}
          color={combo.color}
          shape={combo.shape}
          position={getParticlePosition(index, combinations.length)}
          scale={combo.role === ParticleRole.CORE ? 1.5 : 1.0}
        />
      ))}

      <OrbitControls enableZoom={true} enablePan={true} enableRotate={true} />
    </>
  );
};

/**
 * TraitVisualizer Component
 */
const TraitVisualizer: React.FC<TraitVisualizerProps> = ({
  initialRole = ParticleRole.CORE,
  initialColor,
  initialShape = 'sphere',
  showControls = true,
  showAllRoles = false,
  onTraitSelect,
  className
}) => {
  // State
  const [selectedRole, setSelectedRole] = useState<ParticleRole>(initialRole);
  const [selectedPalette, setSelectedPalette] = useState<string>('bitcoinClassic');
  const [selectedShape, setSelectedShape] = useState<string>(initialShape);
  const [visualizationMode, setVisualizationMode] = useState<VisualizationMode>(
    showAllRoles ? VisualizationMode.COMBINED : VisualizationMode.ISOLATED
  );

  // Get color from palette
  const getColorForRole = (role: ParticleRole) => {
    const palette = getPalette(selectedPalette);
    return palette[role];
  };

  // Create trait combinations based on mode
  const getTraitCombinations = (): TraitCombination[] => {
    if (visualizationMode === VisualizationMode.ISOLATED) {
      return [{
        role: selectedRole,
        color: initialColor || getColorForRole(selectedRole),
        shape: selectedShape
      }];
    } else {
      // Create a combination for each role
      return Object.values(ParticleRole)
        .filter(role => typeof role === 'string')
        .map(role => ({
          role: role as ParticleRole,
          color: getColorForRole(role as ParticleRole),
          shape: role === ParticleRole.CORE ? 'sphere' :
                 role === ParticleRole.CONTROL ? 'cube' :
                 role === ParticleRole.MOVEMENT ? 'cylinder' :
                 role === ParticleRole.DEFENSE ? 'dodecahedron' :
                 'cone'
        }));
    }
  };
"@

# Third part of the index file
$indexContent3 = @"
  // Handle role change
  const handleRoleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const role = e.target.value as ParticleRole;
    setSelectedRole(role);

    if (onTraitSelect) {
      onTraitSelect(role, getColorForRole(role), selectedShape);
    }
  };

  // Handle palette change
  const handlePaletteChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setSelectedPalette(e.target.value);
  };

  // Handle shape change
  const handleShapeChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const shape = e.target.value;
    setSelectedShape(shape);

    if (onTraitSelect) {
      onTraitSelect(selectedRole, getColorForRole(selectedRole), shape);
    }
  };

  // Handle mode change
  const handleModeChange = (mode: VisualizationMode) => {
    setVisualizationMode(mode);
  };

  // Get all available palettes
  const palettes = getAllPalettes();

  // Get all available shapes
  const shapes = Object.entries(SHAPE_DEFINITIONS).map(([key, shape]) => ({
    key,
    name: shape.name,
    category: shape.category
  }));

  return (
    <div className={\`trait-visualizer \${className || ''}\`} css={TraitVisualizerStyles}>
      <div className="trait-visualizer__header">
        <h2 className="trait-visualizer__title">Visual Trait Previewer</h2>
      </div>

      <div className="trait-visualizer__tabs">
        <div
          className={\`trait-visualizer__tab \${visualizationMode === VisualizationMode.ISOLATED ? 'trait-visualizer__tab--active' : ''}\`}
          onClick={() => handleModeChange(VisualizationMode.ISOLATED)}
        >
          Single Trait
        </div>
        <div
          className={\`trait-visualizer__tab \${visualizationMode === VisualizationMode.COMBINED ? 'trait-visualizer__tab--active' : ''}\`}
          onClick={() => handleModeChange(VisualizationMode.COMBINED)}
        >
          Combined Traits
        </div>
      </div>

      {showControls && visualizationMode === VisualizationMode.ISOLATED && (
        <div className="trait-visualizer__controls">
          <div className="trait-visualizer__control-group">
            <label className="trait-visualizer__label">Particle Role</label>
            <select
              className="trait-visualizer__select"
              value={selectedRole}
              onChange={handleRoleChange}
            >
              {Object.values(ParticleRole)
                .filter(role => typeof role === 'string')
                .map(role => (
                  <option key={role} value={role}>{role}</option>
                ))}
            </select>
          </div>

          <div className="trait-visualizer__control-group">
            <label className="trait-visualizer__label">Color Palette</label>
            <select
              className="trait-visualizer__select"
              value={selectedPalette}
              onChange={handlePaletteChange}
            >
              {Object.keys(COLOR_PALETTES).map(key => (
                <option key={key} value={key}>{COLOR_PALETTES[key].name}</option>
              ))}
            </select>
          </div>

          <div className="trait-visualizer__control-group">
            <label className="trait-visualizer__label">Shape</label>
            <select
              className="trait-visualizer__select"
              value={selectedShape}
              onChange={handleShapeChange}
            >
              {shapes.map(shape => (
                <option key={shape.key} value={shape.key}>{shape.name}</option>
              ))}
            </select>
          </div>
        </div>
      )}

      <div className="trait-visualizer__canvas-container">
        <Canvas className="trait-visualizer__canvas">
          <ParticleScene
            combinations={getTraitCombinations()}
            mode={visualizationMode}
          />
        </Canvas>

        <div className="trait-visualizer__info-panel">
          <div className="trait-visualizer__info-title">
            {visualizationMode === VisualizationMode.ISOLATED ? 'Trait Information' : 'Particle Group'}
          </div>

          {visualizationMode === VisualizationMode.ISOLATED ? (
            <>
              <div className="trait-visualizer__info-item">
                <strong>Role:</strong> {selectedRole}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Color:</strong>
                <span
                  className="trait-visualizer__color-preview"
                  style={{
                    backgroundColor: \`rgb(\${getColorForRole(selectedRole).r * 255}, \${getColorForRole(selectedRole).g * 255}, \${getColorForRole(selectedRole).b * 255})\`
                  }}
                ></span>
                {selectedPalette}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Shape:</strong> {getShape(selectedShape).name}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Category:</strong> {getShape(selectedShape).category}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Rarity:</strong> {getShape(selectedShape).rarity}
              </div>
            </>
          ) : (
            <>
              <div className="trait-visualizer__info-item">
                <strong>Palette:</strong> {getPalette(selectedPalette).name}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Category:</strong> {getPalette(selectedPalette).category}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Roles:</strong> {Object.values(ParticleRole).filter(role => typeof role === 'string').join(', ')}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default TraitVisualizer;
"@

# Combine the index content
$fullIndexContent = $indexContent1 + $indexContent2 + $indexContent3

# Save the files
Set-Content -Path $typesPath -Value $typesContent
Set-Content -Path $stylesPath -Value $stylesContent
Set-Content -Path $indexPath -Value $fullIndexContent

Write-Host "Created types file at $typesPath" -ForegroundColor Green
Write-Host "Created styles file at $stylesPath" -ForegroundColor Green
Write-Host "Created index file at $indexPath" -ForegroundColor Green
