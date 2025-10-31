#!/bin/bash

# Configure Cloudflare DNS globally for all NetworkManager connections

echo "Configuring Cloudflare DNS..."

# Create NetworkManager config to use Cloudflare DNS
sudo tee /etc/NetworkManager/conf.d/dns.conf > /dev/null << 'NMCONF'
[global-dns]
searches=

[global-dns-domain-*]
servers=1.1.1.1,1.0.0.1,2606:4700:4700::1111,2606:4700:4700::1001
NMCONF

# Restart NetworkManager to apply changes
sudo systemctl restart NetworkManager

echo "Cloudflare DNS configured for all interfaces"
