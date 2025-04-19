# GitHub Repository Automation Script
# Creates a GitHub repository and pushes local code

# Configuration
$GitHubUsername = "JesterMachine" # Change to your GitHub username
$RepoName = "NEW_REPO_NAME" # Change this for each new repository
$Private = $false    # Set to $true for private repo
$Token = "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"   # Your GitHub personal access token
$RepoDescription = "Repository description goes here"
$LocalPath = "C:\Users\adamj\Github_Repositories\$RepoName"

# Create GitHub repo using API
$Headers = @{ Authorization = "token $Token" }
$Body = @{
    name        = $RepoName
    description = $RepoDescription
    private     = $Private
} | ConvertTo-Json

Invoke-RestMethod -Method Post -Uri "https://api.github.com/user/repos" -Headers $Headers -Body $Body -ContentType "application/json"

# Navigate to local project folder - Create if it doesn't exist
if (!(Test-Path -Path $LocalPath)) {
    New-Item -ItemType Directory -Path $LocalPath | Out-Null
    Write-Host "Created directory: $LocalPath"
}
Set-Location $LocalPath

# Create a README.md file if it doesn't exist
if (!(Test-Path -Path "$LocalPath\README.md")) {
    @"
# $RepoName

$RepoDescription

## Getting Started

Instructions for getting the project up and running.

## Features

- Feature 1
- Feature 2
"@ | Out-File -FilePath "$LocalPath\README.md" -Encoding utf8
    Write-Host "Created README.md file"
}

# Initialize Git and push
git init
git add .
git commit -m "Initial commit of $RepoName repository"
git branch -M main

# Check if remote exists and remove it if it does
$remoteExists = git remote | Where-Object { $_ -eq "origin" }
if ($remoteExists) {
    git remote remove origin
    Write-Host "Removed existing origin remote"
}

# Add the correct remote and push
git remote add origin "https://github.com/$GitHubUsername/$RepoName.git"
git push -u origin main

# Open repo in browser
Start-Process ("https://github.com/" + $GitHubUsername + "/" + $RepoName)

Write-Host "Repository setup complete! Your code has been pushed to GitHub."
