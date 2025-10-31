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

# Install with: compact, dark only
# -s compact = compact size
# -c dark = dark variant only
# -l = link GTK4 to config
./install.sh -s compact -c dark -l

echo "Configuring GNOME appearance..."

# Set GTK theme to Catppuccin Dark Compact
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Dark-Compact"

# Set color scheme to prefer dark
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set accent color to teal
gsettings set org.gnome.desktop.interface accent-color "teal"

# Set WhiteSur icon theme
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'

# Set Bibata Ice cursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'

# Set fonts
gsettings set org.gnome.desktop.interface font-name 'Ubuntu Sans 11'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Sans Mono 11'
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'slight'

echo "GNOME theme, icons, and cursor configured"
