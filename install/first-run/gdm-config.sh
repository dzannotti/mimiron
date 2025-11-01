#!/bin/bash

echo "Configuring GDM login screen..."

# Create dconf directories for gdm user with proper permissions
sudo mkdir -p /var/lib/gdm/.cache/dconf
sudo mkdir -p /var/lib/gdm/.config/dconf
sudo chown -R gdm:gdm /var/lib/gdm/.cache
sudo chown -R gdm:gdm /var/lib/gdm/.config

# Set GTK theme for GDM to Catppuccin
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Lavender-Dark"

# Set icon theme for GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"

# Set cursor theme for GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"

# Enable logo on login screen with Catppuccin logo
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo "/usr/share/pixmaps/catppuccin-logo.png"

# Set font for GDM
sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface font-name "Ubuntu Sans 11"

echo "GDM login screen configured with Catppuccin theme"
