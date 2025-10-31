#!/bin/bash

# Ensure terminal state is clean
printf "\033[?25h"  # Show cursor
printf "\033[0m"    # Reset colors/formatting

show_logo
echo

if [ -n "${MIMIRON_INSTALL_TIME:-}" ]; then
  show_success "Installation completed in $MIMIRON_INSTALL_TIME"
else
  show_success "Installation completed successfully!"
fi

echo
show_info "Next steps:"
echo
echo "${PADDING_LEFT_SPACES}  1. Reboot your system: sudo reboot"
echo "${PADDING_LEFT_SPACES}  2. Log into GNOME"
echo "${PADDING_LEFT_SPACES}  3. First-run setup will automatically:"
echo "${PADDING_LEFT_SPACES}     • Configure firewall"
echo "${PADDING_LEFT_SPACES}     • Set up DNS resolver"
echo "${PADDING_LEFT_SPACES}     • Configure GNOME extensions"
echo
echo "${PADDING_LEFT_SPACES}Your Arch Linux system is now configured with GNOME desktop,"
echo "${PADDING_LEFT_SPACES}development tools, and a beautiful modern setup."
echo
