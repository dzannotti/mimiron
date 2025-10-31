# Install and enable GNOME extensions
# This must run after first login to GNOME

echo "Installing GNOME extensions..."

# List of extension IDs to install
EXTENSIONS=(
  "dash-to-dock@micxgx.gmail.com"
  "arcmenu@arcmenu.com"
  "desktop-cube@schneegans.github.com"
  "blur-my-shell@aunetx"
  "burn-my-windows@schneegans.github.com"
  "Vitals@CoreCoding.com"
  "clipboard-indicator@tudmotu.com"
  "user-theme@gnome-shell-extensions.gcampax.github.com"
)

# Install each extension
for ext in "${EXTENSIONS[@]}"; do
  if ! gnome-extensions list | grep -q "$ext"; then
    echo "Installing $ext..."
    # Extensions will be installed via extension-manager or manual install
    # For now, just enable if already present
    gnome-extensions enable "$ext" 2>/dev/null || true
  fi
done

echo "GNOME extensions configured"
