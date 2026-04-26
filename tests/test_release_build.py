import os
import subprocess
import tempfile
import unittest
import zipfile
from pathlib import Path


REPO_ROOT = Path(__file__).parent.parent
SCRIPT = REPO_ROOT / "scripts" / "build_release.sh"


class ReleaseBuild(unittest.TestCase):
    def test_release_build_strips_debug_functions(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            subprocess.run(
                ["bash", str(SCRIPT)],
                cwd=REPO_ROOT,
                check=True,
                env={
                    **os.environ,
                    **{
                        "TMPDIR": tmpdir,
                    },
                },
            )

            archive = REPO_ROOT / "dist" / "blockwatch_siege-release.zip"
            self.assertTrue(archive.exists(), "release archive was not created")

            with zipfile.ZipFile(archive) as zf:
                names = set(zf.namelist())

            self.assertIn(
                "blockwatch_siege/pack.mcmeta",
                names,
                "release archive is missing pack.mcmeta",
            )
            self.assertFalse(
                any(
                    name.startswith(
                        "blockwatch_siege/data/blockwatch/functions/debug/"
                    )
                    for name in names
                ),
                "release archive should not include debug functions",
            )


if __name__ == "__main__":
    unittest.main(verbosity=2)
