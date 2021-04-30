import unittest

import dot


class TestDot(unittest.TestCase):
    def test_fmt_app(self):
        app = {"name": "i3", "path": ".config/i3/config"}
        want = "parent/.config/i3/config"
        got = dot.fmt_path(app["path"])
        self.assertEqual(want, got)

    def test_fmt_app_extra(self):
        app = {"name": "i3", "path": ".config/i3/config"}
        test = "parent/"
        want = "parent/.config/i3/config"
        got = dot.fmt_path(app["path"], test)
        self.assertEqual(want, got)

        test = "/parent"
        want = "parent/.config/i3/config"
        got = dot.fmt_path(app["path"], test)
        self.assertEqual(want, got)

        test = "/parent/"
        want = "parent/.config/i3/config"
        got = dot.fmt_path(app["path"], test)
        self.assertEqual(want, got)


if __name__ == "__main__":
    unittest.main()
