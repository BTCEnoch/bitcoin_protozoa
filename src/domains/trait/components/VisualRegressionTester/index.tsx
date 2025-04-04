/**
 * VisualRegressionTester Component
 *
 * @description A component for visual regression testing of particle traits
 */
import React from 'react';
import { VisualRegressionTesterProps } from './types';
import './global.css';

/**
 * VisualRegressionTester Component
 */
export const VisualRegressionTester = ({ 
  className, 
  children 
}: VisualRegressionTesterProps) => {
  return (
    <div className={`visualregressiontester ${className || ''}`}>
      <div className="visualregressiontester__header">
        <h2 className="visualregressiontester__title">VisualRegressionTester</h2>
      </div>
      <div className="visualregressiontester__content">
        {children || 'This is the VisualRegressionTester component.'}
      </div>
    </div>
  );
};

export default VisualRegressionTester;
