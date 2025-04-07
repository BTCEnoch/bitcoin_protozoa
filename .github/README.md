# GitHub Configuration

This directory contains GitHub-specific configuration files for the Bitcoin Protozoa project.

## Contents

- [`workflows/`](workflows/): GitHub Actions workflow configurations
- [`ISSUE_TEMPLATE/`](ISSUE_TEMPLATE/): Templates for GitHub issues
- [`PULL_REQUEST_TEMPLATE.md`](PULL_REQUEST_TEMPLATE.md): Template for pull requests

## Workflows

The following GitHub Actions workflows are configured:

### CI/CD Workflows

- **Build and Test**: Builds the project and runs tests on every push and pull request
- **Lint**: Runs linting checks on every push and pull request
- **Deploy**: Deploys the project to the staging environment on push to the `develop` branch
- **Release**: Deploys the project to production on push to the `main` branch

### Utility Workflows

- **Dependency Updates**: Automatically updates dependencies using Dependabot
- **Issue Management**: Automatically labels and assigns issues based on content
- **Stale Issue Cleanup**: Automatically closes stale issues and pull requests

## Issue Templates

The following issue templates are available:

- **Bug Report**: Template for reporting bugs
- **Feature Request**: Template for requesting new features
- **Documentation Update**: Template for requesting documentation updates

## Pull Request Template

The pull request template includes:

- Description of changes
- Related issue(s)
- Type of change (bugfix, feature, etc.)
- Checklist of requirements
- Testing instructions

## Contributing

For more information on contributing to the project, see the [CONTRIBUTING.md](../CONTRIBUTING.md) file in the root directory.
