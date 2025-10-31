#!/bin/bash

ansi_art='
▄▄▄▄  ▄ ▄▄▄▄  ▄  ▄▄▄ ▄▄▄  ▄▄▄▄
█ █ █ ▄ █ █ █ ▄ █   █   █ █   █
█   █ █ █   █ █ █   ▀▄▄▄▀ █   █
      █       █                 '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

echo -e "\nInstallation starting..."
source ~/.local/share/mimiron/install.sh
