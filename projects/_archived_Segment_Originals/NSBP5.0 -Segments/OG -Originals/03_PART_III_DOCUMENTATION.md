# PART III: DOCUMENTATION & WORKFLOW

---

## 9. DOCUMENTATION HIERARCHY (5-LAYER STACK)

> "Documentation is not an afterthought—it is infrastructure."

### 9.1 The Documentation Pyramid

The 5-Layer Stack ensures every project has the right documentation at the right level of abstraction. Each layer serves a specific purpose and audience.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      DOCUMENTATION HIERARCHY                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                         ┌───────────────────┐                                │
│                         │   LAYER 1:        │                                │
│                         │   THE BLUEPRINT   │  ← This document               │
│                         │   (Universal)     │     Immutable laws             │
│                         └─────────┬─────────┘     Platform-agnostic          │
│                                   │                                          │
│                         ┌─────────▼─────────┐                                │
│                         │   LAYER 2:        │                                │
│                         │   SUPERPROMPT     │  ← Project-specific            │
│                         │   (Project)       │     Tech stack, phases         │
│                         └─────────┬─────────┘     Animation signature        │
│                                   │                                          │
│                   ┌───────────────┼───────────────┐                          │
│                   │               │               │                          │
│         ┌─────────▼─────────┐     │     ┌─────────▼─────────┐                │
│         │   LAYER 3:        │     │     │   LAYER 3:        │                │
│         │   ARCHITECTURE    │     │     │   DESIGN SPEC     │                │
│         │   (Technical)     │     │     │   (Visual)        │                │
│         └─────────┬─────────┘     │     └─────────┬─────────┘                │
│                   │               │               │                          │
│                   └───────────────┼───────────────┘                          │
│                                   │                                          │
│                         ┌─────────▼─────────┐                                │
│                         │   LAYER 4:        │                                │
│                         │   IMPLEMENTATION  │  ← Phase-by-phase              │
│                         │   (Tactical)      │     Current sprint             │
│                         └─────────┬─────────┘     Active tasks               │
│                                   │                                          │
│                         ┌─────────▼─────────┐                                │
│                         │   LAYER 5:        │                                │
│                         │   VERIFICATION    │  ← Proof of work               │
│                         │   (Evidence)      │     Test results               │
│                         └───────────────────┘     Walkthroughs               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 9.2 Layer Specifications

#### LAYER 1: THE BLUEPRINT (This Document)

```
LAYER 1: BLUEPRINT SPECIFICATION
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
  Universal laws governing all development across all projects.
  The "operating system" that aligns human and AI builders.

AUDIENCE:
  • All projects (current and future)
  • All team members (regardless of role)
  • All AI agents (provides consistent context)

UPDATE FREQUENCY:
  Rarely—version increments only
  Changes require careful consideration of downstream effects

CONTAINS:
  ├── Philosophy & principles
  │   └── Founder mindset, commandments, value hierarchy
  ├── Primitive execution framework
  │   └── Six primitives, lifecycle, Fix Ledger
  ├── Quality gates
  │   └── 5-gate system, verification protocols
  ├── Design mastery system
  │   └── Animation, motion, micro-interactions
  ├── AI orchestration patterns
  │   └── Model selection, context engineering, consensus
  └── Selection matrices (tool-agnostic)
      └── Technology decisions without specific recommendations

CHARACTERISTICS:
  • Platform-agnostic (no specific tech stack)
  • Project-agnostic (no specific product references)
  • Placeholder syntax for project-specific values
  • Examples use [PLACEHOLDER] format

FILE NAMING:
  NORTH_STAR_BLUEPRINT_v[X.Y].md
  
LOCATION:
  Shared knowledge base, accessible to all projects
```

#### LAYER 2: SUPERPROMPT (Project-Specific)

```
LAYER 2: SUPERPROMPT SPECIFICATION
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
  Project-specific instantiation of Blueprint principles.
  The "configuration file" that customizes the OS for this project.

AUDIENCE:
  • Project team members
  • AI agents working on this specific project
  • Stakeholders needing project context

UPDATE FREQUENCY:
  Per major phase or scope change
  More frequent than Blueprint, less than Implementation

CONTAINS:
  ├── Project identity & positioning
  │   └── Name, mission, target user, value proposition
  ├── Technology stack selections
  │   └── Specific choices from Blueprint matrices
  │   └── Framework, database, hosting, etc.
  ├── Phase logic
  │   └── Current phase number and name
  │   └── Completed phases summary
  │   └── Remaining phases overview
  ├── Animation signature selection
  │   └── Which signature from Blueprint (Elastic, Physics, etc.)
  │   └── Project-specific motion guidelines
  ├── Quality thresholds
  │   └── Specific numbers (Lighthouse score, test coverage)
  │   └── Project-specific metrics
  ├── Team/role definitions
  │   └── Who does what
  │   └── Communication channels
  └── External integrations
      └── Third-party services
      └── API keys needed (not values!)

CHARACTERISTICS:
  • Inherits all Blueprint principles
  • Provides concrete values for Blueprint placeholders
  • Single source of truth for project decisions
  • Versioned and tracked in git

FILE NAMING:
  [project-name]-superprompt-v[X].md
  
LOCATION:
  Project root or /docs directory
```

#### LAYER 3A: ARCHITECTURE DOCUMENT

```
LAYER 3A: ARCHITECTURE SPECIFICATION
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
  Technical system design and architectural decisions.
  The "blueprint" for how the code is structured.

AUDIENCE:
  • Developers (primary)
  • Technical reviewers
  • AI agents needing system understanding

UPDATE FREQUENCY:
  Per architectural decision
  Major changes require ADR (Architecture Decision Record)

CONTAINS:
  ├── System architecture diagrams
  │   └── High-level component overview
  │   └── Service boundaries
  ├── Data flow diagrams
  │   └── How data moves through system
  │   └── State management approach
  ├── API specifications
  │   └── Endpoint definitions
  │   └── Request/response schemas
  │   └── Authentication approach
  ├── Database schema
  │   └── Entity relationships
  │   └── Migration strategy
  ├── Integration points
  │   └── External services
  │   └── Webhooks
  │   └── Third-party APIs
  ├── Security considerations
  │   └── Auth/authz approach
  │   └── Data protection
  │   └── Vulnerability mitigations
  ├── Performance requirements
  │   └── Load expectations
  │   └── Scaling strategy
  │   └── Caching approach
  └── ADRs (Architecture Decision Records)
      └── Significant decisions with context and rationale

CHARACTERISTICS:
  • Technical depth appropriate for implementation
  • Diagrams preferred over prose for structure
  • Kept in sync with actual implementation
  • Referenced in code comments where relevant

FILE NAMING:
  docs/architecture.md or docs/ARCHITECTURE.md
  docs/adr/NNN-title.md for ADRs
  
LOCATION:
  /docs directory in project repository
```

#### LAYER 3B: DESIGN SPECIFICATION

