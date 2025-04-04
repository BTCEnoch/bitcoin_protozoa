# Deployment Pipeline

This document outlines the deployment pipeline for inscribing the Bitcoin Protozoa project on Bitcoin using the Ordinals protocol. It covers the entire process from pre-deployment preparation to monitoring and maintenance.

## Table of Contents

1. [Overview](#overview)
2. [Pre-Deployment Preparation](#pre-deployment-preparation)
3. [Chunk Preparation](#chunk-preparation)
4. [Inscription Order Planning](#inscription-order-planning)
5. [Inscription Process](#inscription-process)
6. [Fallback Mechanisms](#fallback-mechanisms)
7. [Monitoring and Maintenance](#monitoring-and-maintenance)
8. [Security Considerations](#security-considerations)
9. [Deployment Checklist](#deployment-checklist)
10. [Troubleshooting](#troubleshooting)
11. [Related Documents](#related-documents)

## Overview

The Bitcoin Protozoa project will be deployed on Bitcoin using the Ordinals protocol, which allows for the inscription of arbitrary content on individual satoshis. This deployment approach provides several benefits:

1. **Immutability**: Once inscribed, the code cannot be altered
2. **Permanence**: The code will exist as long as Bitcoin exists
3. **Decentralization**: No reliance on centralized servers
4. **Unique Ownership**: Each inscription has a clear owner
5. **Recursive Loading**: Inscriptions can reference other inscriptions

The deployment pipeline is designed to handle the complexities of inscribing a modern web application on Bitcoin while ensuring reliability, performance, and maintainability.

## Pre-Deployment Preparation

### Build Optimization

Before deployment, optimize the application build:

```bash
# Install dependencies
npm install

# Build with production optimization
npm run build

# Analyze bundle size
npm run analyze
```

Key optimization targets:
- Total bundle size under 4MB (split across multiple inscriptions)
- Individual chunk size under 400KB
- Minimal external dependencies
- Efficient code splitting

### Dependency Analysis

Identify all external dependencies that need to be inscribed:

```bash
# Generate dependency report
npm run analyze:deps

# Output should include:
# - React
# - ReactDOM
# - Three.js
# - Zustand
# - Other core libraries
```

### Deployment Tools

Install and configure the necessary tools:

```bash
# Install ord
git clone https://github.com/casey/ord
cd ord
cargo build --release

# Move binary to path
sudo mv target/release/ord /usr/local/bin/

# Initialize ord wallet
ord wallet create

# Fund wallet for inscriptions
# (Send BTC to the address shown by the command below)
ord wallet receive
```

## Chunk Preparation

### Application Chunking Strategy

Split the application into logical chunks:

1. **Core**: Essential application code and initialization
2. **Particle**: Particle system implementation
3. **Physics**: Physics engine and calculations
4. **UI**: User interface components
5. **Dependencies**: External libraries (React, Three.js, etc.)

### Chunk Creation

Create optimized chunks for inscription:

```bash
# Create inscription directory
mkdir -p inscriptions

# Create chunks using custom build script
node scripts/create-chunks.js

# Verify chunks
ls -la inscriptions/
```

Each chunk should:
- Be self-contained or have clear dependencies
- Include version information
- Have minimal size
- Be properly minified and optimized

## Inscription Order Planning

### Dependency Graph

Create a dependency graph to determine inscription order:

```
1. External Dependencies (React, Three.js, etc.)
2. Core Application
3. Particle System
4. Physics Engine
5. UI Components
6. Main HTML
```

### Recursive Inscriptions

Plan for recursive loading:

```javascript
// Example of recursive loading in main HTML
async function loadDependencies() {
  // Load dependencies in order
  // Use appropriate endpoint based on environment
  const baseUrl = process.env.NODE_ENV === 'development'
    ? 'https://ordinals.com'
    : '';

  // ONLY use ordinals.com API, no fallbacks
  await loadScript(`${baseUrl}/content/REACT_INSCRIPTION_ID`);
  await loadScript(`${baseUrl}/content/THREE_INSCRIPTION_ID`);
  await loadScript(`${baseUrl}/content/CORE_INSCRIPTION_ID`);
  // ...and so on
}
```

## Inscription Process

### Inscribe Dependencies

First, inscribe all external dependencies:

```bash
# Inscribe React
ord wallet inscribe --fee-rate 10 inscriptions/react.js

# Record inscription ID
REACT_INSCRIPTION_ID="<output-inscription-id>"

# Inscribe ReactDOM
ord wallet inscribe --fee-rate 10 inscriptions/react-dom.js

# Record inscription ID
REACT_DOM_INSCRIPTION_ID="<output-inscription-id>"

# Continue for all dependencies...
```

### Inscribe Application Chunks

Next, inscribe the application chunks:

```bash
# Inscribe core chunk
ord wallet inscribe --fee-rate 10 inscriptions/core.js

# Record inscription ID
CORE_INSCRIPTION_ID="<output-inscription-id>"

# Continue for all chunks...
```

### Create Main HTML Inscription

Create and inscribe the main HTML file that loads all chunks:

```bash
cat > inscriptions/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bitcoin Protozoa</title>
  <style>
    body { margin: 0; overflow: hidden; background: #1a1a1a; }
    #loading { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: #ff8c00; font-family: sans-serif; }
  </style>
</head>
<body>
  <div id="root"></div>
  <div id="loading">Loading Bitcoin Protozoa...</div>

  <script>
    // Load dependencies in order
    const dependencies = [
      { id: "REACT_INSCRIPTION_ID", name: "react" },
      { id: "REACT_DOM_INSCRIPTION_ID", name: "react-dom" },
      { id: "THREE_INSCRIPTION_ID", name: "three" },
      { id: "ZUSTAND_INSCRIPTION_ID", name: "zustand" },
      { id: "CORE_INSCRIPTION_ID", name: "core" },
      { id: "PARTICLE_INSCRIPTION_ID", name: "particle" },
      { id: "PHYSICS_INSCRIPTION_ID", name: "physics" },
      { id: "UI_INSCRIPTION_ID", name: "ui" }
    ];

    // Load each dependency in sequence
    async function loadDependencies() {
      try {
        for (const dep of dependencies) {
          // Use appropriate endpoint based on environment
          const baseUrl = process.env.NODE_ENV === 'development'
            ? 'https://ordinals.com'
            : '';

          await loadScript(\`${baseUrl}/content/\${dep.id}\`);
          console.log(\`Loaded \${dep.name}\`);
        }

        // Initialize application
        document.getElementById('loading').style.display = 'none';
        window.initializeApplication();
      } catch (error) {
        console.error('Failed to load dependencies:', error);
        document.getElementById('loading').textContent = 'Failed to load. Please try again.';
      }
    }

    // Helper to load a script
    function loadScript(src) {
      return new Promise((resolve, reject) => {
        const script = document.createElement('script');
        script.src = src;
        script.onload = resolve;
        script.onerror = reject;
        document.head.appendChild(script);
      });
    }

    // Start loading
    loadDependencies().catch(err => {
      console.error('Failed to load dependencies:', err);
      document.getElementById('loading').textContent = 'Failed to load. Please try again.';
    });
  </script>
</body>
</html>
EOF

# Inscribe main HTML
ord wallet inscribe --fee-rate 10 inscriptions/index.html

# Record main inscription ID
MAIN_INSCRIPTION_ID="<output-inscription-id>"
```

### Verify Inscriptions

Verify that all inscriptions are accessible and working:

```bash
# Check main inscription
ord explore inscription MAIN_INSCRIPTION_ID

# Test in browser
echo "Open https://ordinals.com/content/MAIN_INSCRIPTION_ID in your browser"
```

## Error Handling

### No External Fallbacks

Important: We do not use any external fallbacks. If an inscription fails to load, the application will display an error message to the user.

```javascript
// Load script without fallbacks - we only use ordinals.com
async function loadScript(inscriptionId) {
  return new Promise((resolve, reject) => {
    const script = document.createElement('script');

    // Use appropriate endpoint based on environment
    const baseUrl = process.env.NODE_ENV === 'development'
      ? 'https://ordinals.com'
      : '';

    script.src = `${baseUrl}/content/${inscriptionId}`;
    script.onload = resolve;
    script.onerror = reject;
    document.head.appendChild(script);
  });
}

// Usage - no fallbacks
try {
  await loadScript('REACT_INSCRIPTION_ID');
  console.log('Loaded React from inscription');
} catch (err) {
  console.error('Failed to load React:', err);
  document.getElementById('loading').textContent = 'Failed to load dependencies. Please try again.';
}
```

### Local Storage Caching

Implement caching to improve loading performance while still using only the ordinals.com API:

```javascript
async function loadWithCache(inscriptionId, expiry = 86400000) { // Default: 1 day
  const cacheKey = `bitcoin-protozoa-${inscriptionId}`;
  const cached = localStorage.getItem(cacheKey);

  if (cached) {
    const { timestamp, content } = JSON.parse(cached);
    if (Date.now() - timestamp < expiry) {
      // Use cached content
      const blob = new Blob([content], { type: 'application/javascript' });
      const url = URL.createObjectURL(blob);
      await loadScript(url);
      return;
    }
  }

  // Fetch and cache - only from ordinals.com API
  try {
    // Use appropriate endpoint based on environment
    const baseUrl = process.env.NODE_ENV === 'development'
      ? 'https://ordinals.com'
      : '';

    const response = await fetch(`${baseUrl}/content/${inscriptionId}`);

    if (!response.ok) {
      throw new Error(`HTTP error ${response.status}`);
    }

    const content = await response.text();

    localStorage.setItem(cacheKey, JSON.stringify({
      timestamp: Date.now(),
      content
    }));

    const blob = new Blob([content], { type: 'application/javascript' });
    const url = URL.createObjectURL(blob);
    await loadScript(url);
  } catch (error) {
    console.error(`Failed to load inscription ${inscriptionId}:`, error);
    throw error; // No fallback - if the API fails, we fail
  }
}
```

## Monitoring and Maintenance

### Inscription Health Checks

Implement health checks to verify inscriptions are accessible:

```javascript
async function checkInscriptionHealth(inscriptionIds) {
  const results = {};

  // Use appropriate endpoint based on environment
  const baseUrl = process.env.NODE_ENV === 'development'
    ? 'https://ordinals.com'
    : '';

  for (const id of inscriptionIds) {
    try {
      const response = await fetch(`${baseUrl}/content/${id}`);
      results[id] = response.ok;
    } catch (err) {
      results[id] = false;
    }
  }

  return results;
}
```

### Update Strategy

For future updates, new inscriptions will be created and the main HTML inscription updated:

1. Inscribe new versions of changed chunks
2. Create a new main HTML inscription with updated references
3. Maintain backward compatibility where possible

## Security Considerations

### Content Security

- Use subresource integrity checks where possible
- Implement content verification before execution
- Validate loaded scripts match expected signatures

### Error Handling

- Implement robust error handling for failed loads
- Provide clear user feedback for loading issues
- Log errors for debugging and monitoring

## Deployment Checklist

Before deploying to Bitcoin, complete this checklist:

1. **Build Verification**
   - [ ] All chunks build successfully
   - [ ] Bundle size is optimized
   - [ ] No unnecessary code or dependencies

2. **Local Testing**
   - [ ] Application works in local environment
   - [ ] All features function correctly
   - [ ] Performance meets requirements

3. **Inscription Preparation**
   - [ ] Chunks are properly split
   - [ ] Dependencies are identified
   - [ ] Loading order is defined

4. **Wallet Preparation**
   - [ ] Wallet has sufficient funds
   - [ ] Private keys are secured
   - [ ] Fee rates are appropriate

5. **Backup**
   - [ ] All source code is backed up
   - [ ] Build artifacts are backed up
   - [ ] Inscription IDs are recorded

6. **Post-Deployment**
   - [ ] Verify all inscriptions are accessible
   - [ ] Test application functionality
   - [ ] Monitor for any issues

## Troubleshooting

### Common Issues

1. **Inscription Not Found**
   - Check inscription ID is correct
   - Verify transaction was confirmed
   - Try accessing through different Ordinals explorers

2. **Loading Failures**
   - Check browser console for errors
   - Verify all dependencies are loaded in correct order
   - Test fallback mechanisms

3. **Performance Issues**
   - Check chunk sizes
   - Verify loading sequence
   - Monitor network requests

### Recovery Procedures

1. **Failed Inscription**
   - Record failed inscription details
   - Retry inscription with higher fee rate
   - Update references if new inscription ID is created

2. **Corrupted Data**
   - Verify source data integrity
   - Re-inscribe from verified source
   - Update references to new inscription

## CI/CD Pipeline

### Continuous Integration

The continuous integration pipeline automates the build, test, and validation process:

```yaml
# .github/workflows/ci.yml
name: Continuous Integration

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Lint
        run: npm run lint

      - name: Type check
        run: npm run type-check

      - name: Test
        run: npm test

      - name: Build
        run: npm run build

      - name: Analyze bundle size
        run: npm run analyze

      - name: Upload build artifacts
        uses: actions/upload-artifact@v3
        with:
          name: build
          path: dist/
```

### Continuous Deployment

The continuous deployment pipeline automates the preparation of inscription-ready artifacts:

```yaml
# .github/workflows/cd.yml
name: Continuous Deployment

on:
  push:
    tags:
      - 'v*'

jobs:
  prepare-inscription:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

      - name: Prepare inscription chunks
        run: node scripts/create-chunks.js

      - name: Validate chunks
        run: node scripts/validate-chunks.js

      - name: Generate inscription manifest
        run: node scripts/generate-manifest.js

      - name: Upload inscription artifacts
        uses: actions/upload-artifact@v3
        with:
          name: inscription-artifacts
          path: inscriptions/
```

### Deployment Workflow

The deployment workflow combines automated and manual steps:

1. **Automated Build and Test**:
   - CI pipeline builds and tests the application
   - Bundle analysis identifies optimization opportunities
   - Test coverage reports highlight areas needing more tests

2. **Automated Artifact Preparation**:
   - CD pipeline prepares inscription-ready chunks
   - Validates chunks for size and content
   - Generates inscription manifest

3. **Manual Review and Approval**:
   - Review build artifacts and test results
   - Verify inscription chunks meet requirements
   - Approve for inscription

4. **Manual Inscription**:
   - Follow inscription process using prepared artifacts
   - Record inscription IDs
   - Update manifest with actual inscription IDs

5. **Automated Verification**:
   - Verify inscriptions are accessible
   - Run tests against inscribed content
   - Generate verification report

### Deployment Environments

The deployment pipeline supports multiple environments:

1. **Development**: Local development environment
   - Uses local development server
   - Simulates inscription loading
   - Fast iteration cycle

2. **Staging**: Pre-inscription testing environment
   - Uses testnet inscriptions
   - Full end-to-end testing
   - Validates inscription process

3. **Production**: Bitcoin mainnet
   - Final inscription on Bitcoin
   - Immutable deployment
   - Production monitoring

## Related Documents

- [Development Workflow](01_development_workflow.md) - For details on the development process
- [Asset Management](03_asset_management.md) - For details on asset management
- [Bitcoin Integration](../bitcoin/01_blockchain_integration.md) - For details on Bitcoin integration
- [Module Structure](../core/03_module_structure.md) - For details on code organization
- [Technical Implementation](../testing/03_technical_implementation.md) - For implementation details
