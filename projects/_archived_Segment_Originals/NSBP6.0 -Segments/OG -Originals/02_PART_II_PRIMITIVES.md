# PART II: PRIMITIVE EXECUTION FRAMEWORK

---

## 5. THE SIX CORE PRIMITIVES

> "The difference between amateur and professional AI development is not the tools—it's the orchestration of primitives."

Every operation in software development—whether performed by human or AI—can be decomposed into six fundamental primitives. Mastering these primitives is the foundation of reliable AI-assisted development.

### 5.1 Primitive Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         THE SIX CORE PRIMITIVES                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│     ┌─────────────────────────────────────────────────────────────────┐     │
│     │                         1. STATE                                 │     │
│     │              "What is the current reality?"                      │     │
│     │                                                                  │     │
│     │  The complete, verifiable snapshot of system condition          │     │
│     │  at any point in time. Truth, not assumption.                   │     │
│     └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                         │
│                    ┌───────────────┴───────────────┐                        │
│                    ▼                               ▼                        │
│     ┌──────────────────────────┐   ┌──────────────────────────┐            │
│     │      2. ARTIFACT         │   │       3. CHANGE          │            │
│     │  "What will be created?" │   │   "What will differ?"    │            │
│     │                          │   │                          │            │
│     │  Any output: code, doc,  │   │  The delta between       │            │
│     │  config, data. Named,    │   │  current state and       │            │
│     │  versioned, traceable.   │   │  desired state.          │            │
│     └──────────────────────────┘   └──────────────────────────┘            │
│                    │                               │                        │
│                    └───────────────┬───────────────┘                        │
│                                    ▼                                         │
│     ┌─────────────────────────────────────────────────────────────────┐     │
│     │                         4. CHECK                                 │     │
│     │                  "Did it work correctly?"                        │     │
│     │                                                                  │     │
│     │  Verification that change achieved desired outcome              │     │
│     │  without unintended consequences. Tests, not hopes.             │     │
│     └─────────────────────────────────────────────────────────────────┘     │
│                                    │                                         │
│                    ┌───────────────┴───────────────┐                        │
│                    ▼                               ▼                        │
│     ┌──────────────────────────┐   ┌──────────────────────────┐            │
│     │      5. ROLLBACK         │   │    6. TRACEABILITY       │            │
│     │  "How do we undo this?"  │   │   "What's the history?"  │            │
│     │                          │   │                          │            │
│     │  Safe return to known    │   │  Complete audit trail    │            │
│     │  good state. Always      │   │  of who, what, when,     │            │
│     │  available, tested.      │   │  why. Accountability.    │            │
│     └──────────────────────────┘   └──────────────────────────┘            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 5.2 Primitive Definitions

#### PRIMITIVE 1: STATE

**Definition:** The complete, verifiable snapshot of system condition at any point in time.

```
STATE COMPONENTS
─────────────────────────────────────────────────────────────────────────────

CODE STATE:
  • Git commit hash (exact version)
  • Branch name
  • Uncommitted changes (if any)
  • Stash contents

DATA STATE:
  • Database schema version
  • Migration status
  • Seed data present/absent
  • Environment (dev/staging/prod)

ENVIRONMENT STATE:
  • Node/Python/runtime versions
  • Dependency versions (lock file)
  • Environment variables set
  • External service availability

APPLICATION STATE:
  • Server running/stopped
  • Current configuration
  • Feature flags active
  • Cache status

USER-VISIBLE STATE:
  • What the user sees in browser/app
  • Console errors present
  • Network requests status
  • Local storage contents
```

**State Verification Commands:**
```bash
# Code state
git status && git log -1 --oneline && git diff --stat

# Dependency state
cat package-lock.json | head -20  # or equivalent

# Environment state
node -v && npm -v && echo $NODE_ENV

# Application state
curl -s localhost:3000/health | jq .
```

**State Anti-Patterns:**
| Anti-Pattern | Problem | Solution |
|--------------|---------|----------|
| "It works on my machine" | Environment mismatch | Docker, lock files |
| "Just pull latest" | Unknown actual state | Specific commit reference |
| "The database has the data" | Unverified assumption | Migration + seed verification |
| "Everything is fine" | No verification | Health check endpoints |

#### PRIMITIVE 2: ARTIFACT

**Definition:** Any output produced by development work—named, versioned, and traceable.

```
ARTIFACT TYPES
─────────────────────────────────────────────────────────────────────────────

CODE ARTIFACTS:
  • Source files (.ts, .tsx, .py, etc.)
  • Configuration files
  • Scripts
  • Database migrations

DOCUMENTATION ARTIFACTS:
  • README files
  • API documentation
  • Architecture Decision Records (ADRs)
  • User guides

DATA ARTIFACTS:
  • Seed data files
  • Test fixtures
  • Export files
  • Backup files

BUILD ARTIFACTS:
  • Compiled bundles
  • Docker images
  • Deployment packages
  • Static assets

VERIFICATION ARTIFACTS:
  • Test results
  • Coverage reports
  • Lighthouse scores
  • Security scan results
```

**Artifact Naming Convention:**
```
[type]-[name]-[version].[extension]

Examples:
  component-user-profile-v2.tsx
  migration-add-user-roles-001.sql
  fixture-test-users-v1.json
  report-lighthouse-20240115.html
```

**Artifact Requirements:**
```
EVERY ARTIFACT MUST HAVE:
─────────────────────────────────────────────────────────────────────────────

□ NAME
  Clear, descriptive identifier
  Following project naming conventions

□ VERSION
  Explicit version or commit reference
  Enables rollback identification

□ LOCATION
  Known path in repository
  Predictable structure

□ PURPOSE
  Why does this artifact exist?
  What problem does it solve?

□ OWNER
  Who created it?
  Who maintains it?

□ DEPENDENCIES
  What does it depend on?
  What depends on it?
```

#### PRIMITIVE 3: CHANGE

**Definition:** The delta between current state and desired state.

