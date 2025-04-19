# Project Template Generator
# Creates a new project from a template

# Configuration
$TemplateName = "python-project" # Options: python-project, node-project, dotnet-project
$ProjectName = "my-new-project"
$ProjectPath = "C:\Users\adamj\Github_Repositories\$ProjectName"

# Create project directory
if (!(Test-Path -Path $ProjectPath)) {
    New-Item -ItemType Directory -Path $ProjectPath | Out-Null
    Write-Host "Created project directory: $ProjectPath"
}

# Python project template
function Create-PythonTemplate {
    # Create directory structure
    New-Item -ItemType Directory -Path "$ProjectPath\src" | Out-Null
    New-Item -ItemType Directory -Path "$ProjectPath\tests" | Out-Null
    New-Item -ItemType Directory -Path "$ProjectPath\docs" | Out-Null
    
    # Create README
    @"
# $ProjectName

A Python project.

## Installation

```
pip install -r requirements.txt
```

## Usage

```python
from src.main import main

main()
```
"@ | Out-File -FilePath "$ProjectPath\README.md" -Encoding utf8
    
    # Create main.py
    @"
def main():
    print("Hello, World!")

if __name__ == "__main__":
    main()
"@ | Out-File -FilePath "$ProjectPath\src\main.py" -Encoding utf8
    
    # Create requirements.txt
    @"
pytest==7.3.1
"@ | Out-File -FilePath "$ProjectPath\requirements.txt" -Encoding utf8
    
    # Create .gitignore
    @"
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Distribution / packaging
dist/
build/
*.egg-info/

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
.pytest_cache/

# Virtual environments
venv/
env/
ENV/

# IDE specific files
.idea/
.vscode/
*.swp
*.swo
"@ | Out-File -FilePath "$ProjectPath\.gitignore" -Encoding utf8
    
    Write-Host "Python project template created at: $ProjectPath"
}

# Create project based on template
switch ($TemplateName) {
    "python-project" { Create-PythonTemplate }
    default { Write-Host "Template not found: $TemplateName" }
}
