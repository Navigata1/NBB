# North Star Anti-Patterns

## The 13 Mistakes That Kill AI-Assisted Development

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│  "The fastest way to learn a framework is to learn what NOT to do.          │
│   Every anti-pattern here was discovered the hard way."                     │
│                                                                              │
│                                        — North Star Framework Philosophy     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

These are the patterns that waste tokens, break builds, and turn AI-assisted development from a superpower into a liability. Each one includes what it looks like, why developers fall into it, what goes wrong, and the correct North Star pattern.

---

## Anti-Pattern 1: Token Burning

**What it looks like:** Loading the entire North Star Blueprint + Master Build Framework + BRIDGE into a single session upfront. "Just give the AI everything and let it figure it out."

**Why developers do it:** It feels thorough. More context should mean better results, right? Loading everything seems like the safe choice.

**What goes wrong:** You burn 60-80% of your context window before the first task begins. The AI has no room for actual code, conversation history, or iterative refinement. Output quality degrades as the session progresses because every response competes for shrinking context space. You end up with worse results than if you'd loaded nothing.

**The correct pattern:** Use BRIDGE routing. Tell the agent what you need — it loads only the relevant sections on demand. A typical implementation session needs 2-3 Blueprint sections and 1-2 MBF categories, not the entire corpus. System context should consume 15-25% of the window, leaving 75-85% for task work.

---

## Anti-Pattern 2: Skipping Plan Mode

**What it looks like:** Jumping straight to code. "It's just a small change." "I already know what I want." The developer describes the feature and immediately tells the agent to implement it.

**Why developers do it:** Planning feels slow. For small changes, it feels like overhead. Developers who are confident in the solution skip the step that feels redundant.

**What goes wrong:** The agent makes assumptions you didn't intend. It picks an approach that conflicts with existing architecture. You discover midway through implementation that the "small change" touches five files and requires a migration. Now you're debugging a half-implemented feature instead of reviewing a plan.

**The correct pattern:** The RPIT Loop — Research, Plan, Implement, Test. Even for small changes, the Plan step takes 30 seconds and saves 30 minutes. Have the agent draft a plan.md with scope, files affected, and approach. Review it. Approve it. Then implement. For genuinely trivial changes (renaming a variable, fixing a typo), you can skip — but if you're thinking "it's just a small change," that's usually the signal that it isn't.

---

## Anti-Pattern 3: Context Blindness

**What it looks like:** Running a session past 85% context utilization. Ignoring compaction warnings. Pushing through "one more task" when the window is nearly full.

**Why developers do it:** Stopping mid-flow is painful. Context switching to a new session feels like lost momentum. The developer doesn't realize context is filling up because there's no visible meter.

**What goes wrong:** The AI starts losing track of earlier decisions. It contradicts itself. It forgets constraints established at the beginning of the session. Compaction events silently drop critical context, and the AI doesn't know what it lost. You get plausible-sounding output that silently violates decisions made 20 messages ago.

**Solution:** Treat context like fuel gauge; begin winding down at 50%, hard stop at 85%. Use sub-agents for intensive work. Start fresh sessions with handoff docs rather than compacting.

---

## Anti-Pattern 4: The Nuclear Permission Flag

**What it looks like:** Running Claude Code with `--dangerously-skip-permissions` because the permission prompts are annoying. Setting every permission to allow-all in `settings.json`.

**Why developers do it:** Permission prompts interrupt flow. When you're iterating quickly, confirming every file write feels like friction. The flag makes the friction disappear.

**What goes wrong:** The agent writes to files you didn't intend. It modifies configuration files, overwrites test fixtures, or alters production configs. Without permission gates, there's no checkpoint between "the AI decided to do something" and "the AI did it." One bad decision cascades unchecked.

**The correct pattern:** Pre-configure permissions in `.claude/settings.json` during project setup. Explicitly allow the directories and file patterns the agent should touch. Deny everything else by default. This gives you flow-state speed on expected operations and hard stops on unexpected ones. The Bootstrap's Permission Pre-Configuration Protocol (v1.4) handles this during scaffolding.

---

## Anti-Pattern 5: Silent Plan Deviation

**What it looks like:** You approved a plan. The agent implements something different. Not wrong exactly — but different from what was agreed. It added an extra abstraction layer. It used a different library. It restructured the file organization.

**Why developers do it:** They don't — the *agent* does. But developers enable it by not using plan annotations to track implementation state, or by approving plans they haven't read carefully (see Anti-Pattern 12).

**What goes wrong:** The implemented solution diverges from the plan silently. You don't notice until testing or code review. The deviation may be fine — or it may introduce architectural debt, break conventions, or conflict with other planned features. The real cost is trust erosion: you stop trusting plans because implementation doesn't match.