```
CHANGE ANATOMY
─────────────────────────────────────────────────────────────────────────────

EVERY CHANGE HAS:

┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│  BEFORE STATE ─────────────────────────────────────► AFTER STATE       │
│       │                                                    │            │
│       │                    CHANGE                          │            │
│       │              ┌─────────────────┐                   │            │
│       └──────────────│                 │───────────────────┘            │
│                      │  • Intent       │                                │
│                      │  • Actions      │                                │
│                      │  • Scope        │                                │
│                      │  • Risk         │                                │
│                      │  • Reversibility│                                │
│                      └─────────────────┘                                │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘

INTENT:        Why is this change being made?
ACTIONS:       What specific operations will occur?
SCOPE:         What files/systems are affected?
RISK:          What could go wrong?
REVERSIBILITY: How easy is it to undo?
```

**Change Classification:**

| Change Type | Scope | Risk | Reversibility | Review Required |
|-------------|-------|------|---------------|-----------------|
| **Trivial** | 1-2 files, < 20 lines | Low | Easy | Self-review |
| **Small** | 3-5 files, < 100 lines | Low-Med | Moderate | Peer review |
| **Medium** | 5-10 files, < 500 lines | Medium | Moderate | Team review |
| **Large** | 10+ files, 500+ lines | High | Difficult | Formal review |
| **Critical** | Core systems, data model | Very High | May be irreversible | Multi-reviewer |

**Change Description Template:**
```markdown
## Change: [Brief Title]

### Intent
[Why this change is being made]

### Scope
- Files affected: [list]
- Systems affected: [list]
- Users affected: [none/some/all]

### Actions
1. [Specific action 1]
2. [Specific action 2]
3. [Specific action 3]

### Risk Assessment
- Risk level: [Low/Medium/High/Critical]
- Potential issues: [list]
- Mitigation: [list]

### Reversibility
- Can be rolled back: [Yes/No/Partial]
- Rollback method: [describe]
- Data implications: [none/minimal/significant]
```

#### PRIMITIVE 4: CHECK

**Definition:** Verification that change achieved desired outcome without unintended consequences.

```
CHECK HIERARCHY
─────────────────────────────────────────────────────────────────────────────

LEVEL 1: SYNTAX CHECK
─────────────────────────────────────────────────────────────────────────────
  • Code compiles/parses
  • No syntax errors
  • Linting passes
  
  TOOLS: TypeScript compiler, ESLint, Prettier
  SPEED: Seconds
  CONFIDENCE: Low (code runs, doesn't mean it's correct)

LEVEL 2: UNIT CHECK
─────────────────────────────────────────────────────────────────────────────
  • Individual functions work
  • Edge cases handled
  • Expected outputs produced
  
  TOOLS: Jest, Vitest, pytest
  SPEED: Seconds to minutes
  CONFIDENCE: Medium (units work, integration unknown)

LEVEL 3: INTEGRATION CHECK
─────────────────────────────────────────────────────────────────────────────
  • Components work together
  • APIs return expected responses
  • Database operations succeed
  
  TOOLS: Supertest, integration test suites
  SPEED: Minutes
  CONFIDENCE: Medium-High (system works, UI unknown)

LEVEL 4: END-TO-END CHECK
─────────────────────────────────────────────────────────────────────────────
  • User flows complete successfully
  • Browser interactions work
  • Full system operates correctly
  
  TOOLS: Playwright, Cypress, Selenium
  SPEED: Minutes to hours
  CONFIDENCE: High (simulates real usage)

LEVEL 5: HUMAN CHECK
─────────────────────────────────────────────────────────────────────────────
  • Manual verification
  • Visual inspection
  • Edge case exploration
  • User acceptance
  
  TOOLS: Human eyes, judgment, intuition
  SPEED: Variable
  CONFIDENCE: Highest (catches what automation misses)
```

**Check Requirements by Change Type:**

| Change Type | Level 1 | Level 2 | Level 3 | Level 4 | Level 5 |
|-------------|---------|---------|---------|---------|---------|
| Trivial | ✅ | ○ | ○ | ○ | ○ |
| Small | ✅ | ✅ | ○ | ○ | ○ |
| Medium | ✅ | ✅ | ✅ | ○ | ○ |
| Large | ✅ | ✅ | ✅ | ✅ | ○ |
| Critical | ✅ | ✅ | ✅ | ✅ | ✅ |

**Legend:** ✅ = Required | ○ = Recommended

#### PRIMITIVE 5: ROLLBACK

**Definition:** Safe return to a known good state when a change fails or causes issues.

```
ROLLBACK READINESS
─────────────────────────────────────────────────────────────────────────────

BEFORE ANY CHANGE, ENSURE:

□ KNOWN GOOD STATE EXISTS
  • Latest stable commit identified
  • Database backup available (if applicable)
  • Configuration backup taken
  • External service states documented

□ ROLLBACK PATH DEFINED
  • Specific steps to reverse change
  • Time estimate for rollback
  • Who can perform rollback
  • Communication plan for users

□ ROLLBACK TESTED (for critical changes)
  • Rollback procedure practiced
  • Recovery time verified
  • Data integrity confirmed
  • Dependencies considered

□ MONITORING READY
  • Error rate alerting active
  • Performance monitoring active
  • User feedback channels open
  • Team available for response
```

**Rollback Types:**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           ROLLBACK STRATEGIES                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  GIT ROLLBACK                                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│  git revert <commit>           # Safe, creates new commit                   │
│  git reset --hard <commit>     # Destructive, use with caution              │
│  git checkout <commit> -- file # Single file rollback                       │
│                                                                              │
│  DEPLOYMENT ROLLBACK                                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Blue/green: Switch traffic to previous version                           │
│  • Container: Deploy previous image tag                                      │
│  • Feature flag: Disable new feature                                         │
│  • Canary: Stop rollout, revert canary                                       │
│                                                                              │
│  DATABASE ROLLBACK                                                           │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Migration down: Run reverse migration                                     │
│  • Point-in-time: Restore from backup                                        │
│  • Soft delete: Undelete records                                             │
│  • Compensating transaction: Write correcting data                           │
│                                                                              │
│  STATE ROLLBACK                                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Cache invalidation: Clear and rebuild                                     │
│  • Configuration: Restore previous config                                    │
│  • Environment: Rebuild from known state                                     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