```
LAYER 3B: DESIGN SPECIFICATION
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
  Visual and interaction design system documentation.
  The "style guide" for consistent user experience.

AUDIENCE:
  • Designers
  • Frontend developers
  • AI agents generating UI code

UPDATE FREQUENCY:
  Per design system change
  Should stabilize after initial development

CONTAINS:
  ├── Brand guidelines
  │   └── Logo usage
  │   └── Voice and tone
  │   └── Photography/illustration style
  ├── Color system
  │   └── Primary, secondary, accent colors
  │   └── Semantic colors (success, error, warning)
  │   └── CSS custom properties / tokens
  ├── Typography scale
  │   └── Font families
  │   └── Size scale (fluid if applicable)
  │   └── Line heights, letter spacing
  ├── Spacing system
  │   └── Base unit
  │   └── Scale (4px, 8px, 16px, etc.)
  │   └── Component-specific spacing
  ├── Component library reference
  │   └── Available components
  │   └── Usage guidelines
  │   └── Props documentation
  ├── Animation specifications
  │   └── Animation signature (from Superprompt)
  │   └── Timing functions
  │   └── Duration guidelines
  ├── Responsive breakpoints
  │   └── Breakpoint values
  │   └── Mobile-first vs desktop-first
  │   └── Component behavior at each breakpoint
  └── Accessibility requirements
      └── WCAG level target
      └── Color contrast requirements
      └── Focus management approach

CHARACTERISTICS:
  • Visual examples where possible
  • Code snippets for implementation
  • Living document updated with design system
  • Single source of truth for visual decisions

FILE NAMING:
  docs/design-spec.md or DESIGN.md
  
LOCATION:
  /docs directory or Storybook/design system tool
```

#### LAYER 4: IMPLEMENTATION GUIDE

```
LAYER 4: IMPLEMENTATION SPECIFICATION
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
  Current tactical plan and execution status.
  The "sprint document" showing what's happening now.

AUDIENCE:
  • Active developers
  • AI agents in current session
  • Project managers tracking progress

UPDATE FREQUENCY:
  Per sprint/iteration
  Most frequently updated document

CONTAINS:
  ├── Current phase details
  │   └── Phase name and number
  │   └── Phase goals
  │   └── Phase timeline
  ├── Active task list
  │   └── What's being worked on
  │   └── Who's doing what
  │   └── Estimated completion
  ├── Blocked items
  │   └── What's stuck
  │   └── Why it's blocked
  │   └── What's needed to unblock
  ├── Dependencies
  │   └── What depends on what
  │   └── External dependencies
  │   └── Critical path items
  ├── Quality gate checklist
  │   └── Gates relevant to current phase
  │   └── Status of each gate item
  └── Next steps
      └── What comes after current tasks
      └── Preparation needed
      └── Handoff requirements

CHARACTERISTICS:
  • Highly dynamic, changes frequently
  • Task-focused, not philosophical
  • Time-bound information
  • Clear ownership for each item

FILE NAMING:
  docs/project-status.md or IMPLEMENTATION.md
  Can also be: docs/current-sprint.md
  
LOCATION:
  /docs directory or project management tool
```

#### LAYER 5: VERIFICATION PROTOCOL

```
LAYER 5: VERIFICATION SPECIFICATION
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
  Proof of work and validation records.
  The "evidence" that work was completed correctly.

AUDIENCE:
  • Reviewers
  • Auditors
  • Future maintainers
  • Quality assurance

UPDATE FREQUENCY:
  Per completed task
  Created as work is done

CONTAINS:
  ├── Test results
  │   └── Test run outputs
  │   └── Coverage reports
  │   └── Failed test investigations
  ├── Walkthrough documentation
  │   └── Step-by-step feature verification
  │   └── Expected vs actual behavior
  │   └── Edge case exploration
  ├── Screenshot evidence
  │   └── Before/after comparisons
  │   └── UI states (loading, error, success)
  │   └── Responsive breakpoint verification
  ├── Performance benchmarks
  │   └── Lighthouse scores
  │   └── Load test results
  │   └── API response times
  ├── Security scan results
  │   └── Vulnerability scan outputs
  │   └── Dependency audit results
  │   └── Penetration test findings
  └── Human review sign-offs
      └── Code review approvals
      └── Design review approvals
      └── Stakeholder acceptance

CHARACTERISTICS:
  • Evidence-based, not opinion-based
  • Timestamped and attributed
  • Preserved for future reference
  • Searchable for troubleshooting

FILE NAMING:
  docs/walkthrough.md
  docs/verification/[feature-name].md
  docs/verification/[date]-[description].md
  
LOCATION:
  /docs/verification directory
```

### 9.3 Document Relationships

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      DOCUMENT RELATIONSHIPS                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  BLUEPRINT ──────────────────────────────────────────────────────────────►  │
│      │              provides universal principles to                         │
│      │                                                                       │
│      ▼                                                                       │
│  SUPERPROMPT ────────────────────────────────────────────────────────────►  │
│      │              instantiates and governs                                 │
│      │                                                                       │
│      ├──────────────────┬────────────────────┐                              │
│      │                  │                    │                              │
│      ▼                  ▼                    ▼                              │
│  ARCHITECTURE      DESIGN SPEC       IMPLEMENTATION                         │
│      │                  │                    │                              │
│      │   technical      │   visual           │   tactical                   │
│      │   decisions      │   decisions        │   execution                  │
│      │                  │                    │                              │
│      └──────────────────┴────────────────────┘                              │
│                         │                                                    │
│                         │ all produce                                        │
│                         ▼                                                    │
│                   VERIFICATION                                               │
│                         │                                                    │
│                         │ validates compliance with                          │
│                         ▼                                                    │
│                   ALL ABOVE LAYERS                                           │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  INFORMATION FLOW:                                                           │
│  • Blueprint flows DOWN (principles inform all below)                        │
│  • Verification flows UP (evidence validates all above)                      │
│  • Layer 3s flow HORIZONTALLY (architecture ↔ design)                        │
│                                                                              │
│  CONFLICT RESOLUTION:                                                        │
│  • Higher layer wins in principle conflicts                                  │
│  • Blueprint > Superprompt > Architecture/Design > Implementation            │
│  • Verification can trigger changes to any layer                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 9.4 Minimum Documentation Per Project

Every project MUST have these documents to be considered properly documented:

