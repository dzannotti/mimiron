#!/bin/bash

# Add ./bin to path for all items in ~/code
mkdir -p "$HOME/code"

cat >"$HOME/code/.mise.toml" <<'EOF'
[env]
_.path = "{{ cwd }}/bin"
EOF

mise trust ~/code/.mise.toml

# Install and set global versions
mise install node@latest
mise use -g node@latest

mise install bun@latest
mise use -g bun@latest

mise install go@latest
mise use -g go@latest

mise install rust@latest
mise use -g rust@latest
