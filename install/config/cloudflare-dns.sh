#!/bin/bash

# Configure Cloudflare DNS for active NetworkManager connections

echo "Configuring Cloudflare DNS..."

# Get all active connection UUIDs
ACTIVE_CONNECTIONS=$(nmcli -t -f UUID,TYPE connection show --active | grep -E 'ethernet|wifi|wireless' | cut -d: -f1)

if [[ -z "$ACTIVE_CONNECTIONS" ]]; then
  echo "No active network connections found, skipping DNS configuration"
  return 0
fi

# Configure DNS for each active connection
for UUID in $ACTIVE_CONNECTIONS; do
  CONNECTION_NAME=$(nmcli -t -f NAME connection show "$UUID")
  echo "Setting Cloudflare DNS for connection: $CONNECTION_NAME"

  # Set IPv4 DNS servers
  nmcli connection modify "$UUID" ipv4.dns "1.1.1.1 1.0.0.1"
  nmcli connection modify "$UUID" ipv4.ignore-auto-dns yes

  # Set IPv6 DNS servers
  nmcli connection modify "$UUID" ipv6.dns "2606:4700:4700::1111 2606:4700:4700::1001"
  nmcli connection modify "$UUID" ipv6.ignore-auto-dns yes
done

# Reload connections to apply changes (doesn't restart NetworkManager)
nmcli connection reload

echo "Cloudflare DNS configured for active connections"
echo "Note: You may need to reconnect to your network for changes to take effect"