```
MINIMUM VIABLE DOCUMENTATION
─────────────────────────────────────────────────────────────────────────────

/[project-root]/
│
├── README.md                         # Quick start guide
│   │                                 # - What is this project?
│   │                                 # - How do I run it?
│   │                                 # - How do I contribute?
│   │
├── [project]-superprompt.md          # Layer 2: Project rules
│   │                                 # - Tech stack
│   │                                 # - Phase logic
│   │                                 # - Quality thresholds
│   │
├── docs/
│   ├── architecture.md               # Layer 3A: Technical design
│   │                                 # - System diagrams
│   │                                 # - API specs
│   │                                 # - Data models
│   │
│   ├── project-status.md             # Layer 4: Current state
│   │                                 # - Active tasks
│   │                                 # - Blockers
│   │                                 # - Next steps
│   │
│   └── changelog.md                  # History of changes
│                                     # - Version history
│                                     # - Breaking changes
│                                     # - Migration guides
│
├── claude.md                         # AI agent memory
│   │                                 # - Project context for AI
│   │                                 # - Codebase conventions
│   │                                 # - Fix Ledger reference
│   │
└── .env.example                      # Environment template
                                      # - Required variables
                                      # - Sample values
                                      # - Documentation links

─────────────────────────────────────────────────────────────────────────────

OPTIONAL BUT RECOMMENDED:

├── docs/
│   ├── design-spec.md                # Layer 3B: Visual design
│   ├── walkthrough.md                # Layer 5: Verification
│   ├── fix-ledger.md                 # Bug history and solutions
│   └── adr/                          # Architecture Decision Records
│       ├── 001-initial-stack.md
│       ├── 002-auth-approach.md
│       └── ...
│
├── CONTRIBUTING.md                   # How to contribute
├── SECURITY.md                       # Security policies
└── LICENSE                           # License information
```

### 9.5 AI Agent Memory File (claude.md)

The `claude.md` file deserves special attention. It is the bridge between documentation and AI agent operation.

```
CLAUDE.MD STRUCTURE
─────────────────────────────────────────────────────────────────────────────

# [Project Name] - AI Agent Context

## Project Overview
[Brief description of what this project is and does]

## Tech Stack
- Framework: [e.g., Next.js 14]
- Language: [e.g., TypeScript 5.3]
- Database: [e.g., PostgreSQL via Supabase]
- Styling: [e.g., Tailwind CSS 3.4]
- [Other relevant technologies]

## Project Structure
```
[Key directories and their purposes]
```

## Current Phase
Phase [X]: [Name]
- [Current objectives]
- [Key constraints]

## Conventions
- [Naming conventions]
- [File organization rules]
- [Code style preferences]

## Critical Rules
1. [Non-negotiable rule 1]
2. [Non-negotiable rule 2]
3. [Non-negotiable rule 3]

## Common Patterns
[Code patterns used in this project with examples]

## Known Issues / Fix Ledger Reference
See: docs/fix-ledger.md

Key issues to be aware of:
- [Issue 1 summary]
- [Issue 2 summary]

## Commands
```bash
# Development
npm run dev

# Testing
npm run test

# Build
npm run build

# [Other relevant commands]
```

## Environment Variables
Required in .env.local:
- `VARIABLE_1`: [purpose]
- `VARIABLE_2`: [purpose]

## Before Making Changes
1. Read relevant existing code first
2. Check Fix Ledger for related issues
3. Run tests to verify current state
4. [Other pre-work requirements]

## After Making Changes
1. Run full test suite
2. Update documentation if needed
3. Create Fix Ledger entry if applicable
4. [Other post-work requirements]
```

---

## 10. THE PLAN-REFINE-EXECUTE PROTOCOL

### 10.1 Protocol Overview

Every significant task follows the Plan-Refine-Execute cycle. This is not optional—it is the fundamental rhythm of quality development.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      PLAN-REFINE-EXECUTE CYCLE                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                         ┌─────────────┐                                      │
│                         │             │                                      │
│            ┌────────────►    PLAN     ├────────────┐                         │
│            │            │             │            │                         │
│            │            │  20-30%     │            │                         │
│            │            │  of time    │            │                         │
│            │            └─────────────┘            │                         │
│            │                                       │                         │
│            │                                       ▼                         │
│    ┌───────┴───────┐                      ┌───────────────┐                  │
│    │               │                      │               │                  │
│    │   ITERATE     │                      │    REFINE     │                  │
│    │   (if scope   │                      │               │                  │
│    │    changes)   │                      │   10-20%      │                  │
│    │               │                      │   of time     │                  │
│    └───────────────┘                      └───────┬───────┘                  │
│            ▲                                      │                          │
│            │                                      │                          │
│            │                                      ▼                          │
│            │            ┌─────────────┐                                      │
│            │            │             │                                      │
│            └────────────┤   EXECUTE   │                                      │
│                         │             │                                      │
│                         │   50-70%    │                                      │
│                         │   of time   │                                      │
│                         └─────────────┘                                      │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  TIME INVESTMENT RATIONALE:                                                  │
│  • Planning prevents rework (1 hour planning saves 4 hours debugging)       │
│  • Refinement catches misunderstandings early (cheap to fix)                │
│  • Execution is faster when direction is clear                               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 10.2 PLAN Phase

**Purpose:** Define what will be done, how, and what success looks like.

```
PLAN PHASE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: CONTEXT GATHERING
─────────────────────────────────────────────────────────────────────────────
Before planning, understand the current state.

□ Read relevant existing code
  → Don't assume you know what's there
  → Open and read the actual files
  → Understand existing patterns

□ Understand current state
  → Run the application
  → See what exists
  → Identify what works/doesn't

□ Identify dependencies and blockers
  → What must be done first?
  → What external factors matter?
  → Who else is affected?

□ Review Fix Ledger for related patterns
  → Has this been attempted before?
  → What approaches failed?
  → What worked in similar situations?

STEP 2: REQUIREMENT CLARIFICATION
─────────────────────────────────────────────────────────────────────────────
Ensure you understand what's actually needed.

□ Ask clarifying questions
  → Before assuming, ask
  → Challenge vague requirements
  → Seek concrete examples

□ Define acceptance criteria
  → How will we know it's done?
  → What's the minimum viable outcome?
  → What would "excellent" look like?

□ Identify edge cases
  → What happens with empty data?
  → What about errors?
  → What about concurrent users?

□ Note out-of-scope items explicitly
  → What are we NOT doing?
  → What's deferred to later?
  → What's someone else's responsibility?

STEP 3: APPROACH DESIGN
─────────────────────────────────────────────────────────────────────────────
Design the solution before implementing.

□ Outline implementation approach
  → High-level steps
  → Technology choices
  → Pattern selections

□ Identify risks and mitigations
  → What could go wrong?
  → How would we detect it?
  → How would we recover?

□ Define rollback strategy
  → How do we undo this if needed?
  → What's the known good state?
  → How long would rollback take?

□ Estimate effort
  → How long will this take?
  → What's the confidence level?
  → What could make it take longer?

STEP 4: ARTIFACT PLANNING
─────────────────────────────────────────────────────────────────────────────
Specify what will be created.

□ List files to be created/modified
  → New files with paths
  → Existing files with changes
  → Configuration changes

□ List tests to be written
  → Unit tests
  → Integration tests
  → E2E tests (if applicable)

□ List documentation updates
  → Code comments
  → README updates
  → API documentation

□ Define verification method
  → How will we test this?
  → What does passing look like?
  → Who will verify?
```

**Plan Document Template:**

