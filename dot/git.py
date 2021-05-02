import logging
import subprocess 
import cli

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

BASE_CMD = f"git --git-dir={cli.DOTGIT}"
def _cmd(command):
    return f"{BASE_CMD} {command}"

# TODO: make configurable
DEFAULT_MESSAGE = "dotfiles saved"

class NonZeroReturn(Exception):
    """Git command exited with non-zero return code."""

def _exec(command):
    """
    Execute basic git commands
    """
    logger.info(command)
    proc = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
    try:
        output, err = proc.communicate()
    except subprocess.TimeoutExpired:
        proc.kill()
        message = "git command took too long, process killed"
        logger.error(message)
    logger.debug(err, result)
    if proc.returncode != 0:
        raise NonZeroReturn(f"git command exited with non-zero return code: {proc.returncode}")
    return output.decode()

def add(filename=None):
    """add
    `git add --all` to stage all files in the git repo for commiting
    """
    command = _cmd(f"add {filename}") if filename else _cmd("add --all")
    return _exec(command)

def commit(message=DEFAULT_MESSAGE):
    """commit
    `git commit --message $1` all staged changes
    """
    return _exec(_cmd(f"commit --message {message}"))

def reset(filename=None):
    """reset
    `git reset` to unstage all staged changes or just a single file
    """
    command = _cmd("reset")
    if filename:
        command = _cmd(f"reset {filename}")
    return _exec(command)

def status():
    """status
    `git status` to see current status of the repo
    """
    return _exec(_cmd("status"))