**Rollback Decision Matrix:**

| Symptom | Severity | Rollback Speed | Rollback? |
|---------|----------|----------------|-----------|
| Error rate > 5% | High | < 5 min | **YES, immediately** |
| Performance degraded > 50% | High | < 5 min | **YES, immediately** |
| Feature doesn't work | Medium | < 15 min | Likely yes |
| Minor visual bug | Low | > 30 min | Probably no, fix forward |
| Single user report | Low | Unknown | Investigate first |

#### PRIMITIVE 6: TRACEABILITY

**Definition:** Complete audit trail of who did what, when, why, and with what outcome.

```
TRACEABILITY CHAIN
─────────────────────────────────────────────────────────────────────────────

Every change should be traceable through:

  REQUIREMENT
      │
      │ "Why was this needed?"
      ▼
  DECISION
      │
      │ "What approach was chosen?"
      ▼
  IMPLEMENTATION
      │
      │ "What code was written?"
      ▼
  VERIFICATION
      │
      │ "How was it tested?"
      ▼
  DEPLOYMENT
      │
      │ "When/where was it released?"
      ▼
  OUTCOME
      │
      │ "What was the result?"
      ▼
  LEARNING
      
      "What did we learn?"
```

**Traceability Requirements:**

```
COMMIT MESSAGES
─────────────────────────────────────────────────────────────────────────────
FORMAT: [type](scope): description

TYPES:
  feat:     New feature
  fix:      Bug fix
  docs:     Documentation
  style:    Formatting (no code change)
  refactor: Code change (no feature/fix)
  test:     Adding tests
  chore:    Maintenance tasks

EXAMPLES:
  feat(auth): add password reset flow
  fix(dashboard): correct date formatting in charts
  docs(api): update authentication examples
  refactor(database): optimize user query performance

─────────────────────────────────────────────────────────────────────────────

PULL REQUESTS
─────────────────────────────────────────────────────────────────────────────
MUST INCLUDE:
  □ Description of change
  □ Link to requirement/issue
  □ Testing performed
  □ Screenshots (if UI change)
  □ Rollback considerations

─────────────────────────────────────────────────────────────────────────────

ADRs (Architecture Decision Records)
─────────────────────────────────────────────────────────────────────────────
FOR SIGNIFICANT DECISIONS:
  □ Context: What situation prompted this decision?
  □ Decision: What was decided?
  □ Alternatives: What other options were considered?
  □ Consequences: What are the implications?
  □ Status: Proposed/Accepted/Deprecated/Superseded
```

### 5.3 Primitive Relationships

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       PRIMITIVE RELATIONSHIPS                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                         ┌─────────┐                                          │
│                         │  STATE  │                                          │
│                         └────┬────┘                                          │
│                              │                                               │
│              ┌───────────────┴───────────────┐                              │
│              │                               │                              │
│              ▼                               ▼                              │
│       ┌─────────────┐               ┌─────────────┐                         │
│       │  ARTIFACT   │◄─────────────►│   CHANGE    │                         │
│       │  (Output)   │   produces/   │  (Action)   │                         │
│       │             │   modifies    │             │                         │
│       └──────┬──────┘               └──────┬──────┘                         │
│              │                             │                                │
│              │    ┌─────────────┐          │                                │
│              └───►│    CHECK    │◄─────────┘                                │
│                   │ (Validates) │                                           │
│                   └──────┬──────┘                                           │
│                          │                                                  │
│           ┌──────────────┴──────────────┐                                  │
│           │                             │                                  │
│           ▼                             ▼                                  │
│    ┌─────────────┐               ┌─────────────┐                           │
│    │  ROLLBACK   │               │TRACEABILITY │                           │
│    │ (If needed) │               │  (Always)   │                           │
│    └─────────────┘               └─────────────┘                           │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  FLOW:                                                                       │
│  1. STATE is assessed (current reality)                                      │
│  2. CHANGE is planned (desired delta)                                        │
│  3. ARTIFACT is produced (output of change)                                  │
│  4. CHECK validates (did it work?)                                           │
│  5. ROLLBACK available (if check fails)                                      │
│  6. TRACEABILITY records (always, regardless of outcome)                     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 5.4 Primitive Implementation Checklist

```
BEFORE ANY DEVELOPMENT TASK
─────────────────────────────────────────────────────────────────────────────

□ STATE VERIFIED
  □ Current git status known
  □ Dependencies up to date
  □ Environment confirmed
  □ Application running/testable

□ CHANGE DEFINED
  □ Intent documented
  □ Scope identified
  □ Risk assessed
  □ Reversibility confirmed

□ ARTIFACTS PLANNED
  □ Files to create/modify listed
  □ Naming conventions followed
  □ Location determined
  □ Version strategy set

□ CHECKS PREPARED
  □ Test strategy defined
  □ Acceptance criteria clear
  □ Verification method ready
  □ Review process known

□ ROLLBACK READY
  □ Known good state identified
  □ Rollback steps documented
  □ Time estimate known
  □ Responsible party identified

□ TRACEABILITY SET
  □ Commit message format ready
  □ PR template available
  □ Links to requirements ready
  □ Documentation plan set
```

---

## 6. PRIMITIVE LIFECYCLE & VERIFICATION

### 6.1 The Primitive Execution Cycle

