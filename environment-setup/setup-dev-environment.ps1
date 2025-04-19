# Development Environment Setup
# Sets up a development environment with essential tools

# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey is already installed"
}

# List of development tools to install
$DevTools = @(
    "git",
    "vscode",
    "nodejs-lts",
    "python",
    "dotnet-sdk"
)

# Install development tools
foreach ($tool in $DevTools) {
    choco install $tool -y
}

# Configure Git
git config --global core.autocrlf input
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Install global Node.js packages
npm install -g yarn

# Install Python packages
pip install --upgrade pip
pip install pytest
pip install black

Write-Host "Development environment setup complete!"
