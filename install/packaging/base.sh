#!/bin/bash

# Install all base packages
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