Every task follows this fundamental cycle. No exceptions.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      PRIMITIVE EXECUTION CYCLE                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                         ┌─────────────────┐                                  │
│                         │                 │                                  │
│                         │   1. ASSESS     │                                  │
│                         │      STATE      │                                  │
│                         │                 │                                  │
│                         └────────┬────────┘                                  │
│                                  │                                           │
│                                  │ "What's the current reality?"             │
│                                  │                                           │
│                                  ▼                                           │
│                         ┌─────────────────┐                                  │
│                         │                 │                                  │
│                         │   2. DEFINE     │                                  │
│                         │     CHANGE      │                                  │
│                         │                 │                                  │
│                         └────────┬────────┘                                  │
│                                  │                                           │
│                                  │ "What needs to be different?"             │
│                                  │                                           │
│                                  ▼                                           │
│                         ┌─────────────────┐                                  │
│                         │                 │                                  │
│                         │   3. PRODUCE    │                                  │
│                         │    ARTIFACT     │                                  │
│                         │                 │                                  │
│                         └────────┬────────┘                                  │
│                                  │                                           │
│                                  │ "Execute the change"                      │
│                                  │                                           │
│                                  ▼                                           │
│                         ┌─────────────────┐                                  │
│                         │                 │                                  │
│                         │   4. VERIFY     │◄──────────────────┐              │
│                         │     (CHECK)     │                   │              │
│                         │                 │                   │              │
│                         └────────┬────────┘                   │              │
│                                  │                            │              │
│                         ┌────────┴────────┐                   │              │
│                         │                 │                   │              │
│                    PASS │                 │ FAIL              │              │
│                         ▼                 ▼                   │              │
│              ┌─────────────────┐  ┌─────────────────┐         │              │
│              │                 │  │                 │         │              │
│              │   5. COMMIT     │  │   5. ROLLBACK   │─────────┘              │
│              │     & TRACE     │  │   & DIAGNOSE    │  (Return to step 2)    │
│              │                 │  │                 │                        │
│              └────────┬────────┘  └─────────────────┘                        │
│                       │                                                      │
│                       │                                                      │
│                       ▼                                                      │
│              ┌─────────────────┐                                             │
│              │                 │                                             │
│              │   6. COMPLETE   │                                             │
│              │   (New STATE)   │                                             │
│              │                 │                                             │
│              └─────────────────┘                                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 6.2 Phase Details

#### Phase 1: Assess State

```
ASSESS STATE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ACTIONS:
  1. Verify code state
     git status
     git log -3 --oneline
     
  2. Verify environment
     node -v (or appropriate runtime)
     npm list (or dependency check)
     
  3. Verify application
     Run the application
     Open in browser
     Check console for errors
     
  4. Read relevant existing code
     Do NOT assume code structure
     Do NOT guess at implementation
     Actually READ the files

OUTPUT:
  Clear understanding of current state
  No assumptions, only verified facts
  
DURATION: 2-5 minutes (invest this time!)

ANTI-PATTERNS:
  ✗ "I think the code does X" (without reading it)
  ✗ "It should work" (without running it)
  ✗ "Same as last time" (without verifying)
```

#### Phase 2: Define Change

```
DEFINE CHANGE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ACTIONS:
  1. State the intent clearly
     "I need to [action] so that [outcome]"
     
  2. Identify affected scope
     Files to modify
     Systems impacted
     Users affected
     
  3. Assess risk
     What could go wrong?
     What's the worst case?
     How reversible is this?
     
  4. Plan verification
     How will I know it worked?
     What tests will I run?
     What will I look for?

OUTPUT:
  Written change specification
  (Can be brief for trivial changes)
  
DURATION: Variable (proportional to change size)

ANTI-PATTERNS:
  ✗ "I'll just make some changes" (no plan)
  ✗ "We'll figure it out" (no defined outcome)
  ✗ "It's simple, no need to plan" (famous last words)
```

#### Phase 3: Produce Artifact

```
PRODUCE ARTIFACT PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ACTIONS:
  1. Create/modify code following plan
     Stay within defined scope
     Follow existing patterns
     Maintain consistency
     
  2. Apply incremental changes
     Small commits
     Testable units
     Clear progress
     
  3. Document as you go
     Comments for non-obvious code
     Update README if needed
     Note decisions made
     
  4. Preserve verifiability
     Don't overwrite without backup
     Keep old code commented (temporarily)
     Enable easy comparison

OUTPUT:
  New or modified files
  Ready for verification
  
DURATION: Variable (the actual "work")

ANTI-PATTERNS:
  ✗ One massive change (untestable)
  ✗ Multiple unrelated changes together
  ✗ Changing things "while I'm here"
  ✗ Forgetting to save
```

#### Phase 4: Verify (Check)

```
VERIFY PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ACTIONS:
  1. Run automated checks
     Linting passes?
     Types check?
     Tests pass?
     
  2. Manual verification
     Does it actually work?
     In the browser/app?
     With real interactions?
     
  3. Edge case exploration
     What about empty states?
     What about errors?
     What about slow networks?
     
  4. Regression check
     Did anything else break?
     Run related tests
     Check adjacent functionality

OUTPUT:
  Pass: Ready to commit
  Fail: Return to step 2 with diagnosis
  
DURATION: Proportional to change size

ANTI-PATTERNS:
  ✗ "It compiled, must work" (compilation ≠ correctness)
  ✗ "Tests passed, done" (tests might be incomplete)
  ✗ Skipping manual verification
  ✗ Not checking edge cases
```

#### Phase 5A: Commit & Trace (on Pass)

```
COMMIT PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ACTIONS:
  1. Stage changes
     git add [files]
     Review staged changes
     
  2. Write good commit message
     [type](scope): description
     
     Include:
     - What was done
     - Why it was done
     - Any notable decisions
     
  3. Push and create PR (if applicable)
     Link to issue/requirement
     Include description
     Add screenshots if UI
     
  4. Update documentation
     README if needed
     Changelog entry
     ADR if significant decision

OUTPUT:
  Committed, traceable change
  Ready for review/merge
  
DURATION: 2-5 minutes

ANTI-PATTERNS:
  ✗ "fixed stuff" (useless message)
  ✗ "wip" (no context)
  ✗ Committing without review
  ✗ Skipping documentation updates
```

#### Phase 5B: Rollback & Diagnose (on Fail)

