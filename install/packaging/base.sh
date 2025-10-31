#!/bin/bash

# Install all base packages (using yay to handle both repo and AUR packages)
# --noconfirm skips all prompts
# --needed skips already installed packages
# --removemake removes build dependencies after AUR package builds
# --answerdiff/clean/edit None auto-answers AUR prompts
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-base.packages" | grep -v '^$')
yay -S --noconfirm --needed --removemake --answerdiff None --answerclean None --answeredit None "${packages[@]}"
