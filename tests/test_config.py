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

    def test_load_str(self):
        test = """
        [example]
        # example
        path = ~/.config/example/config
        package = 
            dnf: example 
            apt: x-ample
            git: https://path.to.repo.git --git-options dest-directory
        pre_install_message = show this message before install process
        post_install_message = after install show this message
        """
        expected = {
            "example": {
                "path": "~/.config/example/config",
                "package": {
                    "dnf": "example",
                    "apt": "x-ample",
                    "git": "https://path.to.repo.git --git-options dest-directory",
                },
                "pre_install_message": "show this message before install process",
                "post_install_message": "after install show this message",
            },
        }
        got = config.load(test)
        self.assertDictEqual(expected, got)

    def test_load_file(self):
        self.maxDiff = None
        with open("config.ini", "r") as f:
            test = f.read()
        expected = {
            "example": {
                "path": "~/.config/example/config",
                "package": {
                    "dnf": "example",
                    "apt": "x-ample",
                    "git": "https://path.to.repo.git --git-options dest-directory",
                },
                "pre_install_message": "show this message before install process",
                "post_install_message": "after install show this message",
            },
            "i3": {
                "path": "~/.config/i3/config",
                "package": {
                    "dnf": "i3",
                    "apt": "i3wm",
                },
            },
            "asdf": {
                "path": "$HOME/.asdfrc",
                "package": {
                    "git": "https://github.com/asdf-vm/asdf.git --branch v0.8.0 ~/.asdf",
                },
                "post_install_message": """add the following to your ~/.zshrc
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit""",
            },
        }
        got = config.load(test)
        self.assertDictEqual(expected, got)


if __name__ == "__main__":
    unittest.main()
