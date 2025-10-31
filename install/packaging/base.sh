#!/bin/bash

# Install all base packages (using yay to handle both repo and AUR packages)
# --ask 4 auto-resolves conflicts by choosing the repo version (pipewire-jack over jack2)
# --needed skips already installed packages
# --removemake removes build dependencies after AUR package builds
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-base.packages" | grep -v '^$')
yay -S --noconfirm --needed --ask 4 --removemake "${packages[@]}"
