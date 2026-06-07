# RECONCILIATION.md — North Star v1 Ground-Truth Baseline

> **Purpose:** This file is the Batch 0 gate deliverable for the North Star ->
> NBB ("Northstar Boot-strap edition") modernization wave. Per the mission
> house rules, no content edits proceed until the TRUE baseline is recorded
> here. Every claim below is evidence-cited to a live file:line in the source
> repo as of the commit named in Section 1.
>
> **Encoding:** This file is ASCII-only by design (mojibake-safe). The source
> repo has a documented history of box-drawing / smart-quote mojibake; see
> Section 6.

---

## 1. Source of Truth (provenance)

| Field | Value |
|-------|-------|
| Source repo | `Navigata1/NorthStarBuild_5.0` (public) |
| Source URL | https://github.com/Navigata1/NorthStarBuild_5.0 |
| Default branch | `main` |
| Source commit (HEAD) | `1002696104927ac364dc71017712aef7b3d0b1aa` |
| Commit subject | "chore: cleanup -- Roo Code section, stale originals, priority-2 SHAs" |
| Commit date | 2026-03-18 |
| Tags | `v1` (single) |
| Remotes | `origin` -> NorthStarBuild_5.0 only |
| Tree size | ~16 MB, 191 files (excl. `.git`) |
| Author / attribution | Jon (@NavigatingTruth, X/Twitter) |
| License | CC BY-NC-SA 4.0, (c) 2025 North Star Build |
| Modernization branch | `modernize/bootstrap-edition-v6-5` |
| Destination repo | `Navigata1/NBB` (to be created at publish time) |

---

## 2. The Version Conflict — RESOLVED

The mission brief carried two conflicting snapshots. The LIVE repo resolves the
conflict decisively:

| Component | "Local snapshot" claim | "Project notes" claim | **LIVE TRUTH** | Evidence |
|-----------|------------------------|------------------------|----------------|----------|
| North Star Blueprint | v6.0 | v6.1 | **v6.1** | `north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md:2` |
| Master Build Framework | v1.1 | v2.1 | **v2.1** | `master-build-framework/MASTER_BUILD_FRAMEWORK_v2.1.md:3` |
| Bootstrap | v1.3 | v1.4 | **v1.4** | `NORTH_STAR_BOOTSTRAP.md:11` |
| BRIDGE | v1.1 | v1.2 | **v1.2** | `BRIDGE.md:9` |
| Global IDE Rules | (n/a) | (n/a) | **v1.1** | `GLOBAL_IDE_RULES.md:8` |
| MBF categories | 56 | 62 | **62** (56 base + 6 v2.1) | `MASTER_BUILD_FRAMEWORK_v2.1.md:5383` |
| Part XIV | absent | present | **present** | `NORTH_STAR_BLUEPRINT_v6.1.md:17384` |

**Verdict:** The live repo IS the "project notes" state, NOT the "local
snapshot" state. The snapshot was an outdated view. Superseded `v6.0` and `v2.0`
files still exist in-tree (Section 5), which is how a stale snapshot could read
"v6.0".

---

## 3. MBF Category Count — RESOLVED (with live drift flagged)

The authoritative count is **62 categories** = 56 base + 6 v2.1 additions
(`MASTER_BUILD_FRAMEWORK_v2.1.md:96` "ALL 62 CATEGORIES", `:5383` "Total: 56
base categories + 6 v2.1 additions = 62 categories", highest category number =
62).

**Live drift to fix in this wave:**
- `MASTER_BUILD_FRAMEWORK_v2.1.md:2` title still says "THE 56-PHASE MASTER BUILD
  FRAMEWORK" (stale title; should reflect 62 categories).
- `QUICK_START.md:97,105` say **63** categories (wrong).
- Progression of record: v1.0 = 56, v2.0 = 60, v2.1 = 62.

Single source of truth going forward: the MBF document's own count (62).

---

## 4. Part XIV / Memory Architecture — RESOLVED

