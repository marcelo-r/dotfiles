#!/bin/bash

declare -A apps
apps+=(
	["zsh"]="$HOME/.zshrc"
	["tmux"]="$HOME/.tmux.conf"
	["nvim"]="$HOME/.config/nvim"
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

