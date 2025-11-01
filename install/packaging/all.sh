#!/bin/bash

# Install packages in order: official repos first, then AUR
source "$MIMIRON_INSTALL/packaging/pacman.sh"
source "$MIMIRON_INSTALL/packaging/aur.sh"
source "$MIMIRON_INSTALL/packaging/reflector.sh"
