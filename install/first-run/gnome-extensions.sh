#!/bin/bash
# Install and enable GNOME extensions
# This must run after first login to GNOME

echo "Installing GNOME extensions..."

# Get GNOME Shell version
GNOME_VERSION=$(gnome-shell --version | grep -oP '(?<=GNOME Shell )\d+')
echo "Detected GNOME Shell version: $GNOME_VERSION"

# Map of extension UUID to extensions.gnome.org ID
declare -A EXTENSIONS=(
  ["dash-to-dock@micxgx.gmail.com"]="307"
  ["arcmenu@arcmenu.com"]="3628"
  ["blur-my-shell@aunetx"]="3193"
  ["Vitals@CoreCoding.com"]="1460"
  ["clipboard-indicator@tudmotu.com"]="779"
  ["user-theme@gnome-shell-extensions.gcampax.github.com"]="19"
  ["trayIconsReloaded@selfmade.pl"]="2890"
)

# Temporary directory for downloads
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Install each extension by downloading and installing the zip
for uuid in "${!EXTENSIONS[@]}"; do
  ext_id="${EXTENSIONS[$uuid]}"

  if gnome-extensions list 2>/dev/null | grep -q "$uuid"; then
    echo "  ✓ $uuid already installed"
  else
    echo "Installing $uuid (ID: $ext_id)..."

    # Get the download URL for this extension
    INFO_URL="https://extensions.gnome.org/extension-info/?pk=${ext_id}&shell_version=${GNOME_VERSION}"
    DOWNLOAD_URL=$(curl -s "$INFO_URL" | grep -oP '"download_url":"\K[^"]+' | head -1)

    if [ -n "$DOWNLOAD_URL" ]; then
      echo "  Downloading from: https://extensions.gnome.org${DOWNLOAD_URL}"
      # Download the extension zip
      ZIP_FILE="$TEMP_DIR/${uuid}.zip"
      curl -sL "https://extensions.gnome.org${DOWNLOAD_URL}" -o "$ZIP_FILE"

      # Install it
      if gnome-extensions install --force "$ZIP_FILE" 2>&1; then
        echo "  ✓ Installed $uuid"
      else
        echo "  ✗ Failed to install $uuid"
      fi
    else
      echo "  ✗ Could not find download URL for $uuid (might not support GNOME $GNOME_VERSION)"
    fi
  fi

  # Enable the extension
  if gnome-extensions enable "$uuid" 2>&1; then
    echo "  ✓ Enabled $uuid"
  else
    echo "  ✗ Failed to enable $uuid"
  fi
done

echo ""
echo "GNOME extensions installation complete."
echo "You may need to restart GNOME Shell (Alt+F2, type 'r') or log out and back in."
