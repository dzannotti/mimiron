# Show welcome notifications with helpful tips

notify-send "🎉 Welcome to Mimiron!" \
  "Your Arch Linux system with GNOME is ready.\n\nRun 'yay' to update packages." \
  -u normal -t 10000

notify-send "💡 Tip: GNOME Extensions" \
  "All your GNOME extensions have been installed and configured.\nRestart GNOME Shell (Alt+F2, type 'r') if needed." \
  -u normal -t 10000
