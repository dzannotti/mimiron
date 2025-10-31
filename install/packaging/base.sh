#!/bin/bash

# Install all base packages (using yay to handle both repo and AUR packages)
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-base.packages" | grep -v '^$')
yay -S --noconfirm --needed "${packages[@]}"
