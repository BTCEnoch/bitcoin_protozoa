# Implement Bitcoin Data Visualization Script
# This script implements the Bitcoin data visualization components
# IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
# NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints

Write-Host "Implementing Bitcoin Data Visualization..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$componentsDir = "$bitcoinDomainDir\components"
$blockDataVisualizerDir = "$componentsDir\BlockDataVisualizer"

# Check if directories exist, create if not
if (-not (Test-Path $bitcoinDomainDir)) {
    Write-Host "Creating Bitcoin domain directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $bitcoinDomainDir -Force | Out-Null
}

if (-not (Test-Path $componentsDir)) {
    Write-Host "Creating Bitcoin components directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $componentsDir -Force | Out-Null
}

if (-not (Test-Path $blockDataVisualizerDir)) {
    Write-Host "Creating BlockDataVisualizer directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $blockDataVisualizerDir -Force | Out-Null
}

# Create BlockDataVisualizer types
$typesFile = "$blockDataVisualizerDir\types.ts"
Write-Host "Creating BlockDataVisualizer types in $typesFile..." -ForegroundColor Yellow

$typesContent = @"
/**
 * Types for BlockDataVisualizer component
 * 
 * This component visualizes Bitcoin block data.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 */
import { MilestoneEvent } from '../../services/confirmationService';

/**
 * BlockDataVisualizer Props
 */
export interface BlockDataVisualizerProps {
  /** Initial block number to fetch (optional) */
  initialBlockNumber?: string;
}

/**
 * Block data interface
 */
export interface BlockData {
  /** Block number */
  blockNumber: number;
  /** Block nonce */
  nonce: number;
  /** Block confirmations */
  confirmations: number;
}

/**
 * Particle interface for visualization
 */
export interface Particle {
  /** Particle ID */
  id: number;
  /** X position (percentage) */
  x: string;
  /** Y position (percentage) */
  y: string;
  /** Particle size */
  size: string;
  /** Particle color */
  color: string;
}
"@

Set-Content -Path $typesFile -Value $typesContent

# Create BlockDataVisualizer component
$componentFile = "$blockDataVisualizerDir\index.tsx"
Write-Host "Creating BlockDataVisualizer component in $componentFile..." -ForegroundColor Yellow

$componentContent = @"
/**
 * BlockDataVisualizer Component
 * 
 * This component visualizes Bitcoin block data.
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints.
 */
import React, { useState, useEffect } from 'react';
import { BlockDataVisualizerProps, Particle } from './types';
import { useBitcoinStore } from '../../store';
import { RNGService } from '../../../rng/services/rngService';
import { randomFloat, randomColor } from '../../../rng/utils/rngHelpers';

// Styles
const containerStyle: React.CSSProperties = {
  padding: '20px',
  maxWidth: '800px',
  margin: '0 auto',
  fontFamily: 'Arial, sans-serif'
};

const inputStyle: React.CSSProperties = {
  padding: '8px',
  fontSize: '16px',
  width: '200px',
  marginRight: '10px'
};

const buttonStyle: React.CSSProperties = {
  padding: '8px 16px',
  fontSize: '16px',
  backgroundColor: '#f7931a', // Bitcoin orange
  color: 'white',
  border: 'none',
  borderRadius: '4px',
  cursor: 'pointer'
};

const dataContainerStyle: React.CSSProperties = {
  marginTop: '20px',
  padding: '15px',
  backgroundColor: '#f5f5f5',
  borderRadius: '4px',
  border: '1px solid #ddd'
};

const particleContainerStyle: React.CSSProperties = {
  marginTop: '20px',
  height: '200px',
  backgroundColor: '#000',
  borderRadius: '4px',
  position: 'relative',
  overflow: 'hidden'
};

const milestoneStyle: React.CSSProperties = {
  marginTop: '20px',
  padding: '10px',
  backgroundColor: '#e6f7ff',
  borderRadius: '4px',
  border: '1px solid #91d5ff'
};

/**
 * BlockDataVisualizer Component
 */
