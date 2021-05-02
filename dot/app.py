import shelve
from collections import namedtuple

import dot.config as config

shelf = shelve.open(f"{config.DOTHOME}/shelf")


__DDL = """
CREATE TABLE app (
    id INT,
    name TEXT,
    path TEXT
)
"""

"""
Packman is an abstraction arround package manager
"""

App = namedtuple("App", ["name", "path", "pfg"])

def register(name, config, packman, **kwargs):
    if not isinstance(name, str):
        raise TypeError("name must be a str")
    _validate_packman(packman)
    app = {
        "name": name,
        "path": config,
        "packman": packman,
    }
    shelf[name] = app

def _validate_packman(packman: dict) -> bool:
    return True

class Packman:
    def __init__(self, name, ):
        pass

class App:
    def __init__(self, name, path, packman):
        self.name = name
        self.config = config
        self.packman = packman

