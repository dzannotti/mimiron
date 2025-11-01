#!/bin/bash

ascii_art='
▄▄▄▄  ▄ ▄▄▄▄  ▄  ▄▄▄ ▄▄▄  ▄▄▄▄
█ █ █ ▄ █ █ █ ▄ █   █   █ █   █
█   █ █ █   █ █ █   ▀▄▄▄▀ █   █
      █       █                 '

colors=(
	'\033[38;5;81m' # Cyan
	'\033[38;5;75m' # Light Blue
	'\033[38;5;69m' # Sky Blue
	'\033[38;5;63m' # Dodger Blue
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
