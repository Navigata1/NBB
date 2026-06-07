---
name: research-report
description: Synthesize a structured technology, API, or architecture decision report with source tiering, confidence rating, and anti-patterns. Use when deciding between tools, evaluating an architecture, comparing vendors, or vetting a dependency before implementing. Triggers: "research report", "compare X and Y", "which should I use", "API research", "before I build this", "technology decision", "architecture decision", "vendor comparison".
license: CC BY-NC-SA-4.0
metadata:
  tags:
    - decision-support
    - research
    - architecture
  triggers:
    - "research report"
    - "compare X and Y"
    - "which should I use"
    - "API research"
    - "before I build this"
    - "technology decision"
    - "architecture decision"
    - "vendor comparison"
---

# Research Report Skill

## Purpose

Generate a structured research report that informs implementation decisions with proper source tiering, confidence ratings, and anti-pattern discovery. Reports become persistent documentation in `research/[topic-slug]-[YYYY-MM-DD].md`.

## When to Use

- **Tool/vendor comparison:** "Should we use Postgres or MongoDB?" "Next.js vs SvelteKit?"
- **Architecture validation:** "Is this microservice pattern right for our scale?"
- **Dependency vetting:** Before adding a critical external package, library, or SaaS tool
- **API evaluation:** Is this REST/GraphQL API suitable for our use case?
- **Technology decision gates:** Before build approval, gather sourced evidence

## When NOT to Use

- **Quick "how-to" questions:** Use web search or context7 for library docs, not a research report.
- **Subjective taste/style decisions:** Design taste, branding, naming — use ccg:design-taste or judgment calls, not research.
- **Established consensus:** If all sources unanimously agree (e.g., "use HTTPS"), a report is overkill.
- **Already-decided paths:** If your team has a locked tech stack, a comparison report wastes time.
- **Sub-hourly decisions:** If you need a decision in 5 minutes, research takes 20+ minutes; use quick web search instead.

Alternative tools: ccg:context7 for docs lookup, deep-research for adversarial fact-checking, ecc:security-scan for CVE vetting.

## Execution Protocol

### Step 1: Clarify the Question
If the user's question is underspecified ("Which database is best?"), ask 2-3 clarifying questions first:
- What scale? (users, requests/sec, data volume)
- What's your current stack?
- What constraints? (budget, team expertise, latency SLA)

### Step 2: Search & Tier

**Use web search to find CURRENT facts.** Your training data is stale; APIs, versions, and recommendations change.

Search patterns:
- `[topic] 2026` (current-year articles)
- `[topic] pitfalls` (learn what breaks)
- `[topic] alternatives` (full option space)
- `github.com [project] issues` (real problems from users)
- `[topic] vs [option] benchmark` (measurable comparison)

**Classify every source by tier BEFORE citing:**
- **Tier A (Official):** Direct vendor docs, official repos, vendor-written blogs, RFCs, W3C specs
- **Tier B (Standard/Reviewed):** Linux Foundation projects, CNCF, well-maintained open-source (2k+ GH stars, active commits), peer-reviewed papers
- **Tier C (Community):** High-profile devs, tutorials, Stack Overflow accepted answers, blog posts from experts
- **Tier D (Discovery):** Unvetted blogs, forum posts, small projects (helpful for ideas, not recommendations)

### Step 3: Cross-Reference

**Minimum 2 independent Tier A+B sources** for any factual claim.
- If only 1 source: state "Single-source finding — verify independently"
- If sources conflict: document the conflict, explain which you trust more and why
- Check GitHub issues for real user problems (more honest than marketing docs)

### Step 4: Contextualize

Read project architecture docs (architecture.md, claude.md, etc.) if available.
- Tailor the recommendation to the team's actual constraints
- Note where recommendation would differ for a different scale or stack
- Include "What NOT to do" based on your research

### Step 5: Date Everything

- Every URL gets an access date (today's date, ISO format)
- Every version number gets a release date
- Every claim about "current" state gets "as of [date]" qualifier

## Report Template

```markdown
# Research Report: [Topic]
**Date:** [YYYY-MM-DD] | **For:** [project/context]
**Confidence:** CERTAIN | HIGH | MEDIUM | LOW | UNCERTAIN

## Executive Summary
[2-3 sentences answering the core question directly]

## Options Evaluated
| Option | Pros | Cons | Best For |
|--------|------|------|----------|
| [Name] | [list] | [list] | [use case] |

## Recommendation
**[Name]** because [reasoning based on tiers below].
Confidence: X% based on Y Tier A/B sources.

## Source Tiering
| Source | Tier | Verified |
|--------|------|----------|
| [Name] | A/B/C/D | [YYYY-MM-DD] |

## What NOT to Do
[Anti-patterns from research; common pitfalls; GitHub issues]

## Implementation Notes
[Version numbers, release dates, gotchas, stack-specific constraints]

## Safe to Vendor?
[If evaluating a dependency]
- [ ] Source reviewed (no suspicious scripts/hooks)
- [ ] Commit SHA: [sha]
- [ ] License: [license] (compatible with ours?)
- [ ] Maintained (last commit within 90 days): Y/N
- [ ] No known CVEs: Y/N

## References
[Links with access dates, GitHub stars+commit dates, include exact versions]
```

## Citation Standards

All factual claims must cite a source with:
- Author/org, title, URL, access date (ISO)
- If GitHub: stars count, last commit date, license
- Primary sources preferred over secondary reporting
- Never cite training data or memory; cite what you found

## Quality Checklist

A good report:
- Zero uncited claims
- Minimum 2 Tier A/B sources for the primary recommendation
- Includes a "What NOT to do" section
- Validates recommendation against project constraints
- Saves more time than it took to produce
- Even if research confirms the original direction, that validation has value

If the research doesn't change the approach, it still validates it — that's a successful report.

## Portability

This skill is **fully portable** across Claude Code, Claude.ai, Cursor, Antigravity, and any web interface.
- All steps (search, tiering, synthesis) work in any Claude interface
- No Claude-Code-only dependencies (no git hooks, no local file writes required; user can copy-paste report to their repo)
- Report output is plain markdown, portable everywhere
- Token economy: full reasoning on moderate topics (<50 options) takes 5-15k tokens; larger comparisons scale to 30k

## Anti-Patterns

- Citing only marketing material (vendor docs without GitHub issues, benchmarks)
- One source as evidence (always require 2 independent sources)
- Skipping the "What NOT to do" section (research without anti-patterns is incomplete)
- Assuming current facts (always verify release dates, version availability)
- Recommending without context (tailor to the project's actual constraints)
- Stopping research too early (if you find strong disagreement, dig deeper, don't average)
