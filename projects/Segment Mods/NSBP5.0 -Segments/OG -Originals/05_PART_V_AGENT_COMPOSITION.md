# PART V: AGENT COMPOSITION & ORCHESTRATION

---

## 20. AGENT MEMORY ARCHITECTURE

> "Memory is what transforms an AI from a tool into a collaborator."

### 20.1 Memory Types

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       AGENT MEMORY ARCHITECTURE                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                    WORKING MEMORY                                    │    │
│  │                    (Context Window)                                  │    │
│  │                                                                      │    │
│  │  • Current conversation                                              │    │
│  │  • Active task context                                               │    │
│  │  • Recently loaded files                                             │    │
│  │  • Tool outputs from current session                                 │    │
│  │                                                                      │    │
│  │  CHARACTERISTICS:                                                    │    │
│  │  • Limited size (context window limit)                               │    │
│  │  • Volatile (lost between sessions)                                  │    │
│  │  • Fastest access                                                    │    │
│  │  • Highest priority                                                  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                    SESSION MEMORY                                    │    │
│  │                    (Persisted State)                                 │    │
│  │                                                                      │    │
│  │  • Conversation summaries                                            │    │
│  │  • Task progress checkpoints                                         │    │
│  │  • Decisions made this session                                       │    │
│  │  • Temporary files created                                           │    │
│  │                                                                      │    │
│  │  CHARACTERISTICS:                                                    │    │
│  │  • Survives context resets                                           │    │
│  │  • Lost when session ends                                            │    │
│  │  • Medium access speed                                               │    │
│  │  • Can be explicitly saved                                           │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                    PROJECT MEMORY                                    │    │
│  │                    (File-Based)                                      │    │
│  │                                                                      │    │
│  │  • claude.md / AI context file                                       │    │
│  │  • Fix Ledger                                                        │    │
│  │  • Architecture Decision Records                                     │    │
│  │  • Project documentation                                             │    │
│  │  • Code comments and annotations                                     │    │
│  │                                                                      │    │
│  │  CHARACTERISTICS:                                                    │    │
│  │  • Persists across sessions                                          │    │
│  │  • Shared with future agents                                         │    │
│  │  • Must be explicitly loaded                                         │    │
│  │  • Can grow unbounded                                                │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                    INSTITUTIONAL MEMORY                              │    │
│  │                    (Cross-Project)                                   │    │
│  │                                                                      │    │
│  │  • North Star Blueprint (this document)                              │    │
│  │  • Organizational patterns                                           │    │
│  │  • Reusable components/templates                                     │    │
│  │  • Cross-project learnings                                           │    │
│  │                                                                      │    │
│  │  CHARACTERISTICS:                                                    │    │
│  │  • Spans multiple projects                                           │    │
│  │  • Rarely changes                                                    │    │
│  │  • Foundational context                                              │    │
│  │  • Highest abstraction level                                         │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 20.2 Memory Management Protocol

```
MEMORY MANAGEMENT PROTOCOL
─────────────────────────────────────────────────────────────────────────────

LOADING MEMORY (Session Start)
─────────────────────────────────────────────────────────────────────────────
1. Load Institutional Memory
   □ Blueprint principles (always)
   □ Relevant organizational patterns

2. Load Project Memory
   □ claude.md / AI context file
   □ Superprompt
   □ Current phase documentation
   □ Recent Fix Ledger entries

3. Load Session Memory (if resuming)
   □ Previous conversation summary
   □ Task progress checkpoint
   □ Pending decisions

4. Initialize Working Memory
   □ Current task requirements
   □ Relevant files for task


SAVING MEMORY (During Session)
─────────────────────────────────────────────────────────────────────────────
□ Update Fix Ledger when bugs resolved
□ Create checkpoints for long tasks
□ Document decisions in ADRs
□ Update claude.md with new patterns
□ Summarize conversations periodically


CLEANING MEMORY (Session End)
─────────────────────────────────────────────────────────────────────────────
□ Summarize session accomplishments
□ Save any unsaved learnings
□ Update project status
□ Clear temporary files
□ Note any incomplete tasks
```

