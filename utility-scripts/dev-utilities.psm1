# Development Utilities
# A collection of useful utility functions for development

# Get the size of a directory
function Get-DirectorySize {
    param(
        [string]$Path
    )
    
    $size = (Get-ChildItem -Path $Path -Recurse -Force | Measure-Object -Property Length -Sum).Sum
    return [math]::Round($size / 1MB, 2)
}

# Find and replace text in files
function Find-ReplaceInFiles {
    param(
        [string]$Directory,
        [string]$FilePattern = "*.cs",
        [string]$FindText,
        [string]$ReplaceText
    )
    
    $files = Get-ChildItem -Path $Directory -Filter $FilePattern -Recurse
    $count = 0
    
    foreach ($file in $files) {
        $content = Get-Content -Path $file.FullName
        if ($content -match $FindText) {
            $content = $content -replace $FindText, $ReplaceText
            Set-Content -Path $file.FullName -Value $content
            $count++
        }
    }
    
    Write-Host "Replaced text in $count files"
}

# Create a new branch and push to remote
function New-GitFeatureBranch {
    param(
        [string]$BranchName
    )
    
    git checkout -b "feature/$BranchName"
    git push -u origin "feature/$BranchName"
    Write-Host "Created and pushed new feature branch: feature/$BranchName"
}

# Export functions
Export-ModuleMember -Function Get-DirectorySize, Find-ReplaceInFiles, New-GitFeatureBranch
