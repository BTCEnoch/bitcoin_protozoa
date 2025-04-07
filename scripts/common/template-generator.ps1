# Template Generator
# This script generates templates for different types of scripts

# Configuration
$templatesDir = "scripts/templates"

# Ensure the templates directory exists
if (-not (Test-Path -Path $templatesDir)) {
    New-Item -ItemType Directory -Path $templatesDir -Force | Out-Null
    Write-Host "Created directory: $templatesDir"
}

# Component Generator Template
$componentGeneratorTemplate = @"
# Component Generator Template
# This template is used to generate React components

param (
    [string]`$componentName,
    [string]`$domainPath,
    [string]`$description,
    [switch]`$useEmotion = `$false,
    [switch]`$useGlobalCss = `$false
)

# Configuration
`$componentPath = "`$domainPath\components\`$componentName"
`$indexPath = "`$componentPath\index.tsx"
`$typesPath = "`$componentPath\types.ts"

# Create style files based on the selected styling approach
if (`$useEmotion) {
    `$stylesPath = "`$componentPath\styles.ts"
}
elseif (`$useGlobalCss) {
    `$stylesPath = "`$componentPath\global.css"
}
else {
    `$stylesPath = "`$componentPath\styles.ts"
}

# Ensure the directory exists
New-DirectoryIfNotExists -path `$componentPath

# Create types file with proper TypeScript typing
`$typesContent = @"
/**
 * `$componentName Types
 *
 * @description Type definitions for `$componentName component
 */
import React from 'react';

export interface `${componentName}Props {
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
# ... (styles file content generation)

# Create index file with proper TypeScript typing and avoiding unused variables
# ... (index file content generation)

# Save the files
Set-Content -Path `$typesPath -Value `$typesContent -Force
Set-Content -Path `$stylesPath -Value `$stylesContent -Force
Set-Content -Path `$indexPath -Value `$indexContent -Force

Write-Host "Created component `$componentName at `$componentPath" -ForegroundColor Green
"@

# Test Generator Template
$testGeneratorTemplate = @"
# Test Generator Template
# This template is used to generate tests for components and functions

param (
    [string]`$testName,
    [string]`$testPath,
    [string]`$targetPath,
    [string]`$testType = "component" # component, unit, integration, visual
)

# Configuration
`$testFilePath = "`$testPath\`$testName.test.tsx"

# Ensure the directory exists
New-DirectoryIfNotExists -path `$testPath

# Create test file based on the test type
switch (`$testType) {
    "component" {
        `$testContent = @"
/**
 * `$testName Component Test
 *
 * @description Tests for the `$testName component
 */
import React from 'react';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { `$testName } from '`$targetPath';

describe('`$testName Component', () => {
  it('renders correctly', () => {
    render(<`$testName />);
    // Add assertions here
  });
  
  it('handles user interactions', async () => {
    render(<`$testName />);
    // Add user interaction tests here
  });
  
  // Add more tests as needed
});
"@
    }
    "unit" {
        `$testContent = @"
/**
 * `$testName Unit Test
 *
 * @description Unit tests for the `$testName function
 */
import { `$testName } from '`$targetPath';

describe('`$testName Function', () => {
  it('returns the expected result', () => {
    // Add assertions here
  });
  
  it('handles edge cases', () => {
    // Add edge case tests here
  });
  
  // Add more tests as needed
});
"@
    }
    # Add cases for other test types
}

# Save the test file
Set-Content -Path `$testFilePath -Value `$testContent -Force

Write-Host "Created test `$testName at `$testFilePath" -ForegroundColor Green
"@

# Documentation Generator Template
$documentationGeneratorTemplate = @"
# Documentation Generator Template
# This template is used to generate documentation for components and functions

param (
    [string]`$docName,
    [string]`$docPath,
    [string]`$targetPath,
    [string]`$docType = "component" # component, function, module, system
)

# Configuration
`$docFilePath = "`$docPath\`$docName.md"

# Ensure the directory exists
New-DirectoryIfNotExists -path `$docPath

# Create documentation file based on the doc type
switch (`$docType) {
    "component" {
        `$docContent = @"
# `$docName Component

## Overview

The `$docName component is responsible for...

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| prop1 | string | '' | Description of prop1 |
| prop2 | number | 0 | Description of prop2 |

## Usage

```tsx
import { `$docName } from '`$targetPath';

const MyComponent = () => {
  return <`$docName prop1="value" prop2={42} />;
};
```

## Implementation Details

The `$docName component is implemented using...

## Related Components

- RelatedComponent1
- RelatedComponent2
"@
    }
    # Add cases for other doc types
}

# Save the documentation file
Set-Content -Path `$docFilePath -Value `$docContent -Force

Write-Host "Created documentation `$docName at `$docFilePath" -ForegroundColor Green
"@

# Save the templates  
Set-Content -Path "$templatesDir/component-generator-template.ps1" -Value $componentGeneratorTemplate -Force
Set-Content -Path "$templatesDir/test-generator-template.ps1" -Value $testGeneratorTemplate -Force
Set-Content -Path "$templatesDir/documentation-generator-template.ps1" -Value $documentationGeneratorTemplate -Force

Write-Host "Generated templates:" -ForegroundColor Green
Write-Host "  - Component Generator Template: $templatesDir/component-generator-template.ps1" -ForegroundColor Green
Write-Host "  - Test Generator Template: $templatesDir/test-generator-template.ps1" -ForegroundColor Green
Write-Host "  - Documentation Generator Template: $templatesDir/documentation-generator-template.ps1" -ForegroundColor Green
Write-Host ""
Write-Host "Templates generated successfully!" -ForegroundColor Green