### 20.3 Memory File Structures

```
PROJECT MEMORY FILE: claude.md
─────────────────────────────────────────────────────────────────────────────

# [Project Name] Agent Context

## Quick Reference
- Project: [name]
- Phase: [current phase]
- Last Updated: [date]

## Critical Context
[Information agent MUST know]

## Current State
- Working on: [current task]
- Blockers: [any blockers]
- Recent changes: [summary]

## Conventions
[Project-specific patterns and rules]

## Known Issues
[Reference to Fix Ledger, current bugs]

## Commands
[How to run, test, deploy]


─────────────────────────────────────────────────────────────────────────────

SESSION CHECKPOINT FILE: .session-checkpoint.json
─────────────────────────────────────────────────────────────────────────────

{
  "session_id": "uuid",
  "started_at": "ISO timestamp",
  "last_checkpoint": "ISO timestamp",
  "task": {
    "description": "Current task",
    "status": "in_progress | blocked | completed",
    "progress": "Description of progress"
  },
  "decisions": [
    {
      "decision": "What was decided",
      "reasoning": "Why",
      "timestamp": "When"
    }
  ],
  "pending_questions": [
    "Question needing answer"
  ],
  "files_modified": [
    "path/to/file.ts"
  ],
  "next_steps": [
    "What to do next"
  ]
}
```

### 20.4 Memory Decay and Refresh

```
MEMORY DECAY PATTERNS
─────────────────────────────────────────────────────────────────────────────

WORKING MEMORY: Decays fastest
─────────────────────────────────────────────────────────────────────────────
• Pushed out by new context
• Oldest information dropped first
• Critical info should be saved before decay
• Refresh: Re-read files as needed

SESSION MEMORY: Decays on session end
─────────────────────────────────────────────────────────────────────────────
• Lost when conversation ends
• Save important items to Project Memory
• Summarize before ending long sessions
• Refresh: Load checkpoint file

PROJECT MEMORY: Slow decay (staleness)
─────────────────────────────────────────────────────────────────────────────
• Doesn't disappear but becomes outdated
• Code changes faster than documentation
• Regular maintenance required
• Refresh: Update documentation, prune stale info

INSTITUTIONAL MEMORY: Minimal decay
─────────────────────────────────────────────────────────────────────────────
• Version-controlled updates
• Principles remain stable
• Patterns evolve slowly
• Refresh: Version updates only
```

---

## 21. SKILLS, SUB-AGENTS & MCP INTEGRATION

### 21.1 Skills Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        SKILLS ARCHITECTURE                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  WHAT IS A SKILL?                                                            │
│  A packaged capability that can be loaded on-demand to extend              │
│  an agent's abilities for specific tasks.                                   │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  SKILL COMPONENTS:                                                           │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                                                                      │    │
│  │  SKILL.md                                                            │    │
│  │  ├── Name & Description                                              │    │
│  │  ├── When to Use                                                     │    │
│  │  ├── Input Requirements                                              │    │
│  │  ├── Output Format                                                   │    │
│  │  ├── Step-by-Step Instructions                                       │    │
│  │  ├── Examples                                                        │    │
│  │  ├── Common Pitfalls                                                 │    │
│  │  └── Related Skills                                                  │    │
│  │                                                                      │    │
│  │  Supporting Files                                                    │    │
│  │  ├── Templates                                                       │    │
│  │  ├── Reference Code                                                  │    │
│  │  └── Validation Scripts                                              │    │
│  │                                                                      │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  SKILL CATEGORIES:                                                           │
│                                                                              │
│  PUBLIC SKILLS (Shared)           USER SKILLS (Custom)                      │
│  ├── docx - Word documents        ├── project-specific                      │
│  ├── xlsx - Spreadsheets          ├── domain-specific                       │
│  ├── pptx - Presentations         ├── workflow-specific                     │
│  ├── pdf - PDF manipulation       └── integration-specific                  │
│  └── common patterns                                                         │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 21.2 Skill Loading Protocol

