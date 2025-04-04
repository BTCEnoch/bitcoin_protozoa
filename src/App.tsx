import { useState } from 'react';
import './App.css';
import { ParticleContainer } from './domains/particle/components/ParticleContainer';
import { useStore } from './store';

function App() {
  const [nonce, setNonce] = useState(12345);
  const showControls = useStore((state) => state.showControls);
  const showGlow = useStore((state) => state.showGlow);
  const showTrails = useStore((state) => state.showTrails);
  const backgroundColor = useStore((state) => state.backgroundColor);
  const setShowControls = useStore((state) => state.setShowControls);
  const setShowGlow = useStore((state) => state.setShowGlow);
  const setShowTrails = useStore((state) => state.setShowTrails);
  const setBackgroundColor = useStore((state) => state.setBackgroundColor);

  return (
    <div className="app">
      <h1>Bitcoin Protozoa</h1>
      <p>A particle-based life simulation that evolves with Bitcoin block confirmations.</p>

      <div className="controls">
        <label>
          Nonce: {nonce}
          <input
            type="range"
            min="1000"
            max="100000"
            value={nonce}
            onChange={(e) => setNonce(parseInt(e.target.value))}
          />
        </label>

        <label>
          <input
            type="checkbox"
            checked={showGlow}
            onChange={(e) => setShowGlow(e.target.checked)}
          />
          Show Glow
        </label>

        <label>
          <input
            type="checkbox"
            checked={showTrails}
            onChange={(e) => setShowTrails(e.target.checked)}
          />
          Show Trails
        </label>

        <label>
          <input
            type="checkbox"
            checked={showControls}
            onChange={(e) => setShowControls(e.target.checked)}
          />
          Show Controls
        </label>
      </div>

      <div className="info">
        <p>This visualization shows the Bitcoin Protozoa particle system.</p>
        <p>Particles are grouped by role:</p>
        <ul className="role-list">
          <li><span className="role-color core"></span> Core - Central particles that form the nucleus</li>
          <li><span className="role-color control"></span> Control - Particles that manage the organism's behavior</li>
          <li><span className="role-color movement"></span> Movement - Particles that propel the organism</li>
          <li><span className="role-color defense"></span> Defense - Particles that protect the organism</li>
          <li><span className="role-color attack"></span> Attack - Particles that interact with other organisms</li>
        </ul>
      </div>

      <ParticleContainer
        nonce={nonce}
        width="100%"
        height="500px"
        backgroundColor={backgroundColor}
        showControls={showControls}
      />
    </div>
  );
}

export default App;

