#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Prompt for sudo password once and cache credentials
sudo -v

export MIMIRON_PATH="$HOME/.local/share/mimiron"
export MIMIRON_INSTALL="$MIMIRON_PATH/install"
export MIMIRON_INSTALL_LOG_FILE="/var/log/mimiron-install.log"

# Load helpers first for presentation and logging
source "$MIMIRON_INSTALL/helpers/all.sh"

# Show logo and start installation
show_logo
show_info "Installing..."
echo
start_install_log

# Run installation phases
show_info "Running preflight checks..."
source "$MIMIRON_INSTALL/preflight/all.sh"
show_success "Preflight complete"

show_info "Installing packages..."
source "$MIMIRON_INSTALL/packaging/all.sh"
show_success "Packages installed"

show_info "Configuring system..."
source "$MIMIRON_INSTALL/config/all.sh"
show_success "System configured"

show_info "Setting up login and bootloader..."
source "$MIMIRON_INSTALL/login/all.sh"
show_success "Login configured"

stop_install_log
source "$MIMIRON_INSTALL/post-install/all.sh"
