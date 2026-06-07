---
name: skill-supply-chain-review
description: Audit external skills before adoption into a framework. Use when evaluating a new skill, reviewing upstream changes, or deciding whether to vendor an external skill — triggers include "review this skill", "is this skill safe", "skill supply chain", "vendor this skill", "should we adopt this".
license: CC BY-NC-SA-4.0
metadata:
  lineage: Original to NorthStarBuild Framework
  framework: North Star v5.0
  reference: arXiv:2602.12430v3 (26.1% of community-contributed skills contain vulnerabilities)
---

# Skill Supply Chain Review

## Purpose
Gatekeeper skill for external skill adoption. Enforces trust tiering from SKILLS_REGISTRY.md, audits file and network behavior, diffs upstream changes against pinned versions, and produces a standardized KEEP / UPDATE / REVIEW / REMOVE recommendation.

This skill exists because external skills pose supply-chain risks. Blind adoption is not acceptable.

## When to Activate
- User asks to evaluate, adopt, or vendor an external skill
- User shares a GitHub link and asks "should we use this?"
- A vendored skill needs upstream diff check (scheduled or ad-hoc)
- A new version of an adopted skill is released
- Trigger phrases: "review this skill", "is this skill safe", "evaluate skill", "skill supply chain", "vendor this skill", "audit skill", "upstream diff", "should we adopt this"
- During retro, if a vendored skill caused friction or unexpected behavior

## When NOT to use
- Reviewing your own internal skills (use /code-review instead).
- Assessing general CLI tools, libraries, or non-skill dependencies (out of scope; consult your dependency security tools).
- Doing a quick "is this repo legit?" check that does not require a formal vendoring decision (use web_search or informal peer review).
- Evaluating skills you have already adopted and are satisfied with, unless upstream changes warrant re-audit.

**See instead:** /code-review for internal code, supply-chain tools (OWASP Dependency Check, Snyk) for dependencies, web_search for informal reputation checks.

## Trust Tier Classification

Classify the skill source before auditing. Tiers determine baseline trust and audit depth:

| Tier | Label | Examples | Audit Depth |
|------|-------|----------|-------------|
| A | Official Vendor | Anthropic, OpenAI official repos | Phases 1, 4, 5 only |
| B | Open Standard | RFCs, W3C specs, Linux Foundation | Phases 1, 2, 4, 5 |
| C | Reviewed Community | High-star repos, peer-reviewed | ALL phases (1-5) |
| D | Discovery Only | Blogs, unverified repos, mega-packs | ALL phases + elevated suspicion |

## Execution Protocol

### Phase 1: Source Verification
1. Confirm repo exists and is accessible.
2. Verify URL matches known patterns (Anthropic: github.com/anthropics/skills/...; OpenAI: github.com/openai/skills/...; Community: exact URL from SKILLS_REGISTRY.md Tier C).
3. Record repo metadata: stars, last commit date, license, open issues.
4. Search for known security advisories: [repo name] CVE, [repo name] vulnerability.
5. If not listed in SKILLS_REGISTRY.md, classify as Tier D.
6. Record findings: Source, Tier, Stars, Last commit, License, Known advisories.

### Phase 2: Content Audit
Read ALL files in the skill directory. For each file, check for:

**Suspicious patterns (flag each):**
- Shell commands: bash, sh, cmd, powershell, exec, spawn, system()
- Network calls: curl, wget, fetch, http, https, axios, request
- File system writes outside project: absolute paths, ~/, /etc/, /usr/, %APPDATA%, $HOME, .. traversals
- Code execution: eval(), exec(), Function(), import() with dynamic paths
- Obfuscated code: base64, hex-encoded payloads, minified blobs
- Environment variable access: process.env, os.environ, $ENV, getenv
- Credential patterns: API_KEY, SECRET, TOKEN, PASSWORD, PRIVATE_KEY
- Package installation: npm install, pip install, cargo install without version pinning

