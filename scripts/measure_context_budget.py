#!/usr/bin/env python3
# =============================================================================
# NBB - Context Budget Measurer
#
# Measures the byte/token footprint of every loadable framework component and
# every Blueprint Part, and writes a machine-readable manifest:
#     bootstrap/context-budget.json
#
# Agents/tools read the manifest to BUDGET loads (decide what fits) instead of
# guessing. Tokens are an ESTIMATE (chars / 4); bytes are exact.
#
# Usage:  python3 scripts/measure_context_budget.py [--check]
#   (no args)  measure + (re)write bootstrap/context-budget.json + print table
#   --check    measure into memory and compare to the committed manifest;
#              exit 1 if the manifest is stale (drift gate for CI)
# =============================================================================
import json, os, re, sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(REPO, "bootstrap", "context-budget.json")
WINDOW = 200_000  # reference context window for the percent column

COMPONENTS = {
    "core_always_resident": "CLAUDE.md",
    "bridge_navigation": "BRIDGE.md",
    "bootstrap_deep": "NORTH_STAR_BOOTSTRAP.md",
    "blueprint_full": "north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.5.md",
    "mbf_full": "master-build-framework/MASTER_BUILD_FRAMEWORK_v2.5.md",
}

def measure(path):
    full = os.path.join(REPO, path)
    data = open(full, encoding="utf-8", errors="replace").read()
    return {"path": path, "bytes": len(data.encode("utf-8")),
            "est_tokens": len(data) // 4}

def blueprint_parts():
    p = os.path.join(REPO, COMPONENTS["blueprint_full"])
    lines = open(p, encoding="utf-8", errors="replace").read().splitlines(keepends=True)
    heads = [(i, l.strip().lstrip("# ").rstrip())
             for i, l in enumerate(lines) if re.match(r'^# PART [IVXLC]+:', l)]
    parts = []
    for k, (i, title) in enumerate(heads):
        end = heads[k + 1][0] if k + 1 < len(heads) else len(lines)
        seg = "".join(lines[i:end])
        parts.append({"part": title, "bytes": len(seg.encode("utf-8")),
                      "est_tokens": len(seg) // 4})
    return parts

def build():
    comps = {k: measure(v) for k, v in COMPONENTS.items()}
    parts = blueprint_parts()
    full = sum(c["est_tokens"] for k, c in comps.items() if k != "core_always_resident")
    core = comps["core_always_resident"]["est_tokens"]
    return {
        "note": "tokens are an estimate (chars/4); bytes are exact. Regenerate with scripts/measure_context_budget.py",
        "reference_window_tokens": WINDOW,
        "components": comps,
        "blueprint_parts": parts,
        "reference_build": {
            "task": "start a project",
            "before_load_all_tokens": full,
            "after_tier1_core_tokens": core,
            "pct_of_window_before": round(full * 100 / WINDOW, 1),
            "pct_of_window_after": round(core * 100 / WINDOW, 2),
            "always_resident_reduction_pct": round(100 - core * 100 / full, 2),
            "full_exceeds_window": full > WINDOW,
        },
    }

def print_table(m):
    print("Component footprint (bytes / ~tokens):")
    for k, c in m["components"].items():
        print(f"  {k:24s} {c['bytes']:8d} B  ~{c['est_tokens']:7d} tok")
    print("\nBlueprint per-Part (~tokens):")
    for p in m["blueprint_parts"]:
        print(f"  {p['part'][:46]:46s} ~{p['est_tokens']:6d} tok")
    rb = m["reference_build"]
    print(f"\nReference build ('{rb['task']}'):")
    print(f"  BEFORE (load all): ~{rb['before_load_all_tokens']} tok "
          f"({rb['pct_of_window_before']}% of a {m['reference_window_tokens']}-token window"
          f"{', EXCEEDS WINDOW' if rb['full_exceeds_window'] else ''})")
    print(f"  AFTER  (Tier 1):   ~{rb['after_tier1_core_tokens']} tok "
          f"({rb['pct_of_window_after']}% of window)")
    print(f"  always-resident reduction: {rb['always_resident_reduction_pct']}%")

def main():
    m = build()
    if "--check" in sys.argv:
        if not os.path.exists(OUT):
            print("DRIFT: bootstrap/context-budget.json missing", file=sys.stderr); sys.exit(1)
        committed = json.load(open(OUT, encoding="utf-8"))
        if committed != m:
            print("DRIFT: context-budget.json is stale; rerun scripts/measure_context_budget.py", file=sys.stderr)
            sys.exit(1)
        print("PASS: context-budget.json matches a fresh measurement.")
        return
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    json.dump(m, open(OUT, "w", encoding="utf-8"), indent=2)
    print(f"wrote {os.path.relpath(OUT, REPO)}")
    print_table(m)

if __name__ == "__main__":
    main()
