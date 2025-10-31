#!/bin/bash

# Configure GNOME theme, icons, cursor, and appearance

echo "Configuring GNOME appearance..."

# Note: catppuccin-gtk-theme-mocha is installed via AUR packages

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