```
SKILL LOADING PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: IDENTIFY SKILL NEED
─────────────────────────────────────────────────────────────────────────────
Triggers:
□ Task requires specific file format (docx, xlsx, pptx, pdf)
□ Task requires specialized knowledge
□ Task matches skill description
□ User explicitly requests skill use

STEP 2: LOAD SKILL DEFINITION
─────────────────────────────────────────────────────────────────────────────
Action: Read SKILL.md file
Location: /mnt/skills/public/[skill]/ or /mnt/skills/user/[skill]/

□ Read entire SKILL.md before starting work
□ Note any prerequisites
□ Understand input/output requirements
□ Review examples

STEP 3: PREPARE ENVIRONMENT
─────────────────────────────────────────────────────────────────────────────
□ Load any required templates
□ Install any required dependencies
□ Verify tool availability
□ Set up working directory

STEP 4: EXECUTE SKILL
─────────────────────────────────────────────────────────────────────────────
□ Follow skill instructions step-by-step
□ Use specified patterns and templates
□ Validate output against skill criteria
□ Handle errors as skill specifies

STEP 5: DELIVER OUTPUT
─────────────────────────────────────────────────────────────────────────────
□ Place output in /mnt/user-data/outputs/
□ Use present_files to share with user
□ Provide brief summary (not verbose explanation)
```

### 21.3 Sub-Agent Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       SUB-AGENT ARCHITECTURE                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                         ┌─────────────────┐                                  │
│                         │   ORCHESTRATOR  │                                  │
│                         │   (Main Agent)  │                                  │
│                         └────────┬────────┘                                  │
│                                  │                                           │
│              ┌───────────────────┼───────────────────┐                      │
│              │                   │                   │                      │
│              ▼                   ▼                   ▼                      │
│       ┌─────────────┐     ┌─────────────┐     ┌─────────────┐              │
│       │  Sub-Agent  │     │  Sub-Agent  │     │  Sub-Agent  │              │
│       │  Research   │     │  Analysis   │     │  Execution  │              │
│       │             │     │             │     │             │              │
│       │ • Web search│     │ • Code review│    │ • File ops  │              │
│       │ • Doc fetch │     │ • Planning  │     │ • Testing   │              │
│       │ • Reference │     │ • Decisions │     │ • Building  │              │
│       └─────────────┘     └─────────────┘     └─────────────┘              │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  WHEN TO USE SUB-AGENTS:                                                     │
│  ───────────────────────────────────────────────────────────────────────    │
│  ✅ Task requires parallel processing                                       │
│  ✅ Task has clearly separable components                                   │
│  ✅ Different sub-tasks need different contexts                             │
│  ✅ Extended research while maintaining context                             │
│                                                                              │
│  WHEN NOT TO USE SUB-AGENTS:                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│  ❌ Task is simple enough for single agent                                  │
│  ❌ Sub-tasks are tightly coupled                                           │
│  ❌ Coordination overhead exceeds benefit                                   │
│  ❌ Full context needed for all sub-tasks                                   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 21.4 MCP Integration Patterns

```
MCP INTEGRATION PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN 1: FILE SYSTEM MCP
─────────────────────────────────────────────────────────────────────────────
Purpose: Extended file operations beyond basic read/write

Capabilities:
• Recursive directory operations
• File watching
• Advanced search
• Symbolic link management

When to use:
• Complex file reorganization
• Monitoring for changes
• Cross-project file operations


PATTERN 2: DATABASE MCP
─────────────────────────────────────────────────────────────────────────────
Purpose: Direct database interaction

Capabilities:
• Query execution
• Schema inspection
• Data migration
• Backup operations

When to use:
• Database-heavy development
• Data analysis tasks
• Schema modifications


PATTERN 3: BROWSER MCP
─────────────────────────────────────────────────────────────────────────────
Purpose: Web automation and testing

Capabilities:
• Page navigation
• Element interaction
• Screenshot capture
• Network monitoring

When to use:
• E2E testing
• Web scraping
• Visual verification
• Form automation


PATTERN 4: API MCP
─────────────────────────────────────────────────────────────────────────────
Purpose: External API integration

Capabilities:
• REST/GraphQL calls
• Authentication handling
• Response parsing
• Error handling

When to use:
• Third-party integrations
• API development
• Data fetching
• Webhook testing


MCP SELECTION MATRIX
─────────────────────────────────────────────────────────────────────────────

TASK                          │ RECOMMENDED MCP
──────────────────────────────┼─────────────────────────────────────────────
Read/write local files        │ Built-in (no MCP needed)
Complex file operations       │ File System MCP
Database queries              │ Database MCP
Web automation                │ Browser MCP
External API calls            │ API MCP / Built-in fetch
Cloud operations              │ Cloud-specific MCP (AWS, GCP, etc.)
Version control               │ Git MCP or built-in
```

