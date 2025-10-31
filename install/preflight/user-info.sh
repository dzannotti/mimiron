#!/bin/bash

# Prompt for git user information
echo ""
read -p "Enter your full name for git: " MIMIRON_USER_NAME
read -p "Enter your email for git: " MIMIRON_USER_EMAIL

export MIMIRON_USER_NAME
export MIMIRON_USER_EMAIL
