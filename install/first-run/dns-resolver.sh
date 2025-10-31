# Configure systemd-resolved as DNS resolver
# https://wiki.archlinux.org/title/Systemd-resolved

echo "Configuring systemd-resolved DNS resolver..."

# Enable and start systemd-resolved
sudo systemctl enable systemd-resolved.service
sudo systemctl start systemd-resolved.service

# Symlink resolv.conf to use systemd-resolved
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
