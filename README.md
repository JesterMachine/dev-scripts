# Development Scripts

A collection of automation scripts for development workflows.

## Contents

### GitHub Automation

Scripts for automating GitHub workflows:
- `github-automation/create-github-repo.ps1` - Creates a GitHub repository and pushes local code

### Project Templates

Templates for quickly starting new projects:
- `project-templates/generate-project.ps1` - Generates a new project from a template

### Utility Scripts

Useful utilities for development:
- `utility-scripts/dev-utilities.psm1` - A collection of utility functions for development

### Environment Setup

Scripts for setting up development environments:
- `environment-setup/setup-dev-environment.ps1` - Sets up a development environment with essential tools

## Getting Started

1. Clone this repository
2. Navigate to the script you want to use
3. Edit the configuration section of the script
4. Run the script with PowerShell

## Usage Examples

### Creating a GitHub Repository

```powershell
# Edit the configuration section of create-github-repo.ps1
$GitHubUsername = "YourUsername"
$RepoName = "YourRepoName"
$Token = "YourGitHubToken"

# Run the script
.\github-automation\create-github-repo.ps1
```

### Generating a Project

```powershell
# Edit the configuration section of generate-project.ps1
$TemplateName = "python-project"
$ProjectName = "your-project-name"

# Run the script
.\project-templates\generate-project.ps1
```

## Contributing

Feel free to contribute by adding new scripts or improving existing ones.
