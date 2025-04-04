# Performance Optimization Strategies

This document outlines the performance optimization strategies for the Bitcoin Protozoa project, focusing on memory management, WebGL rendering, React optimizations, and performance monitoring.

## Table of Contents

1. [Memory Optimization](#memory-optimization)
2. [WebGL Optimization](#webgl-optimization)
3. [React Optimizations](#react-optimizations)
4. [Performance Monitoring](#performance-monitoring)
5. [Implementation Phasing](#implementation-phasing)
6. [Related Documents](#related-documents)

## Memory Optimization

### Object Pooling

Object pooling is a critical optimization for reducing garbage collection pauses:

```typescript
class ObjectPool<T> {
  private pool: T[] = [];
  private factory: () => T;
  private reset: (obj: T) => void;
  
  constructor(factory: () => T, reset: (obj: T) => void, initialSize: number = 0) {
    this.factory = factory;
    this.reset = reset;
    
    // Pre-allocate objects
    for (let i = 0; i < initialSize; i++) {
      this.pool.push(this.factory());
    }
  }
  
  get(): T {
    if (this.pool.length > 0) {
      return this.pool.pop()!;
    }
    
    return this.factory();
  }
  
  release(obj: T): void {
    this.reset(obj);
    this.pool.push(obj);
  }
}
```

### Pooling Priorities

1. **Vector3 Objects** (Highest Priority)
   - Used constantly for position, velocity, and force calculations
   - Initial pool size: 1000

2. **Particle Objects** (High Priority)
   - 500 particles in the simulation
   - Initial pool size: 600

3. **Matrix4 Objects** (Medium Priority)
   - Used for transformations
   - Initial pool size: 600

4. **Force Field Objects** (Medium Priority)
   - Fewer instances but complex
   - Initial pool size: 50

### Memory Monitoring

We'll implement a monitoring system to track memory usage:

```typescript
class MemoryMonitor {
  private metrics: MemoryMetrics;
  private thresholds: {
    low: number;
    medium: number;
    high: number;
  };
  
  updateMetrics(stats: MemoryStats) {
    // Update memory usage metrics
    // Calculate pool utilization
    // Update memory pressure level
  }
  
  shouldTriggerGC(): boolean {
    // Determine if garbage collection should be triggered
    return this.metrics.memoryPressure > this.thresholds.high;
  }
}
```

### Cleanup Strategy

We'll implement a comprehensive cleanup system:

```typescript
class ResourceCleanup {
  private disposedResources: Set<string> = new Set();
  private cleanupQueue: Map<string, () => void> = new Map();
  
  registerResource(id: string, cleanupFn: () => void) {
    // Register a resource for cleanup
    this.cleanupQueue.set(id, cleanupFn);
  }
  
  disposeResource(id: string) {
    // Dispose a specific resource
    if (this.cleanupQueue.has(id)) {
      this.cleanupQueue.get(id)!();
      this.cleanupQueue.delete(id);
      this.disposedResources.add(id);
    }
  }
  
  disposeAll() {
    // Dispose all registered resources
    for (const [id, cleanupFn] of this.cleanupQueue.entries()) {
      cleanupFn();
      this.disposedResources.add(id);
    }
    this.cleanupQueue.clear();
  }
}
```

### Implementation Plan

1. **Phase 1**: Implement Vector3 and Particle pooling
2. **Phase 2**: Add memory monitoring system
3. **Phase 3**: Implement cleanup strategies
4. **Phase 4**: Add Matrix4 and Force Field pooling

## WebGL Optimization

### Renderer Configuration

```typescript
const renderer = new THREE.WebGLRenderer({
  canvas: canvasRef.current,
  antialias: true,
  alpha: true,
  powerPreference: "high-performance",
  stencil: false,
  depth: true,
  logarithmicDepthBuffer: true,
  precision: "highp"
});

// Set optimal pixel ratio
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
```

### Instanced Rendering

The most critical optimization for our 500 particles:

```typescript
// Create one instanced mesh per particle role
const instancedMesh = new THREE.InstancedMesh(
  geometry,
  material,
  particleCount
);

// Use a single dummy object for matrix updates
const dummy = new THREE.Object3D();

// Batch update matrices
for (let i = 0; i < particleCount; i++) {
  dummy.position.copy(particles[i].position);
  dummy.updateMatrix();
  instancedMesh.setMatrixAt(i, dummy.matrix);
}

// Only update buffer once per frame
instancedMesh.instanceMatrix.needsUpdate = true;
```

### Frustum Culling

To avoid rendering particles outside the camera view:

```typescript
// Enable frustum culling for better performance
const frustum = new THREE.Frustum();
frustum.setFromProjectionMatrix(
  new THREE.Matrix4().multiplyMatrices(
    camera.projectionMatrix,
    camera.matrixWorldInverse
  )
);

// Only render visible particles
particles.forEach(particle => {
  if (frustum.containsPoint(particle.position)) {
    // Render particle
    updateParticleInstance(particle);
  }
});
```

### Custom Shaders

For specific visual effects and optimizations:

```typescript
const particleShader = {
  vertexShader: `
    attribute float size;
    attribute vec3 color;
    varying vec3 vColor;
    void main() {
      vColor = color;
      vec4 mvPosition = modelViewMatrix * vec4(position, 1.0);
      gl_PointSize = size * (300.0 / -mvPosition.z);
      gl_Position = projectionMatrix * mvPosition;
    }
  `,
  fragmentShader: `
    varying vec3 vColor;
    void main() {
      gl_FragColor = vec4(vColor, 1.0);
    }
  `
};
```

### Material Optimization

```typescript
// Create materials once and reuse
const materials = useMemo(() => {
  const mats: { [key: string]: THREE.MeshStandardMaterial } = {};
  colors.forEach(color => {
    mats[color] = new THREE.MeshStandardMaterial({
      color: color,
      emissive: color,
      emissiveIntensity: 0.5,
      toneMapped: false
    });
  });
  return mats;
}, [colors]);
```

### Implementation Plan

1. **Phase 1**: Implement instanced rendering and basic renderer configuration
2. **Phase 2**: Add frustum culling and material optimization
3. **Phase 3**: Implement custom shaders for specific effects
4. **Phase 4**: Add advanced WebGL optimizations

## React Optimizations

### Component Memoization

```typescript
// Memoize components
const ParticleRenderer = React.memo(({ particles }) => {
  // Render particles
  return (
    <instancedMesh ref={meshRef} args={[geometry, material, particles.length]}>
      {/* Mesh content */}
    </instancedMesh>
  );
});

// Memoize callbacks
const handleClick = useCallback(() => {
  // Handle click
  setSelected(!selected);
}, [selected]);
```

### Efficient Animation Loop

```typescript
useEffect(() => {
  if (!isInitialized) return;
  
  let frameId: number;
  let lastTime = 0;
  
  const animate = (time: number) => {
    frameId = requestAnimationFrame(animate);
    
    // Calculate delta time in seconds
    const delta = (time - lastTime) / 1000;
    lastTime = time;
    
    // Skip if delta is too large (tab was inactive)
    const clampedDelta = Math.min(delta, 0.1);
    
    // Execute render callbacks
    renderCallbacks.current.forEach(callback => {
      callback(clampedDelta);
    });
    
    // Render scene
    renderer.current.render(scene.current, camera.current);
  };
  
  frameId = requestAnimationFrame(animate);
  
  return () => cancelAnimationFrame(frameId);
}, [isInitialized]);
```

### Throttled Updates

Not every component needs to update at 60fps:

```typescript
// High-priority updates (60fps)
useFrame(() => {
  updateParticlePositions();
});

// Medium-priority updates (30fps)
useFrame(({ clock }) => {
  if (Math.floor(clock.getElapsedTime() * 30) % 2 === 0) {
    updateForceFields();
  }
});

// Low-priority updates (10fps)
useFrame(({ clock }) => {
  if (Math.floor(clock.getElapsedTime() * 10) % 6 === 0) {
    updateUI();
  }
});
```

## Performance Monitoring

### Development Tools

```typescript
// Add to development environment
if (process.env.NODE_ENV === 'development') {
  // Memory profiling
  const memoryProfiler = {
    start() {
      performance.mark('memory-profile-start');
    },
    end() {
      performance.mark('memory-profile-end');
      performance.measure('memory-profile', 'memory-profile-start', 'memory-profile-end');
      const measurements = performance.getEntriesByName('memory-profile');
      console.log('Memory Profile:', measurements[measurements.length - 1]);
    }
  };
  
  // Resource tracking
  const resourceTracker = {
    logResourceCounts() {
      const stats = memoryService.getMemoryStats();
      console.log('Resource Counts:', {
        vector3: stats.vector3PoolSize,
        particles: stats.particlePoolSize,
        forceFields: stats.forceFieldPoolSize
      });
    }
  };
}
```

### Performance Metrics

```typescript
// Monitor WebGL performance
const performanceMonitor = {
  drawCalls: 0,
  triangles: 0,
  textures: 0,
  fps: 0,
  lastTime: 0,
  frameCount: 0,
  
  reset() {
    this.drawCalls = 0;
    this.triangles = 0;
    this.textures = 0;
  },
  
  update(time: number) {
    this.frameCount++;
    
    if (time - this.lastTime >= 1000) {
      this.fps = this.frameCount;
      this.frameCount = 0;
      this.lastTime = time;
      
      console.log(`FPS: ${this.fps}`);
      console.log(`Draw Calls: ${this.drawCalls}`);
      console.log(`Triangles: ${this.triangles}`);
    }
  }
};
```

## Implementation Phasing

### Phase 1: Core Framework
- Set up React with Three.js and React Three Fiber
- Implement basic instanced rendering for particles
- Set up object pooling for Vector3 and particles
- Configure WebGL renderer with optimal settings

### Phase 2: Performance Foundation
- Implement the physics worker for core calculations
- Add memory monitoring and cleanup systems
- Implement frustum culling and basic optimizations
- Set up performance monitoring tools

### Phase 3: Advanced Optimizations
- Add additional workers for rendering and data
- Implement load balancing and task prioritization
- Add custom shaders for specific visual effects
- Implement advanced memory management strategies

### Phase 4: Refinement
- Optimize based on performance metrics
- Add development tools for debugging
- Implement advanced WebGL optimizations
- Fine-tune worker distribution and memory management

## Related Documents

- [Memory and Worker Systems](04_memory_worker_systems.md) - For details on memory management and worker systems
- [Module Structure](03_module_structure.md) - For details on code organization
- [Physics Engine](../physics/01_physics_engine.md) - For details on physics calculations
- [Particle System](../particles/01_particle_system.md) - For details on the particle system