```markdown
## PLAN: [Task Title]

**Date:** [YYYY-MM-DD]
**Author:** [Name]
**Estimated Effort:** [X hours/days] (Confidence: Low/Medium/High)

### Context
[Why does this task exist? What's the current state?]

### Requirements
- [ ] [Requirement 1]
- [ ] [Requirement 2]
- [ ] [Requirement 3]

### Acceptance Criteria
1. [Measurable criterion 1]
2. [Measurable criterion 2]
3. [Measurable criterion 3]

### Out of Scope
- [Explicitly excluded item 1]
- [Explicitly excluded item 2]

### Approach
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Files Affected
| File | Change Type | Description |
|------|-------------|-------------|
| `path/to/file1.ts` | Create | [What it does] |
| `path/to/file2.ts` | Modify | [What changes] |

### Tests to Write
- [ ] Unit: [Test description]
- [ ] Integration: [Test description]
- [ ] E2E: [Test description]

### Risks & Mitigations
| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | Low/Med/High | Low/Med/High | [Mitigation] |

### Rollback Plan
[How to undo this change if it fails]

### Questions for Clarification
1. [Question 1]?
2. [Question 2]?

### Dependencies
- [Dependency 1]
- [Dependency 2]
```

### 10.3 REFINE Phase

**Purpose:** Validate the plan with stakeholders, improve based on feedback, lock scope.

```
REFINE PHASE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: PLAN REVIEW
─────────────────────────────────────────────────────────────────────────────
Share and validate the plan.

□ Share plan with stakeholders
  → Relevant team members
  → Affected parties
  → Decision makers (if scope is significant)

□ Gather feedback
  → What's unclear?
  → What's missing?
  → What seems wrong?

□ Identify gaps in understanding
  → Where do reviewers disagree?
  → What assumptions are questioned?
  → What edge cases were missed?

□ Clarify ambiguities
  → Resolve unclear points
  → Document decisions
  → Update plan with clarifications

STEP 2: SCOPE LOCK
─────────────────────────────────────────────────────────────────────────────
Finalize what will be done.

□ Confirm final requirements
  → All stakeholders agree
  → Written acceptance criteria
  → No unstated expectations

□ Document any scope changes
  → What changed from initial plan?
  → Why did it change?
  → Impact of changes

□ Get explicit approval to proceed
  → "Yes, this is what we want"
  → Sign-off from owner
  → Timeline agreed

□ Set clear boundaries
  → What's NOT included (explicit)
  → Where to stop
  → What triggers a re-plan

STEP 3: PREPARATION
─────────────────────────────────────────────────────────────────────────────
Set up for execution.

□ Set up development environment
  → Clean working directory
  → Dependencies installed
  → Environment variables set

□ Create feature branch
  → Clear branch name
  → From correct base
  → Ready for commits

□ Prepare test scaffolding
  → Test files created
  → Test structure ready
  → Assertions planned

□ Review documentation one more time
  → Architecture docs
  → Design specs
  → Related Fix Ledger entries

STEP 4: FINAL CHECKLIST
─────────────────────────────────────────────────────────────────────────────
Verify readiness.

□ All questions answered?
  → No open unknowns
  → All clarifications received
  → Assumptions documented

□ Approach validated?
  → Technical approach approved
  → No blocking concerns
  → Resources available

□ Risks acknowledged?
  → Stakeholders aware of risks
  → Mitigations accepted
  → Rollback plan confirmed

□ Ready to execute?
  → Environment ready
  → Time allocated
  → Focus available
```

### 10.4 EXECUTE Phase

**Purpose:** Implement the plan, following the approach, validating continuously.

```
EXECUTE PHASE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: IMPLEMENTATION
─────────────────────────────────────────────────────────────────────────────
Build the solution.

□ Follow the plan step-by-step
  → Don't skip steps
  → Don't reorder without reason
  → Mark progress as you go

□ Write tests alongside code
  → TDD preferred (test first)
  → At minimum, test immediately after
  → Don't defer tests to "later"

□ Commit frequently
  → Small, logical commits
  → Descriptive messages
  → Easy to review and rollback

□ Update documentation as you go
  → Comments for complex logic
  → README if needed
  → API docs if applicable

STEP 2: CONTINUOUS VALIDATION
─────────────────────────────────────────────────────────────────────────────
Verify as you build.

□ Run tests after each significant change
  → Catch regressions immediately
  → Don't accumulate broken state
  → Keep test suite green

□ Verify against acceptance criteria
  → Does it meet the requirements?
  → Check each criterion explicitly
  → Document any gaps

□ Check for regressions
  → Run related tests
  → Manual smoke test
  → Compare with known good state

□ Validate edge cases
  → Empty states
  → Error conditions
  → Boundary values

STEP 3: QUALITY GATES
─────────────────────────────────────────────────────────────────────────────
Pass required checkpoints.

□ Gate 1: Vision Alignment
  → Still aligned with project goals?
  → User value preserved?

□ Gate 2: Technical Soundness
  → Architecture consistent?
  → Security considered?

□ Gate 3: Design Excellence
  → Visual quality maintained?
  → Interactions polished?

□ Gate 4: Implementation Quality
  → Tests passing?
  → Performance acceptable?

□ Gate 5: AI Verification
  → AI outputs verified?
  → Hallucinations checked?

STEP 4: COMPLETION
─────────────────────────────────────────────────────────────────────────────
Finalize the work.

□ All acceptance criteria met?
  → Check each one explicitly
  → Document status
  → Note any exceptions

□ All tests passing?
  → Full test suite
  → No skipped tests
  → Coverage acceptable

□ Documentation updated?
  → Code comments complete
  → README updated
  → Changelog entry added

□ Ready for review/merge?
  → PR created
  → Description complete
  → Reviewers assigned
```

### 10.5 When to Re-Plan

Trigger a return to PLAN phase when any of these conditions occur:

```
RE-PLANNING TRIGGERS
─────────────────────────────────────────────────────────────────────────────

SCOPE CHANGES
─────────────────────────────────────────────────────────────────────────────
□ New requirements emerge that change scope by >20%
□ Stakeholder priorities shift
□ "Oh, we also need..." moments
□ Original requirement was misunderstood

TECHNICAL DISCOVERIES
─────────────────────────────────────────────────────────────────────────────
□ Fundamental assumption proves false
□ Dependency doesn't work as expected
□ Performance is unacceptable
□ Security issue discovered

BLOCKERS
─────────────────────────────────────────────────────────────────────────────
□ Blocker cannot be resolved within current approach
□ External dependency unavailable
□ Required information not accessible
□ Resource not available

UNDERSTANDING GAPS
─────────────────────────────────────────────────────────────────────────────
□ Execution reveals plan was based on incorrect understanding
□ Edge cases are more complex than anticipated
□ Integration points behave differently than documented

FEEDBACK
─────────────────────────────────────────────────────────────────────────────
□ Stakeholder feedback requires significant changes
□ User testing reveals wrong approach
□ Code review identifies fundamental issues

─────────────────────────────────────────────────────────────────────────────

IMPORTANT: RE-PLANNING IS NOT FAILURE

Re-planning is the system working correctly.
It's better to re-plan early than to build the wrong thing.
The cost of re-planning is almost always less than the cost of wrong execution.

─────────────────────────────────────────────────────────────────────────────
```