**The correct pattern:** Use Plan.md Annotations. Mark each item `[APPROVED]`, `[MODIFIED]`, or `[BLOCKED]`. When implementation deviates, the agent must flag it with a `[MODIFIED: reason]` annotation before proceeding. If the agent proposes a change mid-implementation, it pauses, updates the plan, and waits for re-approval. No silent pivots.

---

## Anti-Pattern 6: Single-Session Everything

**What it looks like:** One massive session for an entire feature, spanning hours or even days. The developer treats the chat as a persistent workspace rather than a focused execution environment.

**Why developers do it:** Context buildup feels valuable. "The AI already knows everything about my project from this session." Starting fresh means re-establishing context, which feels wasteful.

**What goes wrong:** Context degrades (see Anti-Pattern 3). The session accumulates dead code, abandoned approaches, and stale references. The AI's "memory" of early decisions becomes unreliable. Error correction becomes harder because the agent can't distinguish current intent from abandoned approaches mentioned 40 messages ago.

**The correct pattern:** One RPIT loop per session. Research → Plan → Implement → Test → Done. If a feature requires multiple RPIT cycles, use multiple sessions with handoff documents. Each session starts clean, loads only what it needs, and ends with a clear summary. Think of sessions as Git commits, not as a running process.

---

## Anti-Pattern 7: Verify by Reading Code

**What it looks like:** The developer reviews every line of AI-generated code by reading it. Scrolling through hundreds of lines, trying to mentally execute the logic, checking for correctness by inspection.

**Why developers do it:** It feels responsible. Code review is a best practice, so reviewing AI output line-by-line seems like the right thing to do. Developers trained on human code review apply the same process to AI output.

**What goes wrong:** Humans are terrible at finding bugs by reading code. Studies consistently show that code review catches superficial issues but misses logic errors and edge cases. When reviewing AI output specifically, the volume is higher and the patterns are less familiar, making inspection even less reliable. You spend 30 minutes reading and still miss the bug that a 5-second test run would have caught.

**The correct pattern:** Verify by running, not reading. Write a test first (or have the agent write one), then implement, then run the test. If the test passes, skim the implementation for style and architecture concerns — but don't try to mentally execute it. If you can't test it (infrastructure code, configuration), use hooks to enforce invariants automatically. Reserve deep code reading for architectural decisions, not correctness checking.

---

## Anti-Pattern 8: One-Time claude.md

**What it looks like:** Creating the project context file (`claude.md`, `.cursorrules`, etc.) once during project setup and never touching it again. It describes the project as it was on day one.

**Why developers do it:** It feels like a setup task. You configure it at the start, like `.gitignore`, and move on. The initial context file works well enough that there's no obvious trigger to update it.

**What goes wrong:** Your project evolves but the context file doesn't. New conventions aren't captured. Abandoned patterns are still listed. The AI keeps following stale guidance because that's what the context file says. Worse, new session context actively contradicts the project's current state, and the agent has to guess which is correct.

**The correct pattern:** Treat `claude.md` as a living document. After every retro (see Anti-Pattern 10), update the context file with new learnings. Add new conventions as they emerge. Remove patterns that are no longer used. The Retro Skill's output includes a "context file updates" section specifically for this. Your context file should reflect the project as it is today, not as it was when you started.

---

## Anti-Pattern 9: Parallel Agents Without Worktrees

**What it looks like:** Running multiple Claude Code sessions on the same branch simultaneously. Two agents working on "different files" but sharing the same working directory.

**Why developers do it:** Parallelism seems like free speed. If one agent is working on the frontend and another on the backend, they shouldn't conflict, right?

**What goes wrong:** They conflict. Agent A modifies a shared type definition. Agent B reads the old version. Agent A runs tests that fail because Agent B's half-written code is in the working directory. Git status becomes a mess of interleaved changes. Merge conflicts arise within a single branch. The worst case: both agents modify the same file, and one silently overwrites the other's work.

**The correct pattern:** One agent per Git worktree. Use `git worktree add` to create isolated working directories for each parallel agent. Each agent operates on its own branch with its own file system. Merge via pull request when work is complete. The Multi-Agent Orchestration pattern (NSB Part IV) provides the full setup sequence, including shared-nothing architecture and coordination protocols.

---

## Anti-Pattern 10: Skipping the Retro

**What it looks like:** Finishing a feature and immediately moving to the next one. No retrospective. No encoding of learnings. The session ends, and whatever the agent learned dies with it.

**Why developers do it:** Retros feel like paperwork. The feature is done, the PR is up, momentum says "keep going." Writing down what went wrong feels like dwelling on the past instead of building the future.

**What goes wrong:** The same mistakes repeat. Every new session starts from zero, making the same wrong assumptions, hitting the same edge cases, trying the same failed approaches. Your project context never improves. The AI never gets better at working on *your* codebase specifically, because nothing from previous sessions feeds forward.

**The correct pattern:** Run the Retro Skill at the end of every RPIT cycle. It takes 2 minutes. The skill captures: what worked, what didn't, what the agent struggled with, and what should be added to `claude.md`. Those learnings feed directly into the project context file, making every future session more effective. This is the compounding mechanism — skipping it means you're leaving compounding returns on the table.

