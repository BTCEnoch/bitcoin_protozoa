/**
 * Types for TraitVisualizer component
 *
 * This file contains type definitions for the TraitVisualizer component,
 * which is used to preview visual traits in isolation and combination.
 */
import { Color } from '../../data/colorPalettes';
import { ShapeModifier } from '../../data/particleShapes';
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
