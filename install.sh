#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Prompt for sudo password once and cache credentials
sudo -v

source "$MIMIRON_INSTALL/preflight/all.sh"
source "$MIMIRON_INSTALL/packaging/all.sh"
source "$MIMIRON_INSTALL/config/all.sh"
source "$MIMIRON_INSTALL/login/all.sh"
source "$MIMIRON_INSTALL/post-install/all.sh"
