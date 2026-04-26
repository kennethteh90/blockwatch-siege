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

            # pack.mcmeta must be at the zip root (not inside a subfolder)
            # so Minecraft can load the zip directly from datapacks/
            self.assertIn(
                "pack.mcmeta",
                names,
                "release archive is missing pack.mcmeta at root",
            )
            self.assertNotIn(
                "blockwatch_siege/pack.mcmeta",
                names,
                "pack.mcmeta is nested under blockwatch_siege/ — Minecraft won't load it",
            )
            self.assertFalse(
                any(
                    name.startswith("data/blockwatch/functions/debug/")
                    for name in names
                ),
                "release archive should not include debug functions",
            )


if __name__ == "__main__":
    unittest.main(verbosity=2)
