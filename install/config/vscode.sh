#!/bin/bash

echo "Installing VSCode extensions..."

# Install extensions
code --install-extension Catppuccin.catppuccin-vsc
code --install-extension Catppuccin.catppuccin-vsc-icons
code --install-extension bierner.github-markdown-preview
code --install-extension bierner.markdown-mermaid
code --install-extension biomejs.biome
code --install-extension davidanson.vscode-markdownlint
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension oderwat.indent-rainbow
code --install-extension oven-sh.bun-vscode
code --install-extension pmneo.tsimporter
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension tamasfe.even-better-toml
code --install-extension timonwong.shellcheck
code --install-extension yoavbls.pretty-ts-errors
code --install-extension yzhang.markdown-all-in-one

echo "✓ VSCode extensions installed"
