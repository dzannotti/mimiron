#!/bin/bash

# Install NvChad configuration

echo "Installing NvChad..."

# Clone NvChad starter
if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/NvChad/starter ~/.config/nvim
  # Remove .git folder so it doesn't conflict with our own config tracking
  rm -rf ~/.config/nvim/.git
  echo "  ✓ NvChad starter cloned"
else
  echo "  Neovim config already exists, skipping clone"
fi

# Copy our custom overrides (if any exist)
if [ -d "$MIMIRON_PATH/config/nvim/lua" ]; then
  echo "Applying custom nvim configuration..."
  cp -r "$MIMIRON_PATH/config/nvim/lua"/* ~/.config/nvim/lua/
  echo "  ✓ Custom config applied"
fi

echo "NvChad configuration installed"
echo "Plugins will be installed automatically when you first run 'nvim'"
