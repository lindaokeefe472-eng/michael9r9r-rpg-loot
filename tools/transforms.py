"""Build-time transforms that adapt the 26.2-native source tree to older targets.

Each transform takes and returns a file-tree dict {relpath(str, posix): content(str)}.
Only text files are passed through transforms; binary files (.nbt structures)
are copied verbatim by the packager.

Design rule: transforms must be *verifiable* — after applying, `verify_tree`
asserts no forbidden modern-only tokens remain for legacy targets.
"""
from __future__ import annotations

import json
import re

# ---------------------------------------------------------------------------
# helpers

def _mcfunctions(tree):
    for path in tree:
        if path.endswith(".mcfunction"):
            yield path


def _json_files(tree):
    for path in tree:
        if path.endswith(".json"):
            yield path


# ---------------------------------------------------------------------------
# transform: time_query_daytime  (26.2 clock API -> classic daytime query)

def time_query_daytime(tree):
    """26.2 replaced `time query daytime` with clock timelines. Older versions
    use the classic form, so swap the modulo-based block back."""
    modern = (
        '# 26.2: "time query time" returns the absolute overworld clock; modulo 24000 -> time of day\n'
        "execute store result score rpgloot timeofday run time query time\n"
        "scoreboard players operation rpgloot timeofday %= rpgloot24000 constants"
    )
    legacy = "execute store result score rpgloot timeofday run time query daytime"
    for path in _mcfunctions(tree):
        if modern in tree[path]:
            tree[path] = tree[path].replace(modern, legacy)
    return tree


# ---------------------------------------------------------------------------
# transform: strip_copper_items  (copper gear only exists in 1.21.9+)

COPPER_ITEMS = {
    "minecraft:copper_sword", "minecraft:copper_axe", "minecraft:copper_pickaxe",
    "minecraft:copper_shovel", "minecraft:copper_hoe", "minecraft:copper_helmet",
    "minecraft:copper_chestplate", "minecraft:copper_leggings", "minecraft:copper_boots",
}


def _strip_entries(node, removed):
    if isinstance(node, dict):
        for key, value in list(node.items()):
            if key == "entries" and isinstance(value, list):
                kept = []
                for entry in value:
                    if isinstance(entry, dict) and entry.get("name") in COPPER_ITEMS:
                        removed.append(entry.get("name"))
                    else:
                        kept.append(entry)
                node[key] = kept
            _strip_entries(node.get(key), removed)
    elif isinstance(node, list):
        for item in node:
            _strip_entries(item, removed)


def strip_copper_items(tree):
    removed = []
    for path in _json_files(tree):
        if "loot_table" not in path:
            continue
        if not any(item.split(":")[1] in tree[path] for item in COPPER_ITEMS):
            continue
        data = json.loads(tree[path])
        _strip_entries(data, removed)
        tree[path] = json.dumps(data, indent=2, ensure_ascii=False) + "\n"
    if removed:
        print(f"    strip_copper_items: removed {len(removed)} loot entries ({sorted(set(removed))})")
    return tree


# ---------------------------------------------------------------------------
# transform: legacy_text_events  (1.21.5+ snake_case events -> 1.21.4 camelCase)

def _legacy_events_in_text(text):
    # command actions: {"click_event":{"action":"run_command"|"suggest_command","command":X}} -> clickEvent/value
    text = re.sub(
        r'"click_event"(\s*:\s*\{"action"\s*:\s*"(?:run_command|suggest_command)"\s*,\s*)"command"',
        r'"clickEvent"\1"value"', text)
    # open_url: "url" -> "value"
    text = re.sub(
        r'"click_event"(\s*:\s*\{"action"\s*:\s*"open_url"\s*,\s*)"url"',
        r'"clickEvent"\1"value"', text)
    # change_page: page is an int in 1.21.5+, a string "value" in 1.21.4
    text = re.sub(
        r'"click_event"(\s*:\s*\{"action"\s*:\s*"change_page"\s*,\s*)"page"(\s*:\s*)(\d+)',
        r'"clickEvent"\1"value"\2"\3"', text)
    # any remaining click_event (other actions) -> clickEvent
    text = text.replace('"click_event"', '"clickEvent"')
    # show_text hover: "value" -> "contents"
    text = re.sub(
        r'"hover_event"(\s*:\s*\{"action"\s*:\s*"show_text"\s*,\s*)"value"',
        r'"hoverEvent"\1"contents"', text)
    text = text.replace('"hover_event"', '"hoverEvent"')
    return text


def legacy_text_events(tree):
    for path in _mcfunctions(tree):
        if "click_event" in tree[path] or "hover_event" in tree[path]:
            tree[path] = _legacy_events_in_text(tree[path])
    return tree


# ---------------------------------------------------------------------------
# transform: stringify_customname  (SNBT component array -> 1.21.4 JSON string)

_SNBT_KEY = re.compile(r'([,{\[]\s*)(text|color|bold|italic|underlined|strikethrough|obfuscated)(\s*:)')


def _snbt_component_to_json(snbt):
    """Convert `[{text:"A ",color:"gold"},...]` to a quoted JSON text string.

    Only handles the flat literal shape used by summon files; anything more
    exotic should be authored as JSON directly.
    """
    jsonish = _SNBT_KEY.sub(lambda m: f'{m.group(1)}"{m.group(2)}"{m.group(3)}', snbt)
    json.loads(jsonish)  # sanity check: must be valid JSON after key quoting
    escaped = jsonish.replace("\\", "\\\\").replace("'", "\\'")
    return f"'{escaped}'"


