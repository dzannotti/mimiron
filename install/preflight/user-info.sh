#!/bin/bash

# Check if git user information already exists
EXISTING_NAME=$(git config --global user.name 2>/dev/null || true)
EXISTING_EMAIL=$(git config --global user.email 2>/dev/null || true)

if [[ -n "$EXISTING_NAME" ]] && [[ -n "$EXISTING_EMAIL" ]]; then
    echo ""
    echo "Found existing git configuration:"
    echo "  Name:  $EXISTING_NAME"
    echo "  Email: $EXISTING_EMAIL"

    export MIMIRON_USER_NAME="$EXISTING_NAME"
    export MIMIRON_USER_EMAIL="$EXISTING_EMAIL"
else
    # Prompt for git user information
    echo ""
    read -p "Enter your full name for git: " MIMIRON_USER_NAME
    read -p "Enter your email for git: " MIMIRON_USER_EMAIL

    export MIMIRON_USER_NAME
    export MIMIRON_USER_EMAIL
fi
