/**
 * Shader Utilities
 *
 * This file contains utility functions for working with shaders in the Bitcoin Protozoa project.
 *
 * IMPORTANT: This file is auto-generated. Do not edit directly.
 * Generated by shader-generator.ps1
 */
import * as THREE from 'three';
import { ShaderEffect, ShaderParameter } from './shaderEffects';

/**
 * Create a shader material from a shader effect
 */
export function createShaderMaterial(effect: ShaderEffect, parameters: Record<string, any> = {}): THREE.ShaderMaterial {
  // Create uniforms object
  const uniforms: Record<string, THREE.IUniform> = {
    time: { value: 0 }
  };

  // Add effect parameters as uniforms
  effect.parameters.forEach(param => {
    const value = parameters[param.name] !== undefined ? parameters[param.name] : param.defaultValue;
    uniforms[param.name] = { value };
  });

  // Create shader material
  return new THREE.ShaderMaterial({
    uniforms,
    vertexShader: effect.vertexShader,
    fragmentShader: effect.fragmentShader,
    transparent: true,
    depthWrite: false,
    depthTest: true
  });
}

/**
 * Update shader material uniforms
 */
export function updateShaderUniforms(material: THREE.ShaderMaterial, time: number, parameters: Record<string, any> = {}): void {
  if (material.uniforms.time) {
    material.uniforms.time.value = time;
  }

  // Update other uniforms
  Object.entries(parameters).forEach(([key, value]) => {
    if (material.uniforms[key]) {
      material.uniforms[key].value = value;
    }
  });
}

/**
 * Create a parameter control component for a shader parameter
 */
export function createParameterControl(param: ShaderParameter, value: any, onChange: (value: any) => void): JSX.Element {
  switch (param.type) {
    case 'float':
    case 'int':
      return (
        <div key={param.name} className="shader-parameter">
          <label>{param.name}</label>
          <input
            type="range"
            min={param.min || 0}
            max={param.max || 1}
            step={param.type === 'float' ? 0.01 : 1}
            value={value}
            onChange={(e) => onChange(parseFloat(e.target.value))}
          />
          <span>{value.toFixed(2)}</span>
        </div>
      );

    case 'color':
      return (
        <div key={param.name} className="shader-parameter">
          <label>{param.name}</label>
          <input
            type="color"
            value={rgbToHex(value.r, value.g, value.b)}
            onChange={(e) => {
              const { r, g, b } = hexToRgb(e.target.value);
              onChange({ r, g, b });
            }}
          />
        </div>
      );

    default:
      return null;
  }
}

/**
 * Convert RGB to hex color
 */
function rgbToHex(r: number, g: number, b: number): string {
  const toHex = (c: number) => {
    const hex = Math.round(c * 255).toString(16);
    return hex.length === 1 ? '0' + hex : hex;
  };

  return \#\\\\;
}

/**
 * Convert hex color to RGB
 */
function hexToRgb(hex: string): { r: number, g: number, b: number } {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result ? {
    r: parseInt(result[1], 16) / 255,
    g: parseInt(result[2], 16) / 255,
    b: parseInt(result[3], 16) / 255
  } : { r: 0, g: 0, b: 0 };
}
