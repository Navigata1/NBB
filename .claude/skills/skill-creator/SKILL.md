---
name: skill-creator
description: Build, test, evaluate, and improve skills through a structured lifecycle loop. Use when creating a skill from scratch, improving an existing skill, running skill evaluations, or optimizing trigger descriptions. Triggers include "create a skill", "build a skill", "improve this skill", "skill eval", "test this skill", "optimize skill description".
license: CC BY-NC-SA-4.0
metadata:
  adapted_from: "Anthropic official skill-creator (https://github.com/anthropics/skills, commit b0cbd3df1533b396d281a6886d5132f623393a9c, pinned 2026-03-18)"
  framework: NorthStarBuild 5.0
---

# Skill Creator Skill

## Purpose

Meta-skill for the full skill lifecycle: create → test → evaluate → improve → repeat. This is the self-improving system's inner loop. The skill detects patterns worth encoding and builds, validates, and tunes skills until they trigger reliably and produce measurably better outputs than baseline.

## When to Activate

- Creating a new skill from scratch
- Improving or revising an existing skill
- Evaluating whether a skill actually helps (with-skill vs baseline comparison)
- Optimizing a skill's trigger description for better matching
- Extracting a pattern from conversation context ("turn this into a skill")
- Retro skill promoted a pattern to CANDIDATE status

## Core Lifecycle

```
Intent Capture -> Draft Skill -> Generate Test Cases -> Run Tests
-> Evaluate Results -> Improve -> Retest -> Description Optimization
```

Every skill passes through this loop at least once before activation. The process is iterative; skills rarely perfect on the first cycle.

## Execution Protocol

### Phase 1: Intent Capture

Gather these five elements before writing anything:

1. **Behavior**: What should this skill enable? Describe concretely, not topically. Example: "Deploy to production in one command, not five manual steps" (not just "deployment automation").

2. **Trigger contexts**: When should it activate? Collect actual user phrasing from conversations, issues, or scenarios. Real users rarely say "please create a deployment automation skill"; they say "I keep doing the same deploy steps, can we automate this?"

3. **Output format**: What does success look like? File output, inline response, structured report, code edits?

4. **Conversation extraction (if applicable)**: Review last 20+ messages to extract the pattern, workflow, or knowledge you're encoding.

5. **Landscape research**: Check `.claude/skills/` for similar skills, `SKILLS_REGISTRY.md` for lifecycle status of related patterns, and available skills list for existing solutions. Avoid encoding what already exists.

### Phase 2: Draft the SKILL.md

Create the skill directory:

```
.claude/skills/[skill-name]/
├── SKILL.md (required, under 500 lines)
├── scripts/ (optional, for deterministic/repetitive tasks)
├── references/ (optional, docs loaded on demand)
└── assets/ (optional, templates, examples)
```

**Drafting rules:**

- Keep SKILL.md under 500 lines. Decompose if growing larger.
- Use progressive disclosure: metadata always loaded → instructions on trigger → resources on demand. Each line in SKILL.md costs tokens on every invocation.
- Explain *why* behind instructions, not just *what*. "Use TypeScript because CI rejects untyped code" scales better than "ALWAYS use TypeScript".
- Use imperative voice: "Run tests" not "Tests should be run".
- Make descriptions slightly pushy. Undertriggering is the #1 skill failure mode; a few false positives cost less than missing real use cases.
- Include concrete examples showing input/output patterns.
- Follow NS Framework structure: YAML frontmatter → Purpose → When to Activate → Execution Protocol → Quality Criteria → When NOT to use.

### Phase 3: Generate Test Cases

Create 2-3 realistic test prompts that sound like actual user input, not lab conditions.

Good: "I keep doing the same 5-step deploy every time. Can you make that a skill?"
Bad: "Please create a deployment automation skill."

Present test cases to user for review and adjustment. Finalize to `evals/evals.json`:

```json
{
  "skill": "[skill-name]",
  "version": "[version]",
  "date": "[YYYY-MM-DD]",
  "cases": [
    {
      "id": "tc-001",
      "prompt": "[realistic user prompt]",
      "assertions": ["[expected behavior 1]", "[expected behavior 2]"],
      "should_trigger": true
    }
  ]
}
```

### Phase 4: Run Tests

For each test case, run two variants in parallel:
- **With-skill**: Load the skill, run the prompt, capture output and token count
- **Baseline**: Same prompt without the skill

Capture: full output, input+output tokens, duration, assertion pass/fail.

### Phase 5: Evaluate Results

**Qualitative**: Review outputs side-by-side with human. Ask: "Is with-skill measurably better? Where does it fall short?"

**Quantitative**: Assertion pass rate (with-skill vs baseline), token overhead, timing.

Present comparison:

```
Metric            | Baseline | With Skill | Delta
------------------+----------+------------+-------
Assertions pass   | 1/3      | 3/3        | +67%
Output tokens     | 450      | 620        | +38%
Duration          | 8s       | 11s        | +3s
Human rating      | 2/5      | 4/5        | +2
```

