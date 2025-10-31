#!/bin/bash

# Install all base packages (using yay to handle both repo and AUR packages)
# --ask 4 auto-resolves conflicts by choosing the repo version (pipewire-jack over jack)
# --removemake removes build dependencies after AUR package builds
# --nodeps skips dependency checks (we'll handle deps ourselves)
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-base.packages" | grep -v '^$')
yay -S --noconfirm --needed --ask 4 --removemake "${packages[@]}"
