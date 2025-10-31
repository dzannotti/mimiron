#!/bin/bash

# Install Catppuccin GTK Theme

echo "Installing Catppuccin GTK Theme..."

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

# Apply the theme
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Compact-Blue-Dark-Outline-MacOS"

echo "Catppuccin GTK theme installed"
