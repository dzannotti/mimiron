#!/bin/bash

# Apply saved GNOME and extension settings

echo "Applying GNOME settings..."

SETTINGS_DIR="$HOME/.local/share/mimiron/default/gnome"

# Save current wallpaper setting before loading dconf
WALLPAPER_URI=$(gsettings get org.gnome.desktop.background picture-uri)
WALLPAPER_URI_DARK=$(gsettings get org.gnome.desktop.background picture-uri-dark)

# Apply extension settings
if [ -f "$SETTINGS_DIR/extensions-settings.dconf" ]; then
  echo "  Loading extension settings..."
  dconf load /org/gnome/shell/extensions/ < "$SETTINGS_DIR/extensions-settings.dconf"
fi

# Apply desktop settings
if [ -f "$SETTINGS_DIR/desktop-settings.dconf" ]; then
  echo "  Loading desktop settings..."
  dconf load /org/gnome/desktop/ < "$SETTINGS_DIR/desktop-settings.dconf"
fi

# Apply shell settings (be careful - this includes enabled extensions list)
if [ -f "$SETTINGS_DIR/shell-settings.dconf" ]; then
  echo "  Loading shell settings..."
  dconf load /org/gnome/shell/ < "$SETTINGS_DIR/shell-settings.dconf"
fi

# Restore wallpaper setting
gsettings set org.gnome.desktop.background picture-uri "$WALLPAPER_URI"
gsettings set org.gnome.desktop.background picture-uri-dark "$WALLPAPER_URI_DARK"

echo "GNOME settings applied"
