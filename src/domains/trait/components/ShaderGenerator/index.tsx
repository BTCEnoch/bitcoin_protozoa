/**
 * ShaderGenerator Component
 *
 * @description A component for generating and compiling shader code for visual effects
 */
import React from 'react';
import { ShaderGeneratorProps } from './types';
import './global.css';

/**
 * ShaderGenerator Component
 */
export const ShaderGenerator = ({
  className,
  children
}: ShaderGeneratorProps) => {
  return (
    <div className={`shadergenerator ${className || ''}`}>
      <div className="shadergenerator__header">
        <h2 className="shadergenerator__title">ShaderGenerator</h2>
      </div>
      <div className="shadergenerator__content">
        {children || 'This is the ShaderGenerator component.'}
      </div>
    </div>
  );
};

export default ShaderGenerator;
