#!/bin/python

import os
from pathlib import Path

files=(
".config/i3/config"
".zshrc"
".config/alacritty/alacritty.yml"
".tmux.conf"
 )

def main():
    for f in files:
        Path.mkdir(parent)
    pass

if __name__ == "__main__":
        main()

