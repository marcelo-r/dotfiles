#!/bin/python
"""
options:
    install
        --all (implied) 
        --config
    config
        up
        save
        --all (implied)
    sync
"""

import os
import subprocess as subp
import argparse

import pdb

apps = (
    {
        "name": "alacritty",
        "path": ".config/alacritty/alacritty.yml",
        "pkg": {"dnf": "alacritty", "apt": "alacritty"},
    },
    {"name": "i3", "path": ".config/i3/config", "pkg": {"dnf": "i3", "apt": "i3wm"}},
    {
        "name": "kitty",
        "path": ".config/kitty/kitty.conf",
        "pkg": {"dnf": "kitty", "apt": "kitty"},
    },
    {
        "name": "neovim",
        "path": ".config/nvim",
        "pkg": {"dnf": "neovim", "apt": "neovim"},
    },
    {"name": "tmux", "path": ".tmux.conf", "pkg": {"dnf": "tmux", "apt": "tmux"}},
    {"name": "zsh", "path": ".zshrc", "pkg": {"dnf": "zsh", "apt": "zsh"}},
    {"name": "fd", "pkg": {"dnf": "fd-find", "apt": "fdfind"}},
    {"name": "ripgrep", "pkg": "ripgrep"},
    {"name": "zsh", "path": ".zshrc", "pkg": {"dnf": "zsh", "apt": "zsh"}},
)


def main():
    for app in apps:
        setup_app(app)


def install(app):
    setup_app(app)
    pass


def setup_app(app: dict):
    """setup_app
    Setup config files and backup location.
    """
    config_path = fmt_path(app["path"])
    backup_path = fmt_path(app["path"], DOTHOME)
    pdb.set_trace()
    # check if source is dir and create backup location
    if os.isdir(config_path):
        os.makedirs(backup_path, exist_ok=True)
    # if not dir, get parent and setup backup location
    else:
        parent = os.path.dirname(backup_path)
        os.makedirs(parent)


def fmt_path(path, parent=None):
    """fmt_path
    A path must be defined relatively to $HOME
    """
    if not parent:
        parent = HOME
    pdb.set_trace()
    # when .config/nvim/
    if path[-1] == "/":
        return fmt_path(path[:-1], parent)
    # when /.config/nvim
    if path[0] == "/":
        return fmt_path(path[1:], parent)
    return f"{parent}/{path}"


if __name__ == "__main__":
    # we need HOME and current dir
    HOME = os.path.expanduser("~")
    if not HOME:
        raise EnvironmentError("setup your $HOME environment variable and try again")
    PWD = os.getenv("PWD")
    DOTHOME = os.getenv("DOTHOME", f"{HOME}/.local/dots")
    DOTHOME = f"{PWD}/home"
    main()
