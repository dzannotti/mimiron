#!/bin/bash

echo "Installing multilib packages (Steam and 32-bit support)..."

# Multilib should already be enabled in pacman.conf
# Install multilib packages
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-multilib.packages" | grep -v '^$')

if [ ${#packages[@]} -gt 0 ]; then
    yay -S --noconfirm --needed "${packages[@]}"
    echo "Multilib packages installed"
else
    echo "No multilib packages to install"
fi
