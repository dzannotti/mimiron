#!/bin/bash

# Configure GNOME theme, icons, cursor, and appearance

echo "Installing and configuring GNOME theme..."

# Install Catppuccin GTK Theme
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

cd "$TEMP_DIR"

# Clone the theme repository
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
cd Catppuccin-GTK-Theme

# Install with: compact, outline, dark, macos buttons, mocha flavor
# -s compact = compact size
# --tweaks outline macos = outline windows with macos buttons
# -c dark = dark variant only
# -l = link GTK4 to config
./install.sh -s compact --tweaks outline macos -c dark -l

echo "Configuring GNOME appearance..."

# Set GTK theme to Catppuccin Mocha
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Compact-Blue-Dark-Outline-MacOS"

# Set color scheme to prefer dark
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set WhiteSur icon theme
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-dark'

# Set Bibata Ice cursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'

echo "GNOME theme, icons, and cursor configured"
