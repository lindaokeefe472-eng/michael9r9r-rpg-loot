"""Build release zips for the data pack and resource pack, per version target.

Usage:
    python tools/package.py                     # default target: 26.2
    python tools/package.py --target 1.21.4     # single legacy target
    python tools/package.py --all               # every target in targets.json
    python tools/package.py --version 26.4.0    # override VERSION file

Targets are declared in tools/targets.json. The source tree in data/ is
26.2-native; legacy targets are produced by applying the transform pipeline
in tools/transforms.py at build time (the repo itself is never modified).

Output naming:
    build/michael9r9r-rpg-loot-datapack-v<VERSION>-mc<TARGET>.zip
    build/michael9r9r-rpg-loot-resourcepack-v<VERSION>.zip   (universal, lang-only)

The VERSION file at the repo root is the single source of truth for the
release version. README download links and git tags must match it.
"""
import argparse
import json
import sys
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from transforms import apply_transforms, verify_tree  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
TEXT_SUFFIXES = {".json", ".mcfunction", ".mcmeta"}


def load_targets():
    return json.loads((ROOT / "tools/targets.json").read_text(encoding="utf-8"))["targets"]


def load_tree():
    """Read pack.mcmeta + data/ into {posix relpath: str|bytes}."""
    tree = {}
    tree["pack.mcmeta"] = (ROOT / "pack.mcmeta").read_text(encoding="utf-8")
    for path in sorted((ROOT / "data").rglob("*")):
        if not path.is_file():
            continue
        rel = path.relative_to(ROOT).as_posix()
        if path.suffix in TEXT_SUFFIXES:
            tree[rel] = path.read_text(encoding="utf-8")
        else:
            tree[rel] = path.read_bytes()
    return tree


def set_pack_format(tree, target_def, target_name):
    meta = json.loads(tree["pack.mcmeta"])
    fmt = target_def["supported_formats"]
    # legacy fields (read by <=1.21.x) and modern fields (required by 26.x UI)
    # coexist: each generation of the game ignores the other's keys.
    meta["pack"]["pack_format"] = target_def["pack_format"]
    meta["pack"]["supported_formats"] = fmt
    meta["pack"]["min_format"] = fmt["min_inclusive"]
    meta["pack"]["max_format"] = fmt["max_inclusive"]
    meta["pack"]["description"] = f"michael9r9r's RPG Loot (for {target_def['label']})"
    tree["pack.mcmeta"] = json.dumps(meta, indent=2, ensure_ascii=False) + "\n"
    return tree


def build_datapack(version, target_name, target_def):
    print(f"[*] Building datapack target {target_name} ({target_def['label']})")
    text_tree = {}
    bin_tree = {}
    for rel, content in load_tree().items():
        (text_tree if isinstance(content, str) else bin_tree)[rel] = content

    text_tree = set_pack_format(text_tree, target_def, target_name)
    text_tree = apply_transforms(text_tree, target_def["transforms"])
    problems = verify_tree(text_tree, target_def["transforms"])
    if problems:
        for p in problems:
            print("  [FAIL]", p)
        raise SystemExit(f"transform verification failed for target {target_name}")

    suffix = "" if target_name == "26.2" else f"-mc{target_name}"
    out = ROOT / "build" / f"michael9r9r-rpg-loot-datapack-v{version}{suffix}.zip"
    out.parent.mkdir(exist_ok=True)
    if out.exists():
        out.unlink()
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zipf:
        for doc in ("README.md", "WIKI.md", "GAMEPLAY_TUTORIAL.md", "SPEC.md"):
            if (ROOT / doc).exists():
                zipf.write(ROOT / doc, doc)
        for rel, content in sorted(text_tree.items()):
            zipf.writestr(rel, content)
        for rel, content in sorted(bin_tree.items()):
            zipf.writestr(rel, content)
    tag = "verified" if target_def.get("verified") else "EXPERIMENTAL (no runtime verification)"
    print(f"    -> {out.name}  [{tag}]")
    return out


def build_resourcepack(version):
    out = ROOT / "build" / f"michael9r9r-rpg-loot-resourcepack-v{version}.zip"
    out.parent.mkdir(exist_ok=True)
    if out.exists():
        out.unlink()
    src = ROOT / "resourcepack"
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zipf:
        for path in sorted(src.rglob("*")):
            if path.is_file():
                zipf.write(path, path.relative_to(src).as_posix())
    print(f"    -> {out.name}  [universal: lang-only, all versions]")
    return out


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", default="26.2")
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--version")
    args = parser.parse_args()

    version = (args.version or (ROOT / "VERSION").read_text(encoding="utf-8").strip()).lstrip("v")
    targets = load_targets()
    names = list(targets) if args.all else [args.target]
    for name in names:
        if name not in targets:
            raise SystemExit(f"unknown target {name!r}; known: {', '.join(targets)}")

    print(f"[*] Version {version}; targets: {', '.join(names)}")
    for name in names:
        build_datapack(version, name, targets[name])
    build_resourcepack(version)
    print("[OK] All builds complete.")


if __name__ == "__main__":
    main()
