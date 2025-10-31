#!/bin/bash

# Install LazyVim with custom overrides

echo "Installing LazyVim..."

# Clone LazyVim starter
if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  # Remove .git folder so it doesn't conflict with our own config tracking
  rm -rf ~/.config/nvim/.git
else
  echo "  Neovim config already exists, skipping clone"
fi

# Copy our custom overrides
if [ -d "$MIMIRON_PATH/config/nvim/lua" ]; then
  echo "Applying custom nvim configuration..."
  cp -r "$MIMIRON_PATH/config/nvim/lua"/* ~/.config/nvim/lua/
fi

echo "LazyVim installed"
