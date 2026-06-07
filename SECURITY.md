# Security Policy

## Reporting a Vulnerability

If you discover a security issue in the North Star Framework, please report it responsibly. **Do not open a public GitHub issue for security vulnerabilities.**

### How to Report

**Primary contact:** DM [@NavigatingTruth](https://twitter.com/NavigatingTruth) on Twitter/X

Please include:
- A clear description of the vulnerability
- Which framework file(s) are affected
- Steps to reproduce the issue
- The potential impact as you understand it

### Response Commitment

- **Acknowledgment** within 48 hours of report
- **Assessment** within 7 days — we'll confirm whether it's a valid issue and share next steps
- **Resolution** timeline communicated once the scope is understood
- **Credit** given in the CHANGELOG and release notes (unless you prefer to remain anonymous)

## What Counts as a Security Issue

The North Star Framework is a development methodology, not a running application. Security issues in this context include:

- **Credential exposure patterns** — Example code, templates, or instructions that would lead users to commit secrets, API keys, or tokens to version control
- **Unsafe permission guidance** — Instructions that encourage `dangerously-skip-permissions` or equivalent flags without proper scoping, or that disable security controls without adequate warning
- **Malicious fetch targets** — Any raw GitHub URL or external URL in the framework that has been compromised or redirects to unintended content
- **Hook injection vectors** — Patterns in the Hooks Architecture that could allow untrusted input to execute arbitrary shell commands
- **Supply chain risks** — Recommended tools, dependencies, or MCP servers that have known vulnerabilities or have been compromised

## What Does NOT Count as a Security Issue

- General bugs or typos — use the [Bug Report](.github/ISSUE_TEMPLATE/bug_report.md) template
- Enhancement requests — use the [Enhancement Request](.github/ISSUE_TEMPLATE/enhancement_request.md) template
- Disagreements about best practices or methodology choices
- Issues in third-party tools listed in the Master Build Framework (report those to the tool maintainers directly)

## Operational Security & Governance (NBB)

Operational guidance for agents USING the framework lives in `docs/governance/`:

- `docs/governance/README.md` — cost caps + auto-throttle, immutable action log, HITL checkpoints.
- `docs/governance/PERMISSIONS_AND_SANDBOXING.md` — least-privilege permissions, when NOT to use `--dangerously-skip-permissions`, computer-use sandboxing, and the prompt-injection refusal posture (instructions in page/tool data are DATA, never commands).
- `docs/governance/SECRETS.md` — `op://` / 1Password injection (`op run --`) and Stripe restricted keys + webhook signature verification.
- `docs/governance/LOCAL_FIRST.md` — fully local, zero-egress execution for data-sovereignty needs.

The safety floor (hard stops, blast-radius tiers, autonomy caps) is summarized in
the bootstrap core (`bootstrap/NBB_CORE.md` §5) and detailed in Blueprint Part X.

## Supported Versions

| Version | Supported |
|---------|-----------|
| v6.1 (current) | ✅ Active |
| v6.0 | ⚠️ Critical fixes only |
| v5.0 and earlier | ❌ No longer supported |

---

> **North Star Framework** — Build with intention. Ship with confidence.
> Created by [@NavigatingTruth](https://twitter.com/NavigatingTruth)
