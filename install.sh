#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Ensure terminal is cleaned up on exit (even if script fails)
cleanup_terminal() {
  printf "\033[?25h"  # Show cursor
  printf "\033[0m"    # Reset colors/formatting
}
trap cleanup_terminal EXIT

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
echo  # Add space for log output
start_install_log

# Run installation phases (log streaming shows progress)
source "$MIMIRON_INSTALL/preflight/all.sh"
source "$MIMIRON_INSTALL/packaging/all.sh"
source "$MIMIRON_INSTALL/config/all.sh"
source "$MIMIRON_INSTALL/login/all.sh"

stop_install_log
source "$MIMIRON_INSTALL/post-install/all.sh"
