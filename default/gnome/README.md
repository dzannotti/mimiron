# GDM Configuration Files

This directory contains configuration files for styling the GDM (GNOME Display Manager) login screen.

## Files

### `gdm-dconf`
Contains the dconf settings for GDM's appearance. This file is deployed to `/etc/dconf/db/gdm.d/01-mimiron` and compiled into GDM's dconf database.

**Configured settings:**
- **GTK Theme:** Catppuccin-Lavender-Dark
- **Icon Theme:** WhiteSur
- **Cursor Theme:** Bibata-Modern-Ice
- **Background:** shaded.png (from default/backgrounds)
- **Logo:** Catppuccin logo
- **Colors:** Catppuccin Mocha palette (#1e1e2e base)
- **Accent:** Purple (Lavender)

### `gdm-profile`
Defines the dconf profile for GDM, specifying where GDM should look for its settings database. This is deployed to `/etc/dconf/profile/gdm`.

## How It Works

1. During `first-run.sh`, the configuration files are copied to system locations:
   - `gdm-dconf` → `/etc/dconf/db/gdm.d/01-mimiron`
   - `gdm-profile` → `/etc/dconf/profile/gdm`

2. The shaded background wallpaper is copied to `/usr/share/backgrounds/mimiron/`

3. The Catppuccin logo is copied to `/usr/share/pixmaps/`

4. `dconf update` compiles the text configuration into a binary database that GDM reads

5. GDM directories are created with proper permissions for the `gdm` user

## Testing Changes

After modifying these files, you can test them by running:

```bash
# Copy updated files
sudo cp ~/.local/share/mimiron/default/gnome/gdm-dconf /etc/dconf/db/gdm.d/01-mimiron
sudo cp ~/.local/share/mimiron/default/gnome/gdm-profile /etc/dconf/profile/gdm

# Recompile dconf database
sudo dconf update

# Restart GDM to see changes
sudo systemctl restart gdm
```

**Warning:** Restarting GDM will log you out!

## Customization

To customize the GDM theme:

1. Edit `gdm-dconf` with your desired settings
2. Run the installation via `first-run.sh` or manually copy and compile
3. Restart GDM

### Available Catppuccin Theme Variants

The `catppuccin-gtk-theme-git` package installs multiple variants. You can change the theme by modifying the `gtk-theme` value in `gdm-dconf`:

- `Catppuccin-Lavender-Dark` (current)
- `Catppuccin-Blue-Dark`
- `Catppuccin-Pink-Dark`
- `Catppuccin-Mauve-Dark`
- `Catppuccin-Red-Dark`
- `Catppuccin-Green-Dark`
- `Catppuccin-Yellow-Dark`
- And more...

All variants support `-Light` and `-Dark` suffixes, plus optional `-Compact` for smaller UI elements.