Record for each: File, Line, Pattern, Risk level (LOW/MEDIUM/HIGH/CRITICAL), Context, Legitimate use (yes/no with justification).

### Phase 3: Behavioral Analysis
Analyze what the skill instructs the agent to DO:

1. **Tool usage:** List every tool invocation. Flag any exceeding the skill's stated purpose.
2. **System modification:** Check for modifications to shell profiles, git config, IDE settings outside .claude/, or system-level files.
3. **Phone home:** Check for instructions to send data to external URLs, report usage, or fetch remote config.
4. **Self-replication:** Check for copies of itself, self-modification, auto-trigger registration, or registration without approval.
5. **Scope creep:** Check for undeclared actions, chaining into other skills, or unrelated file modifications.

### Phase 4: Compatibility Check
1. **Conflict scan:** Overlapping trigger phrases, contradictory instructions, or duplicate functionality with existing skills.
2. **Convention compliance:** YAML frontmatter, Markdown structure, human approval gates, no bulk staging (git add -A).
3. **Version compatibility:** Check NORTH_STAR_BOOTSTRAP.md, north-star-blueprint/, master-build-framework/ versions.
4. **Dependency check:** Does it require unavailable tools, MCPs, or plugins?

### Phase 5: Vendoring Assessment
Complete the vendoring checklist (below). All items must be filled. Any FAIL or unanswered item blocks adoption.

## Vendoring Checklist

```markdown
- [ ] Source repo: [url]
- [ ] Upstream path: [path within repo]
- [ ] Date checked: [YYYY-MM-DD]
- [ ] Pinned commit SHA: [full 40-char SHA]
- [ ] Local owner/reviewer: [name or handle]
- [ ] Rationale for adoption: [why this skill, why now]
- [ ] Security review status: [PASS / FAIL / PENDING]
- [ ] License compatible with CC BY-NC-SA 4.0: [yes / no]
- [ ] Last upstream diff check: [YYYY-MM-DD]
- [ ] No suspicious shell commands: [yes / no — if no, list them]
- [ ] No network calls outside documented APIs: [yes / no — if no, list them]
- [ ] No file writes outside project scope: [yes / no — if no, list them]
- [ ] No self-modifying or self-activating behavior: [yes / no — if no, describe]
```

Rules: Every [no] requires justification and explicit human sign-off. Security review status FAIL blocks adoption. License incompatibility blocks adoption. Missing fields treated as FAIL.

## Upstream Diff Protocol

For already-vendored skills, run this protocol on regular cadence or when notified of changes:

1. **Record current state:** Skill name, current pinned SHA (from SKILLS_REGISTRY.md), upstream repo URL, last diff check date.
2. **Fetch upstream changes:** Use web_search or similar to compare upstream commits against pinned SHA. If no changes → KEEP, update date, done.
3. **Diff review:** For each changed line: categorize (documentation/logic/configuration/new dependency), check red flags list (below), note new tool invocations, shell commands, network calls, or trigger phrase changes.
4. **Recommendation:** Based on diff, recommend:
   - KEEP: No changes or irrelevant changes — update date only.
   - UPDATE: Safe changes (docs, bug fixes, non-behavioral improvements) — update SHA, pull changes.
   - REVIEW: Suspicious or significant changes (new commands, network calls, scope changes) — flag for human review, do not auto-update.
   - REMOVE: Compromised (red flags detected, malicious changes) — remove from .claude/skills/, update registry.
5. **Record decision:** Update SKILLS_REGISTRY.md and vendoring checklist with new SHA (if UPDATE), rationale, date, reviewer name.

## Red Flags

Patterns triggering automatic FAIL. No exceptions.