```
ROLLBACK PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ACTIONS:
  1. STOP making more changes
     Don't "try one more thing"
     Don't dig deeper into the hole
     
  2. Return to known good state
     git checkout -- [files]
     git stash (if preserving work)
     Verify application works again
     
  3. Diagnose the failure
     What exactly failed?
     Why did it fail?
     What assumption was wrong?
     
  4. Update approach
     Revise the plan
     Add to Fix Ledger if pattern
     Return to step 2 with new understanding

OUTPUT:
  System back to working state
  Understanding of what went wrong
  Revised approach for next attempt
  
DURATION: Variable (don't rush diagnosis)

ANTI-PATTERNS:
  ✗ "Just push through" (creates more problems)
  ✗ Making changes on top of broken state
  ✗ Not understanding why it failed
  ✗ Blaming external factors without evidence
```

### 6.3 Recursive Verification Pattern

For complex changes, apply verification recursively at multiple levels:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     RECURSIVE VERIFICATION PATTERN                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  FEATURE: User Authentication                                                │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LEVEL 1: Component verification                                      │    │
│  │                                                                      │    │
│  │   ┌──────────────────┐   ┌──────────────────┐   ┌─────────────────┐ │    │
│  │   │ Login Form       │   │ Password Input   │   │ Submit Button   │ │    │
│  │   │ ✓ Unit tests     │   │ ✓ Unit tests     │   │ ✓ Unit tests    │ │    │
│  │   │ ✓ Manual check   │   │ ✓ Manual check   │   │ ✓ Manual check  │ │    │
│  │   └──────────────────┘   └──────────────────┘   └─────────────────┘ │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LEVEL 2: Integration verification                                    │    │
│  │                                                                      │    │
│  │   ┌──────────────────────────────────────────────────────────────┐  │    │
│  │   │ Login Form + API + Database                                   │  │    │
│  │   │ ✓ Form submits to API correctly                               │  │    │
│  │   │ ✓ API validates and stores correctly                          │  │    │
│  │   │ ✓ Errors propagate correctly                                  │  │    │
│  │   └──────────────────────────────────────────────────────────────┘  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LEVEL 3: Flow verification                                           │    │
│  │                                                                      │    │
│  │   ┌──────────────────────────────────────────────────────────────┐  │    │
│  │   │ Complete User Journey                                         │  │    │
│  │   │ ✓ Navigate to login page                                      │  │    │
│  │   │ ✓ Enter credentials                                           │  │    │
│  │   │ ✓ Submit form                                                 │  │    │
│  │   │ ✓ Receive feedback                                            │  │    │
│  │   │ ✓ Redirect to dashboard (success)                             │  │    │
│  │   │ ✓ Show error message (failure)                                │  │    │
│  │   └──────────────────────────────────────────────────────────────┘  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│                                    ▼                                         │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LEVEL 4: System verification                                         │    │
│  │                                                                      │    │
│  │   ┌──────────────────────────────────────────────────────────────┐  │    │
│  │   │ Cross-cutting Concerns                                        │  │    │
│  │   │ ✓ Session management works                                    │  │    │
│  │   │ ✓ Protected routes respect auth                               │  │    │
│  │   │ ✓ Logout clears state                                         │  │    │
│  │   │ ✓ Refresh preserves session                                   │  │    │
│  │   │ ✓ Multiple tabs work correctly                                │  │    │
│  │   └──────────────────────────────────────────────────────────────┘  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  RULE: Each level must pass before moving to the next.                      │
│  RULE: A failure at any level returns to component-level fixes.             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 7. THE ANTI-BUG-LOOP PRINCIPLE (FIX LEDGER)

### 7.1 The Ilya's Loop Problem

Named for the pattern where AI agents create endless fix loops, this is the #1 productivity killer in AI-assisted development.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          THE ILYA'S LOOP                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  THE DEADLY PATTERN:                                                         │
│                                                                              │
│       ┌──────────────────────────────────────────────────────────────┐      │
│       │                                                              │      │
│       │    "I'll fix bug A"                                          │      │
│       │         │                                                    │      │
│       │         ▼                                                    │      │
│       │    Fix introduced → Creates bug B                            │      │
│       │         │                                                    │      │
│       │         ▼                                                    │      │
│       │    "I'll fix bug B"                                          │      │
│       │         │                                                    │      │
│       │         ▼                                                    │      │
│       │    Fix introduced → Re-creates bug A                         │      │
│       │         │                                                    │      │
│       │         ▼                                                    │      │
│       │    "I'll fix bug A again..."                                 │      │
│       │         │                                                    │      │
│       │         ▼                                                    │      │
│       │    ∞ INFINITE LOOP ∞                                         │      │
│       │                                                              │      │
│       └──────────────────────────────────────────────────────────────┘      │
│                                                                              │
│  WHY IT HAPPENS:                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│  1. AI lacks memory of previous fix attempts                                │
│  2. AI treats each bug as independent (misses root cause)                   │
│  3. No record of what was tried and failed                                  │
│  4. AI optimizes for immediate fix, not systemic solution                   │
│  5. Human doesn't notice the loop pattern forming                           │
│                                                                              │
│  THE COST:                                                                   │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Hours or days of wasted effort                                            │
│  • Frustration and loss of trust in AI                                       │
│  • Codebase churn without progress                                           │
│  • Context exhaustion (token limits)                                         │
│  • Increased technical debt                                                  │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 7.2 The Fix Ledger Solution