---

## 11. THE SLICE BUILD METHODOLOGY

### 11.1 Vertical Slices vs. Horizontal Layers

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    SLICE BUILD METHODOLOGY                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ❌ HORIZONTAL LAYERS (Anti-Pattern)                                        │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ Week 1: Build all database tables                                    │    │
│  │         ████████████████████████████████████████████████            │    │
│  ├─────────────────────────────────────────────────────────────────────┤    │
│  │ Week 2: Build all API endpoints                                      │    │
│  │         ████████████████████████████████████████████████            │    │
│  ├─────────────────────────────────────────────────────────────────────┤    │
│  │ Week 3: Build all UI components                                      │    │
│  │         ████████████████████████████████████████████████            │    │
│  ├─────────────────────────────────────────────────────────────────────┤    │
│  │ Week 4: Connect everything (BUGS EVERYWHERE)                         │    │
│  │         ████████ 🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛                │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  PROBLEMS:                                                                   │
│  • Nothing works until Week 4                                                │
│  • Integration bugs discovered late (expensive)                              │
│  • No user feedback until end                                                │
│  • Difficult to change course                                                │
│  • Morale drops (no visible progress)                                        │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  ✅ VERTICAL SLICES (Best Practice)                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  ┌──────────┬──────────┬──────────┬──────────┐                              │
│  │  Week 1  │  Week 2  │  Week 3  │  Week 4  │                              │
│  │          │          │          │          │                              │
│  │  Create  │  Create  │  Invite  │  Export  │                              │
│  │  Account │  Project │  Team    │  Data    │                              │
│  │          │          │          │          │                              │
│  │  ┌────┐  │  ┌────┐  │  ┌────┐  │  ┌────┐  │                              │
│  │  │ UI │  │  │ UI │  │  │ UI │  │  │ UI │  │                              │
│  │  ├────┤  │  ├────┤  │  ├────┤  │  ├────┤  │                              │
│  │  │API │  │  │API │  │  │API │  │  │API │  │                              │
│  │  ├────┤  │  ├────┤  │  ├────┤  │  ├────┤  │                              │
│  │  │ DB │  │  │ DB │  │  │ DB │  │  │ DB │  │                              │
│  │  └────┘  │  └────┘  │  └────┘  │  └────┘  │                              │
│  │    ✓     │    ✓     │    ✓     │    ✓     │                              │
│  │  WORKS!  │  WORKS!  │  WORKS!  │  WORKS!  │                              │
│  └──────────┴──────────┴──────────┴──────────┘                              │
│                                                                              │
│  BENEFITS:                                                                   │
│  • Something works after Week 1                                              │
│  • Integration tested continuously                                           │
│  • User feedback possible at any point                                       │
│  • Easy to reprioritize remaining work                                       │
│  • Morale high (visible progress)                                            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 11.2 Slice Anatomy

Every slice should be a complete vertical cut through the system:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           SLICE ANATOMY                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                    ┌─────────────────────────────────────┐                   │
│                    │            USER ACTION              │                   │
│                    │      (Button click, form submit)    │                   │
│                    └──────────────────┬──────────────────┘                   │
│                                       │                                      │
│                    ┌──────────────────▼──────────────────┐                   │
│                    │           UI COMPONENT              │                   │
│                    │     (Form, button, feedback)        │                   │
│                    │                                     │                   │
│                    │  □ User can see the interface       │                   │
│                    │  □ User can interact with it        │                   │
│                    │  □ Visual feedback is present       │                   │
│                    └──────────────────┬──────────────────┘                   │
│                                       │                                      │
│                    ┌──────────────────▼──────────────────┐                   │
│                    │          STATE MANAGEMENT           │                   │
│                    │    (Local state, global store)      │                   │
│                    │                                     │                   │
│                    │  □ State updates on action          │                   │
│                    │  □ UI reflects state changes        │                   │
│                    │  □ Loading states handled           │                   │
│                    └──────────────────┬──────────────────┘                   │
│                                       │                                      │
│                    ┌──────────────────▼──────────────────┐                   │
│                    │           API LAYER                 │                   │
│                    │    (Request, response handling)     │                   │
│                    │                                     │                   │
│                    │  □ Request is properly formed       │                   │
│                    │  □ Response is properly parsed      │                   │
│                    │  □ Errors are properly handled      │                   │
│                    └──────────────────┬──────────────────┘                   │
│                                       │                                      │
│                    ┌──────────────────▼──────────────────┐                   │
│                    │         BACKEND LOGIC               │                   │
│                    │   (Validation, business rules)      │                   │
│                    │                                     │                   │
│                    │  □ Input is validated               │                   │
│                    │  □ Business rules are applied       │                   │
│                    │  □ Authorization is checked         │                   │
│                    └──────────────────┬──────────────────┘                   │
│                                       │                                      │
│                    ┌──────────────────▼──────────────────┐                   │
│                    │         DATA PERSISTENCE            │                   │
│                    │    (Database, file storage)         │                   │
│                    │                                     │                   │
│                    │  □ Data is saved correctly          │                   │
│                    │  □ Data can be retrieved            │                   │
│                    │  □ Data integrity maintained        │                   │
│                    └──────────────────┬──────────────────┘                   │
│                                       │                                      │
│                    ┌──────────────────▼──────────────────┐                   │
│                    │           USER FEEDBACK             │                   │
│                    │    (Success, error, loading)        │                   │
│                    │                                     │                   │
│                    │  □ Success is communicated          │                   │
│                    │  □ Errors are communicated          │                   │
│                    │  □ User knows what happened         │                   │
│                    └─────────────────────────────────────┘                   │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  A COMPLETE SLICE includes ALL of these layers for ONE user action.         │
│  An INCOMPLETE SLICE is missing one or more layers.                         │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 11.3 Slice Sizing Guidelines

