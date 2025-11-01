#!/bin/bash

echo "Configuring GDM login screen..."

# Create dconf directories if they don't exist
echo "→ Creating dconf directories..."
sudo mkdir -p /etc/dconf/db/gdm.d
sudo mkdir -p /etc/dconf/profile

# Copy GDM dconf configuration
echo "→ Installing GDM dconf settings..."
sudo cp "$HOME/.local/share/mimiron/default/gnome/gdm-dconf" /etc/dconf/db/gdm.d/01-mimiron
sudo cp "$HOME/.local/share/mimiron/default/gnome/gdm-profile" /etc/dconf/profile/gdm

# Create backgrounds directory and copy wallpaper for GDM
echo "→ Installing GDM background..."
sudo mkdir -p /usr/share/backgrounds/mimiron
sudo cp "$HOME/.local/share/mimiron/default/backgrounds/shaded.png" /usr/share/backgrounds/mimiron/

# Note: GDM logo removed - the Catppuccin logo is too large (1544x1544)
# and causes display issues. Logo setting commented out in gdm-dconf.

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

echo "✓ GDM login screen configured"
echo "  Color scheme: Dark with purple accent (Catppuccin Mocha colors)"
echo "  Background: shaded.png"
echo ""
echo "Note: Custom GTK themes require additional GDM CSS configuration"
echo "      Currently using default GDM theme with Catppuccin colors/background"
echo ""
echo "Changes will take effect after reboot or restarting GDM"
