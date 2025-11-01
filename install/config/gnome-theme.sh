#!/bin/bash

# Configure GNOME theme, icons, cursor, and appearance

echo "Configuring GNOME appearance..."

# Note: Catppuccin theme is installed from source during packaging

# Set GTK theme to Catppuccin Flamingo Compact with Macchiato colorscheme
# Theme name format: Catppuccin-<Accent>-<Size>-<Colorscheme>-<Border>-<Buttons>
# B = Bordered, MB = macOS Buttons
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Flamingo-Compact-Macchiato-B-MB"

# Set shell theme (GNOME Shell appearance)
gsettings set org.gnome.shell.extensions.user-theme name "Catppuccin-Flamingo-Compact-Macchiato-B-MB"

# Set legacy applications theme (GTK2/window manager)
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Flamingo-Compact-Macchiato-B-MB"

# Set color scheme to prefer dark
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set accent color to lavender (purple)
gsettings set org.gnome.desktop.interface accent-color "purple"

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