```
SLICE SIZING GUIDE
─────────────────────────────────────────────────────────────────────────────

┌────────────────────────────────────────────────────────────────────────────┐
│ SIZE    │ DURATION   │ SCOPE             │ EXAMPLE                        │
├────────────────────────────────────────────────────────────────────────────┤
│         │            │                   │                                │
│ MICRO   │ 2-4 hours  │ Single            │ Add delete button to list item │
│         │            │ interaction       │ Add loading spinner to button  │
│         │            │                   │ Fix validation message display │
│         │            │                   │                                │
├────────────────────────────────────────────────────────────────────────────┤
│         │            │                   │                                │
│ SMALL   │ 0.5-1 day  │ Simple            │ User can change password       │
│         │            │ feature           │ User can update profile photo  │
│         │            │                   │ Add search to list view        │
│         │            │                   │                                │
├────────────────────────────────────────────────────────────────────────────┤
│         │            │                   │                                │
│ MEDIUM  │ 1-3 days   │ Standard          │ User can create and edit item  │
│         │            │ feature           │ User can filter and sort list  │
│         │            │                   │ Add notification preferences   │
│         │            │                   │                                │
├────────────────────────────────────────────────────────────────────────────┤
│         │            │                   │                                │
│ LARGE   │ 3-5 days   │ Complex           │ User can invite team with roles│
│         │            │ feature           │ Multi-step onboarding flow     │
│         │            │                   │ Dashboard with multiple widgets│
│         │            │                   │                                │
├────────────────────────────────────────────────────────────────────────────┤
│         │            │                   │                                │
│ EPIC    │ 1-2 weeks  │ Multi-feature     │ Complete authentication system │
│         │            │ system            │ Payment and subscription flow  │
│         │            │                   │ Real-time collaboration feature│
│         │            │                   │                                │
└────────────────────────────────────────────────────────────────────────────┘

─────────────────────────────────────────────────────────────────────────────

GOLDEN RULE:
If a slice takes longer than 5 days, it should be broken into smaller slices.

SLICE SPLITTING STRATEGIES:
─────────────────────────────────────────────────────────────────────────────

1. BY USER ACTION
   Epic: "User management"
   Split into:
   ├── User can create account
   ├── User can log in
   ├── User can reset password
   ├── User can update profile
   └── User can delete account

2. BY HAPPY PATH VS EDGE CASES
   Feature: "File upload"
   Split into:
   ├── User can upload single file (happy path)
   ├── User sees error for invalid file type
   ├── User sees error for file too large
   └── User can upload multiple files

3. BY PLATFORM
   Feature: "Responsive dashboard"
   Split into:
   ├── Dashboard works on desktop
   ├── Dashboard works on tablet
   └── Dashboard works on mobile

4. BY USER TYPE
   Feature: "Access control"
   Split into:
   ├── Admin can manage all resources
   ├── Member can manage own resources
   └── Guest can view public resources
```

### 11.4 Slice Prioritization Matrix

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     SLICE PRIORITIZATION MATRIX                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                           USER VALUE                                         │
│                    Low            Medium           High                      │
│              ┌─────────────────────────────────────────────┐                │
│              │              │              │               │                │
│    High      │   DEFER      │   CONSIDER   │   DO FIRST    │                │
│              │              │              │   ★★★         │                │
│    ──────────┼──────────────┼──────────────┼───────────────┤                │
│    E         │              │              │               │                │
│    F  Medium │   SKIP       │   CONSIDER   │   DO NEXT     │                │
│    F         │              │              │   ★★          │                │
│    O  ───────┼──────────────┼──────────────┼───────────────┤                │
│    R         │              │              │               │                │
│    T  Low    │   SKIP       │   DEFER      │   DO NEXT     │                │
│              │              │              │   ★           │                │
│              └─────────────────────────────────────────────┘                │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  LEGEND:                                                                     │
│                                                                              │
│  ★★★ DO FIRST                                                               │
│      High value regardless of effort                                         │
│      These are your highest priority items                                   │
│      Schedule immediately                                                    │
│                                                                              │
│  ★★  DO NEXT                                                                │
│      Medium value + low effort, OR high value + medium effort               │
│      Schedule after DO FIRST items                                           │
│      Keep in active backlog                                                  │
│                                                                              │
│  ★   DO NEXT (Lower Priority)                                               │
│      High value but high effort                                              │
│      May need to be broken into smaller slices                               │
│      Schedule when capacity allows                                           │
│                                                                              │
│  CONSIDER                                                                    │
│      Evaluate trade-offs carefully                                           │
│      May be worth doing, may not                                             │
│      Get more information before deciding                                    │
│                                                                              │
│  DEFER                                                                       │
│      Put in backlog for later                                                │
│      Review periodically                                                     │
│      May become more valuable later                                          │
│                                                                              │
│  SKIP                                                                        │
│      Remove from consideration                                               │
│      Don't spend more time on it                                             │
│      May never be worth doing                                                │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 11.5 Slice Definition Template

```markdown
## SLICE: [Slice Name]

**Size:** Micro / Small / Medium / Large / Epic
**Priority:** ★ / ★★ / ★★★
**Estimated Duration:** [X hours/days]

### User Story
As a [user type], I want to [action] so that [benefit].

### Acceptance Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

### Layers Affected
- [ ] UI Component
- [ ] State Management
- [ ] API Layer
- [ ] Backend Logic
- [ ] Data Persistence
- [ ] User Feedback

### Technical Notes
[Any technical considerations or constraints]

### Dependencies
- [Dependency 1]
- [Dependency 2]

### Out of Scope
- [Not included 1]
- [Not included 2]
```

---

## 12. QUALITY GATES SYSTEM (5-GATE FRAMEWORK)

### 12.1 Gate Overview

Quality Gates are non-negotiable checkpoints that work must pass before proceeding. No exceptions.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        5-GATE QUALITY SYSTEM                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐   │
│  │  GATE   │───►│  GATE   │───►│  GATE   │───►│  GATE   │───►│  GATE   │   │
│  │    1    │    │    2    │    │    3    │    │    4    │    │    5    │   │
│  │ Vision  │    │  Tech   │    │ Design  │    │  Impl   │    │   AI    │   │
│  └─────────┘    └─────────┘    └─────────┘    └─────────┘    └─────────┘   │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  Gate 1: VISION ALIGNMENT                                                    │
│          Does it align with project vision and user needs?                  │
│                                                                              │
│  Gate 2: TECHNICAL SOUNDNESS                                                 │
│          Is the technical architecture sound and sustainable?               │
│                                                                              │
│  Gate 3: DESIGN EXCELLENCE                                                   │
│          Does it meet design and UX standards?                               │
│                                                                              │
│  Gate 4: IMPLEMENTATION QUALITY                                              │
│          Is the implementation correct, tested, and production-ready?       │
│                                                                              │
│  Gate 5: AI VERIFICATION                                                     │
│          Are AI-generated outputs verified and grounded?                    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  RULE: Each gate must pass before proceeding to the next.                   │
│  RULE: A failure at any gate stops progress until resolved.                 │
│  RULE: Gates cannot be skipped, only marked N/A if genuinely not applicable.│
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 12.2 Gate 1: Vision Alignment

**Purpose:** Ensure work aligns with project purpose and user needs.

