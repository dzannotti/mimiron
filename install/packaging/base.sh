#!/bin/bash

# Install all base packages (using yay to handle both repo and AUR packages)
# --ask 4 auto-resolves conflicts by choosing the repo version (pipewire-jack over jack)
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-base.packages" | grep -v '^$')

# Log the install to a file for debugging
YAY_LOG="/tmp/mimiron-yay-install.log"
echo "Installing packages... (logging to $YAY_LOG)" | tee "$YAY_LOG"
yay -S --needed --ask 4 "${packages[@]}" 2>&1 | tee -a "$YAY_LOG"
YAY_EXIT_CODE=${PIPESTATUS[0]}

if [ $YAY_EXIT_CODE -ne 0 ]; then
    echo "WARNING: Package installation had errors. Check $YAY_LOG for details."
    echo "Press Enter to continue or Ctrl+C to abort..."
    read
fi
