#!/bin/bash

echo "Configuring Walker launcher..."

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
Exec = /usr/bin/bash -c "pkill elephant; pkill walker; sleep 1"
HOOK_EOF

echo "Walker pacman hook configured"