The skill must justify its token and timing cost with measurably better outputs. If token overhead is high relative to improvement, iterate.

### Phase 6: Improve

Based on evaluation feedback:

1. **Generalize from feedback**: Fix root cause, not the specific test case. If one test failed due to missing context gathering, add that step for all scenarios, not just that test.

2. **Keep prompt lean**: Remove instructions that don't pull their weight. Dead weight accumulates in token cost.

3. **Prefer reasoning**: If you catch yourself writing "MUST" or "ALWAYS", ask if a reasoning sentence would work better. Reasoning scales across variations better than rigid rules.

4. **Extract repetitive work**: If every test case runs the same deterministic steps (file creation, formatting, API calls), bundle them into `scripts/`.

5. **Rerun tests after improvements**: Don't assume the fix worked; verify.

### Phase 7: Description Optimization

The description is the trigger mechanism. A great skill with a poor description never fires.

1. Generate 20 trigger-evaluation queries: 10 should-trigger (realistic scenarios where skill activates) + 10 should-NOT-trigger (adjacent but different tasks).

   Should trigger: "I keep writing the same error handling pattern. Can we encode that as a reusable skill?"
   Should NOT trigger: "I got an error in my code, can you fix it?"

2. Test each query against the description. Does the skill trigger correctly? Record accuracy.

3. Iterate on the description until trigger accuracy >= 90%.

4. Remember: slightly pushy > slightly conservative. False positive triggers (skill loads but isn't needed) cost less than false negatives (skill never fires).

## Quality Criteria

A skill is ready for activation when:

- Triggers reliably on intended prompts (>= 90% trigger accuracy)
- Does not trigger on unrelated prompts (<= 10% false positive rate)
- With-skill outputs measurably better than baseline
- SKILL.md under 500 lines
- Description captures trigger scenarios accurately
- At least one human has reviewed and approved
- Registered in SKILLS_REGISTRY.md

## When NOT to Use

**Do NOT use this skill if:**

- Pattern has occurred only once or twice. Retro skill guidance: wait for 3+ occurrences before promoting to skill.
- You cannot rerun test cases after improvements. Evaluation requires iteration; one-off evals provide no feedback loop.
- You are encoding a one-time fix or workaround. Skills encode generalizable patterns, not ad-hoc solutions.
- The task is already well-covered by an existing skill. Search SKILLS_REGISTRY.md and available skills list first.
- You need to quickly deploy something. Skill creation adds overhead; for urgent needs, use inline instructions or temporary scripts.

**Instead, use:**

- Retro skill: for recognizing patterns worth encoding (when to create a skill in the first place)
- Inline instructions/scripts: for one-off tasks or urgent hotfixes
- Code review skill: if evaluating whether existing code embodies a pattern
- Task loop: for running a single task repeatedly

## Portability

This skill is native to Claude Code and relies on `.claude/skills/` directory structure and local file creation. The core protocol (Intent -> Test -> Evaluate -> Improve) is portable to Cursor, Antigravity, and other Claude-based editors, but:

- Bundled resource files (`scripts/`, `references/`) are a Claude Code optimization; other environments can inline resources into SKILL.md body.
- The SKILLS_REGISTRY.md reference assumes a monorepo structure; adjust for your environment's skill management approach.
- Local test execution (Phase 4) may require adaptation depending on your IDE's testing harness.

## Skill Writing Guidelines

- Under 500 lines for SKILL.md body. Decompose large skills into focused, single-purpose skills.
- Progressive disclosure: metadata always in context (token cost every turn), body on trigger, resources on demand.
- Explain why, not just what. Reasoning > rules.
- Imperative form: "Run tests" not "Tests should be run".
- Pushy descriptions combat undertriggering. Slightly higher false-positive rate is acceptable.
- Concrete examples help clarify expected behavior.
- No malware, exploits, or misleading content.
- Domain-specific skills: separate related variants into different skills, not one giant skill with conditionals.

## Anti-Patterns

- **One-off encoding**: Skills encode repeatable patterns. Wait for 3+ occurrences.
- **Overfitting to test cases**: Generalize from feedback. Goal is robust behavior across real usage, not passing a specific eval set.
- **Rigid ALWAYS/NEVER rules**: Use reasoning. "MUST use semicolons" → "Use semicolons because the linter enforces them; CI will reject PRs without them."
- **Skipping baseline**: Cannot measure improvement without a control. Always run baseline + with-skill.
- **Undertriggering from timid descriptions**: Slightly pushy beats slightly conservative. Undertriggering is the #1 failure mode.
- **No human approval before activation**: Every skill passes through human review before reaching ACTIVE status.
- **Monolithic designs**: If a skill handles too many scenarios, decompose into focused, well-bounded skills.
- **Skipping the rerun**: After improving, always rerun test cases. Don't assume the fix worked.
