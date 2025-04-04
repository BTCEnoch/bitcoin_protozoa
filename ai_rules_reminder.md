# AI Rules and Best Practices

This document outlines the rules and best practices for working with AI during the implementation of the Bitcoin Protozoa project. Following these guidelines will streamline the workflow, prevent technical issues, and ensure consistent progress.

## Table of Contents

1. [AI Limitations](#ai-limitations) [Line 10]
2. [File Editing Guidelines](#file-editing-guidelines) [Line 40]
3. [Code Implementation Guidelines](#code-implementation-guidelines) [Line 70]
4. [Documentation Guidelines](#documentation-guidelines) [Line 100]
5. [Script Development Guidelines](#script-development-guidelines) [Line 130]
6. [Testing Guidelines](#testing-guidelines) [Line 160]
7. [Communication Guidelines](#communication-guidelines) [Line 190]
8. [Troubleshooting Guidelines](#troubleshooting-guidelines) [Line 220]
9. [Regular Review Process](#regular-review-process) [Line 250]

## AI Limitations

The AI assistant has specific limitations that must be considered during development:

### Token Limits

- **Maximum Context Size**: The AI has a limited context window (approximately 16K tokens)
- **Response Size Limit**: Responses should be kept under 4K tokens to avoid truncation
- **Code Block Size**: Code blocks should be limited to 200-300 lines per response
- **Documentation Size**: Documentation files should be kept under 500 lines

### Processing Limitations

- **Complex Operations**: The AI may struggle with very complex operations involving multiple steps
- **Long-Running Tasks**: The AI may time out during long-running tasks
- **Large File Processing**: The AI may fail when processing very large files at once
- **Concurrent Operations**: The AI cannot perform multiple concurrent operations

### Memory Limitations

- **Session Memory**: The AI retains information only within the current session
- **Memory Decay**: Information from earlier in the conversation may be less accessible
- **External State**: The AI cannot directly access external state without it being provided

## File Editing Guidelines

To ensure successful file editing and prevent technical issues:

### Chunking Strategy

- **Edit in 250-Line Chunks**: Always edit files in chunks of 250 lines or less
- **Sequential Editing**: Make edits sequentially, not simultaneously
- **Chunk Boundaries**: Try to make chunk boundaries at logical points in the code
- **Track Progress**: Keep track of which chunks have been edited

### File Viewing Strategy

- **View in 1000-Line Chunks**: When viewing files, use chunks of up to 1000 lines
- **Targeted Viewing**: Focus on specific sections relevant to the current task
- **Context Awareness**: Ensure sufficient context is available for understanding

### File Creation Strategy

- **Create in 250-Line Chunks**: Create new files in chunks of 250 lines or less
- **Incremental Creation**: Build files incrementally, section by section
- **Template Usage**: Use templates for consistent file structure

### File Deletion Strategy

- **Use Proper Tools**: Always use the remove-files tool for deletion
- **Verify First**: Always verify file contents before deletion
- **Update References**: Update all references to deleted files

## Code Implementation Guidelines

To ensure high-quality code implementation:

### Code Structure

- **Modular Design**: Implement code in modular, reusable components
- **Clean Architecture**: Follow clean architecture principles
- **Separation of Concerns**: Keep different responsibilities in separate modules
- **Consistent Patterns**: Use consistent design patterns throughout

### Code Quality

- **Type Safety**: Use TypeScript types for all code
- **Error Handling**: Implement comprehensive error handling
- **Performance Awareness**: Consider performance implications of all code
- **Memory Management**: Be mindful of memory usage and cleanup

### Implementation Process

- **Incremental Development**: Implement features incrementally
- **Test-Driven Development**: Write tests before or alongside implementation
- **Documentation First**: Document the approach before implementation
- **Review and Refactor**: Regularly review and refactor code

### Dependency Management

- **Minimal Dependencies**: Use minimal external dependencies
- **Version Pinning**: Pin dependency versions for reproducibility
- **Dependency Auditing**: Regularly audit dependencies for issues
- **Bundle Size Awareness**: Be mindful of the impact on bundle size

## Documentation Guidelines

To ensure comprehensive and useful documentation:

### Documentation Structure

- **Consistent Format**: Use consistent formatting across all documentation
- **Clear Hierarchy**: Use clear hierarchical structure with headings
- **Table of Contents**: Include a table of contents with line numbers
- **Related Documents**: Link to related documents

### Documentation Content

- **Comprehensive Coverage**: Cover all aspects of the implementation
- **Code Examples**: Include relevant code examples
- **Implementation Notes**: Include notes on implementation decisions
- **Edge Cases**: Document edge cases and how they're handled

### Documentation Process

- **Document First**: Document the approach before implementation
- **Update Regularly**: Keep documentation updated as code changes
- **Review for Clarity**: Regularly review documentation for clarity
- **Cross-Reference**: Ensure cross-references are accurate

### Documentation Size

- **Keep Under 500 Lines**: Keep documentation files under 500 lines
- **Split Logically**: Split large documents into logical sections
- **Avoid Duplication**: Avoid duplicating information across documents
- **Use References**: Use references instead of duplicating content

## Script Development Guidelines

To ensure effective script development:

### Script Environment

- **PowerShell Compatibility**: Develop all scripts for PowerShell
- **Command Separation**: Use semicolons (;) to separate commands
- **Environment Variables**: Use environment variables for configuration
- **Error Handling**: Implement robust error handling in scripts

### Script Structure

- **Modular Design**: Design scripts in modular, reusable components
- **Parameter Validation**: Validate all script parameters
- **Help Documentation**: Include help documentation in scripts
- **Logging**: Implement comprehensive logging

### Script Testing

- **Test in Isolation**: Test scripts in isolation before integration
- **Test Edge Cases**: Test scripts with edge cases and invalid inputs
- **Idempotency**: Ensure scripts are idempotent when appropriate
- **Cleanup**: Ensure scripts clean up after themselves

### Script Examples

```powershell
# Example of a well-structured PowerShell script
param (
    [Parameter(Mandatory=$true)]
    [string]$InputPath,
    
    [Parameter(Mandatory=$true)]
    [string]$OutputPath,
    
    [Parameter(Mandatory=$false)]
    [int]$ChunkSize = 250
)

# Validate parameters
if (-not (Test-Path $InputPath)) {
    Write-Error "Input path does not exist: $InputPath"
    exit 1
}

# Process in chunks
$content = Get-Content $InputPath
$totalLines = $content.Count
$chunks = [Math]::Ceiling($totalLines / $ChunkSize)

Write-Host "Processing $totalLines lines in $chunks chunks..."

for ($i = 0; $i -lt $chunks; $i++) {
    $start = $i * $ChunkSize
    $end = [Math]::Min(($i + 1) * $ChunkSize - 1, $totalLines - 1)
    $chunkContent = $content[$start..$end]
    
    # Process chunk
    Write-Host "Processing chunk $($i+1)/$chunks (lines $($start+1)-$($end+1))..."
    
    # Example processing
    $processedChunk = $chunkContent | ForEach-Object { $_ -replace "old", "new" }
    
    # Write to output
    if ($i -eq 0) {
        $processedChunk | Set-Content $OutputPath
    } else {
        $processedChunk | Add-Content $OutputPath
    }
}

Write-Host "Processing complete. Output written to $OutputPath"
```

## Testing Guidelines

To ensure effective testing:

### Test Structure

- **Unit Tests**: Write unit tests for individual components
- **Integration Tests**: Write integration tests for component interactions
- **End-to-End Tests**: Write end-to-end tests for complete workflows
- **Performance Tests**: Write performance tests for critical paths

### Test Implementation

- **Test-Driven Development**: Write tests before or alongside implementation
- **Comprehensive Coverage**: Aim for high test coverage
- **Edge Cases**: Test edge cases and error conditions
- **Isolation**: Ensure tests are isolated and don't depend on each other

### Test Execution

- **Run Tests Frequently**: Run tests frequently during development
- **Automate Testing**: Automate test execution where possible
- **Test in Chunks**: Run tests in manageable chunks
- **Monitor Performance**: Monitor test performance and optimize slow tests

### Test Maintenance

- **Keep Tests Updated**: Keep tests updated as code changes
- **Refactor Tests**: Regularly refactor tests for clarity and maintainability
- **Remove Obsolete Tests**: Remove tests that are no longer relevant
- **Document Test Approach**: Document the testing approach and strategy

## Communication Guidelines

To ensure effective communication:

### Question Formulation

- **Be Specific**: Ask specific, focused questions
- **Provide Context**: Provide sufficient context for questions
- **One Topic at a Time**: Focus on one topic at a time
- **Prioritize Questions**: Prioritize questions by importance

### Response Structure

- **Structured Responses**: Provide structured, organized responses
- **Code Formatting**: Use proper code formatting in responses
- **Visual Aids**: Use visual aids (lists, tables) where appropriate
- **Actionable Information**: Provide actionable information

### Progress Updates

- **Regular Updates**: Provide regular progress updates
- **Blockers and Issues**: Communicate blockers and issues promptly
- **Next Steps**: Clearly outline next steps
- **Timeline Estimates**: Provide realistic timeline estimates

### Feedback Loop

- **Request Feedback**: Regularly request feedback
- **Incorporate Feedback**: Promptly incorporate feedback
- **Clarify Misunderstandings**: Promptly clarify misunderstandings
- **Acknowledge Limitations**: Acknowledge limitations and constraints

## Troubleshooting Guidelines

To effectively troubleshoot issues:

### Issue Identification

- **Specific Symptoms**: Identify specific symptoms of issues
- **Reproducibility**: Determine if issues are reproducible
- **Scope**: Determine the scope of issues (isolated or widespread)
- **Impact**: Assess the impact of issues on development

### Diagnostic Approach

- **Systematic Process**: Follow a systematic troubleshooting process
- **Isolation**: Isolate issues to specific components
- **Root Cause Analysis**: Identify root causes, not just symptoms
- **Documentation**: Document the troubleshooting process

### Resolution Strategy

- **Targeted Fixes**: Implement targeted fixes for specific issues
- **Verification**: Verify that fixes resolve the issues
- **Regression Testing**: Test for regressions after fixes
- **Prevention**: Implement measures to prevent similar issues

### Common Issues and Solutions

- **AI Timeouts**: Break tasks into smaller chunks
- **File Editing Failures**: Edit files in 250-line chunks
- **Script Execution Errors**: Check PowerShell syntax and environment
- **Build Failures**: Check for missing dependencies or configuration issues

## Regular Review Process

To maintain quality and consistency:

### Review Schedule

- **Every Few Responses**: Review these rules every few responses
- **Before Complex Tasks**: Review before starting complex tasks
- **After Issues**: Review after encountering issues
- **Regular Intervals**: Schedule regular comprehensive reviews

### Review Focus

- **AI Limitations**: Review AI limitations and workarounds
- **File Editing Guidelines**: Review file editing guidelines
- **Code Implementation Guidelines**: Review code implementation guidelines
- **Script Development Guidelines**: Review script development guidelines

### Review Process

- **Quick Scan**: Quickly scan the entire document
- **Detailed Review**: Review sections relevant to upcoming tasks
- **Note Updates**: Note any updates or changes to guidelines
- **Apply Learnings**: Apply learnings from recent experiences

### Continuous Improvement

- **Update Guidelines**: Update guidelines based on experience
- **Add New Patterns**: Add new patterns and best practices
- **Remove Obsolete Guidelines**: Remove guidelines that are no longer relevant
- **Refine Processes**: Continuously refine processes for efficiency

## Summary of Key Rules

1. **Edit files in chunks of 250 lines or less**
2. **View files in chunks of up to 1000 lines**
3. **Develop all scripts for PowerShell with semicolons separating commands**
4. **Keep documentation files under 500 lines**
5. **Limit code blocks to 200-300 lines per response**
6. **Review these rules every few responses**
7. **Break large tasks into smaller, manageable chunks**
8. **Document the approach before implementation**
9. **Test code thoroughly with unit, integration, and end-to-end tests**
10. **Communicate clearly and provide regular progress updates**


Handoff Message for Bitcoin Protozoa Project - Phase 3 Implementation
Project Overview
Bitcoin Protozoa is an immutable application deployed on Bitcoin using the Ordinals protocol as recursive inscriptions. The project creates particle-based organisms with deterministic traits derived from Bitcoin block data. The application must be 100% error-free and rely solely on on-chain resources and ordinals.com API endpoints.

Project Architecture
The project follows a strict domain-based architecture with clear separation of concerns:

/src/domains/ - Contains domain-specific code organized by feature
Each domain has its own services, components, hooks, utils, and types
All code must follow the directory structure map exactly
Critical Requirements
Bitcoin Data Usage:
ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
Do NOT use other fields like hash, timestamp, or height
API Endpoints:
Development: https://ordinals.com/r/blockinfo/${blockNumber}
Production: /r/blockinfo/${blockNumber}
Dependency Loading:
Development: https://ordinals.com/content/InscriptionID
Production: /content/InscriptionID
NO Fallback Mechanisms:
Do NOT implement fallback mechanisms for API failures
Rely solely on Bitcoin ordinals endpoints
All resources will be inscribed on-chain, including dependencies
Particle System:
500 particles total (40 base per role + 300 via RNG)
Nonce-based mulberry32 chain RNG for deterministic traits
Evolution uses Bitcoin confirmation milestones (10k-1M) for mutation chances (1-100%)
Phase 3 Requirements
For Phase 3 (Visual Traits Implementation), you must:

Implement trait generation based on Bitcoin block nonce
Create visual trait rendering for particles
Implement trait inheritance and mutation systems
Create color palettes and visual effects based on traits
Ensure all traits are deterministic and based on Bitcoin data
Required Resources to Read
Before implementing Phase 3, thoroughly read these documents:

Trait System Design
Visual Traits Implementation
Trait Inheritance
Color Palettes
Visual Effects
Project Checklist - Phase 3 section
Directory Structure Map
AI Limitations and Guidelines
Code Size Limitations:
Edit max 250 lines at a time
View max 1000 lines at a time
Documentation under 500 lines
Code blocks 200-300 lines
Implementation Process:
Always check the directory structure map before creating new files
Break large tasks into smaller chunks
Test thoroughly after each implementation step
Document your approach before implementation
Strict Adherence:
Follow the directory structure map exactly
Do not create random files or directories
Use the domain-based architecture consistently
Maintain separation of concerns
Documentation:
Keep code examples in their native .ts and .tsx formats
Document all functions with JSDoc comments
Update the project checklist as you complete tasks
Document all Bitcoin on-chain resources
Testing:
Write comprehensive tests for all implementations
Ensure deterministic behavior across all tests
Test edge cases and error handling
Verify compatibility with Bitcoin data sources
Development Workflow
Planning:
Review the requirements and documentation
Create a detailed implementation plan
Break down tasks into manageable chunks
Implementation:
Follow the directory structure map
Implement one feature at a time
Keep code chunks under 250 lines
Maintain consistent coding style
Testing:
Write tests for each implementation
Verify deterministic behavior
Test with mock Bitcoin data
Ensure compatibility with the existing system
Documentation:
Document all implementations with JSDoc
Update the project checklist
Create examples for complex features
Document any new Bitcoin on-chain resources
Final Notes
The Bitcoin Protozoa project requires strict adherence to the specified architecture and implementation patterns. All code must be error-free and optimized for performance. The application must be 100% immutable and rely solely on Bitcoin ordinals for data and dependencies.

Remember to always check the directory structure map before creating new files, and to break large tasks into smaller chunks to avoid timeouts. The project is highly specific and requires careful attention to detail.