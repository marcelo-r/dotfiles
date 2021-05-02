import os
import subprocess
import configparser
import logging

import dot.cli as cli

HOME = os.getenv("HOME")
if not HOME:
    raise EnvironmentError("setup your $HOME environment variable and try again")
DOTHOME = f"{HOME}/.local/dot"
os.makedirs(DOTHOME, exist_ok=True)

# must point to .git directory, not parent
DOTGIT = f"{DOTHOME}/.git"
DOTGIT = "/home/marcelo/code/local/dotfiles/.git"

# load from path to config file or from default file
CONFIG_HOME = f"{HOME}/.config/dot/"
CONFIG_FILE = f"{CONFIG_HOME}/config"
if not os.path.isfile(CONFIG_FILE):
    print("config file does not exist")


PACKMAN = {
    "dnf": {
        "cmd": "dnf",
        "install": "install -y {app}",
        "remove": "remove -y {app}",
    },
    "apt": {
        "cmd": "apt-get",
        "install": "install -y {app}",
    },
    "git": {
        "install": "git clone {app}",
        "remove": "rm -r --one-file-system {app}",
    },
}


def load_default_config(filename):
    """
    Default configuration
    """
    default = """
[main]

[packman]
dnf
    """
    with open(filename, "w") as f:
        f.write(default)


def detect_packman() -> dict:
    """detect_packman
    Detect which package manager the system uses.
    """
    for k, v in PACKMAN.items():
        command = f"command -v {v['cmd']}"
        proc = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
        result, _ = proc.communicate()
        packman = result.decode().split("/")[-1]
        try:
            return PACKMAN[packman]
        except KeyError:
            continue
        else:
            return packman


def load(filename):
    _pre = "pre_install_"
    _post = "post_install_"
    parser = configparser.ConfigParser()
    parser.read(filename)
    the_dict = {}
    #import ipdb; ipdb.set_trace()
    for s in parser.sections():
        if not s or s.startswith("_"):
            continue
        section = dict(parser[s].items())
        section["package"] = parse_package(section.pop("package", ""))
        the_dict[s] = section
    return the_dict


def parse_package(text: str):
    """parse_package
    Extract package configuration from string
    """
    lines = text.strip().replace("\t", "").replace("\r", "").split("\n")
    pairs = [parse_package_line(line) for line in lines if line]
    try:
        return dict(pairs)
    except ValueError as exc:
        raise SyntaxError(f"check the syntax in your config.ini, got: {text}") from exc


WHITESPACE = (" ", "\n", "\t", "\r")

def parse_package_line(line):
    """
    Parse a line containing 'package_manager: package_name'
    to extract a tuple consisting of:
        (package_manager, package_name)
    """
    manager = []
    package = []
    found_colon = False
    for i, letter in enumerate(line):
        if letter in WHITESPACE:
            continue
        if letter == ":" and not found_colon:
            found_colon = True
            continue
        if not found_colon:
            manager.append(letter)
        else:
            package = line[i:].strip()
            break
    return ("".join(manager).strip(), package)

def is_root():
    return os.geteuid() == 0
