#!/bin/bash

ascii_art='
▄▄▄▄  ▄ ▄▄▄▄  ▄  ▄▄▄ ▄▄▄  ▄▄▄▄
█ █ █ ▄ █ █ █ ▄ █   █   █ █   █
█   █ █ █   █ █ █   ▀▄▄▄▀ █   █
      █       █                 '

colors=(
	'\033[38;5;203m' # Red (Catppuccin Maroon/Red)
	'\033[38;5;216m' # Peach (Orange)
	'\033[38;5;229m' # Yellow
	'\033[38;5;115m' # Green
	'\033[38;5;117m' # Blue (Sky)
	'\033[38;5;183m' # Mauve (Purple)
)

# Split the ASCII art into lines (compatible with both bash and zsh)
lines=()
while IFS= read -r line; do
	lines+=("$line")
done <<< "$ascii_art"

# Print each line with the corresponding color
i=0
for line in "${lines[@]}"; do
	echo -e "${colors[$i]}${line}"
	i=$((i + 1))
done

# Reset color to default
echo -e '\033[0m'
