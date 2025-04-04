/**
 * InfoPanel Component
 *
 * @description A component for InfoPanel
 */

import React from 'react';
import { InfoPanelProps } from './types';
import { useStyles } from './styles';

/**
 * InfoPanel Component
 */
export const InfoPanel = (props) => {
  const styles = useStyles();

  return (
    <div className={styles.container}>
      <h2>InfoPanel</h2>
      {/* Component implementation */}
    </div>
  );
};

export default InfoPanel;
