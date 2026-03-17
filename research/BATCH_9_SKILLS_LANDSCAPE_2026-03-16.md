# Research Report: Batch 9 Skills Landscape

**Date:** 2026-03-16  
**Author:** Codex  
**For:** NorthStarBuild Batch 9 skill sourcing and integration

## Executive Summary

North Star is ready for Batch 9, but the repository is missing the one artifact
that Batch 9 most obviously needs: a real `SKILLS_REGISTRY.md`. The framework
already references that file in `GLOBAL_IDE_RULES.md`, yet no registry existed.

The safest current 2026 path is not "download the biggest skill pack". It is:

1. use official OpenAI and Anthropic skill sources as the trusted baseline,
2. selectively vendor a short list of high-value skills,
3. adapt strong community ideas into local skills after review,
4. treat public marketplaces and giant community collections as discovery only.

## Local Repo Findings

### What already exists

- `.claude/skills/parallel-agent`
- `.claude/skills/plan-annotator`
- `.claude/skills/research-report`
- `.claude/skills/retro`

### What the docs already imply

- `NORTH_STAR_BOOTSTRAP.md` defines a skill creation meta-system.
- `BRIDGE.md` references skill manifests, self-improvement, and skill packaging.
- `GLOBAL_IDE_RULES.md` already points Roo Code at `./SKILLS_REGISTRY.md`.

### What is missing

- No root `SKILLS_REGISTRY.md` had been created.
- No pinned upstream source list existed.
- No trust-tier model existed for official versus community skills.
- No documented vendoring workflow existed for external skills.

## Options Evaluated

| Option | Pros | Cons | Best For |
|--------|------|------|----------|
| Bulk-import community packs | Fast catalog growth | Highest supply-chain risk, inconsistent quality, stale paths | Never as default |
| Official-only skill adoption | Safest and cleanest | Narrower coverage, fewer creative patterns | Core Batch 9 baseline |
| Hybrid: official baseline + reviewed community adaptation | Best balance of safety and capability | Requires review discipline | Recommended |

## Recommendation

**Recommended: Hybrid with a strict trust model.**

Use official OpenAI and Anthropic skill ecosystems as the installable baseline,
then adapt selected community patterns into local project skills. This produces
better long-term quality than either a pure official-only strategy or a raw
community import strategy.

## Verified Upstream Sources

### 1. OpenAI official

- Codex custom skills docs:
  https://developers.openai.com/codex/customizing-codex
- OpenAI skills repo:
  https://github.com/openai/skills

#### What was verified on 2026-03-16

- Current top-level skill folders in the repo:
  - `skills/.curated`
  - `skills/.system`
- The installer-expected `skills/.experimental` path did not exist at that
  location on 2026-03-16.
- The curated catalog currently contains **35 skills**.

#### High-value OpenAI curated skills for North Star

- `playwright`
- `screenshot`
- `doc`
- `gh-fix-ci`
- `gh-address-comments`
- `security-best-practices`
- `security-threat-model`
- `openai-docs`

#### Verified raw-link examples

- https://raw.githubusercontent.com/openai/skills/main/skills/.curated/playwright/SKILL.md
- https://raw.githubusercontent.com/openai/skills/main/skills/.curated/security-threat-model/SKILL.md
- https://raw.githubusercontent.com/openai/skills/main/skills/.curated/screenshot/SKILL.md

### 2. Anthropic official

- Custom skills help article:
  https://support.claude.com/en/articles/12091968-create-custom-skills-for-claude
- Anthropic example skills repo:
  https://github.com/anthropics/skills

#### What was verified on 2026-03-16

- The public repo currently exposes an `examples/` directory.
- That `examples/` directory currently contains **13 example skills**.

#### Verified raw-link examples

- https://raw.githubusercontent.com/anthropics/skills/main/examples/bash/CLAUDE.md
- https://raw.githubusercontent.com/anthropics/skills/main/examples/code-reviewer/CLAUDE.md

### 3. Vendor-neutral standard

- Agent Skills standard:
  https://github.com/mariozechner/agents.json

#### Why it matters

North Star is increasingly multi-agent and cross-tool. A vendor-neutral
registry model would future-proof Batch 9 better than a Claude-only or
Codex-only shape.

## Community Landscape

### High-signal community candidate: `taste-skill`

- Repo: https://github.com/leonxlnx/taste-skill

This is the strongest candidate I found for replacing a generic frontend-design
skill with something more opinionated and higher quality. It appears best used
as source material for a local `design-taste` skill rather than installed
verbatim.

### High-signal community candidate: `claude-code-subagents-collection`

- Repo: https://github.com/ericbuess/claude-code-subagents-collection

Verified on 2026-03-16:

- `/.claude/agents` currently contains **91** agent markdown files.

This is strong evidence that the agent landscape is shifting from a simple
"single monolithic assistant" model toward specialized agent libraries.

### What not to do

Do not import giant community packs directly into `.claude/skills/` just
because they are popular. Community collections are excellent discovery
surfaces, but they are not sufficient trust anchors on their own.

## Direct Implications for Batch 9

### 1. Create the missing registry

This was the cleanest immediate gap. Batch 9 should begin by making
`SKILLS_REGISTRY.md` real and treating it as the canonical source map.

### 2. Update skills as a supply chain, not just as prose

For every adopted external skill, Batch 9 should record:

- source repo
- upstream path
- date checked
- pinned commit SHA
- local owner/reviewer
- rationale for adoption

### 3. Improve the local skills

Recommended upgrades:

- `parallel-agent`: modernize for agent teams and subagent workflows
- `research-report`: add explicit citation and trust-tier requirements
- `retro`: add self-improving skill promotion with human approval gates

### 4. Add two new local skills

- `design-taste`
  - informed by `taste-skill`
  - focused on high-quality frontend direction
- `skill-supply-chain-review`
  - evaluates external skill safety and upgrade diffs

### 5. Revalidate stale installation language

I found `claude plugin install code-simplifier` in the current Bootstrap text.
That syntax should be revalidated against current Claude tooling before it is
propagated further in Batch 9.

## Best Integration Model

Recommended local structure:

```text
.claude/
  skills/
    parallel-agent/
    plan-annotator/
    research-report/
    retro/
    design-taste/
    skill-supply-chain-review/
  vendor-skills/
    openai/
    anthropic/
```

Use `vendor-skills/` as the review staging area and copy only approved,
project-shaped variants into `.claude/skills/`.

## What NOT to Do

- Do not trust popularity alone.
- Do not install directly from random mirrors.
- Do not assume old repo paths still exist.
- Do not merge subagent packs into skill packs without adaptation.
- Do not let self-improving skills self-activate without human approval.

## Conclusion

North Star is structurally ready for Batch 9. The repo does not need a blind
skill explosion. It needs a disciplined skill registry, a reviewed upstream
pipeline, and a small number of high-leverage additions.

That is the correct Batch 9 shape for the 2026 agent landscape.

## References

- https://developers.openai.com/codex/customizing-codex
- https://github.com/openai/skills
- https://support.claude.com/en/articles/12091968-create-custom-skills-for-claude
- https://github.com/anthropics/skills
- https://github.com/mariozechner/agents.json
- https://github.com/leonxlnx/taste-skill
- https://github.com/ericbuess/claude-code-subagents-collection
