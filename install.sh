#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Prompt for sudo password once and cache credentials
sudo -v

export MIMIRON_PATH="$HOME/.local/share/mimiron"
export MIMIRON_INSTALL="$MIMIRON_PATH/install"

source "$MIMIRON_INSTALL/preflight/all.sh"
source "$MIMIRON_INSTALL/packaging/all.sh"
source "$MIMIRON_INSTALL/config/all.sh"
