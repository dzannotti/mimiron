# Configure GNOME theme and appearance
# This must run after GNOME is installed but before first login

# Set GTK theme to Adwaita-dark
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Set color scheme to prefer dark
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set icon theme to Yaru (Ubuntu-style icons)
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Update icon cache for Yaru icons
sudo gtk-update-icon-cache /usr/share/icons/Yaru
