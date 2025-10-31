#!/bin/bash

# Update Mimiron configuration
# Pulls latest changes from git and re-applies dotfiles/config

set -e

MIMIRON_PATH="$HOME/.local/share/mimiron"

cd "$MIMIRON_PATH"

echo "Updating Mimiron..."
echo

# Pull latest changes
echo "→ Pulling latest changes from git..."
git pull

echo
echo "→ Updating dotfiles and configuration..."

# Re-copy dotfiles from config/ to ~/.config
mkdir -p ~/.config
cp -R "$MIMIRON_PATH/config/"* ~/.config

# Ensure autostart file is updated
mkdir -p "$HOME/.config/autostart"
cp -f "$MIMIRON_PATH/config/autostart/mimiron-first-run.desktop" "$HOME/.config/autostart/"

# Re-apply zsh configuration
if [ -d "$MIMIRON_PATH/config/zsh" ]; then
  echo "→ Updating zsh configuration..."
  cp -R "$MIMIRON_PATH/config/zsh/"* ~/.config/zsh/
fi

# Update default system files (requires sudo)
echo
echo "→ Updating system defaults (requires sudo)..."

# GPG configuration
if [ -d "$MIMIRON_PATH/default/gpg" ]; then
  sudo cp -R "$MIMIRON_PATH/default/gpg/"* /etc/
fi

# Zsh system default
if [ -f "$MIMIRON_PATH/default/zshrc" ]; then
  sudo cp "$MIMIRON_PATH/default/zshrc" /etc/zsh/zshrc
fi

echo
echo "✓ Mimiron configuration updated!"
echo
echo "Note: Some changes may require:"
echo "  - Restarting your terminal (for shell changes)"
echo "  - Logging out and back in (for GNOME settings)"
echo "  - Reloading GNOME Shell (Alt+F2, type 'r', press Enter)"
echo
