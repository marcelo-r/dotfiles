import argparse


parser = argparse.ArgumentParser("manage your apps and configs")
parser.add_argument(
    "--loglevel",
    help="logging level",
    dest="loglevel",
    default="INFO",
)
ARGS = parser.parse_args()

