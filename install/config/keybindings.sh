# Configure GNOME keyboard shortcuts for application launching
# Using Ctrl+Alt+<key> workflow

echo "Configuring custom keyboard shortcuts..."

# Remap CapsLock to Escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# GNOME allows custom keybindings via org.gnome.settings-daemon.plugins.media-keys.custom-keybindings
# We need to create custom keybinding entries

# Define the custom keybindings path
CUSTOM_KEYBINDINGS_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

# Set the list of custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "['${CUSTOM_KEYBINDINGS_PATH}/custom0/', '${CUSTOM_KEYBINDINGS_PATH}/custom1/', '${CUSTOM_KEYBINDINGS_PATH}/custom2/', '${CUSTOM_KEYBINDINGS_PATH}/custom3/', '${CUSTOM_KEYBINDINGS_PATH}/custom4/', '${CUSTOM_KEYBINDINGS_PATH}/custom5/', '${CUSTOM_KEYBINDINGS_PATH}/custom6/']"

# Custom0: Ctrl+Alt+Space - Walker launcher
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom0/ name "Walker"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom0/ command "walker"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom0/ binding "<Primary><Alt>space"

# Custom1: Ctrl+Alt+H - Obsidian (launch or focus)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom1/ name "Obsidian"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom1/ command "$HOME/.local/share/mimiron/bin/mimiron-launch-or-focus obsidian"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom1/ binding "<Primary><Alt>h"

# Custom2: Ctrl+Alt+J - Chrome (launch or focus)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom2/ name "Chrome"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom2/ command "$HOME/.local/share/mimiron/bin/mimiron-launch-or-focus chrome google-chrome-stable"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom2/ binding "<Primary><Alt>j"

# Custom3: Ctrl+Alt+K - VSCode (launch or focus)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom3/ name "VSCode"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom3/ command "$HOME/.local/share/mimiron/bin/mimiron-launch-or-focus code"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom3/ binding "<Primary><Alt>k"

# Custom4: Ctrl+Alt+L - Ghostty terminal (launch or focus)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom4/ name "Ghostty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom4/ command "$HOME/.local/share/mimiron/bin/mimiron-launch-or-focus ghostty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom4/ binding "<Primary><Alt>l"

# Custom5: Ctrl+Alt+; - Ferdium (launch or focus)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom5/ name "Ferdium"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom5/ command "$HOME/.local/share/mimiron/bin/mimiron-launch-or-focus ferdium"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom5/ binding "<Primary><Alt>semicolon"

# Custom6: Ctrl+Shift+4 - Screenshot with annotation
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom6/ name "Screenshot"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom6/ command "$HOME/.local/share/mimiron/bin/mimiron-cmd-screenshot region"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${CUSTOM_KEYBINDINGS_PATH}/custom6/ binding "<Primary><Shift>4"

echo "Custom keyboard shortcuts configured:"
echo "  Ctrl+Alt+Space → Walker"
echo "  Ctrl+Alt+H     → Obsidian (launch or focus)"
echo "  Ctrl+Alt+J     → Chrome (launch or focus)"
echo "  Ctrl+Alt+K     → VSCode (launch or focus)"
echo "  Ctrl+Alt+L     → Ghostty (launch or focus)"
echo "  Ctrl+Alt+;     → Ferdium (launch or focus)"
echo "  Ctrl+Shift+4   → Screenshot with annotation"
