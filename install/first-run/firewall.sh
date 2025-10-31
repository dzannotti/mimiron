# Configure UFW firewall with sensible defaults

echo "Configuring UFW firewall..."

# Allow nothing in, everything out
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Turn on the firewall
sudo ufw --force enable

# Enable UFW systemd service to start on boot
sudo systemctl enable ufw

echo "Firewall configured and enabled"
