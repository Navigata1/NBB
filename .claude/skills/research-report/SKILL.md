---
name: research-report
version: 1.0
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

## Executive Summary
[2-3 sentence answer to the core question]

## Options Evaluated
| Option | Pros | Cons | Best For |
|--------|------|------|----------|

## Recommendation
**[Recommended option]** because [reasoning].

## Implementation Notes
[Specific notes for THIS project's constraints]
[Gotchas discovered]
[Version-specific details]

## Code Examples
[Working examples for the recommended approach]

## References
[Links to docs, GitHub repos, benchmarks used]
```

## Execution Protocol
1. Use web search to find current documentation (not training data — APIs change)
2. Search for "[topic] pitfalls", "[topic] alternatives", "[topic] 2026"
3. Check GitHub for recent issues/PRs that might indicate problems
4. Tailor recommendations to the project's existing stack (read architecture.md)
5. Include a "What NOT to do" section based on research

## Quality Bar
A good research report saves more time than it takes.
If the research doesn't change the implementation approach, it still
validates the original direction — that has value too.