def stringify_customname(tree):
    pattern = re.compile(r'CustomName:(\[[^\[\]]*(?:\[[^\[\]]*\][^\[\]]*)*\])')
    count = 0
    for path in _mcfunctions(tree):
        content = tree[path]
        if "CustomName:[" not in content:
            continue

        def repl(match):
            nonlocal count
            count += 1
            return "CustomName:" + _snbt_component_to_json(match.group(1))

        tree[path] = pattern.sub(repl, content)
    if count:
        print(f"    stringify_customname: converted {count} CustomName tags")
    return tree


# ---------------------------------------------------------------------------
# transform: legacy_snbt_escapes  (1.21.5+ SNBT string escapes -> 1.21.4 safe)

_UNICODE_ESCAPE = re.compile(r'\\u([0-9a-fA-F]{4})')


def _decode_unicode_escapes(text):
    """SNBT quoted strings only learned \\uXXXX in 1.21.5; emit literal chars."""
    out = []
    i = 0
    pending_high = None
    for match in _UNICODE_ESCAPE.finditer(text):
        out.append(text[i:match.start()])
        code = int(match.group(1), 16)
        if 0xD800 <= code <= 0xDBFF:
            pending_high = code
            i = match.end()
            continue
        if pending_high is not None and 0xDC00 <= code <= 0xDFFF:
            combined = 0x10000 + ((pending_high - 0xD800) << 10) + (code - 0xDC00)
            out.append(chr(combined))
            pending_high = None
        else:
            out.append(chr(code))
        i = match.end()
    out.append(text[i:])
    return "".join(out)


def legacy_snbt_escapes(tree):
    """For commands whose components live in SNBT (give ...[written_book_content=...]):
    1.21.4's SNBT parser rejects \\uXXXX and \\n escapes, so decode \\u to literal
    characters and defer \\n to the inner JSON layer as \\\\n."""
    count = 0
    for path in _mcfunctions(tree):
        lines = tree[path].split("\n")
        changed = False
        for idx, line in enumerate(lines):
            if "written_book_content" not in line:
                continue
            new = _decode_unicode_escapes(line)
            # escape \n for the SNBT layer, but leave already-escaped \\n alone
            new = re.sub(r'(?<!\\)\\n', r'\\\\n', new)
            if new != line:
                lines[idx] = new
                changed = True
                count += 1
        if changed:
            tree[path] = "\n".join(lines)
    if count:
        print(f"    legacy_snbt_escapes: rewrote {count} book command(s)")
    return tree


# ---------------------------------------------------------------------------
# transform: legacy_book_pages  (native SNBT component pages -> 1.21.4 JSON strings)

def _match_pages_array(line):
    m = re.search(r'pages:\[', line)
    if not m:
        return None
    start = m.end() - 1
    depth, i, in_str = 0, start, False
    while i < len(line):
        c = line[i]
        if in_str:
            if c == "\\":
                i += 2
                continue
            if c == '"':
                in_str = False
        else:
            if c == '"':
                in_str = True
            elif c == "[":
                depth += 1
            elif c == "]":
                depth -= 1
                if depth == 0:
                    return start, i + 1
        i += 1
    return None


def legacy_book_pages(tree):
    """Pre-1.21.5 written books expect each page as an escaped JSON string,
    not a native SNBT component. The source pages are strict JSON, so parse
    and re-emit each page as a single-quoted JSON string."""
    count = 0
    for path in _mcfunctions(tree):
        if "written_book_content" not in tree[path]:
            continue
        lines = tree[path].split("\n")
        for idx, line in enumerate(lines):
            if "written_book_content" not in line:
                continue
            span = _match_pages_array(line)
            if not span:
                continue
            start, end = span
            pages = json.loads(line[start:end])
            quoted = []
            for obj in pages:
                js = json.dumps(obj, ensure_ascii=False, separators=(",", ": "))
                quoted.append("'" + js.replace("\\", "\\\\").replace("'", "\\'") + "'")
            lines[idx] = line[:start] + "[" + ",".join(quoted) + "]" + line[end:]
            count += 1
        tree[path] = "\n".join(lines)
    if count:
        print(f"    legacy_book_pages: stringified pages in {count} book command(s)")
    return tree


# ---------------------------------------------------------------------------
# registry + post-transform verification

TRANSFORMS = {
    "time_query_daytime": time_query_daytime,
    "strip_copper_items": strip_copper_items,
    "legacy_text_events": legacy_text_events,
    "stringify_customname": stringify_customname,
    "legacy_snbt_escapes": legacy_snbt_escapes,
    "legacy_book_pages": legacy_book_pages,
}

FORBIDDEN_AFTER = {
    "time_query_daytime": ["time query time"],
    "strip_copper_items": sorted(COPPER_ITEMS),
    "legacy_text_events": ['"click_event"', '"hover_event"'],
    "stringify_customname": ["CustomName:["],
}


def apply_transforms(tree, names):
    for name in names:
        tree = TRANSFORMS[name](tree)
    return tree


def verify_tree(tree, names):
    problems = []
    for name in names:
        for token in FORBIDDEN_AFTER.get(name, []):
            for path, content in tree.items():
                if token in content:
                    problems.append(f"{path}: forbidden token {token!r} survived transform {name}")
    return problems
