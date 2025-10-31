#!/bin/bash

# Install build tools and reflector
sudo pacman -S --needed --noconfirm base-devel git openssh reflector

# Configure pacman
sudo cp -f "$MIMIRON_PATH/default/pacman/pacman.conf" /etc/pacman.conf

# Use reflector to generate a fast mirrorlist
echo "Generating optimized mirrorlist with reflector..."
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Configure cache proxy for testing (optional - set MIMIRON_CACHE_PROXY to enable)
# Example: export MIMIRON_CACHE_PROXY="192.168.122.1:8080"
if [[ -n "$MIMIRON_CACHE_PROXY" ]]; then
    echo "Prepending cache proxy at $MIMIRON_CACHE_PROXY to mirrorlist..."
    sudo sed -i "1iServer = http://$MIMIRON_CACHE_PROXY/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
fi

sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

sudo pacman -Sy
sudo pacman -S --noconfirm --needed omarchy-keyring

# Refresh all repos
sudo pacman -Syu --noconfirm
