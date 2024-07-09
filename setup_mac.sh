#!/bin/bash

REPO_DIR="$HOME/wezterm-config"
WEZTERM_CONFIG="$HOME/.wezterm.lua"
REPO_URL="git@github.com:msetsma/my-wezterm.git"

if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning WezTerm config repository..."
    git clone "$REPO_URL" "$REPO_DIR"
else
    echo "Updating WezTerm config repository..."
    cd "$REPO_DIR" && git pull
fi

if [ ! -L "$WEZTERM_CONFIG" ]; then
    echo "Creating symlink..."
    ln -s "$REPO_DIR/wezterm.lua" "$WEZTERM_CONFIG"
else
    echo "Symlink already exists."
fi

echo "Setup complete!"