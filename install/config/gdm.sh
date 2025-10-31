#!/bin/bash

echo "Configuring GDM login screen..."

# Enable GDM display manager for next boot (don't start now)
sudo systemctl enable gdm.service

# Configure GDM theme and appearance
# Note: These settings need to be applied as the gdm user

# Set GTK theme for GDM to Catppuccin
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Dark-Compact" 2>/dev/null || true

# Set icon theme for GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme "WhiteSur" 2>/dev/null || true

# Set cursor theme for GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice" 2>/dev/null || true

# Copy Catppuccin logo to system
sudo cp "$MIMIRON_PATH/default/logos/catppuccin-logo.png" /usr/share/pixmaps/

# Enable logo on login screen with Catppuccin logo
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo "/usr/share/pixmaps/catppuccin-logo.png" 2>/dev/null || true

# Set font for GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface font-name "Ubuntu Sans 11" 2>/dev/null || true

echo "GDM login screen configured with Catppuccin theme"
