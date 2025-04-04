# Regenerate Components
#
# This script regenerates the ShaderGenerator and VisualRegressionTester components
# with proper TypeScript typing and avoiding common linting issues.

# Function to ensure a directory exists
function New-DirectoryIfNotExists {
    param (
        [string]$path
    )

    if (-not (Test-Path -Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created directory: $path"
    }
}

# ShaderGenerator Component
$componentName = "ShaderGenerator"
$componentPath = "src\domains\trait\components\$componentName"
$indexPath = "$componentPath\index.tsx"
$typesPath = "$componentPath\types.ts"
$stylesPath = "$componentPath\global.css"

# Ensure the directory exists
New-DirectoryIfNotExists -path $componentPath

# Create types file
$typesContent = @"
/**
 * ShaderGenerator Types
 *
 * @description Type definitions for ShaderGenerator component
 */
import React from 'react';

export interface ShaderGeneratorProps {
  /**
   * Optional className for custom styling
   */
  className?: string;
  
  /**
   * Children elements
   */
  children?: React.ReactNode;
  
  // Add more props as needed
}
"@

# Create styles file
$stylesContent = @"
/**
 * Global styles for ShaderGenerator component
 */

.shadergenerator {
  display: flex;
  flex-direction: column;
  padding: 1rem;
}

.shadergenerator__header {
  margin-bottom: 1rem;
}

.shadergenerator__title {
  font-size: 1.5rem;
  font-weight: 600;
  color: #f7931a;
}

.shadergenerator__content {
  flex: 1;
}
"@

# Create index file
$indexContent = @"
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
    <div className={`shadergenerator \${className || ''}`}>
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
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $stylesPath -Value $stylesContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force

Write-Host "Created ShaderGenerator component at $componentPath" -ForegroundColor Green

# VisualRegressionTester Component
$componentName = "VisualRegressionTester"
$componentPath = "src\domains\trait\components\$componentName"
$indexPath = "$componentPath\index.tsx"
$typesPath = "$componentPath\types.ts"
$stylesPath = "$componentPath\global.css"

# Ensure the directory exists
New-DirectoryIfNotExists -path $componentPath

# Create types file
$typesContent = @"
/**
 * VisualRegressionTester Types
 *
 * @description Type definitions for VisualRegressionTester component
 */
import React from 'react';

export interface VisualRegressionTesterProps {
  /**
   * Optional className for custom styling
   */
  className?: string;
  
  /**
   * Children elements
   */
  children?: React.ReactNode;
  
  // Add more props as needed
}
"@

# Create styles file
$stylesContent = @"
/**
 * Global styles for VisualRegressionTester component
 */

.visualregressiontester {
  display: flex;
  flex-direction: column;
  padding: 1rem;
}

.visualregressiontester__header {
  margin-bottom: 1rem;
}

.visualregressiontester__title {
  font-size: 1.5rem;
  font-weight: 600;
  color: #f7931a;
}

.visualregressiontester__content {
  flex: 1;
}
"@

# Create index file
$indexContent = @"
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
    <div className={`visualregressiontester \${className || ''}`}>
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
"@

# Save the files
Set-Content -Path $typesPath -Value $typesContent -Force
Set-Content -Path $stylesPath -Value $stylesContent -Force
Set-Content -Path $indexPath -Value $indexContent -Force

Write-Host "Created VisualRegressionTester component at $componentPath" -ForegroundColor Green
Write-Host "Components regenerated successfully!" -ForegroundColor Green
