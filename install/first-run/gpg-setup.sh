#!/bin/bash
# GPG Setup for commit signing

set -euo pipefail

USER_EMAIL="dzannotti@me.com"
USER_NAME="dzannotti"

echo "Setting up GPG for commit signing..."

# Check if GPG key already exists
if gpg --list-secret-keys --keyid-format=long "$USER_EMAIL" &>/dev/null; then
    echo "✓ GPG key already exists for $USER_EMAIL"
    KEY_ID=$(gpg --list-secret-keys --keyid-format=long "$USER_EMAIL" | grep sec | awk '{print $2}' | cut -d'/' -f2 | head -1)
else
    echo "Creating GPG key for $USER_EMAIL..."

    # Create temporary GPG config
    cat > /tmp/gpg-batch.conf << EOF
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: $USER_NAME
Name-Email: $USER_EMAIL
Expire-Date: 0
%no-protection
%commit
EOF

    # Generate key
    gpg --batch --gen-key /tmp/gpg-batch.conf 2>&1 | grep -v "^gpg:"
    rm /tmp/gpg-batch.conf

    # Get the key ID
    KEY_ID=$(gpg --list-secret-keys --keyid-format=long "$USER_EMAIL" | grep sec | awk '{print $2}' | cut -d'/' -f2 | head -1)
    echo "✓ GPG key created (ID: $KEY_ID)"
fi

# Configure git
if [ "$(git config --global user.signingkey || echo '')" != "$KEY_ID" ]; then
    git config --global user.signingkey "$KEY_ID"
    echo "✓ Git configured with GPG key"
fi

if [ "$(git config --global commit.gpgsign || echo '')" != "true" ]; then
    git config --global commit.gpgsign true
    echo "✓ Git commit signing enabled"
fi

# Export public key
gpg --armor --export "$KEY_ID" > ~/.local/share/mimiron/gpg-public-key.asc
echo "✓ Public key exported to ~/.local/share/mimiron/gpg-public-key.asc"

echo
echo "  To enable verified commits on GitHub:"
echo "  1. Visit: https://github.com/settings/gpg/new"
echo "  2. Copy key: cat ~/.local/share/mimiron/gpg-public-key.asc | wl-copy"
echo "  3. Paste and save"
