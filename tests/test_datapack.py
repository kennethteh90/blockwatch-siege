"""
Static-analysis tests for the blockwatch_siege datapack.

No Minecraft install required — these validate structural integrity only.

Run:  python3 -m pytest tests/
      python3 -m unittest discover tests/
"""
import json
import re
import unittest
from pathlib import Path

REPO_ROOT      = Path(__file__).parent.parent
DATAPACK_ROOT  = REPO_ROOT / "datapack" / "blockwatch_siege"
FUNCTIONS_ROOT = DATAPACK_ROOT / "data" / "blockwatch" / "functions"
SETUP_BOARDS   = FUNCTIONS_ROOT / "state" / "setup_scoreboards.mcfunction"


def _mcfunction_lines():
    """Yield (path, lineno, text) for every non-comment, non-blank line."""
    for path in sorted(FUNCTIONS_ROOT.rglob("*.mcfunction")):
        for lineno, raw in enumerate(path.read_text().splitlines(), 1):
            text = raw.strip()
            if text and not text.startswith("#"):
                yield path, lineno, text


class JsonValidity(unittest.TestCase):
    def test_json_files_are_valid(self):
        for path in DATAPACK_ROOT.rglob("*.json"):
            with self.subTest(file=str(path.relative_to(REPO_ROOT))):
                json.loads(path.read_text())

    def test_pack_mcmeta_is_valid(self):
        mcmeta = DATAPACK_ROOT / "pack.mcmeta"
        self.assertTrue(mcmeta.exists(), "pack.mcmeta missing")
        data = json.loads(mcmeta.read_text())
        self.assertIn("pack_format", data.get("pack", {}))


class FunctionReferences(unittest.TestCase):
    def test_all_function_calls_resolve(self):
        broken = []
        for path, lineno, line in _mcfunction_lines():
            for ref in re.findall(r'\bfunction blockwatch:([a-z0-9_/]+)', line):
                target = FUNCTIONS_ROOT / f"{ref}.mcfunction"
                if not target.exists():
                    broken.append(
                        f"  {path.relative_to(FUNCTIONS_ROOT)}:{lineno}: "
                        f"blockwatch:{ref} → file not found"
                    )
        if broken:
            self.fail("Broken function references:\n" + "\n".join(broken))


class ScoreboardCompleteness(unittest.TestCase):
    def _declared_objectives(self):
        return set(re.findall(
            r'scoreboard objectives add (\S+)',
            SETUP_BOARDS.read_text(),
        ))

    def _set_cfg_constants(self):
        return set(re.findall(
            r'scoreboard players set (#\S+)\s+bw\.cfg',
            SETUP_BOARDS.read_text(),
        ))

    def test_score_condition_objectives_are_declared(self):
        declared = self._declared_objectives()
        missing = []
        for path, lineno, line in _mcfunction_lines():
            for obj in re.findall(r'\b(?:if|unless) score \S+ (\S+)', line):
                if obj.startswith("bw.") and obj not in declared:
                    missing.append(
                        f"  {path.relative_to(FUNCTIONS_ROOT)}:{lineno}: "
                        f"objective '{obj}' used in score condition but not declared"
                    )
        if missing:
            self.fail("Undeclared objectives:\n" + "\n".join(missing))

    def test_cfg_constants_referenced_are_all_set(self):
        defined = self._set_cfg_constants()
        missing = []
        for path, lineno, line in _mcfunction_lines():
            if path == SETUP_BOARDS:
                continue
            for const in re.findall(r'(#\S+)\s+bw\.cfg', line):
                if const not in defined:
                    missing.append(
                        f"  {path.relative_to(FUNCTIONS_ROOT)}:{lineno}: "
                        f"'{const}' referenced in bw.cfg but never set in setup_scoreboards"
                    )
        if missing:
            self.fail("Missing bw.cfg constants:\n" + "\n".join(missing))


class WaveCoverage(unittest.TestCase):
    def _max_waves(self):
        m = re.search(
            r'scoreboard players set #waves\.max\s+bw\.cfg\s+(\d+)',
            SETUP_BOARDS.read_text(),
        )
        self.assertIsNotNone(m, "#waves.max not found in setup_scoreboards")
        return int(m.group(1))

    def test_wave_files_exist_for_all_waves(self):
        for i in range(1, self._max_waves() + 1):
            with self.subTest(wave=i):
                self.assertTrue(
                    (FUNCTIONS_ROOT / "waves" / f"wave_{i:02d}.mcfunction").exists(),
                    f"waves/wave_{i:02d}.mcfunction missing",
                )

    def test_wave_preview_covers_all_waves(self):
        preview = FUNCTIONS_ROOT / "ui" / "wave_preview.mcfunction"
        self.assertTrue(preview.exists(), "ui/wave_preview.mcfunction missing")
        text = preview.read_text()
        for i in range(1, self._max_waves() + 1):
            with self.subTest(wave=i):
                self.assertTrue(
                    re.search(rf"\bmatches {i}\b", text),
                    f"wave_preview.mcfunction missing branch for wave {i}",
                )


class ParticipantScoping(unittest.TestCase):
    def test_gold_operations_use_shared_bank(self):
        allowed_paths = {
            FUNCTIONS_ROOT / "debug" / "give_gold.mcfunction",
            FUNCTIONS_ROOT / "state" / "new_match.mcfunction",
            FUNCTIONS_ROOT / "state" / "reset_match.mcfunction",
            FUNCTIONS_ROOT / "state" / "setup_scoreboards.mcfunction",
            FUNCTIONS_ROOT / "debug" / "status.mcfunction",
        }
        failures = []

        for path, lineno, line in _mcfunction_lines():
            if "bw.gold" not in line:
                continue

            if path in allowed_paths:
                continue

            if "#gold bw.gold" in line:
                continue

            failures.append(
                f"  {path.relative_to(FUNCTIONS_ROOT)}:{lineno}: "
                f"gold-affecting logic should use the shared #gold bank"
            )

        if failures:
            self.fail("Non-shared-bank gold usage:\n" + "\n".join(failures))

    def test_player_count_scaling_is_configured(self):
        setup_text = SETUP_BOARDS.read_text()
        self.assertIn(
            "scoreboard players set #castle.per_player bw.cfg",
            setup_text,
            "#castle.per_player should be defined in setup_scoreboards",
        )

        new_match = (FUNCTIONS_ROOT / "state" / "new_match.mcfunction").read_text()
        self.assertIn(
            "#castle.per_player",
            new_match,
            "new_match should apply the per-player castle HP scaling",
        )
        self.assertIn(
            "#players bw.tmp",
            new_match,
            "new_match should count active match participants",
        )


if __name__ == "__main__":
    unittest.main(verbosity=2)
