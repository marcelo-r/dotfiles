#!/bin/bash

declare -A apps
apps+=(
	["i3"]="$HOME/.config/i3"
	["zsh"]="$HOME/.zshrc"
	["tmux"]="$HOME/.tmux.conf"
	["alacritty"]="$HOME/.config/alacritty"
	["nvim"]="$HOME/.config/nvim/"
	["rofi"]="$HOME/.config/rofi"
	["waybar"]="$HOME/.config/waybar"
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
			echo "$key=$conf DOES NOT EXIST"
		fi
	done
	echo "done"
}

save

