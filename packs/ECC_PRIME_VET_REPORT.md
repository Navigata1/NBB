# ECC-Prime Vetting Report (hardened gate)

Bounded, license-confirmed upstream review of ECC-Prime for NBB skill packs.

- **Upstream:** https://github.com/Navigata1/ECC-Prime
- **Pinned SHA:** `7113b5bf63694b716f8b2413c5919824a82fc095`
- **License:** MIT (Copyright (c) 2026 Affaan Mustafa) - see `THIRD_PARTY_NOTICES.md`
- **Gate:** `scripts/vet_skill.sh` **v2 (context-aware)** - dangerous tokens only
  count in EXECUTABLE context; defensive prose / tables / comments / inline-code
  examples are exempt. Real bare commands + prompt injection still FAIL.
- **Scope:** canonical `skills/<name>/SKILL.md` only (251 skills; 792 files
  minus ja-JP/zh-CN/.agents/.kiro/.cursor locale copies).

## Result (honest counts)

| Verdict | Count | Disposition |
|---------|-------|-------------|
| PASS | 234 | ADOPTED as pinned entries in `packs/extended-300.json` |
| WARN | 17 | HELD (default-denied; manual review) |
| FAIL | 0 | HELD (blocked) |
| Total canonical | 251 | |

The earlier 3 FAILs (`perl-security`, `security-bounty-hunter`, `security-scan`)
were DEFENSIVE security-education false-positives; with the v2 context-aware gate
they now PASS (the gate no longer flags an attack pattern that appears only inside
a CWE table, a `#` comment, an inline-code example, or defensive prose).

`extended-300.json` = 36 curated + 234 ECC = 270 concrete (target
300; NOT padded). Full PASS set also enumerable via the pinned
`ecc-prime` bulk source.

## HELD - WARN (17) - default-denied, manual review

- `autonomous-agent-harness`
- `cisco-ios-patterns`
- `deployment-patterns`
- `django-patterns`
- `docker-patterns`
- `e2e-testing`
- `flox-environments`
- `homelab-network-setup`
- `homelab-pihole-dns`
- `homelab-vlan-segmentation`
- `homelab-wireguard-vpn`
- `kotlin-patterns`
- `netmiko-ssh-automation`
- `nutrient-document-processing`
- `safety-guard`
- `ui-demo`
- `vite-patterns`

## Reproduce
```bash
git clone https://github.com/Navigata1/ECC-Prime.git && cd ECC-Prime && git checkout 7113b5bf63694b716f8b2413c5919824a82fc095
for f in skills/*/SKILL.md; do bash /path/to/NBB/scripts/vet_skill.sh "$f"; done
```
Re-pin + re-vet on any new ECC commit.
