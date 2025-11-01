#!/bin/bash

echo "Installing Catppuccin GTK Theme from source..."

# Create temp directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Clone the repo
echo "→ Cloning Catppuccin GTK Theme repository..."
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
cd Catppuccin-GTK-Theme/themes

# Install with specific options:
# -t flamingo: flamingo accent color
# -s compact: compact size variant
# -l: link to libadwaita (gtk-4.0)
# --tweaks macchiato macos outline: macchiato colorscheme, macOS buttons, outline windows
echo "→ Installing Catppuccin-Flamingo-Compact theme..."
./install.sh -t flamingo -s compact -l --tweaks macchiato macos outline

echo "✓ Catppuccin GTK Theme installed"
echo "  Variant: Flamingo-Compact with macOS buttons and outline"
echo "  Location: ~/.themes"

# Clean up
cd ~
rm -rf "$TEMP_DIR"

echo "Theme installation complete!"
