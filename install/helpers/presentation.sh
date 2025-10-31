# Presentation helpers for beautiful installer output

# Ensure we have gum available
if ! command -v gum &>/dev/null; then
  sudo pacman -S --needed --noconfirm gum
fi

# Get terminal size
if [ -e /dev/tty ]; then
  TERM_SIZE=$(stty size 2>/dev/null </dev/tty)

  if [ -n "$TERM_SIZE" ]; then
    export TERM_HEIGHT=$(echo "$TERM_SIZE" | cut -d' ' -f1)
    export TERM_WIDTH=$(echo "$TERM_SIZE" | cut -d' ' -f2)
  else
    export TERM_WIDTH=80
    export TERM_HEIGHT=24
  fi
else
  export TERM_WIDTH=80
  export TERM_HEIGHT=24
fi

export LOGO_PATH="$MIMIRON_PATH/logo.txt"
export LOGO_WIDTH=$(awk '{ if (length > max) max = length } END { print max+0 }' "$LOGO_PATH" 2>/dev/null || echo 0)
export LOGO_HEIGHT=$(wc -l <"$LOGO_PATH" 2>/dev/null || echo 0)

export PADDING_LEFT=$((($TERM_WIDTH - $LOGO_WIDTH) / 2))
export PADDING_LEFT_SPACES=$(printf "%*s" $PADDING_LEFT "")

# Color scheme (using ANSI color codes compatible with gum)
export GUM_CONFIRM_PROMPT_FOREGROUND="6"     # Cyan for prompts
export GUM_CONFIRM_SELECTED_FOREGROUND="0"   # Black text on selected
export GUM_CONFIRM_SELECTED_BACKGROUND="2"   # Green background for selected
export GUM_CONFIRM_UNSELECTED_FOREGROUND="7" # White for unselected
export GUM_CONFIRM_UNSELECTED_BACKGROUND="0" # Black background for unselected
export PADDING="0 0 0 $PADDING_LEFT"
export GUM_CHOOSE_PADDING="$PADDING"
export GUM_FILTER_PADDING="$PADDING"
export GUM_INPUT_PADDING="$PADDING"
export GUM_SPIN_PADDING="$PADDING"
export GUM_TABLE_PADDING="$PADDING"
export GUM_CONFIRM_PADDING="$PADDING"

# Display logo centered with color
show_logo() {
  clear
  gum style --foreground 6 --padding "1 0 0 $PADDING_LEFT" "$(<"$LOGO_PATH")"
}

# Show a status message
show_status() {
  local message="$1"
  local color="${2:-3}" # Default to yellow (3)
  gum style --foreground "$color" --padding "1 0 0 $PADDING_LEFT" "$message"
}

# Show success message
show_success() {
  show_status "✓ $1" 2 # Green
}

# Show info message
show_info() {
  show_status "→ $1" 6 # Cyan
}

# Show error message
show_error() {
  show_status "✗ $1" 1 # Red
}

# Hide cursor
hide_cursor() {
  printf "\033[?25l"
}

# Show cursor
show_cursor() {
  printf "\033[?25h"
}