The Fix Ledger is a persistent record of what was tried, what worked, what didn't, and why. It breaks the loop by giving AI (and humans) memory.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            THE FIX LEDGER                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  LOCATION: /docs/fix-ledger.md or embedded in claude.md                     │
│                                                                              │
│  PURPOSE:                                                                    │
│  ─────────────────────────────────────────────────────────────────────────  │
│  1. Record every significant bug encountered                                │
│  2. Document what solutions were attempted                                   │
│  3. Mark what worked vs. what failed                                         │
│  4. Prevent the same failed approach twice                                   │
│  5. Build institutional knowledge of the codebase                            │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  WHEN TO ADD AN ENTRY:                                                       │
│  ─────────────────────────────────────────────────────────────────────────  │
│  □ Bug took > 30 minutes to resolve                                          │
│  □ Bug recurred after initial fix                                            │
│  □ Fix was non-obvious                                                       │
│  □ Bug had root cause in different area than symptom                        │
│  □ Multiple approaches were tried                                            │
│  □ Bug likely to be encountered again                                        │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  WHEN TO CONSULT:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  □ Before debugging ANY issue                                                │
│  □ When a fix doesn't work on first try                                      │
│  □ When bug feels familiar                                                   │
│  □ Before asking AI to fix something                                         │
│  □ When context switching back to a feature area                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 7.3 Fix Ledger Entry Template

```markdown
## FIX LEDGER

### Entry: [YYYY-MM-DD] [Brief Title]

**Symptom:**
[What the user/developer observed]

**Root Cause:**
[The actual underlying issue]

**Environment:**
[Relevant context: browser, OS, dependencies, etc.]

**Attempted Solutions:**

| # | Approach | Result | Why It Failed/Worked |
|---|----------|--------|---------------------|
| 1 | [First attempt] | ❌ FAILED | [Reason] |
| 2 | [Second attempt] | ❌ FAILED | [Reason] |
| 3 | [Third attempt] | ✅ WORKED | [Why this one worked] |

**Final Solution:**
```
[Code or detailed description of what fixed it]
```

**Prevention:**
[How to prevent this from happening again]

**Related Files:**
- `path/to/file1.ts`
- `path/to/file2.ts`

**Tags:** #authentication #state-management #race-condition

---
```

### 7.4 Fix Ledger Example Entries

```markdown
## FIX LEDGER

---

### Entry: 2024-01-15 Authentication Token Expiry Race Condition

**Symptom:**
Users randomly logged out while actively using the app. Seemed to happen
more frequently during complex operations.

**Root Cause:**
Token refresh was happening asynchronously, but API calls weren't waiting
for refresh to complete. Multiple simultaneous requests could all fail if
token expired during a burst of activity.

**Environment:**
- React 18.2
- Next.js 14.0
- JWT tokens with 15-minute expiry

**Attempted Solutions:**

| # | Approach | Result | Why It Failed/Worked |
|---|----------|--------|---------------------|
| 1 | Extend token expiry to 1 hour | ❌ FAILED | Security concern, didn't fix root cause |
| 2 | Refresh token on every request | ❌ FAILED | Too many refresh calls, rate limited |
| 3 | Queue requests during refresh | ✅ WORKED | Single refresh, queue waits, then all proceed |

**Final Solution:**
```typescript
// Token refresh with request queuing
let refreshPromise: Promise<string> | null = null;

async function getValidToken(): Promise<string> {
  if (isTokenValid()) return getToken();
  
  // If refresh already in progress, wait for it
  if (refreshPromise) return refreshPromise;
  
  // Start refresh and share the promise
  refreshPromise = refreshToken().finally(() => {
    refreshPromise = null;
  });
  
  return refreshPromise;
}
```

**Prevention:**
- All API calls must go through `getValidToken()`
- Token refresh happens at 80% of expiry (proactive)
- Added test for concurrent request scenario

**Related Files:**
- `lib/auth/token-manager.ts`
- `lib/api/client.ts`

**Tags:** #authentication #race-condition #async

---

### Entry: 2024-01-18 CSS Animation Jank on Mobile Safari

**Symptom:**
Card flip animations were choppy on iOS Safari, smooth everywhere else.

**Root Cause:**
Safari's compositor was being triggered unnecessarily on each frame due to
`filter: drop-shadow()` being animated alongside transform.

**Environment:**
- iOS Safari 17
- Tailwind CSS 3.4
- Framer Motion 10.16

**Attempted Solutions:**

| # | Approach | Result | Why It Failed/Worked |
|---|----------|--------|---------------------|
| 1 | Add will-change: transform | ❌ FAILED | Already present, no effect |
| 2 | Use translateZ(0) hack | ❌ FAILED | No improvement |
| 3 | Move shadow to pseudo-element | ✅ WORKED | Shadow on separate layer |

**Final Solution:**
```css
/* Move shadow to non-animated pseudo-element */
.card {
  position: relative;
}

.card::after {
  content: '';
  position: absolute;
  inset: 0;
  box-shadow: 0 10px 40px rgba(0,0,0,0.2);
  border-radius: inherit;
  pointer-events: none;
  /* Shadow doesn't animate, only card transforms */
}
```

**Prevention:**
- Never animate `filter` or `box-shadow` on mobile
- Test all animations on iOS Safari specifically
- Added to design system documentation

**Related Files:**
- `components/ui/card.tsx`
- `styles/animations.css`

**Tags:** #animation #mobile #safari #performance

---
```

### 7.5 The "#" Shortcut for Regression Prevention

When a bug is fixed and added to the Fix Ledger, reference it with "#" in commit messages and code comments. This creates instant searchability.

```
USAGE:
─────────────────────────────────────────────────────────────────────────────

COMMIT MESSAGE:
  fix(auth): prevent token race condition #FL-2024-01-15-auth

CODE COMMENT:
  // #FL-2024-01-15-auth: Queue requests during refresh
  // See: docs/fix-ledger.md

PR DESCRIPTION:
  Fixes issue with random logouts.
  
  Root cause documented in #FL-2024-01-15-auth

SEARCH:
  grep -r "#FL-2024-01" ./         # Find all references
```

### 7.6 Fix Ledger Integration with AI Agents

```
AI AGENT INSTRUCTIONS (Add to claude.md or similar)
─────────────────────────────────────────────────────────────────────────────

BEFORE DEBUGGING ANY ISSUE:
1. Check /docs/fix-ledger.md for similar issues
2. Search for related tags: #[relevant-tag]
3. Review attempted solutions that FAILED

WHEN FIX IS FOUND:
1. ADD entry to Fix Ledger if:
   - Issue took > 30 minutes
   - Multiple approaches tried
   - Root cause was non-obvious
2. Reference Fix Ledger entry in commit message
3. Update related documentation

NEVER:
- Try an approach already marked ❌ FAILED in ledger
- Skip consulting ledger "to save time"
- Implement a fix without checking for prior attempts
```

