#!/bin/bash

echo "Configuring GDM login screen..."

# Copy GDM dconf configuration
echo "→ Installing GDM dconf settings..."
sudo cp "$HOME/.local/share/mimiron/default/gnome/gdm-dconf" /etc/dconf/db/gdm.d/01-mimiron
sudo cp "$HOME/.local/share/mimiron/default/gnome/gdm-profile" /etc/dconf/profile/gdm

# Create backgrounds directory and copy wallpaper for GDM
echo "→ Installing GDM background..."
sudo mkdir -p /usr/share/backgrounds/mimiron
sudo cp "$HOME/.local/share/mimiron/default/backgrounds/shaded.png" /usr/share/backgrounds/mimiron/

# Copy Catppuccin logo for GDM
echo "→ Installing Catppuccin logo..."
sudo cp "$HOME/.local/share/mimiron/default/logos/catppuccin-logo.png" /usr/share/pixmaps/

# Compile dconf database for GDM
echo "→ Compiling dconf database..."
sudo dconf update

# Create dconf directories for gdm user with proper permissions
sudo mkdir -p /var/lib/gdm/.cache/dconf
sudo mkdir -p /var/lib/gdm/.config/dconf
sudo chown -R gdm:gdm /var/lib/gdm/.cache
sudo chown -R gdm:gdm /var/lib/gdm/.config
sudo chmod 700 /var/lib/gdm/.cache/dconf
sudo chmod 700 /var/lib/gdm/.config/dconf

echo "✓ GDM login screen configured with Catppuccin Lavender Dark theme"
echo "  Theme: Catppuccin-Lavender-Dark"
echo "  Icons: WhiteSur"
echo "  Cursor: Bibata-Modern-Ice"
echo "  Background: shaded.png"
echo "  Logo: Catppuccin"
echo ""
echo "Note: Changes will take effect after reboot or restarting GDM"
