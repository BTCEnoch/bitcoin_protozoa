import { ReactNode } from 'react';
import { useCreature } from '../hooks/useCreature';

interface ParticleCreatureProps {
  blockNumber: number;
  children?: ReactNode;
}

/**
 * Main component for rendering a particle creature
 * Part of Phase 1 implementation
 */
const ParticleCreature = ({ blockNumber, children }: ParticleCreatureProps) => {
  const { creature } = useCreature(blockNumber);

  return (
    <group>
      {/* Creature rendering will be implemented here */}
      {children}
    </group>
  );
};

export default ParticleCreature;
