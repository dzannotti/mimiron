#!/bin/bash
# Install and enable GNOME extensions
# This must run after first login to GNOME

echo "Installing GNOME extensions..."

# Map of extension UUID to extensions.gnome.org ID
declare -A EXTENSIONS=(
  ["dash-to-dock@micxgx.gmail.com"]="307"
  ["arcmenu@arcmenu.com"]="3628"
  ["desktop-cube@schneegans.github.com"]="4648"
  ["blur-my-shell@aunetx"]="3193"
  ["burn-my-windows@schneegans.github.com"]="4679"
  ["Vitals@CoreCoding.com"]="1460"
  ["clipboard-indicator@tudmotu.com"]="779"
  ["user-theme@gnome-shell-extensions.gcampax.github.com"]="19"
  ["trayIconsReloaded@selfmade.pl"]="2890"
)

# Install each extension using gdbus
for uuid in "${!EXTENSIONS[@]}"; do
  ext_id="${EXTENSIONS[$uuid]}"
  if ! gnome-extensions list 2>/dev/null | grep -q "$uuid"; then
    echo "Installing $uuid..."
    gdbus call --session \
      --dest org.gnome.Shell.Extensions \
      --object-path /org/gnome/Shell/Extensions \
      --method org.gnome.Shell.Extensions.InstallRemoteExtension \
      "$uuid" 2>/dev/null || echo "  Failed to install $uuid (may need manual install)"
  else
    echo "  $uuid already installed"
  fi

  # Enable the extension
  gnome-extensions enable "$uuid" 2>/dev/null || true
done

echo "GNOME extensions configured"
