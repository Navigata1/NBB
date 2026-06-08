# ECC-Prime Vetting Report

Bounded, license-confirmed upstream review of ECC-Prime for NBB skill packs.

- **Upstream:** https://github.com/Navigata1/ECC-Prime
- **Pinned SHA:** `7113b5bf63694b716f8b2413c5919824a82fc095`
- **License:** MIT (Copyright (c) 2026 Affaan Mustafa) - see `THIRD_PARTY_NOTICES.md`
- **Gate:** `scripts/vet_skill.sh` (NBB's existing per-skill security gate)
- **Scope:** canonical skills only (`skills/<name>/SKILL.md`); locale duplicates
  under `docs/ja-JP/`, `docs/zh-CN/`, `.agents/`, `.kiro/`, `.cursor/` were NOT
  counted as separate skills (792 files -> 251 canonical skills).

## Result (honest counts, no inflation)

| Verdict | Count | Disposition |
|---------|-------|-------------|
| PASS | 218 | **ADOPTED** as pinned entries in `packs/extended-300.json` |
| WARN | 30 | **HELD** (default-denied; manual review required) |
| FAIL | 3 | **HELD** (blocked; manual review required) |
| **Total canonical** | 251 | |

`extended-300.json` now lists **36 curated + 218 ECC PASS = 254 concrete entries**
(target 300). The cap is NOT padded to 300 - only genuinely-passing skills were added.
The full PASS set is also reachable via the `ecc-prime` enumerable bulk source at
the pinned SHA (gate-each at build time).

## HELD - FAIL (3) — blocked, manual review

All three are DEFENSIVE security-education skills; the gate flagged their own
example/illustrative text (not malicious behavior). They are held, not deleted,
and not auto-included:

- `perl-security` — flagged on defensive example text (e.g. an injection sample / a CWE impact table). Reviewer should confirm defensive intent before any inclusion.
- `security-bounty-hunter` — flagged on defensive example text (e.g. an injection sample / a CWE impact table). Reviewer should confirm defensive intent before any inclusion.
- `security-scan` — flagged on defensive example text (e.g. an injection sample / a CWE impact table). Reviewer should confirm defensive intent before any inclusion.

## HELD - WARN (30) — default-denied, manual review

Flagged for review (outbound POST, IPs, base64 blobs, chmod, rc writes,
env-near-network, webhooks). Held pending a human decision; NOT in the pack.

- `agentic-os`
- `api-connector-builder`
- `automation-audit-ops`
- `autonomous-agent-harness`
- `canary-watch`
- `cisco-ios-patterns`
- `deployment-patterns`
- `django-patterns`
- `django-security`
- `docker-patterns`
- `e2e-testing`
- `ecc-tools-cost-audit`
- `flox-environments`
- `homelab-network-setup`
- `homelab-pihole-dns`
- `homelab-vlan-segmentation`
- `homelab-wireguard-vpn`
- `kotlin-patterns`
- `laravel-patterns`
- `llm-trading-agent-security`
- `netmiko-ssh-automation`
- `nutrient-document-processing`
- `production-audit`
- `safety-guard`
- `tinystruct-patterns`
- `ui-demo`
- `uncloud`
- `unified-notifications-ops`
- `videodb`
- `vite-patterns`

## Reproduce

```bash
git clone https://github.com/Navigata1/ECC-Prime.git && cd ECC-Prime
git checkout 7113b5bf63694b716f8b2413c5919824a82fc095
for f in skills/*/SKILL.md; do bash /path/to/NBB/scripts/vet_skill.sh "$f"; done
```

Counts will match at this SHA. New ECC commits require re-pinning + re-vetting.