- **Part XIV EXISTS** in the monolithic Blueprint v6.1
  (`NORTH_STAR_BLUEPRINT_v6.1.md:17384-17883`) and is titled
  **"HUMAN-AGENT COLLABORATION"** -- it is NOT the memory architecture. The
  mission brief's label "Part XIV (memory architecture)" is therefore incorrect
  for the live repo and is corrected here.
- **There is NO standalone `NS_MEMORY_ARCHITECTURE_PROPOSAL.md`** in the tree
  (confirmed: no file matches `*memory*` or `*proposal*`). Per
  `CHANGELOG.md:172` (ENH-040) the proposal was "integrated into Part XII / new
  Part XIV; proposal file archived."
- **Memory architecture is already first-class and integrated**, but referenced
  inconsistently (drift): Blueprint "Section 20: Agent Memory Architecture"
  (`:777,:8070`), Blueprint S56.5 "Memory Architecture -- The Third Engineering
  Layer" (`:16411`), and MBF "Category 31E: Memory Architecture" (`:5081`).
  BRIDGE variously routes memory to Part III, Part XII, and Section 20
  (`BRIDGE.md:197,:272,:443`).

**Resolution for this wave (Batch 3):** Memory architecture is NOT a proposal --
it is integrated. What is MISSING and will be added is a *swappable cross-harness
agent-memory backend interface* (e.g., agentmemory / claude-mem), documented as
an optional protocol layer, plus a single canonical cross-reference for the
memory section to end the Part III/XII/Section-20 drift.

---

## 5. Duplicate-Canonical Files (root cause of version confusion)

The framework keeps BOTH old and new canonical monoliths in-tree:

| Newest (canonical) | Superseded (still present) |
|--------------------|----------------------------|
| `north-star-blueprint/NORTH_STAR_BLUEPRINT_v6.1.md` | `.../NORTH_STAR_BLUEPRINT_v6.0.md` |
| `master-build-framework/MASTER_BUILD_FRAMEWORK_v2.1.md` | `.../MASTER_BUILD_FRAMEWORK_v2.0.md` |

Plus large archived segment trees under `projects/_archived_Segment_Originals/`
and working segments under `projects/Segment Mods/`. The NBB edition will make
the newest the single advertised canonical and clearly mark/relocate the
superseded copies (without destroying user-authored history).

---

## 6. Encoding / Mojibake Scan

Scan method: `LC_ALL=C grep` for `0xC3 0xA2` ("a-circumflex", the lead byte of
Latin-1-misdecoded UTF-8) and `0xEF 0xBF 0xBD` (U+FFFD replacement char).

| Result | Finding |
|--------|---------|
| U+FFFD anywhere | **0 occurrences** (clean) |
| Canonical distribution files (10) | **ALL CLEAN** (Blueprint v6.1, MBF v2.1, BOOTSTRAP, BRIDGE, README, QUICK_START, CONTRIBUTING, GLOBAL_IDE_RULES, AGENTS.md, claude.md = 0 mojibake each) |
| Dirty `.md` files | **2**, both non-canonical: `master-build-framework/MASTER_BUILD_FRAMEWORK_v2.0.md` (superseded), `projects/Segment Mods/CONTRIBUTING.md` (em-dash mojibake at :190) |
| Dirty `.sh` files | **1** cosmetic: `scripts/merge_mbf_segments.sh:48` literal `?O ERROR` where other lines use `ERROR` cleanly |

**Implication:** Building the NBB edition from the clean v6.1 / v2.1 canonical
set starts mojibake-free. The 2 dirty non-canonical files and the 1 script
artifact are tracked for cleanup in Batch 6 build hardening.

---

## 7. Skills Inventory (`.claude/skills/`) — 9 skills