---

## 22. RECURSIVE VERIFICATION PROTOCOL

### 22.1 Verification Layers

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    RECURSIVE VERIFICATION PROTOCOL                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Every output goes through multiple verification layers.                    │
│  Each layer catches different types of errors.                              │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LAYER 1: SYNTAX VERIFICATION                                         │    │
│  │                                                                      │    │
│  │ □ Code parses without errors                                         │    │
│  │ □ All brackets/braces matched                                        │    │
│  │ □ Import statements valid                                            │    │
│  │ □ No obvious typos                                                   │    │
│  │                                                                      │    │
│  │ TOOLS: Parser, Linter                                                │    │
│  │ CATCHES: Typos, missing characters, basic structure errors          │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LAYER 2: TYPE VERIFICATION                                           │    │
│  │                                                                      │    │
│  │ □ Type annotations correct                                           │    │
│  │ □ Function signatures match usage                                    │    │
│  │ □ No implicit any (if strict mode)                                   │    │
│  │ □ Generic types properly applied                                     │    │
│  │                                                                      │    │
│  │ TOOLS: TypeScript compiler, type checker                             │    │
│  │ CATCHES: Type mismatches, interface violations                       │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LAYER 3: LOGIC VERIFICATION                                          │    │
│  │                                                                      │    │
│  │ □ Unit tests pass                                                    │    │
│  │ □ Edge cases handled                                                 │    │
│  │ □ Error paths covered                                                │    │
│  │ □ Business logic correct                                             │    │
│  │                                                                      │    │
│  │ TOOLS: Unit test runner                                              │    │
│  │ CATCHES: Logic errors, missing cases, wrong calculations            │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LAYER 4: INTEGRATION VERIFICATION                                    │    │
│  │                                                                      │    │
│  │ □ Components work together                                           │    │
│  │ □ API contracts respected                                            │    │
│  │ □ Database operations correct                                        │    │
│  │ □ External services integrated properly                              │    │
│  │                                                                      │    │
│  │ TOOLS: Integration tests                                             │    │
│  │ CATCHES: Interface mismatches, integration failures                 │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LAYER 5: HUMAN VERIFICATION                                          │    │
│  │                                                                      │    │
│  │ □ Output makes sense                                                 │    │
│  │ □ Requirements actually met                                          │    │
│  │ □ No hallucinated content                                            │    │
│  │ □ Appropriate for context                                            │    │
│  │                                                                      │    │
│  │ TOOLS: Human review                                                  │    │
│  │ CATCHES: Semantic errors, hallucinations, context mismatches        │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 22.2 Verification by Output Type

```
VERIFICATION BY OUTPUT TYPE
─────────────────────────────────────────────────────────────────────────────

CODE OUTPUT:
─────────────────────────────────────────────────────────────────────────────
□ Syntax: Parses without error
□ Types: Type check passes
□ Lint: Linting passes
□ Tests: Related tests pass
□ Build: Build succeeds
□ Run: Application starts
□ Manual: Feature works as expected

DOCUMENTATION OUTPUT:
─────────────────────────────────────────────────────────────────────────────
□ Format: Markdown renders correctly
□ Links: All links valid
□ Code blocks: Code examples run
□ Accuracy: Information is correct
□ Completeness: All sections present
□ Clarity: Human can understand

API DESIGN OUTPUT:
─────────────────────────────────────────────────────────────────────────────
□ Schema: Valid OpenAPI/JSON Schema
□ Consistency: Naming conventions followed
□ Completeness: All endpoints documented
□ Examples: Request/response examples work
□ Security: Auth requirements specified
□ Errors: Error responses documented

CONFIGURATION OUTPUT:
─────────────────────────────────────────────────────────────────────────────
□ Syntax: Valid JSON/YAML/etc.
□ Schema: Matches expected schema
□ Values: Values are appropriate
□ Secrets: No secrets exposed
□ Environments: Works in target environment
□ Load: Configuration loads successfully

DATA OUTPUT:
─────────────────────────────────────────────────────────────────────────────
□ Format: Valid data format
□ Schema: Matches expected schema
□ Integrity: No data corruption
□ Completeness: No missing fields
□ Accuracy: Values are correct
□ Privacy: No PII exposure
```

