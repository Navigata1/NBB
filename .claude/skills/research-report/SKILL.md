---
name: research-report
version: 1.1
description: >
  Use when user needs a research report on a technology, API, architecture
  decision, or tool comparison before building. Triggers: "research",
  "research report", "which should I use", "compare X and Y", "what's the
  best way to", "before I build this", "API research", "technology decision".
---

# Research Report Skill

## Purpose
Generate a structured research report that informs implementation decisions.
Always output to a file — reports are persistent knowledge.

## Output File Location
`research/[topic-slug]-[YYYY-MM-DD].md`

## Report Template

```markdown
# Research Report: [Topic]
**Date:** [date] | **Author:** Claude | **For:** [project/feature]
**Confidence:** [CERTAIN/HIGH/MEDIUM/LOW/UNCERTAIN]

## Executive Summary
[2-3 sentence answer to the core question]

## Source Tiering
Sources used in this report, classified by trust level:

| Source | Tier | URL | Date Verified |
|--------|------|-----|---------------|
| [name] | A: Official Vendor | [url] | [date] |
| [name] | B: Open Standard | [url] | [date] |
| [name] | C: Reviewed Community | [url] | [date] |
| [name] | D: Discovery Only | [url] | [date] |

## Options Evaluated
| Option | Pros | Cons | Best For |
|--------|------|------|----------|

## Recommendation
**[Recommended option]** because [reasoning].

**Confidence rating:** [X]% — based on [number] of Tier A/B sources consulted.

## Implementation Notes
[Specific notes for THIS project's constraints]
[Gotchas discovered]
[Version-specific details — include exact version numbers and dates]

## What NOT to Do
[Anti-patterns discovered during research]
[Common pitfalls from GitHub issues, Stack Overflow, etc.]

## Code Examples
[Working examples for the recommended approach]

## Safe to Vendor?
[If evaluating an external skill, tool, or dependency:]
- [ ] Source repo reviewed (no suspicious scripts, hooks, or network calls)
- [ ] Pinned commit SHA recorded: [sha]
- [ ] License compatible: [license]
- [ ] Active maintenance (last commit within 90 days): [yes/no]
- [ ] No known CVEs or security advisories: [yes/no]

## References
[Links to docs, GitHub repos, benchmarks used]
[Include exact access dates for all URLs]
```

## Execution Protocol

### Step 1: Verify, Don't Assume
1. Use web search to find CURRENT documentation (not training data — APIs change)
2. Search for "[topic] pitfalls", "[topic] alternatives", "[topic] 2026"
3. Check GitHub for recent issues/PRs that might indicate problems
4. Verify exact version numbers and release dates

### Step 2: Tier Your Sources
Classify every source before citing it:
- **Tier A (Official Vendor):** Direct vendor docs, official repos, official blogs
- **Tier B (Open Standard):** RFCs, W3C specs, Linux Foundation projects
- **Tier C (Reviewed Community):** Well-known developers, high-star repos, peer-reviewed
- **Tier D (Discovery Only):** Blog posts, tutorials, forum answers, unverified repos

### Step 3: Cross-Reference
- Minimum 2 independent sources for any factual claim
- If only 1 source found, explicitly state: "Single-source claim — verify independently"
- If sources conflict, document the conflict and state which you trust more and why

### Step 4: Contextualize
- Tailor recommendations to the project's existing stack (read architecture.md or claude.md)
- Note where the recommendation would differ for a different stack/scale
- Include a "What NOT to do" section based on research

### Step 5: Date Everything
- Every URL gets an access date
- Every version number gets a release date
- Every "current" claim gets a "as of [date]" qualifier

## Citation Requirements
- All factual claims must cite a source
- All sources must include: author/org, title, URL, date accessed
- Prefer primary sources over secondary reporting
- If citing a GitHub repo: include stars count, last commit date, license

## Quality Bar
A good research report:
- Saves more time than it takes to produce
- Contains zero uncited factual claims
- Has at least 2 Tier A sources for the primary recommendation
- Includes a "What NOT to do" section
- Validates the recommendation against the project's actual constraints

If the research doesn't change the implementation approach, it still
validates the original direction — that has value too.
