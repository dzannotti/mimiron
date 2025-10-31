#!/bin/bash

mkdir -p ~/.config
cp -R "$MIMIRON_PATH/config/"* ~/.config

# Ensure autostart directory exists and copy first-run autostart file
mkdir -p "$HOME/.config/autostart"
cp -f "$MIMIRON_PATH/config/autostart/mimiron-first-run.desktop" "$HOME/.config/autostart/"
