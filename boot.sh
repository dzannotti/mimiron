#!/bin/bash
clear

export MIMIRON_PATH="$HOME/.local/share/mimiron"
export MIMIRON_INSTALL="$MIMIRON_PATH/install"

source "$MIMIRON_INSTALL/ascii-art.sh"

# Check internet connectivity
if ! ping -c 1 -W 2 archlinux.org &> /dev/null; then
  echo "ERROR: No internet connection detected!"
  echo
  echo "Please connect to the internet first:"
  echo "  1. Start NetworkManager: sudo systemctl start NetworkManager"
  echo "  2. Connect to WiFi: nmtui"
  echo "  3. Or use: nmcli device wifi connect \"SSID\" password \"PASSWORD\""
  echo "  4. Then run this script again"
  echo
  exit 1
fi

echo "Internet connection verified!"
echo

echo -e "\nInstallation starting..."
source "$MIMIRON_INSTALL/install.sh"
