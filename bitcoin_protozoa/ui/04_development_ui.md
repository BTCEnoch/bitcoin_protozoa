# Development UI

This document outlines the Development UI for the Bitcoin Protozoa project, which provides a robust interface for testing, parameter adjustment, and visualization of the particle ecosystem during development.

## Table of Contents

1. [Overview](#overview) [Line 20]
2. [Core Requirements](#core-requirements) [Line 30]
3. [UI Components](#ui-components) [Line 50]
   - [Main Visualization Area](#main-visualization-area) [Line 55]
   - [Control Panel](#control-panel) [Line 70]
   - [Block Data Controls](#block-data-controls) [Line 90]
   - [Role Management](#role-management) [Line 110]
   - [Force Field Editor](#force-field-editor) [Line 130]
   - [Debug Visualization](#debug-visualization) [Line 150]
4. [Implementation Approach](#implementation-approach) [Line 170]
   - [Component Architecture](#component-architecture) [Line 175]
   - [Technology Stack](#technology-stack) [Line 190]
   - [Parameter Categories](#parameter-categories) [Line 210]
5. [Preset System](#preset-system) [Line 250]
6. [Development-Only Code Separation](#development-only-code-separation) [Line 280]
7. [Transition to Production](#transition-to-production) [Line 310]
8. [Production UI](#production-ui) [Line 330]
9. [Implementation Guidelines](#implementation-guidelines) [Line 350]
10. [Related Documents](#related-documents) [Line 370]

## Overview

The Development UI is a critical component during the development phase, providing a robust interface for testing, parameter adjustment, and visualization of the particle ecosystem. This UI will not be included in the final production version that will be inscribed on Bitcoin.

The Development UI serves several key purposes:

1. **Testing and Debugging**: Provides tools to test and debug the particle system
2. **Parameter Tuning**: Allows for real-time adjustment of system parameters
3. **Visual Verification**: Enables visual verification of particle behaviors
4. **Preset Management**: Facilitates creation and management of parameter presets
5. **Block Data Simulation**: Simulates Bitcoin block data for testing

## Core Requirements

1. **Full Visualization**: Clear, full-screen view of the particle simulation
2. **Parameter Controls**: Interface to adjust and test different properties and variables
3. **Data Overlays**: Display of relevant metrics and system state
4. **Debugging Tools**: Visualization of force fields, collision detection, and other internal systems
5. **Preset Management**: Tools to create and save presets for trait assets

The Development UI must be:

- **Responsive**: Adapts to different screen sizes and resolutions
- **Performant**: Minimal impact on simulation performance
- **Intuitive**: Easy to use for developers and testers
- **Comprehensive**: Provides access to all relevant parameters and data
- **Separable**: Easily removable for production builds

## UI Components

### Main Visualization Area

- Full-screen canvas for particle rendering
- Toggle for different visualization modes (normal, debug, wireframe)
- Camera controls for zooming, panning, and rotating
- Performance metrics overlay (FPS, particle count, etc.)

The visualization area is the central component of the Development UI, providing a clear view of the particle simulation. It includes:

```tsx
const VisualizationArea = () => {
  const [viewMode, setViewMode] = useState<'normal' | 'debug' | 'wireframe'>('normal');
  const [showMetrics, setShowMetrics] = useState(true);

  return (
    <div className="visualization-area">
      <Canvas>
        <ParticleRenderer viewMode={viewMode} />
        <CameraControls />
        <DebugOverlay active={viewMode === 'debug'} />
      </Canvas>

      <div className="visualization-controls">
        <button onClick={() => setViewMode('normal')}>Normal</button>
        <button onClick={() => setViewMode('debug')}>Debug</button>
        <button onClick={() => setViewMode('wireframe')}>Wireframe</button>
        <button onClick={() => setShowMetrics(!showMetrics)}>
          {showMetrics ? 'Hide Metrics' : 'Show Metrics'}
        </button>
      </div>

      {showMetrics && <PerformanceMetrics />}
    </div>
  );
};
```

### Control Panel

- Collapsible sidebar for parameter adjustments
- Organized into logical sections (Physics, Particles, Force Fields, etc.)
- Real-time parameter adjustment with immediate visual feedback
- Preset saving and loading functionality

The control panel provides access to all adjustable parameters in the system, organized into logical categories:

```tsx
const ControlPanel = () => {
  const [expanded, setExpanded] = useState(true);
  const [activeTab, setActiveTab] = useState('physics');

  return (
    <div className={`control-panel ${expanded ? 'expanded' : 'collapsed'}`}>
      <div className="control-panel-header">
        <h2>Control Panel</h2>
        <button onClick={() => setExpanded(!expanded)}>
          {expanded ? 'Collapse' : 'Expand'}
        </button>
      </div>

      {expanded && (
        <>
          <div className="control-panel-tabs">
            <button
              className={activeTab === 'physics' ? 'active' : ''}
              onClick={() => setActiveTab('physics')}
            >
              Physics
            </button>
            <button
              className={activeTab === 'particles' ? 'active' : ''}
              onClick={() => setActiveTab('particles')}
            >
              Particles
            </button>
            <button
              className={activeTab === 'forceFields' ? 'active' : ''}
              onClick={() => setActiveTab('forceFields')}
            >
              Force Fields
            </button>
            <button
              className={activeTab === 'roles' ? 'active' : ''}
              onClick={() => setActiveTab('roles')}
            >
              Roles
            </button>
            <button
              className={activeTab === 'system' ? 'active' : ''}
              onClick={() => setActiveTab('system')}
            >
              System
            </button>
          </div>

          <div className="control-panel-content">
            {activeTab === 'physics' && <PhysicsControls />}
            {activeTab === 'particles' && <ParticleControls />}
            {activeTab === 'forceFields' && <ForceFieldControls />}
            {activeTab === 'roles' && <RoleControls />}
            {activeTab === 'system' && <SystemControls />}
          </div>

          <div className="control-panel-presets">
            <PresetManager />
          </div>
        </>
      )}
    </div>
  );
};
```

### Block Data Controls

- Block height input for deterministic creature generation
- Block data display (nonce and confirmations only, as per project requirements)
- Manual override options for testing specific scenarios
- Simulation of confirmation increases for evolution testing

The block data controls allow for testing with different Bitcoin block data:

```tsx
const BlockDataControls = () => {
  const [blockHeight, setBlockHeight] = useState(750000);
  const [nonce, setNonce] = useState(0);
  const [confirmations, setConfirmations] = useState(0);
  const [manualOverride, setManualOverride] = useState(false);
  const [loading, setLoading] = useState(false);

  const fetchBlockData = async () => {
    try {
      setLoading(true);
      // In development, we use a mock API or the actual API
      const response = await fetch(`/r/blockinfo/${blockHeight}`);
      const data = await response.json();

      if (!manualOverride) {
        setNonce(data.nonce);
        setConfirmations(data.confirmations);
      }
    } catch (error) {
      console.error('Failed to fetch block data:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleBlockHeightChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = parseInt(e.target.value, 10);
    if (!isNaN(value) && value >= 0) {
      setBlockHeight(value);
    }
  };

  const simulateConfirmationIncrease = () => {
    setConfirmations(prev => prev + 1);
  };

  const simulateMilestone = (milestone: number) => {
    setConfirmations(milestone);
  };

  return (
    <div className="block-data-controls">
      <h3>Block Data</h3>

      <div className="block-height-input">
        <label htmlFor="block-height">Block Height:</label>
        <input
          id="block-height"
          type="number"
          value={blockHeight}
          onChange={handleBlockHeightChange}
          min="0"
        />
        <button onClick={fetchBlockData} disabled={loading}>
          {loading ? 'Loading...' : 'Fetch'}
        </button>
      </div>

      <div className="block-data-display">
        <div>
          <span>Nonce:</span>
          <input
            type="number"
            value={nonce}
            onChange={(e) => setNonce(parseInt(e.target.value, 10))}
            disabled={!manualOverride}
          />
        </div>
        <div>
          <span>Confirmations:</span>
          <input
            type="number"
            value={confirmations}
            onChange={(e) => setConfirmations(parseInt(e.target.value, 10))}
            disabled={!manualOverride}
          />
        </div>
      </div>

      <div className="manual-override">
        <label>
          <input
            type="checkbox"
            checked={manualOverride}
            onChange={(e) => setManualOverride(e.target.checked)}
          />
          Manual Override
        </label>
      </div>

      <div className="confirmation-simulation">
        <button onClick={simulateConfirmationIncrease}>
          +1 Confirmation
        </button>
        <div className="milestone-buttons">
          <button onClick={() => simulateMilestone(10000)}>10K</button>
          <button onClick={() => simulateMilestone(50000)}>50K</button>
          <button onClick={() => simulateMilestone(100000)}>100K</button>
        </div>
      </div>
    </div>
  );
};
```

### Role Management

- Visualization of role distribution
- Manual adjustment of role percentages for testing
- Color coding and filtering by role
- Role interaction matrix visualization and adjustment

The role management component allows for adjusting and visualizing particle roles:

```tsx
const RoleManagement = () => {
  const roles = [
    { id: 'core', name: 'Core', color: '#FF5555', percentage: 10 },
    { id: 'control', name: 'Control', color: '#55FF55', percentage: 20 },
    { id: 'movement', name: 'Movement', color: '#5555FF', percentage: 30 },
    { id: 'defense', name: 'Defense', color: '#FFFF55', percentage: 20 },
    { id: 'attack', name: 'Attack', color: '#FF55FF', percentage: 20 }
  ];

  const [roleData, setRoleData] = useState(roles);
  const [selectedRole, setSelectedRole] = useState<string | null>(null);
  const [showInteractionMatrix, setShowInteractionMatrix] = useState(false);

  const handlePercentageChange = (roleId: string, value: number) => {
    // Ensure percentages sum to 100%
    const newRoleData = roleData.map(role => {
      if (role.id === roleId) {
        return { ...role, percentage: value };
      }
      return role;
    });

    const total = newRoleData.reduce((sum, role) => sum + role.percentage, 0);

    if (total !== 100) {
      // Adjust other roles proportionally
      const adjustment = (100 - value) / (total - newRoleData.find(r => r.id === roleId)!.percentage);

      const adjustedRoleData = newRoleData.map(role => {
        if (role.id !== roleId) {
          return { ...role, percentage: Math.round(role.percentage * adjustment) };
        }
        return role;
      });

      setRoleData(adjustedRoleData);
    } else {
      setRoleData(newRoleData);
    }
  };

  const toggleRoleFilter = (roleId: string) => {
    setSelectedRole(selectedRole === roleId ? null : roleId);
  };

  return (
    <div className="role-management">
      <h3>Role Management</h3>

      <div className="role-distribution">
        <h4>Role Distribution</h4>
        <div className="role-bars">
          {roleData.map(role => (
            <div
              key={role.id}
              className="role-bar"
              style={{
                width: `${role.percentage}%`,
                backgroundColor: role.color,
                opacity: selectedRole === null || selectedRole === role.id ? 1 : 0.3
              }}
              onClick={() => toggleRoleFilter(role.id)}
            >
              {role.percentage > 10 && `${role.name} (${role.percentage}%)`}
            </div>
          ))}
        </div>
      </div>

      <div className="role-controls">
        {roleData.map(role => (
          <div key={role.id} className="role-control">
            <label style={{ color: role.color }}>{role.name}:</label>
            <input
              type="range"
              min="5"
              max="50"
              value={role.percentage}
              onChange={(e) => handlePercentageChange(role.id, parseInt(e.target.value, 10))}
            />
            <span>{role.percentage}%</span>
          </div>
        ))}
      </div>

      <button
        onClick={() => setShowInteractionMatrix(!showInteractionMatrix)}
        className="matrix-toggle"
      >
        {showInteractionMatrix ? 'Hide' : 'Show'} Interaction Matrix
      </button>

      {showInteractionMatrix && <RoleInteractionMatrix roles={roleData} />}
    </div>
  );
};
```

### Force Field Editor

- Visual editor for force field shapes and properties
- Force field creation and deletion tools
- Adjustment of rotation parameters for gyroscopic fields
- Visualization of field influence areas

The force field editor allows for creating and adjusting force fields:

```tsx
const ForceFieldEditor = () => {
  const [forceFields, setForceFields] = useState([
    { id: 'field1', type: 'sphere', position: { x: 0, y: 0, z: 0 }, radius: 5, strength: 1, role: 'core' },
    { id: 'field2', type: 'box', position: { x: 10, y: 0, z: 0 }, dimensions: { x: 5, y: 5, z: 5 }, strength: -0.5, role: 'defense' }
  ]);

  const [selectedField, setSelectedField] = useState<string | null>(null);
  const [newFieldType, setNewFieldType] = useState('sphere');

  const handleFieldSelect = (fieldId: string) => {
    setSelectedField(fieldId);
  };

  const handleFieldUpdate = (fieldId: string, updates: any) => {
    setForceFields(fields =>
      fields.map(field =>
        field.id === fieldId ? { ...field, ...updates } : field
      )
    );
  };

  const handleAddField = () => {
    const newField = {
      id: `field${forceFields.length + 1}`,
      type: newFieldType,
      position: { x: 0, y: 0, z: 0 },
      radius: newFieldType === 'sphere' ? 5 : undefined,
      dimensions: newFieldType === 'box' ? { x: 5, y: 5, z: 5 } : undefined,
      strength: 1,
      role: 'core'
    };

    setForceFields([...forceFields, newField]);
    setSelectedField(newField.id);
  };

  const handleRemoveField = (fieldId: string) => {
    setForceFields(fields => fields.filter(field => field.id !== fieldId));
    if (selectedField === fieldId) {
      setSelectedField(null);
    }
  };

  return (
    <div className="force-field-editor">
      <h3>Force Field Editor</h3>

      <div className="force-field-list">
        <h4>Force Fields</h4>
        <ul>
          {forceFields.map(field => (
            <li
              key={field.id}
              className={selectedField === field.id ? 'selected' : ''}
              onClick={() => handleFieldSelect(field.id)}
            >
              {field.type} ({field.role})
              <button onClick={() => handleRemoveField(field.id)}>X</button>
            </li>
          ))}
        </ul>

        <div className="add-field">
          <select
            value={newFieldType}
            onChange={(e) => setNewFieldType(e.target.value)}
          >
            <option value="sphere">Sphere</option>
            <option value="box">Box</option>
            <option value="cylinder">Cylinder</option>
            <option value="torus">Torus</option>
          </select>
          <button onClick={handleAddField}>Add Field</button>
        </div>
      </div>

      {selectedField && (
        <ForceFieldProperties
          field={forceFields.find(f => f.id === selectedField)!}
          onUpdate={(updates) => handleFieldUpdate(selectedField, updates)}
        />
      )}

      <div className="force-field-visualization">
        <Canvas>
          <ambientLight intensity={0.5} />
          <pointLight position={[10, 10, 10]} />
          <ForceFieldVisualizer
            fields={forceFields}
            selectedField={selectedField}
            onSelectField={handleFieldSelect}
          />
          <OrbitControls />
          <gridHelper args={[20, 20]} />
          <axesHelper args={[5]} />
        </Canvas>
      </div>
    </div>
  );
};
```

### Debug Visualization

- Toggle for force field boundaries
- Particle velocity and acceleration vectors
- Collision detection visualization
- Spatial partitioning grid display
- Energy level and interaction radius visualization

The debug visualization tools help developers understand the internal workings of the system:

```tsx
const DebugVisualization = () => {
  const [showForceFields, setShowForceFields] = useState(true);
  const [showVelocityVectors, setShowVelocityVectors] = useState(false);
  const [showAccelerationVectors, setShowAccelerationVectors] = useState(false);
  const [showCollisions, setShowCollisions] = useState(false);
  const [showSpatialGrid, setShowSpatialGrid] = useState(false);
  const [showInteractionRadius, setShowInteractionRadius] = useState(false);

  return (
    <div className="debug-visualization">
      <h3>Debug Visualization</h3>

      <div className="debug-toggles">
        <label>
          <input
            type="checkbox"
            checked={showForceFields}
            onChange={(e) => setShowForceFields(e.target.checked)}
          />
          Force Fields
        </label>

        <label>
          <input
            type="checkbox"
            checked={showVelocityVectors}
            onChange={(e) => setShowVelocityVectors(e.target.checked)}
          />
          Velocity Vectors
        </label>

        <label>
          <input
            type="checkbox"
            checked={showAccelerationVectors}
            onChange={(e) => setShowAccelerationVectors(e.target.checked)}
          />
          Acceleration Vectors
        </label>

        <label>
          <input
            type="checkbox"
            checked={showCollisions}
            onChange={(e) => setShowCollisions(e.target.checked)}
          />
          Collisions
        </label>

        <label>
          <input
            type="checkbox"
            checked={showSpatialGrid}
            onChange={(e) => setShowSpatialGrid(e.target.checked)}
          />
          Spatial Grid
        </label>

        <label>
          <input
            type="checkbox"
            checked={showInteractionRadius}
            onChange={(e) => setShowInteractionRadius(e.target.checked)}
          />
          Interaction Radius
        </label>
      </div>

      <div className="debug-settings">
        <h4>Debug Settings</h4>

        <div className="debug-setting">
          <label>Vector Scale:</label>
          <input type="range" min="0.1" max="5" step="0.1" defaultValue="1" />
        </div>

        <div className="debug-setting">
          <label>Grid Cell Size:</label>
          <input type="range" min="1" max="10" step="0.5" defaultValue="5" />
        </div>

        <div className="debug-setting">
          <label>Collision Highlight Duration (ms):</label>
          <input type="range" min="100" max="2000" step="100" defaultValue="500" />
        </div>
      </div>

      <div className="debug-stats">
        <h4>Debug Statistics</h4>

        <div className="stat-row">
          <span>Active Particles:</span>
          <span>500</span>
        </div>

        <div className="stat-row">
          <span>Force Calculations:</span>
          <span>124,750 / frame</span>
        </div>

        <div className="stat-row">
          <span>Collisions:</span>
          <span>32 / frame</span>
        </div>

        <div className="stat-row">
          <span>Spatial Grid Cells:</span>
          <span>64</span>
        </div>

        <div className="stat-row">
          <span>Average Particles per Cell:</span>
          <span>7.8</span>
        </div>
      </div>
    </div>
  );
};
```

## Implementation Approach

### Component Architecture

The Development UI follows a modular component architecture:

```
┌─────────────────────────────────────────────────────────┐
│                     Development UI                       │
├─────────────┬─────────────┬────────────────┬────────────┤
│ Visualization│  Parameter  │   Debugging    │  Preset    │
│    Panel     │   Controls  │     Tools      │  Manager   │
├─────────────┼─────────────┼────────────────┼────────────┤
│             Simulation Engine Interface                  │
└─────────────────────────────────────────────────────────┘
```

This architecture ensures:

1. **Separation of Concerns**: Each component has a specific responsibility
2. **Modularity**: Components can be developed and tested independently
3. **Reusability**: Common components can be reused across the UI
4. **Maintainability**: Changes to one component don't affect others
5. **Testability**: Components can be tested in isolation

### Technology Stack

The Development UI is built using the following technologies:

- **React**: For building the UI components
- **Three.js**: For 3D visualization of particles and force fields
- **React Three Fiber**: React bindings for Three.js
- **Zustand**: For state management
- **TypeScript**: For type safety and better developer experience
- **CSS Modules**: For component-scoped styling

This technology stack provides:

1. **Performance**: Efficient rendering of complex 3D scenes
2. **Developer Experience**: Strong typing and modern tooling
3. **Maintainability**: Component-based architecture with clear separation of concerns
4. **Flexibility**: Easy integration with the simulation engine
5. **Testability**: Components can be tested in isolation

### Parameter Categories

The Development UI provides controls for various parameter categories:

1. **Physics Parameters**
   - Gravity strength
   - Collision elasticity
   - Damping factors
   - Time step size
   - Cutoff distance
   - Viscosity

2. **Particle Parameters**
   - Size ranges by role
   - Color schemes
   - Energy consumption rates
   - Trail properties
   - Particle count
   - Particle shapes

3. **Force Field Parameters**
   - Field strengths
   - Rotation speeds
   - Vertex counts
   - Influence radii
   - Field shapes
   - Field positions

4. **Role Parameters**
   - Role distribution percentages
   - Force matrix values
   - Visual characteristics by role
   - Behavioral properties
   - Interaction rules

5. **System Parameters**
   - Memory pool size
   - Worker count
   - Spatial grid resolution
   - Rendering quality
   - Performance settings

Each parameter category has its own dedicated control panel with appropriate input types (sliders, number inputs, color pickers, etc.) for each parameter.

## Preset System

The preset system allows developers to save and load parameter configurations for quick testing and comparison:

```tsx
const PresetSystem = () => {
  const [presets, setPresets] = useState([
    { id: 'preset1', name: 'Default', description: 'Default parameters', parameters: {} },
    { id: 'preset2', name: 'High Energy', description: 'High energy configuration', parameters: {} },
    { id: 'preset3', name: 'Slow Motion', description: 'Slow motion configuration', parameters: {} }
  ]);

  const [currentPreset, setCurrentPreset] = useState<string | null>('preset1');
  const [presetName, setPresetName] = useState('');
  const [presetDescription, setPresetDescription] = useState('');

  const simulationStore = useSimulationStore();

  const saveCurrentAsPreset = () => {
    if (!presetName) return;

    const newPreset = {
      id: `preset${Date.now()}`,
      name: presetName,
      description: presetDescription,
      parameters: simulationStore.getParameters()
    };

    setPresets([...presets, newPreset]);
    setCurrentPreset(newPreset.id);
    setPresetName('');
    setPresetDescription('');
  };

  const loadPreset = (presetId: string) => {
    const preset = presets.find(p => p.id === presetId);
    if (!preset) return;

    simulationStore.setParameters(preset.parameters);
    setCurrentPreset(presetId);
  };

  const deletePreset = (presetId: string) => {
    if (presets.length <= 1) return; // Keep at least one preset

    const newPresets = presets.filter(p => p.id !== presetId);
    setPresets(newPresets);

    if (currentPreset === presetId) {
      setCurrentPreset(newPresets[0].id);
      simulationStore.setParameters(newPresets[0].parameters);
    }
  };

  return (
    <div className="preset-system">
      <h3>Presets</h3>

      <div className="preset-list">
        {presets.map(preset => (
          <div
            key={preset.id}
            className={`preset-item ${currentPreset === preset.id ? 'active' : ''}`}
            onClick={() => loadPreset(preset.id)}
          >
            <div className="preset-info">
              <div className="preset-name">{preset.name}</div>
              <div className="preset-description">{preset.description}</div>
            </div>
            <button
              className="delete-preset"
              onClick={(e) => { e.stopPropagation(); deletePreset(preset.id); }}
            >
              X
            </button>
          </div>
        ))}
      </div>

      <div className="save-preset">
        <input
          type="text"
          placeholder="Preset name"
          value={presetName}
          onChange={(e) => setPresetName(e.target.value)}
        />
        <input
          type="text"
          placeholder="Description (optional)"
          value={presetDescription}
          onChange={(e) => setPresetDescription(e.target.value)}
        />
        <button onClick={saveCurrentAsPreset} disabled={!presetName}>Save Current</button>
      </div>

      <div className="preset-actions">
        <button onClick={() => simulationStore.resetToDefaults()}>Reset to Defaults</button>
        <button onClick={() => exportPresets(presets)}>Export Presets</button>
        <input
          type="file"
          id="import-presets"
          style={{ display: 'none' }}
          onChange={(e) => importPresets(e, setPresets)}
        />
        <label htmlFor="import-presets" className="button">Import Presets</label>
      </div>
    </div>
  );
};
```

## Development-Only Code Separation

To ensure the Development UI doesn't impact the production build, we use several strategies to separate development-only code:

```typescript
// src/config/environment.ts
export const isDevelopment = process.env.NODE_ENV === 'development';
export const isProduction = process.env.NODE_ENV === 'production';
export const isInscriptionMode = process.env.INSCRIPTION_MODE === 'true';

// Only include development UI in development mode
export const includeDevUI = isDevelopment && !isInscriptionMode;
```

### Code Splitting

```tsx
// src/App.tsx
import React, { lazy, Suspense } from 'react';
import { includeDevUI } from './config/environment';
import MainApplication from './components/MainApplication';

// Lazy load the Development UI
const DevelopmentUI = lazy(() =>
  includeDevUI
    ? import('./dev/DevelopmentUI')
    : Promise.resolve({ default: () => null })
);

const App = () => {
  return (
    <div className="app">
      <MainApplication />

      {includeDevUI && (
        <Suspense fallback={<div>Loading Development UI...</div>}>
          <DevelopmentUI />
        </Suspense>
      )}
    </div>
  );
};
```

### Build Configuration

```javascript
// vite.config.js
export default defineConfig(({ mode }) => {
  const isProduction = mode === 'production';
  const isInscriptionMode = process.env.INSCRIPTION_MODE === 'true';

  return {
    // ... other config
    build: {
      // ... other build options
      rollupOptions: {
        // Exclude development UI from production builds
        external: isProduction || isInscriptionMode ? ['./src/dev/**'] : [],
      },
    },
    define: {
      'process.env.NODE_ENV': JSON.stringify(mode),
      'process.env.INSCRIPTION_MODE': JSON.stringify(process.env.INSCRIPTION_MODE || 'false'),
    },
  };
});
```

### Development-Only Components

All development UI components are placed in a separate directory structure:

```
src/
├── components/       # Production components
└── dev/              # Development-only components
    ├── components/   # Development UI components
    ├── hooks/        # Development-only hooks
    ├── store/        # Development-only state management
    └── utils/        # Development-only utilities
```

This separation ensures that:

1. **Clean Production Builds**: No development UI code is included in production builds
2. **Clear Separation**: Development-only code is clearly separated from production code
3. **Efficient Tree-Shaking**: Build tools can easily exclude development-only code
4. **Reduced Bundle Size**: Production builds are as small as possible

## Transition to Production

The transition from development to production involves several steps to ensure the Development UI is completely removed:

```bash
# Build for development with Development UI
npm run build:dev

# Build for production without Development UI
npm run build:production

# Build for inscription (production build with special optimizations)
npm run build:inscription
```

### Production Build Process

1. **Environment Detection**:
   ```typescript
   // Check if we're in production mode
   if (process.env.NODE_ENV === 'production') {
     // Don't include development UI
   }
   ```

2. **Feature Flags**:
   ```typescript
   // Feature flags for different builds
   const features = {
     developmentUI: process.env.NODE_ENV === 'development',
     debugLogging: process.env.NODE_ENV === 'development',
     performanceMonitoring: true, // Included in all builds
     errorReporting: true // Included in all builds
   };
   ```

3. **Code Splitting**:
   ```typescript
   // Only load development UI in development mode
   if (process.env.NODE_ENV === 'development') {
     import('./dev/DevelopmentUI').then(module => {
       const DevUI = module.default;
       // Initialize Development UI
     });
   }
   ```

4. **Build Configuration**:
   ```javascript
   // vite.config.js
   export default defineConfig({
     // ... other config
     build: {
       // ... other build options
       rollupOptions: {
         // Exclude development UI from production builds
         external: isProduction ? ['./src/dev/**'] : [],
       },
     },
   });
   ```

## Production UI

The production UI is minimal and focused on the particle simulation itself:

```tsx
const ProductionUI = () => {
  return (
    <div className="production-ui">
      <Canvas>
        <ParticleRenderer />
        <CameraControls />
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} />
      </Canvas>

      <div className="info-overlay">
        <div className="logo">Bitcoin Protozoa</div>
        <div className="block-info">
          <div>Block: {blockHeight}</div>
          <div>Confirmations: {confirmations}</div>
        </div>
      </div>
    </div>
  );
};
```

The production UI includes only essential elements:

1. **Full-Screen Canvas**: Maximizes the visualization area
2. **Minimal Overlays**: Only essential information is displayed
3. **Block Information**: Shows the current block height and confirmations
4. **Branding**: Minimal branding elements
5. **Performance Optimizations**: Optimized for maximum performance

## Implementation Guidelines

When implementing the Development UI, follow these guidelines:

1. **Performance First**: Ensure the Development UI has minimal impact on simulation performance
   ```typescript
   // Use React.memo for components that don't need frequent updates
   const PerformanceMetrics = React.memo(() => {
     // Component implementation
   });
   ```

2. **Clean Separation**: Keep development-only code clearly separated
   ```typescript
   // Use environment checks to conditionally include code
   if (process.env.NODE_ENV === 'development') {
     // Development-only code
   }
   ```

3. **Responsive Design**: Ensure the UI works well on different screen sizes
   ```css
   /* Use responsive design principles */
   .control-panel {
     width: 300px;

     @media (max-width: 768px) {
       width: 100%;
       height: auto;
     }
   }
   ```

4. **Accessibility**: Ensure the UI is accessible
   ```tsx
   // Use proper ARIA attributes
   <button
     aria-label="Toggle control panel"
     onClick={togglePanel}
   >
     {expanded ? 'Collapse' : 'Expand'}
   </button>
   ```

5. **Consistent Styling**: Use a consistent design language
   ```typescript
   // Use a theme object for consistent styling
   const theme = {
     colors: {
       primary: '#1a1a1a',
       secondary: '#f5a623',
       background: '#121212',
       text: '#ffffff'
     },
     spacing: {
       small: '8px',
       medium: '16px',
       large: '24px'
     }
   };
   ```

## Related Documents

- [User Experience](01_user_experience.md) - For details on user experience design
- [Visual Design](02_visual_design.md) - For details on visual design principles
- [Color Themes](03_color_themes.md) - For details on color palettes and themes
- [Testing Strategy](../testing/01_testing_strategy.md) - For details on testing approach
- [Development Workflow](../deployment/01_development_workflow.md) - For details on the development process