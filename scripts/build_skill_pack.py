#!/usr/bin/env python3
# =============================================================================
# NBB - Secure Skill-Pack Builder
#
# Turns a VETTED MANIFEST into a downloadable pack. For every entry it:
#   1. resolves the skill (first-party local, or vendor/community fetched AT a
#      pinned SHA - reproducible),
#   2. runs the security gate (scripts/vet_skill.sh),
#   3. includes ONLY PASS (WARN needs --allow-warn; FAIL/license_pending/unpinned
#      are quarantined by default = default-deny),
#   4. fills the tier up to target_count, HIGHEST CALIBER FIRST,
#   5. writes the pack + a provenance MANIFEST.json + a QUARANTINE.md report.
#
# Usage:
#   python3 scripts/build_skill_pack.py <tier> [--allow-warn] [--offline]
#     <tier>       basename of packs/<tier>.json (e.g. core-100, extended-300)
#     --offline    only build from first-party local skills (no network) - used
#                  for CI smoke tests and air-gapped builds
#     --allow-warn include WARN-verdict skills (still logged); default excludes
#
# Honesty: a pack is "secure" ONLY for the skills that actually passed the gate
# in THIS run. Nothing is asserted vetted that was not gated. Counts are targets
# the gate fills, never inflated.
# =============================================================================
import json, os, subprocess, sys, shutil, tempfile, urllib.request

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
VET = os.path.join(REPO, "scripts", "vet_skill.sh")

def die(m): print(m, file=sys.stderr); sys.exit(2)

def vet(path):
    r = subprocess.run(["bash", VET, path], capture_output=True, text=True)
    return {0: "PASS", 2: "WARN", 1: "FAIL"}.get(r.returncode, "ERROR"), r.stdout.strip()

def resolve(entry, offline):
    """Return (local_path, recorded_sha, reason_if_skipped)."""
    st = entry.get("source_type")
    if st == "first_party":
        p = os.path.join(REPO, ".claude", "skills", entry["name"], "SKILL.md")
        return (p, "first-party", None) if os.path.exists(p) else (None, None, "missing local skill")
    if entry.get("license") == "pending" or entry.get("vetting_status") == "license_pending":
        return (None, None, "license_pending (not copied until license confirmed)")
    if not entry.get("sha"):
        return (None, None, "unpinned (no SHA) - default-deny")
    if offline:
        return (None, None, "skipped (--offline; external fetch disabled)")
    url = entry.get("raw_url", "").replace("<sha>", entry["sha"])
    if not url:
        return (None, None, "no raw_url")
    try:
        tmp = tempfile.NamedTemporaryFile("w", suffix="-SKILL.md", delete=False)
        with urllib.request.urlopen(url, timeout=20) as resp:
            tmp.write(resp.read().decode("utf-8", "replace"))
        tmp.close()
        return (tmp.name, entry["sha"], None)
    except Exception as e:
        return (None, None, f"fetch failed: {e}")

def main():
    if len(sys.argv) < 2:
        die("usage: build_skill_pack.py <tier> [--offline] [--allow-warn]")
    tier = sys.argv[1]
    offline = "--offline" in sys.argv
    allow_warn = "--allow-warn" in sys.argv

    man_path = os.path.join(REPO, "packs", f"{tier}.json")
    if not os.path.exists(man_path):
        die(f"manifest not found: {man_path}")
    man = json.load(open(man_path, encoding="utf-8"))
    entries = sorted(man.get("entries", []), key=lambda e: -e.get("caliber", 0))
    target = man.get("target_count", len(entries))

    out = os.path.join(REPO, "dist", "packs", tier)
    if os.path.isdir(out): shutil.rmtree(out)
    os.makedirs(os.path.join(out, "skills"), exist_ok=True)

    included, quarantined = [], []
    for e in entries:
        if len(included) >= target:
            quarantined.append({**e, "reason": "tier cap reached"}); continue
        path, sha, skip = resolve(e, offline)
        if skip:
            quarantined.append({**e, "reason": skip}); continue
        verdict, _ = vet(path)
        if verdict == "PASS" or (verdict == "WARN" and allow_warn):
            dst = os.path.join(out, "skills", e["name"] + ".SKILL.md")
            shutil.copyfile(path, dst)
            included.append({"name": e["name"], "category": e.get("category"),
                             "trust_tier": e.get("trust_tier"), "sha": sha,
                             "verdict": verdict, "source_type": e["source_type"]})
        else:
            quarantined.append({**e, "reason": f"gate verdict {verdict}"})

    json.dump({"tier": tier, "target_count": target, "included_count": len(included),
               "offline": offline, "allow_warn": allow_warn, "included": included},
              open(os.path.join(out, "MANIFEST.json"), "w", encoding="utf-8"), indent=2)
    with open(os.path.join(out, "QUARANTINE.md"), "w", encoding="utf-8") as q:
        q.write(f"# Quarantine report - {tier}\n\nExcluded {len(quarantined)} entries "
                f"(default-deny). Nothing here entered the pack.\n\n")
        for x in quarantined:
            q.write(f"- `{x.get('name','?')}` - {x['reason']}\n")

    print(f"pack '{tier}': included {len(included)}/{target}, quarantined {len(quarantined)}")
    print(f"  -> dist/packs/{tier}/ (skills/, MANIFEST.json, QUARANTINE.md)")
    if not offline and len(included) < target:
        print(f"  NOTE: {target - len(included)} slots unfilled - more sources must pass the gate "
              f"(no fabricated entries).")

if __name__ == "__main__":
    main()