**Critical Red Flags (Automatic FAIL):**
1. Untrusted downloads: curl, wget, fetch to unknown URLs
2. Security disabling: Instructions to disable features, ignore warnings, bypass validation
3. Malicious intent: Crypto mining, data exfiltration, reverse shells, backdoors
4. Obfuscated payloads: Base64 commands, hex scripts, minified blobs resisting review
5. Shell profile modification: Instructions to modify .bashrc, .zshrc, .profile, .bash_profile
6. Self-improving without gates: Modifies itself, adds to auto-trigger lists, activates without approval
7. Auto-start behavior: Registers for automatic activation on every session without opt-in
8. Credential access: Reading, logging, transmitting API keys, tokens, passwords, private keys
9. Privilege escalation: sudo, runas, permission elevation beyond current user
10. Supply chain attacks: Instructions to add dependencies, modify package.json, requirements.txt without declaration

**Warning Flags (Require Justification):**
- Shell commands related to skill purpose (e.g., git in git-related skill)
- Network calls to documented, expected APIs (e.g., web_search in research skill)
- File writes within project directory matching skill purpose
- Environment variable reads for configuration (not credentials)

## Output Template

Write review report to research/skill-review-[skill-name]-[YYYY-MM-DD].md:

```markdown
# Skill Supply Chain Review: [skill-name]

Date: [YYYY-MM-DD]
Reviewer: Claude (via skill-supply-chain-review v1.0)
Source: [url]
Tier: [A / B / C / D]

## Verdict: [PASS / FAIL / CONDITIONAL PASS]

**Recommendation:** [ADOPT / REJECT / DEFER — for new] | [KEEP / UPDATE / REVIEW / REMOVE — for existing]

## Summary
[2-3 sentence assessment]

## Phase 1: Source Verification
- Repo exists: [yes/no]
- URL pattern matches: [yes/no]
- Stars: [count] | Last commit: [date] | License: [license]
- Known advisories: [none / list]
- Tier classification: [A/B/C/D] — [justification]

## Phase 2: Content Audit
- Files reviewed: [count]
- Suspicious patterns found: [count]

| File | Line | Pattern | Risk | Legitimate |
|------|------|---------|------|------------|
| [entries] | | | | |

## Phase 3: Behavioral Analysis
- Tools instructed: [list]
- System modifications: [none / list]
- Phone-home behavior: [none / list]
- Self-replication: [none / list]
- Scope creep: [none / list]

## Phase 4: Compatibility Check
- Conflicts with existing skills: [none / list]
- Follows NS conventions: [yes / no — details]
- Version compatible: [yes / no]
- Missing dependencies: [none / list]

## Phase 5: Vendoring Checklist
[Complete checklist]

## Red Flags
- Critical flags triggered: [none / list]
- Warning flags triggered: [none / list with justifications]

## Conditions (if CONDITIONAL PASS)
[List specific modifications required before adoption]

## References
[URLs checked, with access dates]
```

## Quality Criteria
- Review catches real risks without false-positive noise.
- Every FAIL includes specific evidence, never vague ("it feels unsafe").
- Every PASS includes completed vendoring checklist with no blanks.
- Review is reproducible — another reviewer following this protocol reaches the same conclusion.
- Upstream diff checks are timestamped and traceable.
- Skipped steps (e.g., Tier A phase shortcuts) are explicitly justified.

## Common Anti-Patterns to Avoid
- Rubber-stamping because a skill is popular (stars ≠ security).
- Skipping content audit for Tier A skills with shell commands.
- Adopting a skill "temporarily" without completing vendoring checklist.
- Updating pinned SHA without reviewing the diff.
- Treating CONDITIONAL PASS as PASS without completing conditions.
- Running review without reading ALL skill files.
- Approving skills that modify their own triggers or activation.
- Using git add -A when committing review artifacts.

## Portability
This skill is platform-agnostic. All protocols (trust tiering, audit phases, diff review, red flag detection) work outside Claude Code. No step is Claude Code-specific. Review templates, checklists, and decision trees are portable to Cursor, Codex, Antigravity, or manual paper-based reviews. No tool or MCP is required; web_search is optional for finding advisory data (use any search tool available in your environment).
