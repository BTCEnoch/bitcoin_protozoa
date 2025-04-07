# Script Templates

This directory contains templates for generating scripts and code for the Bitcoin Protozoa project. These templates are used by the script generation system to create consistent and standardized scripts.

## Template Types

### Script Templates

- [`component-template.ps1`](component-template.ps1): Template for generating React components
- [`service-template.ps1`](service-template.ps1): Template for generating services
- [`hook-template.ps1`](hook-template.ps1): Template for generating React hooks
- [`test-template.ps1`](test-template.ps1): Template for generating tests

### Implementation Templates

- [`trait-implementation-template.ps1`](trait-implementation-template.ps1): Template for implementing traits
- [`mutation-implementation-template.ps1`](mutation-implementation-template.ps1): Template for implementing mutation traits
- [`class-implementation-template.ps1`](class-implementation-template.ps1): Template for implementing classes

### Documentation Templates

- [`documentation-template.ps1`](documentation-template.ps1): Template for generating documentation
- [`readme-template.ps1`](readme-template.ps1): Template for generating README files

## Usage

These templates are used by the script generation system and should not be modified directly. To generate scripts using these templates, use the script generation scripts in the `scripts/common` directory:

```powershell
.\scripts\common\script-generator.ps1 -phase "phase_3" -template "component-template.ps1" -output "component-name.ps1"
```

## Template Structure

Each template follows a standard structure:

1. **Header**: Contains metadata about the template, including its purpose, usage, and parameters
2. **Parameters**: Defines the parameters that can be passed to the template
3. **Content**: The actual content of the template, with placeholders for parameters
4. **Footer**: Contains any closing code or comments

## Customizing Templates

If you need to customize a template, create a copy with a new name and modify it. Do not modify the original templates, as they are used by the script generation system.

## Documentation

For more information on the script generation system, see the following documentation:

- [Script Generation System](../../bitcoin_protozoa/project/03_implementation_approach.md)
- [Phase Implementation Guide](../../bitcoin_protozoa/project/07_phase_implementation_guide.md)
