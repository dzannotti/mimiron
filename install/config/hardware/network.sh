#!/bin/bash

# Ensure NetworkManager service will be started
sudo systemctl enable NetworkManager.service

# Prevent systemd-networkd-wait-online timeout on boot
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service
