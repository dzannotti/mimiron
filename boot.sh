#!/bin/bash

ansi_art='
▄▄▄▄  ▄ ▄▄▄▄  ▄  ▄▄▄ ▄▄▄  ▄▄▄▄
█ █ █ ▄ █ █ █ ▄ █   █   █ █   █
█   █ █ █   █ █ █   ▀▄▄▄▀ █   █
      █       █                 '

clear
echo -e "\n$ansi_art\n"

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

sudo pacman -Syu --noconfirm --needed git

echo -e "\nInstallation starting..."
source ~/.local/share/mimiron/install.sh
