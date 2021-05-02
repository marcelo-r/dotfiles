import unittest

import dot.config as config


class TestParse(unittest.TestCase):
    """
    Test parsers
    """

    def test_parse_name(self):
        tests = [
            ("dnf: example", ("dnf", "example")),
            ("\ndnf:\n\nexample\t\r\n", ("dnf", "example")),
            (
                "git: https://repository.git -v abc:dce",
                ("git", "https://repository.git -v abc:dce"),
            ),
        ]
        for value, expected in tests:
            got = config.parse_package_line(value)
            with self.subTest(value=value, expected=expected, got=got):
                self.assertTupleEqual(expected, got)

    def test_parse_package(self):
        """
        If package values are parsed correctly
        """
        tests = [
            """
            dnf: example
            apt: x-ample
            """,
            """\n\n\n\ndnf:example\n\n\t\t\n\t\r\napt:      x-ample""",
            """\n\n\n\ndnf      :       example\n\n\t\t\napt     :      x-ample\n   \t""",
        ]
        expected = {"dnf": "example", "apt": "x-ample"}
        for test in tests:
            with self.subTest(value=test):
                self.assertDictEqual(expected, config.parse_package(test))

    def test_load_1(self):
        self.maxDiff = None
        test = "config.ini"
        expected = {
            "example": {
                "path": "~/.config/example/config",
                "package": {
                    "dnf": "example",
                    "apt": "x-ample",
                    "git": "https://path.to.repo.git --git-options dest-directory",
                },
                "pre_install": {"message": "show this message before install process"},
                "post_install": {"message": "after install show this message"},
            },
            "i3": {
                "path": "~/.config/i3/config",
                "package": {
                    "dnf": "i3",
                    "apt": "i3wm",
                },
                "pre_install": {},
                "post_install": {},
            },
            "asdf": {
                "path": "~/.config/example/config",
                "package": {
                    "git": "https://path.to.repo.git --git-options dest-directory",
                },
                "pre_install": {},
                "post_install": {
                    "message": """add the following to your ~/.zshrc
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit"""
                },
            },
        }
        self.assertDictEqual(expected, config.load(test))


if __name__ == "__main__":
    unittest.main()