```
GATE 1: VISION ALIGNMENT
─────────────────────────────────────────────────────────────────────────────

GATE OWNER: Product owner, stakeholder, or project lead

WHEN TO APPLY:
  ✅ New features
  ✅ Major changes
  ✅ Scope decisions
  ○  Bug fixes (optional)
  ○  Technical debt (optional)
  ○  Infrastructure (optional)

─────────────────────────────────────────────────────────────────────────────

CHECKLIST:

□ PURPOSE ALIGNMENT
  □ Feature serves the core project mission
  □ User story clearly articulates value
  □ Fits within current project scope
  □ Doesn't contradict existing features

□ USER FOCUS
  □ Target user is clearly defined
  □ User pain point is understood (not assumed)
  □ Solution addresses the actual need
  □ User journey is considered

□ SUCCESS METRICS
  □ Measurable success criteria defined
  □ Baseline established (if applicable)
  □ Method of measurement identified
  □ Target values specified

□ POSITIONING
  □ Work maintains "Category of One" standard
  □ Level 4-5 value positioning maintained
  □ Differentiation preserved or enhanced
  □ Brand alignment checked

─────────────────────────────────────────────────────────────────────────────

PASS CRITERIA:
  All checked items must be satisfied

FAILURE RESPONSE:
  Return to planning phase
  Clarify requirements with stakeholders
  Do not proceed with implementation
```

### 12.3 Gate 2: Technical Soundness

**Purpose:** Ensure technical approach is architecturally correct and sustainable.

```
GATE 2: TECHNICAL SOUNDNESS
─────────────────────────────────────────────────────────────────────────────

GATE OWNER: Tech lead, senior developer, or architect

WHEN TO APPLY:
  ✅ All code changes
  ✅ Infrastructure changes
  ✅ Dependency additions
  ✅ API modifications

─────────────────────────────────────────────────────────────────────────────

CHECKLIST:

□ ARCHITECTURE ALIGNMENT
  □ Follows established patterns in codebase
  □ Consistent with architecture documentation
  □ No unauthorized architectural changes
  □ Maintains separation of concerns

□ SCALABILITY
  □ Solution handles expected load
  □ Performance implications considered
  □ Resource usage acceptable
  □ No obvious bottlenecks introduced

□ SECURITY
  □ Authentication/authorization appropriate
  □ Input validation implemented
  □ No sensitive data exposure
  □ OWASP top 10 considered
  □ SQL injection prevented
  □ XSS prevented

□ INTEGRATION
  □ API contracts respected
  □ Database schema changes are safe
  □ Third-party integrations handled correctly
  □ Migration path defined (if applicable)
  □ Backward compatibility maintained (or breaking changes documented)

□ MAINTAINABILITY
  □ Code is readable and self-documenting
  □ Dependencies are justified and minimal
  □ Technical debt is minimal or documented
  □ Future developers can understand this

─────────────────────────────────────────────────────────────────────────────

PASS CRITERIA:
  All security items required
  80% of other items required
  Any failures must be documented with justification

FAILURE RESPONSE:
  Address technical concerns before proceeding
  Consult with tech lead if uncertain
  Document any accepted technical debt
```

### 12.4 Gate 3: Design Excellence

**Purpose:** Ensure visual and interaction design meets standards.

```
GATE 3: DESIGN EXCELLENCE
─────────────────────────────────────────────────────────────────────────────

GATE OWNER: Design lead, UX reviewer, or frontend lead

WHEN TO APPLY:
  ✅ UI changes
  ✅ New components
  ✅ Interaction changes
  ○  Backend-only changes (N/A)
  ○  Infrastructure (N/A)

─────────────────────────────────────────────────────────────────────────────

CHECKLIST:

□ VISUAL DESIGN
  □ Color system correctly applied
  □ Typography hierarchy respected
  □ Spacing system followed
  □ Brand consistency maintained
  □ Icons and imagery appropriate

□ ANIMATION & MOTION
  □ Animation signature applied correctly
  □ Standard easings used
  □ Duration within guidelines
  □ Motion enhances, not distracts
  □ Reduced motion respected

□ INTERACTION DESIGN
  □ Clear feedback for user actions
  □ Loading states present and informative
  □ Error states designed and helpful
  □ Empty states handled gracefully
  □ Hover/focus states defined

□ RESPONSIVE DESIGN
  □ Works on mobile breakpoints
  □ Works on tablet breakpoints
  □ Works on desktop breakpoints
  □ Touch targets appropriate size (44px minimum)
  □ No horizontal scroll on mobile

□ ACCESSIBILITY
  □ Color contrast sufficient (WCAG AA: 4.5:1 text, 3:1 UI)
  □ Keyboard navigation works
  □ Screen reader compatible (proper ARIA)
  □ Focus states visible
  □ Form labels present
  □ Error messages accessible

□ FIRST IMPRESSION TEST
  □ Would this impress in first 3 seconds?
  □ Does it feel "premium" and polished?
  □ Is it distinctly "Category of One"?
  □ Would I be proud to show this?

─────────────────────────────────────────────────────────────────────────────

PASS CRITERIA:
  All accessibility items required (legal/ethical obligation)
  85% of visual items required
  First Impression Test is subjective but important

FAILURE RESPONSE:
  Iterate on design before shipping
  Consult with design lead
  Do not compromise on accessibility
```

### 12.5 Gate 4: Implementation Quality

**Purpose:** Ensure code is correct, tested, and production-ready.

```
GATE 4: IMPLEMENTATION QUALITY
─────────────────────────────────────────────────────────────────────────────

GATE OWNER: Code reviewer, QA, or tech lead

WHEN TO APPLY:
  ✅ All code changes

─────────────────────────────────────────────────────────────────────────────

CHECKLIST:

□ CODE QUALITY
  □ Linting passes with zero warnings
  □ Type checking passes (if applicable)
  □ No console errors in browser
  □ No compiler warnings
  □ Code follows project conventions
  □ No debugging code left in

□ TESTING
  □ Unit tests for critical logic
  □ Integration tests for API endpoints
  □ E2E tests for critical user flows
  □ Test coverage meets threshold: [PROJECT_THRESHOLD]%
  □ All tests passing
  □ No skipped tests without documented reason

□ PERFORMANCE
  □ Lighthouse score ≥ [PROJECT_THRESHOLD]
  □ Core Web Vitals pass:
    □ LCP < 2.5s
    □ FID < 100ms
    □ CLS < 0.1
  □ Bundle size within budget: [PROJECT_BUDGET]
  □ API response times acceptable: < [PROJECT_THRESHOLD]ms
  □ No N+1 queries

□ DOCUMENTATION
  □ Code comments for complex logic
  □ API documentation updated (if API changed)
  □ README updated (if setup changed)
  □ Changelog entry added
  □ ADR created (if significant decision)

□ DEPLOYMENT READINESS
  □ Environment variables documented
  □ Database migrations ready and tested
  □ Feature flags configured (if applicable)
  □ Rollback plan defined and tested
  □ Monitoring in place

─────────────────────────────────────────────────────────────────────────────

PASS CRITERIA:
  All testing items required for critical paths
  90% overall required
  Performance thresholds are project-specific

FAILURE RESPONSE:
  Fix failing items before merge
  Do not merge with broken tests
  Do not merge with performance regressions
```

### 12.6 Gate 5: AI Verification

