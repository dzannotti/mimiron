# Configure systemd-resolved as DNS resolver
# https://wiki.archlinux.org/title/Systemd-resolved

echo "Configuring systemd-resolved DNS resolver..."
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
