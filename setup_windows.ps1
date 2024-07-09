$RepoDir = "$env:USERPROFILE\Documents\wezterm-config"
$WeztermConfig = "$env:USERPROFILE\.wezterm.lua"
$RepoUrl = "git@github.com:msetsma/my-wezterm.git"

if (!(Test-Path $RepoDir)) {
    Write-Host "Cloning WezTerm config repository..."
    git clone $RepoUrl $RepoDir
} else {
    Write-Host "Updating WezTerm config repository..."
    Set-Location $RepoDir
    git pull
}

if (!(Test-Path $WeztermConfig)) {
    Write-Host "Creating symlink..."
    New-Item -ItemType SymbolicLink -Path $WeztermConfig -Target "$RepoDir\wezterm.lua"
} else {
    Write-Host "Config file already exists."
}

# Set environment variable
[System.Environment]::SetEnvironmentVariable("WEZTERM_CONFIG_FILE", "$RepoDir\wezterm.lua", "User")

Write-Host "Setup complete!"