### 7.7 The Golden Rule of Anti-Bug-Loop

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        THE GOLDEN RULE                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                                                                              │
│        IF YOU'VE TRIED TO FIX SOMETHING 3 TIMES                             │
│                                                                              │
│                   AND IT'S STILL NOT FIXED                                   │
│                                                                              │
│                         ┌─────────┐                                          │
│                         │  STOP.  │                                          │
│                         └─────────┘                                          │
│                                                                              │
│                  YOU ARE PROBABLY IN A LOOP.                                 │
│                                                                              │
│                                                                              │
│  INSTEAD:                                                                    │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  1. Stop fixing                                                              │
│  2. Document what you've tried                                               │
│  3. Question your assumptions about the problem                              │
│  4. Consider that the symptom ≠ root cause                                  │
│  5. Seek a different perspective (human or different AI model)              │
│  6. Return to first principles                                               │
│                                                                              │
│  THE BUG YOU'RE FIXING IS NOT THE BUG YOU THINK IT IS.                      │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 8. REGRESSION DISCIPLINE & SAFETY NETS

### 8.1 The Regression Discipline Matrix

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      REGRESSION DISCIPLINE MATRIX                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  WHAT IS A REGRESSION?                                                       │
│  A regression is when something that used to work, stops working.           │
│  This is worse than a bug—it's a betrayal of user trust.                    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  REGRESSION TYPES:                                                           │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ FUNCTIONAL REGRESSION                                                │    │
│  │ Feature X worked yesterday, doesn't work today                       │    │
│  │                                                                      │    │
│  │ Prevention:                                                          │    │
│  │ □ Comprehensive test coverage for all features                       │    │
│  │ □ Run full test suite before merge                                   │    │
│  │ □ E2E tests for critical user journeys                              │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ PERFORMANCE REGRESSION                                               │    │
│  │ Page loaded in 1s yesterday, takes 3s today                          │    │
│  │                                                                      │    │
│  │ Prevention:                                                          │    │
│  │ □ Performance budgets with enforcement                               │    │
│  │ □ Lighthouse CI in pipeline                                          │    │
│  │ □ Bundle size monitoring                                             │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ VISUAL REGRESSION                                                    │    │
│  │ Button was blue yesterday, is red today (unintentionally)            │    │
│  │                                                                      │    │
│  │ Prevention:                                                          │    │
│  │ □ Visual regression testing (Percy, Chromatic)                       │    │
│  │ □ Design system enforcement                                          │    │
│  │ □ Screenshot comparison in PR                                        │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ DATA REGRESSION                                                      │    │
│  │ User had 100 items yesterday, has 50 today (data loss)               │    │
│  │                                                                      │    │
│  │ Prevention:                                                          │    │
│  │ □ Database migrations tested in staging                              │    │
│  │ □ Data integrity checks                                              │    │
│  │ □ Point-in-time recovery capability                                  │    │
│  │ □ Backup before every migration                                      │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ SECURITY REGRESSION                                                  │    │
│  │ Endpoint was protected yesterday, is public today                    │    │
│  │                                                                      │    │
│  │ Prevention:                                                          │    │
│  │ □ Security tests in CI                                               │    │
│  │ □ Auth checks have test coverage                                     │    │
│  │ □ Regular security audits                                            │    │
│  │ □ Middleware ordering verification                                   │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 8.2 Safety Net Types

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           SAFETY NET TYPES                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  LAYER 1: TESTS                                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  First line of defense. Fast, automated, comprehensive.                     │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ Unit Tests        → Individual functions work correctly             │    │
│  │ Integration Tests → Components work together                         │    │
│  │ E2E Tests         → User flows complete successfully                 │    │
│  │ Visual Tests      → UI looks as expected                             │    │
│  │ Performance Tests → System meets speed requirements                  │    │
│  │ Security Tests    → Vulnerabilities not introduced                   │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  LAYER 2: METRICS                                                            │
│  ───────────────────────────────────────────────────────────────────────    │
│  Quantitative measurements that alert on deviation.                         │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ Error Rates       → Alert if > threshold (e.g., 0.1%)               │    │
│  │ Response Times    → Alert if p95 > threshold (e.g., 500ms)          │    │
│  │ Conversion Rates  → Alert if drops > 10%                             │    │
│  │ User Engagement   → Alert if session duration drops                  │    │
│  │ Resource Usage    → Alert if CPU/memory spikes                       │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  LAYER 3: ROLLBACKS                                                          │
│  ───────────────────────────────────────────────────────────────────────    │
│  Fast reversion when problems detected post-deployment.                     │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ Feature Flags     → Disable specific features instantly             │    │
│  │ Blue/Green        → Switch traffic to previous version              │    │
│  │ Git Revert        → Revert specific commits                          │    │
│  │ Database PITR     → Restore data to point in time                    │    │
│  │ Cache Invalidation→ Clear stale data                                 │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  LAYER 4: GUARDRAILS                                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│  Structural protections that prevent problems from occurring.               │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ Type Systems      → Catch type errors at compile time               │    │
│  │ Linting Rules     → Enforce code style and patterns                  │    │
│  │ Schema Validation → Ensure data integrity                            │    │
│  │ API Contracts     → Verify interface compliance                      │    │
│  │ Branch Protection → Require reviews before merge                     │    │
│  │ Rate Limiting     → Prevent system overload                          │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 8.3 Regression Prevention Workflow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    REGRESSION PREVENTION WORKFLOW                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  BEFORE WRITING CODE:                                                        │
│  ───────────────────────────────────────────────────────────────────────    │
│  □ Review existing tests in affected area                                   │
│  □ Identify what could break                                                │
│  □ Plan test coverage for new code                                          │
│                                                                              │
│                              │                                               │
│                              ▼                                               │
│                                                                              │
│  WHILE WRITING CODE:                                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│  □ Write tests alongside code (TDD preferred)                               │
│  □ Run tests frequently                                                      │
│  □ Check adjacent functionality manually                                     │
│                                                                              │
│                              │                                               │
│                              ▼                                               │
│                                                                              │
│  BEFORE COMMITTING:                                                          │
│  ───────────────────────────────────────────────────────────────────────    │
│  □ Run full test suite                                                       │
│  □ Check linting/type errors                                                │
│  □ Self-review changes                                                       │
│  □ Run application and verify manually                                       │
│                                                                              │
│                              │                                               │
│                              ▼                                               │
│                                                                              │
│  BEFORE MERGING:                                                             │
│  ───────────────────────────────────────────────────────────────────────    │
│  □ PR reviewed by another person                                            │
│  □ CI pipeline passes                                                        │
│  □ Visual review of changes (screenshots if UI)                             │
│  □ Documentation updated                                                     │
│                                                                              │
│                              │                                               │
│                              ▼                                               │
│                                                                              │
│  AFTER DEPLOYING:                                                            │
│  ───────────────────────────────────────────────────────────────────────    │
│  □ Monitor error rates                                                       │
│  □ Check key metrics                                                         │
│  □ Smoke test critical paths                                                 │
│  □ Be ready to rollback                                                      │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 8.4 When Regression Occurs

