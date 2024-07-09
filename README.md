# WezTerm Configuration

This repository contains my personal WezTerm configuration.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [macOS](#macos)
  - [Windows](#windows)
- [Configuration Structure](#configuration-structure)
- [Understanding Symlinks](#understanding-symlinks)
- [Customization](#customization)
- [Updating](#updating)
- [Troubleshooting](#troubleshooting)

## Overview

This WezTerm configuration provides a consistent terminal experience across different operating systems. It includes custom key bindings, appearance settings, and platform-specific optimizations.

## Prerequisites

- [WezTerm](https://wezfurlong.org/wezterm/installation.html) installed on your system
- Git (for version control and easy updates)
- Bash (for macOS setup)
- PowerShell (for Windows setup)

## Installation

### macOS

1. Open Terminal
2. Run the following commands:

   ```bash
   git clone git@github.com:msetsma/my-wezterm.git ~/wezterm-config
   cd ~/wezterm-config
   chmod +x setup_mac.sh
   ./setup_mac.sh
   ```

3. Restart WezTerm to apply the new configuration

### Windows

1. Open PowerShell as Administrator
2. Run the following commands:

   ```powershell
   git clone git@github.com:msetsma/my-wezterm.git $env:USERPROFILE\Documents\wezterm-config
   cd $env:USERPROFILE\Documents\wezterm-config
   .\setup_windows.ps1
   ```

3. Restart WezTerm to apply the new configuration

## Configuration Structure

- `wezterm.lua`: Main configuration file
- `config/`: Directory containing modular configuration files
  - `appearance.lua`: Visual customization settings
  - `keybindings.lua`: Custom key bindings
  - `platform_specific.lua`: Settings specific to Windows or macOS
- `utils.lua`: Helper functions for cross-platform compatibility
- `setup_mac.sh`: Setup script for macOS
- `setup_windows.ps1`: Setup script for Windows

## Understanding Symlinks

This configuration uses symlinks (symbolic links) to make WezTerm use the configuration files in this repository. Here's what you need to know:

- A symlink is a special type of file that points to another file or directory.
- In this setup, we create a symlink at `~/.wezterm.lua` (macOS) or `%USERPROFILE%\.wezterm.lua` (Windows) that points to the `wezterm.lua` file in this repository.
- This allows WezTerm to find the configuration in its expected location while the actual file remains in our version-controlled directory.
- If you delete the symlink, it won't affect the original configuration file in this repository.
- The setup scripts (`setup_mac.sh` and `setup_windows.ps1`) handle creating these symlinks for you.

Benefits of using symlinks in this configuration:
1. Keep your WezTerm configuration under version control.
2. Easily sync your configuration across multiple machines.
3. Quickly revert to the default configuration by simply deleting the symlink.
4. Maintain a clean home directory without scattered configuration files.

## Customization

To customize the configuration:

1. Fork this repository
2. Clone your forked repository
3. Modify the Lua files in the `config/` directory
4. Commit and push your changes
5. Run the appropriate setup script to apply your changes

## Updating

To update your configuration with the latest changes:

1. Navigate to your wezterm-config directory
2. Pull the latest changes: `git pull`
3. Run the setup script for your platform to ensure any new files are properly linked

## Troubleshooting

- If changes don't apply, ensure WezTerm is completely restarted
- Check the WezTerm debug console for any error messages
- Ensure symlinks are correctly created (use `ls -l ~/.wezterm.lua` on macOS or `Get-Item $env:USERPROFILE\.wezterm.lua` on Windows to verify)
- If you encounter issues, you can always revert to the default WezTerm configuration by renaming or removing the symlinked `~/.wezterm.lua` file

For more help, please [open an issue](https://github.com/msetsma/my-wezterm.git) in this repository.