---
name: skill-creator
version: 1.0
author: NavigatingTruth / NorthStarFramework
description: >
  Meta-skill for building, testing, and improving other skills. Use when
  creating a new skill from scratch, improving an existing skill, running
  skill evaluations, benchmarking skill performance, or optimizing skill
  descriptions for better triggering. Triggers: "create a skill",
  "build a skill", "improve this skill", "skill eval", "test this skill",
  "optimize skill description", "make a new skill", "skill benchmark".
---

# Skill Creator Skill

## Purpose
Meta-skill for the full skill lifecycle: create → test → evaluate → improve
→ repeat. This is the self-improving system's inner loop — the retro skill
detects *what* should become a skill, and the skill-creator builds it,
validates it, and tunes it until it triggers reliably and produces
measurably better outputs than baseline.

Adapted from Anthropic's official skill-creator. Condensed for NS Framework
conventions while preserving the core evaluation loop.

## When to Activate
- Creating a new skill from scratch
- Improving or revising an existing skill
- Evaluating whether a skill actually helps (with-skill vs baseline)
- Optimizing a skill's description for better trigger matching
- User says "turn this into a skill" (extract from conversation context)
- Retro skill promoted a pattern to CANDIDATE status

## Core Loop
```
Intent Capture → Draft Skill → Generate Test Cases → Run Tests
    → Evaluate Results (qualitative + quantitative) → Improve
    → Repeat until satisfied → Optimize Description
```

Every skill passes through this loop at least once before activation.

## Execution Protocol

### Phase 1: Intent Capture

Gather these before writing anything:

1. **What should this skill enable the agent to do?**
   Get a concrete description of the behavior, not just a topic.

2. **When should it trigger?**
   Collect user phrases, contexts, and scenarios. Think about what a real
   user would actually type — not idealized trigger phrases.

3. **What's the expected output format?**
   File? Inline response? Structured report? Code changes?

4. **Extract from conversation if applicable.**
   If the user says "turn this into a skill", review the last 20+ messages
   to extract the pattern, workflow, or specialized knowledge to encode.

5. **Research existing skills.**
   - Check `.claude/skills/` for similar or overlapping skills
   - Check `SKILLS_REGISTRY.md` for lifecycle status of related skills
   - Search available skills list for patterns that already exist
   - Look up best practices for the skill's domain

### Phase 2: Draft the SKILL.md

Create the skill directory and file:

```
.claude/skills/[skill-name]/
├── SKILL.md (required)
│   ├── YAML frontmatter (name, description required)
│   └── Markdown instructions
└── Bundled Resources (optional)
    ├── scripts/     — Deterministic/repetitive tasks
    ├── references/  — Docs loaded as needed
    └── assets/      — Templates, icons, fonts
```

**Drafting rules:**

- Keep SKILL.md under 500 lines. If it's growing past that, decompose
  into a focused skill + reference files.
- Use progressive disclosure:
  - **Metadata** (frontmatter) — always in context, costs tokens every turn
  - **Body** (instructions) — loaded when skill triggers
  - **Resources** (scripts, references) — loaded on demand within the skill
- Explain the WHY behind instructions. LLMs respond better to reasoning
  than to rigid rules. Instead of "ALWAYS use TypeScript", write "Use
  TypeScript because this project's CI rejects untyped code."
- Prefer imperative form: "Run tests before committing" not "Tests should
  be run before committing."
- Make the description slightly "pushy" — undertriggering is the #1 skill
  failure mode. A description that triggers on a few false positives is
  better than one that misses real use cases.
- Include examples with concrete input/output patterns where they help
  clarify expected behavior.
- Follow existing NS Framework skill structure:
  - YAML frontmatter (name, version, author, description)
  - `# [Name] Skill` heading
  - `## Purpose` — what and why
  - `## When to Activate` — trigger scenarios
  - `## Execution Protocol` — step-by-step with phases
  - `## Quality Criteria` — how to know it's working
  - `## Anti-Patterns` — what to avoid

### Phase 3: Generate Test Cases

Create 2-3 realistic test prompts. These must sound like what a real user
would actually say — not sanitized lab prompts.

Good test case:
```
"I keep doing the same 5-step deploy process every time.
 Can you make that a skill so it happens automatically?"
```

Bad test case:
```
"Please create a deployment automation skill."
```

Present test cases to the user for review before running them. Adjust based
on feedback.

Save finalized test cases to `evals/evals.json` (create the file if needed):
```json
{
  "skill": "[skill-name]",
  "version": "[version]",
  "date": "[YYYY-MM-DD]",
  "cases": [
    {
      "id": "tc-001",
      "prompt": "[realistic user prompt]",
      "assertions": [
        "[expected behavior 1]",
        "[expected behavior 2]"
      ],
      "should_trigger": true
    }
  ]
}
```

### Phase 4: Run Tests

For each test case, run two variants:
- **With-skill:** Load the skill, run the prompt, capture output
- **Baseline:** Run the same prompt without the skill loaded

Run variants in parallel where possible. Capture:
- Full output text
- Token count (input + output)
- Duration
- Whether assertions passed

### Phase 5: Evaluate Results

