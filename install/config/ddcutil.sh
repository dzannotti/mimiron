#!/bin/bash

# Configure ddcutil for monitor control

echo "Configuring ddcutil..."

# Add user to i2c group
sudo usermod -aG i2c "$USER"

# Load i2c-dev kernel module
sudo modprobe i2c-dev

# Make i2c-dev load on boot
echo "i2c-dev" | sudo tee /etc/modules-load.d/i2c-dev.conf >/dev/null

echo "ddcutil configured (logout/login required for group changes to take effect)"
