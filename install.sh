#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

export MIMIRON_PATH="$HOME/.local/share/mimiron"
export MIMIRON_INSTALL="$MIMIRON_PATH/install"

source "$MIMIRON_INSTALL/preflight/all.sh"
