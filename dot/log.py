import logging
import cli
from datetime import datetime

TIMESTAMP_FORMAT = "%Y-%m-%d %H:%M:%S"
LOG_FILE = "dot.log"

def log(message):
    """
    Very simple logger
    """
    timestamp = datetime.now().strftime(TIMESTAMP_FORMAT)
    with open(LOG_FILE, "a") as f:
        f.write(f"{timestamp} - {message}\n")

# set log level and check if valid
_loglevel = getattr(logging, cli.ARGS.loglevel.upper(), None)
if not isinstance(_loglevel, int):
    raise ValueError(f"invalid log level: {_loglevel}")

logging.basicConfig(
    filename=LOG_FILE,
    encoding="utf-8",
    level=_loglevel,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)