**Purpose:** Ensure AI-generated content is verified and trustworthy.

```
GATE 5: AI VERIFICATION
─────────────────────────────────────────────────────────────────────────────

GATE OWNER: Human reviewer (always human, never AI)

WHEN TO APPLY:
  ✅ All AI-assisted development
  ✅ AI-generated code
  ✅ AI-generated documentation
  ✅ AI-suggested solutions

─────────────────────────────────────────────────────────────────────────────

CHECKLIST:

□ HALLUCINATION CHECK
  □ All facts verified against source material
  □ Code references actual APIs/libraries (not invented)
  □ URLs and links validated (actually exist)
  □ Statistics and numbers confirmed
  □ Method/function names verified in docs
  □ No "confident but wrong" assertions

□ CONSISTENCY CHECK
  □ AI output consistent with project standards
  □ Terminology matches project glossary
  □ Style matches existing codebase
  □ No conflicting implementations introduced
  □ Patterns match established conventions

□ MULTI-MODEL VERIFICATION (for critical decisions)
  □ Query posed to multiple models (if applicable)
  □ Consensus points identified
  □ Divergences investigated
  □ Final decision documented with reasoning
  □ Disagreements resolved through testing

□ HUMAN REVIEW
  □ AI output reviewed by human before use
  □ Human understands what the code does
  □ Edge cases manually tested
  □ Business logic validated
  □ Sensitive content double-checked
  □ Human takes ownership of the code

□ GROUNDING CHECK
  □ AI had access to current codebase state
  □ AI read relevant files before making claims
  □ AI output based on actual project context
  □ No assumptions about code that wasn't read
  □ Context window contained relevant information

─────────────────────────────────────────────────────────────────────────────

PASS CRITERIA:
  All items required for user-facing AI output
  Human review is non-negotiable
  "AI wrote it" is not an excuse for bugs

FAILURE RESPONSE:
  Correct AI output before using
  Re-prompt with better context if needed
  Do not blindly trust AI output
```

### 12.7 Gate Application by Task Type

```
GATE APPLICATION MATRIX
─────────────────────────────────────────────────────────────────────────────

                    │ Gate 1  │ Gate 2  │ Gate 3  │ Gate 4  │ Gate 5  │
                    │ Vision  │  Tech   │ Design  │  Impl   │   AI    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
New feature         │   ✅    │   ✅    │   ✅    │   ✅    │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
Bug fix             │   ○     │   ✅    │   ○     │   ✅    │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
Refactor            │   ○     │   ✅    │   ○     │   ✅    │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
UI enhancement      │   ○     │   ○     │   ✅    │   ✅    │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
Infrastructure      │   ○     │   ✅    │   ○     │   ✅    │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
Documentation       │   ✅    │   ○     │   ○     │   ○     │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
Configuration       │   ○     │   ✅    │   ○     │   ✅    │  ✅*    │
────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
Security fix        │   ○     │   ✅    │   ○     │   ✅    │  ✅*    │
────────────────────┴─────────┴─────────┴─────────┴─────────┴─────────┘

LEGEND:
  ✅  = Required
  ○   = Optional / N/A
  ✅* = Required if AI-assisted
```

### 12.8 Gate Failure Protocol

When a gate fails, follow this protocol:

```
GATE FAILURE PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: STOP
─────────────────────────────────────────────────────────────────────────────
  • Do not proceed to next phase
  • Do not "we'll fix it later"
  • Do not make exceptions without documented approval

STEP 2: DOCUMENT
─────────────────────────────────────────────────────────────────────────────
  • Record which gate failed
  • Record which specific items failed
  • Record why they failed
  • Record who identified the failure

STEP 3: REMEDIATE
─────────────────────────────────────────────────────────────────────────────
  • Fix the failing items
  • Re-run the gate check
  • Get sign-off from gate owner
  • Only proceed when gate passes

STEP 4: LEARN
─────────────────────────────────────────────────────────────────────────────
  • If pattern emerges, add to Fix Ledger
  • Update process if systemic issue
  • Share learning with team
  • Consider adding automated check

─────────────────────────────────────────────────────────────────────────────

EXCEPTION PROCESS (Use Sparingly)
─────────────────────────────────────────────────────────────────────────────

If gate MUST be bypassed (genuine emergency only):

□ Document the bypass and detailed reason
□ Get explicit written approval from gate owner
□ Create ticket to remediate within 48 hours
□ Add to Fix Ledger as technical debt
□ Set calendar reminder to follow up
□ Track in project status

BYPASS APPROVAL AUTHORITY:
  Gate 1: Product owner
  Gate 2: Tech lead
  Gate 3: Design lead
  Gate 4: Tech lead
  Gate 5: Project lead

THINGS THAT ARE NOT EMERGENCIES:
  • "We're behind schedule"
  • "It's just a small thing"
  • "We'll fix it in the next sprint"
  • "No one will notice"
```

---

## PART III SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                   PART III: DOCUMENTATION & WORKFLOW                         │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  DOCUMENTATION HIERARCHY (5 Layers):                                         │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Layer 1: Blueprint      → Universal laws (this document)                   │
│  Layer 2: Superprompt    → Project-specific configuration                   │
│  Layer 3A: Architecture  → Technical design                                 │
│  Layer 3B: Design Spec   → Visual design system                             │
│  Layer 4: Implementation → Current tactical plan                            │
│  Layer 5: Verification   → Proof of work                                    │
│                                                                              │
│  PLAN-REFINE-EXECUTE:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Plan (20-30%):   Context → Requirements → Approach → Artifacts             │
│  Refine (10-20%): Review → Scope Lock → Preparation → Ready Check           │
│  Execute (50-70%): Implement → Validate → Quality Gates → Complete          │
│  Re-plan when:    Scope changes >20%, assumptions wrong, blocked            │
│                                                                              │
│  SLICE BUILD METHODOLOGY:                                                    │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Vertical slices > Horizontal layers                                         │
│  Complete flow: UI → State → API → Backend → Data → Feedback                │
│  Sizes: Micro (2-4h) → Small (0.5-1d) → Medium (1-3d) → Large (3-5d)       │
│  Golden Rule: If > 5 days, split into smaller slices                        │
│  Prioritize: User Value × Effort = Priority                                 │
│                                                                              │
│  QUALITY GATES (5-Gate System):                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Gate 1: Vision Alignment   → Does it serve the mission?                    │
│  Gate 2: Technical Sound    → Is it architecturally correct?                │
│  Gate 3: Design Excellence  → Does it meet UX standards?                    │
│  Gate 4: Implementation     → Is it tested and production-ready?            │
│  Gate 5: AI Verification    → Are AI outputs verified?                      │
│                                                                              │
│  CRITICAL RULES:                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Documentation is infrastructure, not afterthought                         │
│  • Higher layers win in conflicts                                            │
│  • Gates cannot be skipped, only marked N/A                                  │
│  • Human review is always required for AI output                             │
│  • Re-planning is success, not failure                                       │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
