# Mimiron

Opinionated Arch Linux configuration focused on GNOME desktop and modern development workflows.

## Installation

### Prerequisites
Fresh Arch Linux installation with:
- Base packages (default)
- User account created (non-root)
- `networkmanager` installed
- Working internet connection

### Connect to Internet (if WiFi)

After fresh Arch install, you'll be in a TTY terminal. Connect to WiFi:

```bash
# Start NetworkManager service
sudo systemctl start NetworkManager

# Connect to WiFi using nmtui (Text UI)
nmtui

# Or use nmcli (command line)
nmcli device wifi list
nmcli device wifi connect "YOUR_SSID" password "YOUR_PASSWORD"

# Verify connection
ping -c 3 archlinux.org
```

**Ethernet:** Should work automatically if NetworkManager is running.

### Quick Start

```bash
# Clone to expected location
git clone https://github.com/dzannotti/mimiron.git ~/.local/share/mimiron

# Run bootstrap
source ~/.local/share/mimiron/boot.sh
```

After installation completes, reboot into GNOME.

### Post-Install (First boot into GNOME)

After logging into GNOME for the first time, run:

```bash
# Install GNOME extensions
source ~/.local/share/mimiron/install/config/gnome-extensions.sh
```

This will install all configured GNOME extensions. You can then enable/disable them using Extension Manager.

## Philosophy

Inspired by [omarchy](https://github.com/basecamp/omarchy)'s principles but tailored for GNOME users who want:
- Ubuntu-quality defaults and polish on Arch
- Minimal configuration overhead (no tiling WM)
- Quick recovery from system issues
- Repeatable, version-controlled setup

Perfect for ultrawide monitor users who prefer traditional desktop paradigms.

## What's Included

### Desktop Environment
- **GNOME** - Full desktop environment with Ubuntu-like defaults
- **Catppuccin theme** - Consistent theming across all applications

### Development Tools
- **VSCode** - Primary editor with extensions and settings
- **Neovim** - Terminal editor with full configuration
- **mise** - Runtime version manager (replaces asdf/nvm/gvm)
  - Node.js
  - Bun
  - Go

### Configuration
- Shell configuration and aliases
- Git configuration
- Application preferences and dotfiles

## Goals

Transform a minimal Arch installation into a fully configured development environment with:
- Production-ready tooling
- Consistent theming
- Sensible defaults
- Zero manual configuration steps

## Notes

This is a personal configuration primarily for my own use. It's public for my own reference and in case the approach is useful to others, but it's not designed as a general-purpose installer.

