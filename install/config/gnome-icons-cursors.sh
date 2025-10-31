#!/bin/bash

# Configure GNOME icons and cursor theme

echo "Configuring GNOME icons and cursor..."

# Set WhiteSur icon theme
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-dark'

# Set Bibata Ice cursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'

echo "Icons and cursor configured"
