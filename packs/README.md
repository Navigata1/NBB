# Skill Packs — Vetted, Tiered, Reproducible

> A "pack" here is **a vetted manifest + a secure builder**, NOT a downloaded
> blob of foreign code. This is how NBB offers 100s of skills "for the masses"
> without shipping prompt-injection or supply-chain risk. ASCII-only.

---

## Why not just bundle a ZIP of 300 skills?

Because that is exactly the attack surface North Star's supply-chain policy bans
(`SKILLS_REGISTRY.md` S4: "never install from opaque ZIP/download mirrors; never
import giant community packs wholesale"). A blob rots, hides its provenance, and
can carry an injection in any one file. Instead:

- The **manifest** (`packs/<tier>.json`) lists each skill with `source · pinned
  SHA · trust tier · caliber · vetting status`.
- The **builder** (`scripts/build_skill_pack.py`) fetches each skill **at its
  pinned SHA** (reproducible), runs the **security gate**, and assembles a pack
  from ONLY what passes. Everything else is quarantined with a reason.
- "Downloadable" therefore means **reproducibly buildable from a vetted, pinned
  manifest** (or downloadable from a CI release built the same way) — current,
  auditable, and honestly secure.

## The two tiers

| Tier | Cap | For |
|------|-----|-----|
| `core-100` | 100 | the highest-caliber set for most build workflows |
| `extended-300` | 300 | broad power-use set, filled from gated bulk sources |

Caps are **targets the gate fills**, never inflated. Selection is **highest
caliber first**, build-workflow relevance, security gate mandatory.

## The security gate (every skill, no exceptions)

`scripts/vet_skill.sh <SKILL.md>` statically scans for:
- **Auto-FAIL:** pipe-to-shell (`curl|sh`), base64-decode-to-interpreter,
  `eval $(curl ...)`, reverse shells (`/dev/tcp`, `nc -e`), fork bombs,
  `rm -rf` on root/home, reading private keys/credentials, prompt injection
  ("ignore previous instructions", "reveal system prompt", "exfiltrate"),
  and encouraging `--dangerously-skip-permissions`.
- **WARN (manual review):** outbound POST, hardcoded IPs, long base64 blobs,
  `chmod 777`, writing to shell rc, env-vars-near-network, webhooks.

Exit 0 = PASS, 2 = WARN, 1 = FAIL. The builder includes PASS only (WARN needs
`--allow-warn`; FAIL / unpinned / `license_pending` are **default-denied**).

> **Expected behavior:** security-education skills (which legitimately *discuss*
> exfiltration / reverse shells) will FAIL the gate on their own example text.
> That is correct — they route to MANUAL REVIEW, where a human confirms the
> content is defensive and allows it with a recorded justification. The gate is
> necessary, not sufficient; high trust + pinned SHA + human review still apply.
> (NBB's own first-party security skills ship in `.claude/skills/` regardless;
> the gate governs EXTERNAL pack inclusion.)

## Build a pack

```bash
# First-party only (no network) - CI smoke test / air-gapped:
python3 scripts/build_skill_pack.py core-100 --offline

# Full build (fetches each external skill at its pinned SHA, gates it):
python3 scripts/build_skill_pack.py core-100
python3 scripts/build_skill_pack.py extended-300

# Output: dist/packs/<tier>/  ->  skills/  MANIFEST.json  QUARANTINE.md
```
`MANIFEST.json` records exactly what passed (name + SHA + verdict).
`QUARANTINE.md` records everything excluded and why. Nothing is asserted vetted
that was not gated in that run.

Or let CI build it: `.github/workflows/build-skill-pack.yml` (manual dispatch)
runs the same builder and uploads the pack as a downloadable release artifact.

## Pick up a pack (routing into build -> execute)

1. Build (or download from Releases) the tier you want.
2. Drop `dist/packs/<tier>/skills/*` into your project's `.claude/skills/`
   (or your harness's skill dir). Each file is a standard `SKILL.md`.
3. The bootstrap core's mini-router (`bootstrap/NBB_CORE.md` S3) and `BRIDGE.md`
   route tasks to skills by trigger; added pack skills become available to that
   routing automatically.
4. Re-run `skill-supply-chain-review` on anything you later add out-of-band.

## License posture (read before redistributing)

Each external skill keeps its OWN upstream license (recorded per entry). A pack
you publish must respect those terms. NBB's first-party skills are CC BY-NC-SA
4.0. **ECC-Prime is MIT** (Copyright (c) 2026 Affaan Mustafa) — license confirmed,
pinned at SHA `7113b5bf...`, and recorded in `THIRD_PARTY_NOTICES.md`. ECC-Prime
skill files are NOT blended into NBB methodology prose and are NOT vendored into
this tree; they are referenced by pinned manifest entries and fetched at the SHA
at build time, carrying the MIT notice in the built pack's `MANIFEST.json`. The
two licenses are kept clearly separated.

## Sources (extended-300 `bulk_sources`)

| Source | Trust | Status |
|--------|-------|--------|
| `anthropics/skills` @ pinned SHA | A | enumerable + gate-each |
| `openai/skills` (.curated) | A | pin a SHA, then gate-each |
| Reviewed community (Tier C) | C | adapt locally + pin; never raw-import |
| ECC-Prime (`Navigata1/ECC-Prime`, **MIT**) | C-MIT | **adopted** — 218/251 canonical PASS, pinned @ `7113b5bf`; 33 held (30 WARN, 3 FAIL). See `packs/ECC_PRIME_VET_REPORT.md` + `THIRD_PARTY_NOTICES.md` |

Higher-caliber sources preempt lower ones when filling the cap.
