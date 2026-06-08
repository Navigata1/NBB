# NBB Modernization — Honest Capability Assessment

> Per the mission's top value (honest assessment over optimism). Three buckets:
> genuinely improved (verified), unverified (claims), and deferred. Benchmarks
> are treated as claims; behavior-based verification is preferred and noted where
> done. ASCII-only.

Source: `NorthStarBuild_5.0@1002696` -> published as `Navigata1/NBB`.

---

## 1. Genuinely improved — VERIFIED in this build

| Improvement | How it was verified | Measured result |
|-------------|---------------------|-----------------|
| Portable single-source bootstrap | `build_bootstrap.sh --check` (diff fresh build vs committed) | PASS — CLAUDE/AGENTS/SKILL/dist byte-identical to source; cannot drift |
| Low-bloat always-resident surface | `measure_context_budget.py` (byte count; tokens=chars/4) | core ~2.0k tokens vs full ~258k; ~99% reduction; full EXCEEDS a 200k window |
| Mechanical context budget | manifest `--check` gate | `bootstrap/context-budget.json` matches a fresh measurement |
| Skills 9 -> 12, uniform spec | grep: front-matter, "When NOT", "Portability" on all 12 | all present; 0 mojibake |
| Attribution preserved | grep SHAs vs git HEAD | design-taste/mcp-builder/skill-creator SHAs match exactly |
| Canonical surface mojibake-clean | `LC_ALL=C grep` for C3A2 / U+FFFD (excl superseded/archived) | 0 in canonical surface |
| Version bump to .5 line | re-merge from bumped segments + grep monolith stamps | Blueprint v6.5, MBF "62-CATEGORY"/v2.5 confirmed; zero segment->monolith drift |
| Segment->monolith integrity | fresh merge diff vs committed | 0 diff lines before bump; regenerated cleanly after |

## 2. Genuinely improved — designed & documented, NOT runtime-enforced

These are real, usable artifacts, but they are GUIDANCE + example configs, not an
installed enforcement engine. Honest framing:

- **Governance** (`docs/governance/`): cost-cap YAML, action-log JSONL schema, HITL
  table, permission/sandboxing/secrets/local-first docs. These describe and
  template the controls; a host still has to apply them. (The live cost-guardrail
  pause during THIS build is evidence the pattern works in practice.)
- **Interop protocols** (`docs/protocols/`): MCP/A2A/AG-UI/A2UI/ACP described as
  optional layers + a memory-backend INTERFACE. No backend is bundled; the
  local-JSON fallback is the only dependency-free option.
- **Skills**: improved structure and triggers; they remain instructions a harness
  loads, not compiled behavior.

## 3. Unverified — claims, not behavior-verified

- **Live auto-load in non-CLI harnesses** (Claude Desktop/Cowork, Codex desktop,
  Antigravity 2, Cursor 3): NOT launched/tested from this build env. Marked
  UNVERIFIED in `docs/PORTABILITY.md` with a self-validation checklist. Claude
  Code CLI conventions are the only ones treated as established.
- **Skill trigger-activation benchmark**: NOT run. Trigger descriptions were
  tightened by judgment, not measured before/after across harnesses.
- **Protocol spec specifics** (AG-UI "17 event types", ACP adopter list): taken
  from the mission brief, marked "(verify)" in-doc; not confirmed against a live
  canonical spec read here.
- **New-skill upstreams** (`Lum1104/Understand-Anything`, `chopratejas/headroom`)
  and **memory backends** (`agentmemory`, `claude-mem`): user-specified, UNPINNED;
  no SHAs fabricated; must be vendored via `skill-supply-chain-review`.
- **Token figures**: chars/4 ESTIMATES (+/-~15% vs a real tokenizer). Byte counts
  are exact.

## 4. Deferred (known, bounded)

- **Deep in-body version labels**: the .5 bump covered named pointers ("Blueprint
  v6.1" etc.), the headline stamps (title/box/version line), and the hand-edited
  root docs. Some deep, bare "(v6.1)"-style labels inside Blueprint Part bodies may
  remain at the old tag; they do not affect behavior or the headline identity. A
  full body sweep is deferred. (Residual count recorded at publish in the log.)
- **Cosmetic**: segment-file 8-line headers (stripped on merge) and emoji/box-glyphs
  in `merge_*_segments.sh` echo output (valid Unicode, not mojibake) left as-is;
  MBF version line date ("v2.5 - March 2026") not changed to June.
- **BRIDGE memory-routing prose** ("Part III/Part XII" framings): the canonical
  pointer is published in `MEMORY_BACKEND.md`; aligning the older BRIDGE prose is
  deferred (cosmetic; the correct pointer exists).
- **Superseded v6.0/v2.0 monoliths**: relocated to `superseded/` (provenance);
  their original-era mojibake intentionally NOT rewritten (history).

## 5. Net assessment

The headline goal — a portable, low-bloat, governed bootstrap that loads across
harnesses from one source — is DELIVERED and self-verified where verifiable
(footprint, drift gates, mojibake, attribution, version integrity). The honest
gaps are (a) live multi-harness auto-load testing, which needs those harnesses,
and (b) treating documented governance/protocol layers as guidance rather than
runtime enforcement. Nothing here claims a capability that was not built; nothing
verified-by-assertion is presented as verified-by-behavior.

## 6. ECC-Prime upstream integration (bounded, MIT-confirmed)

- **ADOPTED:** 218 canonical ECC-Prime skills that PASSED `vet_skill.sh`, added as
  **pinned** entries (SHA `7113b5bf...`, MIT) to `packs/extended-300.json`
  (36 curated + 218 = 254 concrete; cap 300 NOT padded).
- **HELD:** 30 WARN + 3 FAIL (default-denied). The 3 FAILs (`perl-security`,
  `security-bounty-hunter`, `security-scan`) are DEFENSIVE security-education
  skills the conservative gate flagged on their own example text — held for manual
  review, not deleted, not auto-included.
- **HONEST dedup:** 792 `SKILL.md` files reduced to 251 canonical skills (the rest
  are `docs/ja-JP`, `docs/zh-CN`, `.agents`, `.kiro`, `.cursor` locale copies) — so
  counts are not inflated by translations.
- **License posture:** MIT preserved in `THIRD_PARTY_NOTICES.md`; ECC skills are
  REFERENCED (pinned + fetched-at-SHA by the builder), NOT vendored into the tree
  and NOT blended into NBB methodology prose. CC BY-NC-SA / MIT kept separated.
- **Limit:** PASS = passed the STATIC gate at this SHA (necessary, not sufficient;
  no per-skill behavioral sandbox was run). Re-pin + re-vet on any new ECC commit.
  Full report: `packs/ECC_PRIME_VET_REPORT.md`.
