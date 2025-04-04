/**
 * ParticleDebug Component
 *
 * @description A component for ParticleDebug
 */

import React from 'react';
import { ParticleDebugProps } from './types';
import { useStyles } from './styles';

/**
 * ParticleDebug Component
 */
export const ParticleDebug = (props) => {
  const styles = useStyles();

  return (
    <div className={styles.container}>
      <h2>ParticleDebug</h2>
      {/* Component implementation */}
    </div>
  );
};

export default ParticleDebug;
