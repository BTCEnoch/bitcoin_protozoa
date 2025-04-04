/**
 * TraitVisualizer Component
 *
 * This component provides a visual preview of particle traits,
 * allowing developers to see how different traits will appear
 * when applied to particles.
 */
import React, { useRef, useState } from 'react';
import { Canvas, useFrame } from '@react-three/fiber';
import { OrbitControls } from '@react-three/drei';
import * as THREE from 'three';
import { TraitVisualizerProps, VisualizationMode, TraitCombination } from './types';
import './global.css';
import { ParticleRole } from '../../../particle/types';
import { COLOR_PALETTES, getPalette } from '../../data/colorPalettes';
import { SHAPE_DEFINITIONS, getShape } from '../../data/particleShapes';

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
          key={`${combo.role}-${index}`}
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
  onTraitSelect
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

  // Get all available shapes
  const shapes = Object.entries(SHAPE_DEFINITIONS).map(([key, shape]) => ({
    key,
    name: shape.name,
    category: shape.category
  }));

  return (
    <div className="trait-visualizer">
      <div className="trait-visualizer__header">
        <h2 className="trait-visualizer__title">Visual Trait Previewer</h2>
      </div>

      <div className="trait-visualizer__tabs">
        <div
          className={`trait-visualizer__tab ${visualizationMode === VisualizationMode.ISOLATED ? 'trait-visualizer__tab--active' : ''}`}
          onClick={() => handleModeChange(VisualizationMode.ISOLATED)}
        >
          Single Trait
        </div>
        <div
          className={`trait-visualizer__tab ${visualizationMode === VisualizationMode.COMBINED ? 'trait-visualizer__tab--active' : ''}`}
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
              {Object.entries(ParticleRole)
                .filter(([_, value]) => typeof value === 'string')
                .map(([key, value]) => (
                  <option key={key} value={value}>{key}</option>
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
                <strong>Role:</strong> {ParticleRole[selectedRole]}
              </div>
              <div className="trait-visualizer__info-item">
                <strong>Color:</strong>
                <span
                  className="trait-visualizer__color-preview"
                  style={{
                    backgroundColor: `rgb(${getColorForRole(selectedRole).r * 255}, ${getColorForRole(selectedRole).g * 255}, ${getColorForRole(selectedRole).b * 255})`
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
                <strong>Roles:</strong> {Object.keys(ParticleRole).filter(key => isNaN(Number(key))).join(', ')}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default TraitVisualizer;
