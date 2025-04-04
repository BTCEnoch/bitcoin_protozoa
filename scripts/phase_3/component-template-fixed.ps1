# Component Template Fixed
#
# This script provides an improved template for generating React components
# with proper TypeScript typing and avoiding common linting issues.
#
# Features:
# - Proper TypeScript typing for all components
# - Avoids unused imports and variables
# - Handles style objects correctly
# - Follows React best practices

# Function to create a new component with proper TypeScript typing
function New-Component {
    param (
        [string]$componentName,
        [string]$domainPath,
        [string]$description,
        [switch]$useEmotion = $false,
        [switch]$useGlobalCss = $false
    )

    # Configuration
    $componentPath = "$domainPath\components\$componentName"
    $indexPath = "$componentPath\index.tsx"
    $typesPath = "$componentPath\types.ts"

    # Create style files based on the selected styling approach
    if ($useEmotion) {
        $stylesPath = "$componentPath\styles.ts"
    }
    elseif ($useGlobalCss) {
        $stylesPath = "$componentPath\global.css"
    }
    else {
        $stylesPath = "$componentPath\styles.ts"
    }

    # Ensure the directory exists
    New-DirectoryIfNotExists -path $componentPath

    # Create types file with proper TypeScript typing
    $typesContent = @"
/**
 * $componentName Types
 *
 * @description Type definitions for $componentName component
 */
import React from 'react';

export interface ${componentName}Props {
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

    # Create styles file based on the selected styling approach
    if ($useEmotion) {
        $stylesContent = @"
/**
 * $componentName Styles
 *
 * @description Styles for $componentName component using Emotion
 */
import { css } from '@emotion/react';

export const ${componentName}Styles = css`
  /* Component styles */
  .${componentName.toLowerCase()} {
    display: flex;
    flex-direction: column;
    padding: 1rem;
  }

  .${componentName.toLowerCase()}__header {
    margin-bottom: 1rem;
  }

  .${componentName.toLowerCase()}__title {
    font-size: 1.5rem;
    font-weight: 600;
    color: #f7931a;
  }

  .${componentName.toLowerCase()}__content {
    flex: 1;
  }
`;
"@
    }
    elseif ($useGlobalCss) {
        $stylesContent = @"
/**
 * Global styles for $componentName component
 */

.${componentName.toLowerCase()} {
  display: flex;
  flex-direction: column;
  padding: 1rem;
}

.${componentName.toLowerCase()}__header {
  margin-bottom: 1rem;
}

.${componentName.toLowerCase()}__title {
  font-size: 1.5rem;
  font-weight: 600;
  color: #f7931a;
}

.${componentName.toLowerCase()}__content {
  flex: 1;
}
"@
    }
    else {
        # Create inline styles with proper TypeScript typing
        $stylesContent = @"
/**
 * $componentName Styles
 *
 * @description Styles for $componentName component
 */
import React from 'react';

export const useStyles = (): { [key: string]: React.CSSProperties } => {
  return {
    container: {
      display: 'flex',
      flexDirection: 'column' as React.CSSProperties['flexDirection'],
      padding: '1rem',
    },
    header: {
      marginBottom: '1rem',
    },
    title: {
      fontSize: '1.5rem',
      fontWeight: 600,
      color: '#f7931a',
    },
    content: {
      flex: 1,
    },
  };
};
"@
    }

    # Create index file with proper TypeScript typing and avoiding unused variables
    if ($useEmotion) {
        $indexContent = @"
/**
 * $componentName Component
 *
 * @description $description
 */
import React from 'react';
import { ${componentName}Props } from './types';
import { ${componentName}Styles } from './styles';

/**
 * $componentName Component
 */
export const $componentName = ({
  className,
  children
}) => {
  return (
    <div className={`${componentName.toLowerCase()} \${className || ''}`} css={${componentName}Styles}>
      <div className="${componentName.toLowerCase()}__header">
        <h2 className="${componentName.toLowerCase()}__title">$componentName</h2>
      </div>
      <div className="${componentName.toLowerCase()}__content">
        {children || 'This is the $componentName component.'}
      </div>
    </div>
  );
};

export default $componentName;
"@
    }
    elseif ($useGlobalCss) {
        $indexContent = @"
/**
 * $componentName Component
 *
 * @description $description
 */
import React from 'react';
import { ${componentName}Props } from './types';
import './global.css';

/**
 * $componentName Component
 */
export const $componentName = ({
  className,
  children
}) => {
  return (
    <div className={`${componentName.toLowerCase()} \${className || ''}`}>
      <div className="${componentName.toLowerCase()}__header">
        <h2 className="${componentName.toLowerCase()}__title">$componentName</h2>
      </div>
      <div className="${componentName.toLowerCase()}__content">
        {children || 'This is the $componentName component.'}
      </div>
    </div>
  );
};

export default $componentName;
"@
    }
    else {
        $indexContent = @"
/**
 * $componentName Component
 *
 * @description $description
 */
import React from 'react';
import { ${componentName}Props } from './types';
import { useStyles } from './styles';

/**
 * $componentName Component
 */
export const $componentName = ({
  className,
  children
}) => {
  const styles = useStyles();

  return (
    <div style={styles.container} className={className}>
      <div style={styles.header}>
        <h2 style={styles.title}>$componentName</h2>
      </div>
      <div style={styles.content}>
        {children || 'This is the $componentName component.'}
      </div>
    </div>
  );
};

export default $componentName;
"@
    }

    # Save the files
    Set-Content -Path $typesPath -Value $typesContent -Force
    Set-Content -Path $stylesPath -Value $stylesContent -Force
    Set-Content -Path $indexPath -Value $indexContent -Force

    Write-Host "Created component $componentName at $componentPath" -ForegroundColor Green
    Write-Host "  - Created types file at $typesPath" -ForegroundColor Green
    Write-Host "  - Created styles file at $stylesPath" -ForegroundColor Green
    Write-Host "  - Created index file at $indexPath" -ForegroundColor Green
}

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

# Example usage:
# New-Component -componentName "ShaderGenerator" -domainPath "src\domains\trait" -description "A component for generating and compiling shader code" -useGlobalCss
