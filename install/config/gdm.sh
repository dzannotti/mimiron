#!/bin/bash

echo "Enabling GDM display manager..."

# Enable GDM display manager for next boot (don't start now)
sudo systemctl enable gdm.service

# Copy Catppuccin logo to system (for manual configuration via gdm-settings)
sudo cp "$MIMIRON_PATH/default/logos/catppuccin-logo.png" /usr/share/pixmaps/ 2>/dev/null || true

# Note: GDM theming should be configured manually using gdm-settings after first login
# gsettings commands don't work during install as gdm user has no active session

echo "GDM enabled - use gdm-settings app to customize login screen after first login"