const BlockDataVisualizer: React.FC<BlockDataVisualizerProps> = ({ initialBlockNumber = '' }) => {
  // Bitcoin store
  const {
    currentBlockNumber,
    blockNonce,
    confirmations,
    lastMilestone,
    milestoneEvents,
    loading,
    error,
    setBlockNumber,
    refreshConfirmations,
    clearMilestoneEvents
  } = useBitcoinStore();
  
  // Local state
  const [blockNumberInput, setBlockNumberInput] = useState<string>(initialBlockNumber);
  const [particles, setParticles] = useState<Particle[]>([]);
  const [rngService] = useState(() => new RNGService());
  
  // Generate particles when nonce changes
  useEffect(() => {
    if (blockNonce) {
      // Set RNG seed to block nonce
      rngService.setMasterSeed(blockNonce);
      
      // Generate particles
      const newParticles = generateParticles(rngService);
      setParticles(newParticles);
    }
  }, [blockNonce, rngService]);
  
  // Refresh confirmations periodically
  useEffect(() => {
    if (currentBlockNumber) {
      const intervalId = setInterval(() => {
        refreshConfirmations();
      }, 5000); // Every 5 seconds
      
      return () => clearInterval(intervalId);
    }
  }, [currentBlockNumber, refreshConfirmations]);
  
  // Fetch block data
  const handleFetchBlock = () => {
    if (!blockNumberInput || isNaN(parseInt(blockNumberInput))) {
      return;
    }
    
    const blockNum = parseInt(blockNumberInput);
    clearMilestoneEvents();
    setBlockNumber(blockNum);
  };
  
  // Generate particles based on RNG
  const generateParticles = (rngService: RNGService): Particle[] => {
    const visualRng = rngService.getStream('visual');
    const count = 50;
    const particles: Particle[] = [];
    
    for (let i = 0; i < count; i++) {
      const x = randomFloat(visualRng, 0, 100);
      const y = randomFloat(visualRng, 0, 100);
      const size = randomFloat(visualRng, 5, 15);
      
      particles.push({
        id: i,
        x: `\${x}%`,
        y: `\${y}%`,
        size: `\${size}px`,
        color: randomColor(visualRng)
      });
    }
    
    return particles;
  };
  
  return (
    <div style={containerStyle}>
      <h1>Bitcoin Block Data Visualizer</h1>
      <p>Enter a Bitcoin block number to fetch its data and visualize it using the RNG system.</p>
      
      <div>
        <input
          type="text"
          value={blockNumberInput}
          onChange={(e) => setBlockNumberInput(e.target.value)}
          placeholder="Enter block number"
          style={inputStyle}
        />
        <button
          onClick={handleFetchBlock}
          disabled={loading}
          style={buttonStyle}
        >
          {loading ? 'Loading...' : 'Fetch Block Data'}
        </button>
      </div>
      
      {error && (
        <div style={{ marginTop: '20px', color: 'red' }}>
          {error}
        </div>
      )}
      
      {currentBlockNumber > 0 && (
        <div style={dataContainerStyle}>
          <h2>Block Data</h2>
          <p><strong>Block Number:</strong> {currentBlockNumber}</p>
          <p><strong>Nonce:</strong> {blockNonce}</p>
          <p><strong>Confirmations:</strong> {confirmations}</p>
          {lastMilestone > 0 && (
            <p><strong>Last Milestone:</strong> {lastMilestone} confirmations</p>
          )}
        </div>
      )}
      
      {particles.length > 0 && (
        <div style={particleContainerStyle}>
          {particles.map((particle) => (
            <div
              key={particle.id}
              style={{
                position: 'absolute',
                left: particle.x,
                top: particle.y,
                width: particle.size,
                height: particle.size,
                borderRadius: '50%',
                backgroundColor: particle.color,
                transition: 'all 0.5s ease-in-out'
              }}
            />
          ))}
        </div>
      )}
      
      {milestoneEvents.length > 0 && (
        <div>
          <h2>Milestone Events</h2>
          {milestoneEvents.map((event, index) => (
            <div key={index} style={milestoneStyle}>
              <p><strong>Threshold:</strong> {event.threshold} confirmations</p>
              <p><strong>Timestamp:</strong> {new Date(event.timestamp).toLocaleString()}</p>
              <p><strong>Mutation Chance:</strong> {(event.chance * 100).toFixed(2)}%</p>
              <p><strong>Available Rarities:</strong> {event.rarities.join(', ')}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default BlockDataVisualizer;
"@

Set-Content -Path $componentFile -Value $componentContent

# Create index.ts
$indexFile = "$componentsDir\index.ts"
Write-Host "Creating Bitcoin components index in $indexFile..." -ForegroundColor Yellow

$indexContent = @"
/**
 * Bitcoin Components Index
 * 
 * This file exports all Bitcoin components.
 */

export { default as BlockDataVisualizer } from './BlockDataVisualizer';
"@

Set-Content -Path $indexFile -Value $indexContent

Write-Host "Bitcoin Data Visualization implementation complete!" -ForegroundColor Green
