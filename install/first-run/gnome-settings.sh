#!/bin/bash

# Apply saved GNOME and extension settings

echo "Applying GNOME settings..."

SETTINGS_DIR="$HOME/.local/share/mimiron/default/gnome"

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

echo "GNOME settings applied"
