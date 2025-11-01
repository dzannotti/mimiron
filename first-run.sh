#!/bin/bash

ansi_art='
▄▄▄▄  ▄ ▄▄▄▄  ▄  ▄▄▄ ▄▄▄  ▄▄▄▄
█ █ █ ▄ █ █ █ ▄ █   █   █ █   █
█   █ █ █   █ █ █   ▀▄▄▄▀ █   █
      █       █                 '

clear
echo -e "\n$ansi_art\n"
echo "Running first-boot configuration..."
echo

MIMIRON_PATH="$HOME/.local/share/mimiron"

# Run first-run scripts in order
echo "→ Configuring DNS resolver..."
bash "$MIMIRON_PATH/install/first-run/dns-resolver.sh"

echo
echo "→ Configuring firewall..."
bash "$MIMIRON_PATH/install/first-run/firewall.sh"

echo
echo "→ Installing GNOME extensions..."
bash "$MIMIRON_PATH/install/first-run/gnome-extensions.sh"

echo
echo "→ Configuring GDM login screen..."
bash "$MIMIRON_PATH/install/first-run/gdm-config.sh"

echo
echo "→ Showing welcome message..."
bash "$MIMIRON_PATH/install/first-run/welcome.sh"

echo
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                   FIRST-RUN COMPLETE                              ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo
echo "You may need to:"
echo "  - Restart GNOME Shell (Alt+F2, type 'r', press Enter)"
echo "  - Or log out and back in for all changes to take effect"
echo