| Skill | Live version (per CHANGELOG) | Notes |
|-------|------------------------------|-------|
| autoresearch | v1.0 | Karpathy autoresearch + uditgoenka adaptation; metric loop |
| design-taste | v1.0 | Adapted from `leonxlnx/taste-skill` (4 sub-skills -> 1); LINEAGE MUST BE PRESERVED |
| mcp-builder | v1.0 | Adapted from Anthropic official mcp-builder |
| parallel-agent | v1.1 | Brief calls it "parallel-agent-orchestration"; actual dir is `parallel-agent` |
| plan-annotator | v1.1 | |
| research-report | v1.1 | |
| retro | v1.1 | Skill Promotion Pipeline |
| skill-creator | v1.0 | Anthropic meta-loop |
| skill-supply-chain-review | v1.0 | Original skill; NOT named in the brief's list (brief listed 8, repo has 9) |

Load mechanism: `.claude/skills/<name>/SKILL.md`, governed by
`.claude/settings.json` permissions and `.claude/hooks/pre-write.sh`.

---

## 8. Existing Build Mechanism (segmented -> monolithic ALREADY EXISTS)

The house convention is already implemented and will be BUILT ON, not replaced:

- Blueprint: 7 segments `projects/Segment Mods/NSBP6.0 -Segments/PART_1..7_*.md`
  -> `scripts/merge_nsb_segments.sh` -> `NORTH_STAR_BLUEPRINT_v6.1.md`
  (8-line nav header stripped per segment).
- MBF: 4 segments `projects/Segment Mods/MBF2.0- Segments/MBF_PART_1..4_*.md`
  -> `scripts/merge_mbf_segments.sh` -> `MASTER_BUILD_FRAMEWORK_v2.1.md`.
- `scripts/verify_versions.sh` greps Segment Mods for stale version strings.
- `.claude/hooks/pre-write.sh` blocks direct edits to generated monoliths.

**Gap for NBB:** there is no *bootstrap-artifact* build (a single low-bloat
portable distributable). That is the headline Batch 1/Batch 6 deliverable.

---

## 9. Entry-Surface Truth (portability gap)

- `AGENTS.md` (v1.0) = "Multi-Agent Coordination Protocol" -- ownership/locking
  rules. NOT a portable harness entry file.
- `claude.md` (lowercase) = "Project Context" -- a Claude-specific brief.
- These two are SEPARATE, hand-authored, different-purpose files. The mission's
  requirement that `AGENTS.md` and `CLAUDE.md` be GENERATED FROM ONE SOURCE so
  they never drift is **currently unmet** and is a Batch 1 deliverable.
- README.md is STALE: badges + body still advertise v6.0 / MBF v2.0 / "14 parts"
  (`README.md:6,7,31`) -- a full version behind canonical. Batch 6 fix.

---

## 10. Version Bump Plan for This Wave (the ".5 line")

Per the mission version scheme ("bump to the .5 line"). These targets are
DELIBERATE and recorded here (not invented); each bumps the live stamp from
Section 2 to the unified .5 wave:

| Component | Live | NBB wave target |
|-----------|------|-----------------|
| North Star Blueprint | v6.1 | **v6.5** |
| Master Build Framework | v2.1 | **v2.5** |
| Bootstrap | v1.4 | **v1.5** |
| BRIDGE | v1.2 | **v1.5** |
| Global IDE Rules | v1.1 | **v1.5** |
| AGENTS coordination protocol | v1.0 | aligned to wave (v1.5) |

The repo itself is republished as **NBB — Northstar Boot-strap edition** with
its own README/QUICK_START reflecting the above.

---

## 11. Known Drifts / Defects Logged in Batch 0 (fix targets)

1. MBF v2.1 title "56-PHASE" vs body "62 categories" -- stale title.
2. QUICK_START "63 categories" vs MBF "62" -- wrong count.
3. README advertises v6.0 / v2.0 / 14 parts -- a version behind.
4. Memory architecture cross-references split across Part III / Part XII /
   Section 20 -- needs one canonical pointer.
5. `merge_mbf_segments.sh:48` mojibake artifact (`?O`).
6. 2 non-canonical `.md` files carry mojibake.
7. AGENTS.md / CLAUDE.md not generated from a single source (drift risk).
8. No low-bloat portable bootstrap artifact exists yet.

---

*Batch 0 ground truth complete. Edits may proceed from this baseline.*
