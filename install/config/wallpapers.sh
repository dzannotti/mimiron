#!/bin/bash

# Install wallpapers and configure rotation

echo "Installing wallpapers..."

# Create wallpapers directory
mkdir -p ~/.local/share/backgrounds/mimiron

# Copy wallpapers from default/backgrounds
if [ -d "$MIMIRON_PATH/default/backgrounds" ]; then
  cp "$MIMIRON_PATH/default/backgrounds"/*.{png,jpg,jpeg} ~/.local/share/backgrounds/mimiron/ 2>/dev/null || true
fi

# Get first wallpaper as default
FIRST_WALLPAPER=$(ls ~/.local/share/backgrounds/mimiron/*.{png,jpg,jpeg} 2>/dev/null | head -1)

if [ -n "$FIRST_WALLPAPER" ]; then
  # Set initial wallpaper
  gsettings set org.gnome.desktop.background picture-uri "file://$FIRST_WALLPAPER"
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$FIRST_WALLPAPER"
  
  # Create wallpaper rotation script
  cat > ~/.local/bin/mimiron-rotate-wallpaper << 'ROTATE_EOF'
#!/bin/bash

WALLPAPER_DIR="$HOME/.local/share/backgrounds/mimiron"
CURRENT=$(gsettings get org.gnome.desktop.background picture-uri | sed "s/'//g" | sed 's/file:\/\///')

# Get all wallpapers
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | sort)

# Find current index
CURRENT_INDEX=0
for i in "${!WALLPAPERS[@]}"; do
  if [[ "${WALLPAPERS[$i]}" == "$CURRENT" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Get next wallpaper (wrap around)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))
NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"

# Set new wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$NEXT_WALLPAPER"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$NEXT_WALLPAPER"
ROTATE_EOF

  chmod +x ~/.local/bin/mimiron-rotate-wallpaper
  
  # Create systemd timer for rotation (every 3 hours)
  mkdir -p ~/.config/systemd/user
  
  cat > ~/.config/systemd/user/mimiron-wallpaper-rotate.service << 'SERVICE_EOF'
[Unit]
Description=Rotate Mimiron Wallpaper

[Service]
Type=oneshot
ExecStart=%h/.local/bin/mimiron-rotate-wallpaper
SERVICE_EOF

  cat > ~/.config/systemd/user/mimiron-wallpaper-rotate.timer << 'TIMER_EOF'
[Unit]
Description=Rotate Mimiron Wallpaper every 3 hours

[Timer]
OnBootSec=3h
OnUnitActiveSec=3h
Persistent=true

[Install]
WantedBy=timers.target
TIMER_EOF

  # Note: The timer will be enabled on first login via first-run script
  # Can't enable it here since there's no user session during install

  echo "Wallpapers installed and rotation configured (will enable on first login)"
else
  echo "No wallpapers found in default/backgrounds"
fi
