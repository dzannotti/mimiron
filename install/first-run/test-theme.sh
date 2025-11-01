#!/bin/bash

# Temporary script to test Catppuccin theme installation without full reinstall

echo "Testing Catppuccin GTK Theme installation..."

# Remove old AUR theme package if installed
if pacman -Qi catppuccin-gtk-theme-git &>/dev/null; then
    echo "→ Removing old catppuccin-gtk-theme-git AUR package..."
    yay -R --noconfirm catppuccin-gtk-theme-git
    echo "✓ Old package removed"
fi

# Install Catppuccin GTK Theme from source
echo "→ Installing Catppuccin GTK Theme from source..."
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
git clone --depth 1 https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
cd Catppuccin-GTK-Theme/themes
./install.sh -t flamingo -s compact -l --tweaks macchiato macos outline
cd ~
rm -rf "$TEMP_DIR"
echo "✓ Catppuccin theme installed"
echo

# Apply the theme
echo "→ Applying Catppuccin theme..."
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Flamingo-Compact-Macchiato-B-MB"
gsettings set org.gnome.shell.extensions.user-theme name "Catppuccin-Flamingo-Compact-Macchiato-B-MB"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Flamingo-Compact-Macchiato-B-MB"

echo "✓ Theme applied!"
echo
echo "You may need to restart GNOME Shell (Alt+F2, type 'r') to see all changes"
