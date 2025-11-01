#!/bin/bash

echo "Configuring Walker launcher..."

# Copy walker launch scripts to ~/.local/bin
mkdir -p ~/.local/bin
cp "$MIMIRON_PATH/bin/mimiron-launch-walker" ~/.local/bin/
cp "$MIMIRON_PATH/bin/mimiron-restart-walker" ~/.local/bin/
chmod +x ~/.local/bin/mimiron-launch-walker
chmod +x ~/.local/bin/mimiron-restart-walker

# Create pacman hook to restart walker/elephant after updates
sudo mkdir -p /etc/pacman.d/hooks
sudo tee /etc/pacman.d/hooks/walker-restart.hook > /dev/null << 'HOOK_EOF'
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Operation = Remove
Target = walker
Target = elephant*

[Action]
Description = Restarting Walker and Elephant services
When = PostTransaction
Exec = /home/$USER/.local/bin/mimiron-restart-walker
HOOK_EOF

echo "Walker launch scripts and pacman hook configured"
