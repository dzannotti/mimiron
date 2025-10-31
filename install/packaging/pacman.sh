#!/bin/bash

# Install official repository packages via pacman
echo "Installing official repository packages via pacman..."

# Read package list
mapfile -t packages < <(grep -v '^#' "$MIMIRON_INSTALL/mimiron-pacman.packages" | grep -v '^$')

if [ ${#packages[@]} -eq 0 ]; then
    echo "No pacman packages to install"
    exit 0
fi

echo "Found ${#packages[@]} packages to install from official repos"

# Track failures
failed_packages=()

# Install packages one by one to avoid silent failures
for package in "${packages[@]}"; do
    echo -n "Installing $package... "
    if sudo pacman -S --noconfirm --needed "$package" &>/tmp/mimiron-pacman-$package.log; then
        echo "✓"
    else
        echo "✗ FAILED"
        failed_packages+=("$package")
        echo "  Error log: /tmp/mimiron-pacman-$package.log"
    fi
done

# Report results
echo ""
echo "════════════════════════════════════════════════════════════════"
if [ ${#failed_packages[@]} -eq 0 ]; then
    echo "✓ All pacman packages installed successfully!"
else
    echo "✗ ${#failed_packages[@]} package(s) failed to install:"
    printf '  - %s\n' "${failed_packages[@]}"
    echo ""
    echo "Check log files in /tmp/mimiron-pacman-*.log for details"
    echo ""
    echo "You can retry failed packages manually with:"
    echo "  sudo pacman -S ${failed_packages[*]}"
fi
echo "════════════════════════════════════════════════════════════════"
echo ""
