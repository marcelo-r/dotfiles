#!/bin/bash

declare -A apps
apps+=(
	["i3"]="$HOME/.config/i3"
	["zsh"]="$HOME/.zshrc"
	["tmux"]="$HOME/.tmux.conf"
	["alacritty"]="$HOME/.config/alacritty"
	["nvim"]="$HOME/.config/nvim"
	["rofi"]="$HOME/.config/rofi"
)

# save each config to its own directory
save()
{
	echo "copying..."
	for key in "${!apps[@]}"; do
		conf="${apps[$key]}"
		echo "copying $key configuration"
		# directory just needs to be copied
		if [ -d "${conf}" ]; then
			cp -r "$conf" .
		# when a file create a directory for it
		elif [ -f "${conf}" ]; then
			mkdir -p "$key"
			cp "$conf" "$key"
		else
			echo "$key=$conf IS INVALID"
			echo "aborted"
			exit 1
		fi
	done
	echo "done"
}

save