```
REGRESSION RESPONSE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: DETECT (Immediate)
─────────────────────────────────────────────────────────────────────────────
  HOW: Monitoring alerts, user reports, automated tests
  
  □ Confirm regression is real (not false alarm)
  □ Identify scope of impact
  □ Determine severity

STEP 2: RESPOND (Within 5 minutes for critical)
─────────────────────────────────────────────────────────────────────────────
  DECISION TREE:
  
  Is users' data at risk?
    YES → Rollback immediately, investigate later
    NO  → Continue assessment
  
  Is core functionality broken?
    YES → Rollback immediately, investigate later
    NO  → Can likely fix forward
  
  Can we fix in < 15 minutes?
    YES → Fix forward with hot patch
    NO  → Rollback, then fix properly

STEP 3: ROLLBACK (If needed)
─────────────────────────────────────────────────────────────────────────────
  □ Execute rollback procedure
  □ Verify system is back to working state
  □ Communicate to affected users
  □ Preserve evidence for investigation

STEP 4: ROOT CAUSE (After stability restored)
─────────────────────────────────────────────────────────────────────────────
  □ What change caused the regression?
  □ Why wasn't it caught by tests?
  □ Why wasn't it caught in review?
  □ What systemic issue allowed this?

STEP 5: PREVENT (Before next deployment)
─────────────────────────────────────────────────────────────────────────────
  □ Add test that would have caught this
  □ Update review checklist if applicable
  □ Add to Fix Ledger
  □ Share learnings with team
```

### 8.5 Regression Prevention Checklist (Pre-Deployment)

```
PRE-DEPLOYMENT REGRESSION CHECK
─────────────────────────────────────────────────────────────────────────────

□ FUNCTIONAL
  □ All automated tests pass
  □ Critical user journeys manually verified
  □ Edge cases tested
  □ Error handling verified

□ PERFORMANCE
  □ Lighthouse score maintained (≥ [PROJECT_THRESHOLD])
  □ Bundle size within budget
  □ API response times acceptable
  □ No new N+1 queries

□ VISUAL
  □ UI matches design specifications
  □ No unintended visual changes
  □ Responsive breakpoints working
  □ Animation performance acceptable

□ DATA
  □ Migrations tested
  □ Backward compatibility maintained
  □ No data loss possible
  □ Rollback procedure verified

□ SECURITY
  □ Auth/authz unchanged or improved
  □ No new vulnerabilities introduced
  □ Sensitive data handling reviewed
  □ Input validation in place

□ DOCUMENTATION
  □ API documentation updated
  □ README updated if needed
  □ Changelog entry added
  □ Breaking changes documented

─────────────────────────────────────────────────────────────────────────────
ALL BOXES MUST BE CHECKED BEFORE DEPLOYMENT
─────────────────────────────────────────────────────────────────────────────
```

---

## PART II SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                   PART II: PRIMITIVE EXECUTION FRAMEWORK                     │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  THE SIX PRIMITIVES:                                                         │
│  ─────────────────────────────────────────────────────────────────────────  │
│  1. STATE      → Current verified reality                                   │
│  2. ARTIFACT   → Named, versioned output                                    │
│  3. CHANGE     → Defined delta between states                               │
│  4. CHECK      → Verification of outcome                                    │
│  5. ROLLBACK   → Return to known good state                                 │
│  6. TRACEABILITY → Complete audit trail                                     │
│                                                                              │
│  PRIMITIVE LIFECYCLE:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Assess State → Define Change → Produce Artifact → Verify →                 │
│  → Commit (pass) or Rollback (fail) → New State                             │
│                                                                              │
│  THE FIX LEDGER:                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Prevents Ilya's Loop (endless bug-fix cycles)                            │
│  • Documents what was tried and why it failed/worked                        │
│  • Builds institutional knowledge                                            │
│  • Must be consulted BEFORE debugging                                        │
│  • Golden Rule: 3 failed attempts = STOP, you're in a loop                  │
│                                                                              │
│  REGRESSION DISCIPLINE:                                                      │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Types: Functional, Performance, Visual, Data, Security                   │
│  • Safety Nets: Tests → Metrics → Rollbacks → Guardrails                   │
│  • Prevention Workflow: Before/During/After every change                    │
│  • Response Protocol: Detect → Respond → Rollback → Root Cause → Prevent   │
│                                                                              │
│  CORE PRINCIPLES:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Never guess—verify                                                        │
│  • Every change is traceable                                                 │
│  • Rollback is always possible                                               │
│  • Tests catch what humans miss                                              │
│  • Memory (Fix Ledger) breaks loops                                          │
│  • Regressions are worse than bugs                                           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