**Qualitative evaluation:**
- Review outputs side-by-side with the human
- Ask: "Is the with-skill output meaningfully better? Where does it fall short?"
- Capture specific feedback on what to improve

**Quantitative evaluation:**
- Assertion pass rate: with-skill vs baseline
- Token overhead: how much extra cost does the skill add?
- Timing: is the skill adding unacceptable latency?

Present a comparison table:
```
| Metric          | Baseline | With Skill | Delta    |
|-----------------|----------|------------|----------|
| Assertions pass | 1/3      | 3/3        | +67%     |
| Output tokens   | 450      | 620        | +38%     |
| Duration        | 8s       | 11s        | +3s      |
| Human rating    | 2/5      | 4/5        | +2       |
```

The skill must justify its token/time cost with measurably better outputs.

### Phase 6: Improve

Based on evaluation results:

1. **Generalize from feedback.** Fix the root cause, not the specific test
   case. If test case 2 failed because the skill missed a context-gathering
   step, add that step for ALL scenarios — don't add a special case for
   test case 2's exact prompt.

2. **Keep the prompt lean.** Remove instructions that don't pull their
   weight in the evaluation. Every line in SKILL.md costs tokens on every
   invocation — dead weight accumulates.

3. **Explain the why.** If you catch yourself writing "MUST" or "ALWAYS",
   ask: would a sentence explaining the reasoning work just as well?
   Reasoning scales better than rules.

4. **Look for repeated work.** If every test case triggers the same
   deterministic steps (file creation, formatting, API calls), extract
   those into bundled scripts under `scripts/`.

5. **Rerun tests after improvements.** Don't assume the fix worked — verify.

### Phase 7: Description Optimization

The description is the skill's trigger mechanism. A great skill with a bad
description never fires.

1. Generate 20 trigger evaluation queries:
   - 10 should-trigger (realistic prompts where this skill should activate)
   - 10 should-NOT-trigger (realistic prompts for adjacent but different tasks)

2. Queries must be realistic with concrete details:
   ```
   Should trigger:    "I keep writing the same error handling pattern,
                       can we encode that as a reusable skill?"
   Should NOT trigger: "I got an error in my code, can you fix it?"
   ```

3. Test each query against the description. Does the skill trigger
   correctly? Record accuracy.

4. Iterate on the description until trigger accuracy is ≥ 90% on the
   evaluation set.

5. Remember: slightly pushy > slightly conservative. False positive
   triggers are cheap (skill loads but isn't needed). False negatives
   mean the skill never helps.

## Skill Writing Guidelines

- **Under 500 lines** for SKILL.md body. Decompose large skills.
- **Progressive disclosure:** metadata always loaded → body on trigger →
  resources on demand.
- **Explain WHY**, not just WHAT. Reasoning > rigid rules.
- **Imperative voice.** "Run X" not "X should be run."
- **Pushy descriptions.** Combat undertriggering — the #1 failure mode.
- **Concrete examples.** Show input/output patterns where helpful.
- **No malware, exploit code, or misleading content.**
- **Domain organization:** group variants with separate reference files,
  not one giant SKILL.md with conditional branches.

## Integration with NS Framework

After a skill passes evaluation:

1. **Register in SKILLS_REGISTRY.md** with lifecycle state.
2. **Follow the lifecycle:**
   ```
   DISCOVERY → REVIEW → APPROVED → VENDORED → ACTIVE
   ```
3. **Human approval required** before activation. Present the skill draft,
   evaluation results, and trigger accuracy to the user. Wait for explicit
   "approve" before setting state to ACTIVE.
4. **For external adaptations** (skills sourced from outside this repo),
   run the skill-supply-chain-review checklist from the research-report
   skill's "Safe to Vendor?" section.
5. **Run retro skill** after the skill creation process to capture what
   was learned about skill authoring itself.

## Quality Criteria

A skill is ready for activation when:
- Triggers reliably on intended prompts (≥ 90% trigger accuracy)
- Does NOT trigger on unrelated prompts (≤ 10% false positive rate)
- With-skill outputs are measurably better than baseline
- SKILL.md is under 500 lines
- Description accurately captures trigger scenarios
- At least one human has reviewed and approved the skill
- Skill is registered in SKILLS_REGISTRY.md

## Anti-Patterns

- **Creating skills for one-time patterns.** Wait for 3+ occurrences
  (per retro skill guidance) before promoting to a skill.
- **Overfitting to test cases.** Generalize from feedback — the goal is
  robust behavior across real usage, not passing a specific eval set.
- **Rigid ALWAYS/NEVER rules.** Use reasoning where it works better.
  "MUST use semicolons" → "Use semicolons because the project linter
  enforces them and CI will reject PRs without them."
- **Skipping baseline comparison.** You cannot measure improvement without
  a control. Always run baseline alongside with-skill.
- **Not optimizing the description.** Undertriggering is the #1 skill
  failure mode. A skill that never fires provides zero value.
- **Self-activating without human approval.** Every skill must pass through
  the human review gate before reaching ACTIVE status.
- **Giant monolithic skills.** If a skill tries to handle too many
  scenarios, decompose it into focused skills with clear boundaries.
  Each skill should do one thing well.
- **Skipping the rerun.** After improving a skill, always rerun the test
  cases. Don't assume the fix worked.