### 22.3 Self-Verification Checklist

```
SELF-VERIFICATION CHECKLIST (Before Presenting Output)
─────────────────────────────────────────────────────────────────────────────

□ DID I READ THE FILES I'M MODIFYING?
  Not assumed, actually read them in this session

□ DOES MY OUTPUT MATCH THE REQUEST?
  Re-read the original request and verify

□ IS MY OUTPUT COMPLETE?
  No missing sections, no TODO placeholders

□ ARE THERE ANY HALLUCINATIONS?
  API names, file paths, URLs all verified to exist

□ DOES IT FIT THE EXISTING PATTERNS?
  Consistent with codebase style and conventions

□ HAVE I TESTED IT?
  Actually ran the code/command, not just believed it works

□ WHAT COULD GO WRONG?
  Considered edge cases and error conditions

□ IS IT READY FOR USE?
  No additional steps needed before it works
```

---

## 23. AGENT HANDOFF PROTOCOLS

### 23.1 Handoff Types

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        AGENT HANDOFF PROTOCOLS                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  HANDOFF TYPE 1: SESSION CONTINUATION                                        │
│  ───────────────────────────────────────────────────────────────────────    │
│  Same project, different session (next day, after break)                    │
│                                                                              │
│  REQUIREMENTS:                                                               │
│  □ Session checkpoint saved                                                  │
│  □ Current state documented                                                  │
│  □ Next steps clearly listed                                                 │
│  □ Any blockers noted                                                        │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  HANDOFF TYPE 2: AGENT-TO-AGENT                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  Different agent/model continuing work                                      │
│                                                                              │
│  REQUIREMENTS:                                                               │
│  □ Full context document prepared                                            │
│  □ All decisions documented with reasoning                                   │
│  □ File state described (what exists, what's in progress)                   │
│  □ Verification status noted                                                 │
│  □ No implicit knowledge required                                            │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  HANDOFF TYPE 3: TASK COMPLETION                                             │
│  ───────────────────────────────────────────────────────────────────────    │
│  Work complete, handing to human for review/use                             │
│                                                                              │
│  REQUIREMENTS:                                                               │
│  □ All deliverables complete                                                 │
│  □ Verification checklist passed                                            │
│  □ Documentation updated                                                     │
│  □ Summary of what was done                                                  │
│  □ Any follow-up actions noted                                               │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  HANDOFF TYPE 4: ESCALATION                                                  │
│  ───────────────────────────────────────────────────────────────────────    │
│  Problem beyond current capability, needs human/expert                      │
│                                                                              │
│  REQUIREMENTS:                                                               │
│  □ Clear description of the problem                                          │
│  □ What has been tried                                                       │
│  □ Why it's being escalated                                                  │
│  □ What help is needed                                                       │
│  □ Current state preserved                                                   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 23.2 Handoff Document Template

```markdown
## AGENT HANDOFF DOCUMENT

**Handoff Type:** [Session Continuation / Agent-to-Agent / Task Completion / Escalation]
**Date:** [YYYY-MM-DD HH:MM]
**From:** [Agent/Session identifier]
**To:** [Next agent/Human]

---

### PROJECT CONTEXT
- **Project:** [Name]
- **Phase:** [Current phase]
- **Primary Goal:** [What we're trying to achieve]

### CURRENT STATE

**Completed:**
- [x] [Completed item 1]
- [x] [Completed item 2]

**In Progress:**
- [ ] [In progress item] - [Status details]

**Not Started:**
- [ ] [Pending item]

### FILES AFFECTED

| File | Status | Notes |
|------|--------|-------|
| `path/to/file.ts` | Modified | [What was changed] |
| `path/to/new.ts` | Created | [What it does] |

### KEY DECISIONS MADE

1. **[Decision]:** [What was decided]
   - Reasoning: [Why]
   - Alternatives considered: [What else]

### BLOCKERS / ISSUES

- **[Issue]:** [Description]
  - Attempted: [What was tried]
  - Status: [Blocked / Needs input / Resolved]

### NEXT STEPS

1. [First thing to do next]
2. [Second thing to do]
3. [Third thing to do]

### CONTEXT TO LOAD

The following files should be read to continue:
- `[path/to/important/file.ts]` - [Why]
- `[path/to/another/file.ts]` - [Why]

### WARNINGS / GOTCHAS

- [Something to watch out for]
- [Known issue to be aware of]

### VERIFICATION STATUS

- [ ] Syntax checks passing
- [ ] Type checks passing
- [ ] Tests passing
- [ ] Manual verification done
- [ ] Documentation updated
```

### 23.3 Resume Protocol

```
RESUME PROTOCOL (For Incoming Agent)
─────────────────────────────────────────────────────────────────────────────

STEP 1: LOAD CONTEXT (5 minutes)
─────────────────────────────────────────────────────────────────────────────
□ Read handoff document
□ Read project claude.md
□ Read current phase documentation
□ Load listed context files

STEP 2: VERIFY STATE (5 minutes)
─────────────────────────────────────────────────────────────────────────────
□ Run current tests to verify state
□ Check file states match description
□ Verify no unexpected changes
□ Confirm you can build/run the project

STEP 3: UNDERSTAND POSITION (5 minutes)
─────────────────────────────────────────────────────────────────────────────
□ Understand what was done
□ Understand what needs to be done
□ Identify any gaps in understanding
□ Ask clarifying questions if needed

STEP 4: CONTINUE WORK
─────────────────────────────────────────────────────────────────────────────
□ Start from documented next steps
□ Follow established patterns
□ Document new decisions
□ Update handoff document as you progress
```

---

## PART V SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 PART V: AGENT COMPOSITION & ORCHESTRATION                    │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  AGENT MEMORY ARCHITECTURE:                                                  │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Working Memory: Context window (fast, volatile)                          │
│  • Session Memory: Persisted state (survives resets)                        │
│  • Project Memory: Files (claude.md, Fix Ledger, ADRs)                      │
│  • Institutional Memory: Blueprint (cross-project)                          │
│  • Load in priority order, save important learnings                         │
│                                                                              │
│  SKILLS & SUB-AGENTS:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Skills = packaged capabilities (SKILL.md files)                          │
│  • Load skill definition BEFORE starting task                               │
│  • Sub-agents for parallel/separable tasks                                  │
│  • Don't over-engineer—simple is better                                     │
│                                                                              │
│  MCP INTEGRATION:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • File System: Complex file operations                                      │
│  • Database: Direct DB interaction                                           │
│  • Browser: Web automation/testing                                           │
│  • API: External integrations                                                │
│  • Use built-in tools when sufficient                                        │
│                                                                              │
│  RECURSIVE VERIFICATION:                                                     │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Layer 1: Syntax (parser, linter)                                            │
│  Layer 2: Types (compiler)                                                   │
│  Layer 3: Logic (unit tests)                                                 │
│  Layer 4: Integration (integration tests)                                    │
│  Layer 5: Human (review)                                                     │
│  Each layer catches different error types                                    │
│                                                                              │
│  HANDOFF PROTOCOLS:                                                          │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Session Continuation: Checkpoint, state, next steps                       │
│  • Agent-to-Agent: Full context, no implicit knowledge                       │
│  • Task Completion: Deliverables, verification, summary                      │
│  • Escalation: Problem, attempts, what help needed                           │
│  • Always document decisions and reasoning                                   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
