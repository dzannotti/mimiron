# Mimiron

Opinionated Arch Linux configuration focused on GNOME desktop and modern development workflows.

## Installation

### Prerequisites
Fresh Arch Linux installation with:
- Base packages (default)
- `networkmanager` and `nmtui`
- Working internet connection

### Quick Start

```bash
# Clone to expected location
git clone git@github.com:dzannotti/mimiron.git ~/.local/share/mimiron

# Run bootstrap
source ~/.local/share/mimiron/boot.sh
```

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

