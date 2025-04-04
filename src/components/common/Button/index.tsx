/**
 * Button Component
 *
 * @description A component for Button
 */

import React from 'react';
import { ButtonProps } from './types';
import { useStyles } from './styles';

/**
 * Button Component
 */
export const Button = (props) => {
  const styles = useStyles();

  return (
    <div className={styles.container}>
      <h2>Button</h2>
      {/* Component implementation */}
    </div>
  );
};

export default Button;