---

## Anti-Pattern 11: Research-Less Implementation

**What it looks like:** Building on an unfamiliar API, library, or framework without a Research phase. The developer describes the feature and tells the agent to implement it, assuming the agent's training data is current.

**Why developers do it:** The AI "knows" the library. It can generate code that looks correct. Research feels like a delay when you just want to build. For well-known libraries, it seems unnecessary.

**What goes wrong:** APIs change. Libraries release breaking versions. The agent generates code using deprecated methods, old API signatures, or patterns that were valid in the training data but aren't valid now. You don't discover this until runtime — and the error messages don't say "you used the v2 API but v3 is current." You waste hours debugging what looks like correct code.

**The correct pattern:** Always run the Research phase of RPIT for unfamiliar territory. Have the agent read the current documentation (using web search or `fetch` commands), check for recent breaking changes, and verify API signatures against the live source. This takes 5 minutes and prevents the 2-hour debugging session. The Research Report Skill provides a structured output format that captures findings and flags version discrepancies.

---

## Anti-Pattern 12: Approving Plans You Haven't Read

**What it looks like:** The agent presents a plan. The developer glances at the section headers, sees nothing obviously wrong, and says "looks good, proceed." The plan contained 15 items across 8 files.

**Why developers do it:** Plan review feels like a bottleneck. The developer trusts the agent's planning ability. Skimming the plan and seeing reasonable structure feels sufficient. Reading every line item feels like micromanagement.

**What goes wrong:** The plan contains an assumption you'd disagree with — but you didn't read it. The agent implements the wrong thing perfectly. It builds exactly what the plan said, which isn't what you wanted. Now you have a well-executed solution to the wrong problem. Rolling it back means discarding a full implementation cycle and starting over.

**The correct pattern:** Read every plan item. It takes 2 minutes for a typical plan. Check specifically for: scope (is it doing more or less than you expected?), file list (is it touching files you didn't anticipate?), approach (does the technical strategy match your intent?), and assumptions (what did the agent fill in that you didn't specify?). If the plan is too long to read quickly, it's too big for a single RPIT cycle — break it up.

---

## Anti-Pattern 13: Context Compaction as Crutch

**The "Friends Don't Let Friends Compact" Rule**

**Problem:** Using `/compact` mid-session to "free up" context window. Compaction creates the worst of both worlds — you lose the detailed working context you need while retaining stale context poisoning from earlier in the session. The result is a Claude that remembers just enough to be confidently wrong.

**Why It Happens:** Context fills up fast (50%+ in minutes of intensive work). Compaction seems logical — keep working, just compress. But LLMs don't compress like ZIP files. They lose nuance, forget specifics, and retain ghosts of earlier decisions that no longer apply.

**Solution:** Treat sessions as finite resources. At 50% context, begin wrapping up the current task. Use sub-agents for intensive work — each gets a fresh context window and reports results back to the orchestrator. When you must continue, start a fresh session with handoff notes rather than compacting.

**The Right Pattern:**
```
Instead of: [work] → [50% context] → /compact → [keep working] → [hallucinations]
Do this:    [work] → [50% context] → [wrap up] → /clear or new session → [handoff notes]
Better:     [orchestrate] → [dispatch to sub-agents] → [receive results] → [stay lean]
```

**Connection:** This is why the status line showing context % is critical infrastructure, not a nice-to-have. Install `npx cc-status-line@latest` and watch it like a fuel gauge.

---

## Quick Reference

| # | Anti-Pattern | One-Line Fix |
|---|-------------|-------------|
| 1 | Token Burning | Use BRIDGE routing, not full-corpus loading |
| 2 | Skipping Plan Mode | Always run RPIT — even for "small" changes |
| 3 | Context Blindness | Stop at 85% context, start fresh sessions |
| 4 | Nuclear Permission Flag | Pre-configure `.claude/settings.json` |
| 5 | Silent Plan Deviation | Use Plan.md annotations, require `[MODIFIED]` flags |
| 6 | Single-Session Everything | One RPIT loop per session with handoff docs |
| 7 | Verify by Reading Code | Verify by running tests, not reading lines |
| 8 | One-Time claude.md | Update context file after every retro |
| 9 | Parallel Without Worktrees | One agent per `git worktree` |
| 10 | Skipping the Retro | Run Retro Skill at end of every RPIT cycle |
| 11 | Research-Less Implementation | Always Research before unfamiliar territory |
| 12 | Approving Unread Plans | Read every plan item — 2 minutes saves 2 hours |
| 13 | Context Compaction as Crutch | Sub-agents + fresh sessions, never `/compact` |

---

> **North Star Framework v6.1** — Build with intention. Ship with confidence.
> Created by [@NavigatingTruth](https://twitter.com/NavigatingTruth)
> Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
