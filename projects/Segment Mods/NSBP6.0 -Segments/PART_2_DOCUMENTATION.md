# NORTH STAR BLUEPRINT v6.0 — SEGMENT 2 of 7
## PART_2_DOCUMENTATION
### Contents: Part III (Sections 9-12) + Part IV (Sections 13-19)
### Lines: 3820-7150 of original
---
> **SEGMENT NAVIGATION:** This is a development segment. For full Blueprint, merge all 7 parts.
> For BRIDGE routing: Sections 9-19 are in this segment.
---

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

### 12.0 Vertical Slices vs. Horizontal Layers

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

## 12.9 CONTEXT MANAGEMENT

```text
CONTEXT COMPACTION RECOVERY PROTOCOL
──────────────────────────────────────────────────────────────────────────────

PROBLEM: Autocompaction (when Claude runs out of context and compresses the
         conversation) causes degraded results. Critical decisions, architectural
         context, and reasoning chains get lost.

RULE: Treat compaction as a session restart. Prevent it. When it happens, recover.

PREVENTION STRATEGY:
  1. Monitor context with /context command — know your % at a glance
  2. Customize status line to show context % always visible
  3. Use /clear liberally between distinct tasks (not just when stuck)
  4. Start new sessions for new tasks — don't stretch one session too long
  5. Aim to complete each RPIT loop within a single session

RECOVERY PROTOCOL (when compaction occurs):
  Step 1: Don't continue — compacted sessions compound errors
  
  Step 2: Start a fresh session
  
  Step 3: Load context from structured artifacts (not conversation):
    "We just had compaction. Reload context:
     1. Read claude.md
     2. Read plan.md for current feature
     3. Read git log --oneline -10
     4. Run the tests to see current state
     Tell me what you understand about where we were."
  
  Step 4: Verify Claude's understanding before continuing
    If Claude is missing context: have it read the relevant source files
    If Claude seems confused: re-brief explicitly
  
  Step 5: Continue from a clean state — don't try to "resume"

ARTIFACTS THAT SURVIVE COMPACTION:
  These are your continuity lifeline. Always keep them current:
  ✓ claude.md — project context
  ✓ plan.md — current feature plan with completed steps checked off
  ✓ architecture.md — system understanding
  ✓ git log — what actually happened
  ✓ test results — current pass/fail state

ANTI-PATTERN: Trying to summarize what happened to Claude after compaction.
              Always restore context from files, not conversation summaries.
              Files are ground truth. Conversation is ephemeral.

CONTEXT BUDGET GUIDELINES:
  ┌────────────────────────────────────────────────────────────────────────┐
  │  Context %  │  Action                                                  │
  ├────────────────────────────────────────────────────────────────────────┤
  │  0-50%      │  Normal operation                                        │
  │  50-70%     │  Finish current task, then /clear or new session         │
  │  70-85%     │  Finish current step ONLY, immediately start new session │
  │  85%+       │  STOP. New session NOW. Do not proceed.                  │
  └────────────────────────────────────────────────────────────────────────┘
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
# PART IV: AI ORCHESTRATION & INTELLIGENCE

---

## 13. MODEL INTELLIGENCE MATRIX

> "The difference between amateur and professional AI development is not the tools—it's the orchestration."

### 13.1 Model Selection Philosophy

Not all AI models are created equal. Each has strengths, weaknesses, and optimal use cases. The professional AI orchestrator understands these differences and routes tasks accordingly.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      MODEL INTELLIGENCE MATRIX                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  MODEL CLASS          STRENGTHS                 OPTIMAL USE CASES            │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  FRONTIER CLASS                                                              │
│  (Claude Opus, GPT-4, Gemini Ultra)                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Deepest reasoning                      • Complex architecture decisions  │
│  • Nuanced understanding                  • Multi-step planning             │
│  • Best at ambiguous tasks                • Creative problem solving        │
│  • Highest quality output                 • Code review and analysis        │
│  • Most expensive                         • Critical business logic         │
│  • Slower response                        • System design                   │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  BALANCED CLASS                                                              │
│  (Claude Sonnet, GPT-4o, Gemini Pro)                                        │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Strong reasoning                       • Day-to-day development          │
│  • Good speed/quality balance             • Feature implementation          │
│  • Cost-effective                         • Debugging                       │
│  • Reliable output                        • Documentation writing           │
│  • Good context handling                  • Test generation                 │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  SPEED CLASS                                                                 │
│  (Claude Haiku, GPT-4o-mini, Gemini Flash)                                  │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Fastest response                       • Quick lookups                   │
│  • Lowest cost                            • Simple transformations          │
│  • High throughput                        • Syntax checks                   │
│  • Good for simple tasks                  • Formatting tasks                │
│  • May miss nuance                        • Bulk operations                 │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  SPECIALIZED CLASS                                                           │
│  (Code-specific, Vision, Embedding models)                                   │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Domain expertise                       • Specific task types             │
│  • Optimized performance                  • Image analysis                  │
│  • May lack generality                    • Code completion                 │
│  • Task-specific accuracy                 • Semantic search                 │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 13.2 Model Selection Decision Tree

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    MODEL SELECTION DECISION TREE                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                              START                                           │
│                                │                                             │
│                                ▼                                             │
│                    ┌─────────────────────┐                                  │
│                    │ Is this a critical  │                                  │
│                    │ decision with high  │                                  │
│                    │ stakes?             │                                  │
│                    └──────────┬──────────┘                                  │
│                               │                                             │
│              ┌────────────────┼────────────────┐                            │
│              │ YES            │                │ NO                         │
│              ▼                │                ▼                            │
│    ┌─────────────────┐        │      ┌─────────────────┐                   │
│    │ FRONTIER CLASS  │        │      │ Is speed more   │                   │
│    │ + Multi-model   │        │      │ important than  │                   │
│    │   verification  │        │      │ depth?          │                   │
│    └─────────────────┘        │      └────────┬────────┘                   │
│                               │               │                            │
│                               │    ┌──────────┼──────────┐                 │
│                               │    │ YES      │          │ NO              │
│                               │    ▼          │          ▼                 │
│                               │  ┌────────────┴───┐  ┌─────────────────┐   │
│                               │  │ Is it a simple │  │ BALANCED CLASS  │   │
│                               │  │ task?          │  │ (Default choice)│   │
│                               │  └───────┬────────┘  └─────────────────┘   │
│                               │          │                                  │
│                               │   ┌──────┴──────┐                          │
│                               │   │ YES   │ NO  │                          │
│                               │   ▼       ▼     │                          │
│                               │ ┌───────┐ ┌─────┴─────┐                    │
│                               │ │ SPEED │ │ BALANCED  │                    │
│                               │ │ CLASS │ │ CLASS     │                    │
│                               │ └───────┘ └───────────┘                    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  DEFAULT ROUTING:                                                            │
│  • If unsure → BALANCED CLASS                                               │
│  • For production code → BALANCED or FRONTIER                               │
│  • For exploration → SPEED CLASS is fine                                    │
│  • For architecture → FRONTIER CLASS required                               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 13.3 Task-to-Model Mapping

```
TASK-TO-MODEL MAPPING TABLE
─────────────────────────────────────────────────────────────────────────────

TASK TYPE                          │ RECOMMENDED MODEL CLASS
───────────────────────────────────┼─────────────────────────────────────────
                                   │
PLANNING & ARCHITECTURE            │
───────────────────────────────────┼─────────────────────────────────────────
System design                      │ Frontier
Architecture decisions             │ Frontier + Multi-model
Database schema design             │ Frontier
API contract design                │ Balanced → Frontier
Technology selection               │ Frontier + Multi-model
                                   │
IMPLEMENTATION                     │
───────────────────────────────────┼─────────────────────────────────────────
Feature implementation             │ Balanced
Component creation                 │ Balanced
API endpoint coding                │ Balanced
Bug fixing (simple)                │ Balanced
Bug fixing (complex)               │ Frontier
Refactoring                        │ Balanced
                                   │
REVIEW & ANALYSIS                  │
───────────────────────────────────┼─────────────────────────────────────────
Code review                        │ Frontier
Security review                    │ Frontier + Specialized
Performance analysis               │ Balanced
Dependency audit                   │ Balanced
                                   │
DOCUMENTATION                      │
───────────────────────────────────┼─────────────────────────────────────────
Technical documentation            │ Balanced
User documentation                 │ Balanced
API documentation                  │ Balanced
README creation                    │ Balanced
                                   │
TESTING                            │
───────────────────────────────────┼─────────────────────────────────────────
Unit test generation               │ Balanced
Integration test generation        │ Balanced
E2E test generation                │ Balanced
Test case ideation                 │ Frontier
                                   │
OPERATIONS                         │
───────────────────────────────────┼─────────────────────────────────────────
Formatting/linting                 │ Speed
Simple transformations             │ Speed
Bulk operations                    │ Speed
Quick lookups                      │ Speed
Error message generation           │ Speed
```

### 13.4 Cost-Quality Trade-off Matrix

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    COST-QUALITY TRADE-OFF MATRIX                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                              QUALITY REQUIRED                                │
│                    Low         Medium         High                           │
│              ┌─────────────────────────────────────────────┐                │
│              │              │              │               │                │
│    High      │   OVERKILL   │   CONSIDER   │   FRONTIER    │                │
│    Budget    │   Use lower  │   Frontier   │   CLASS       │                │
│              │   tier       │   or multi   │   Required    │                │
│    ──────────┼──────────────┼──────────────┼───────────────┤                │
│    B         │              │              │               │                │
│    U  Medium │   SPEED      │   BALANCED   │   BALANCED    │                │
│    D         │   CLASS      │   CLASS      │   + Review    │                │
│    G  ───────┼──────────────┼──────────────┼───────────────┤                │
│    E         │              │              │               │                │
│    T  Low    │   SPEED      │   SPEED +    │   RE-SCOPE    │                │
│              │   CLASS      │   Validation │   or wait     │                │
│              └─────────────────────────────────────────────┘                │
│                                                                              │
│  KEY INSIGHT:                                                                │
│  The goal is not to minimize cost—it's to maximize value per token.         │
│  Using a cheaper model that produces wrong output costs more in rework.     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 14. THE CORE 4 PRIMITIVES

Every AI interaction can be decomposed into four fundamental capabilities. Understanding these enables effective orchestration.

## 14.1 THREE-LEVEL RULES INHERITANCE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      RULES HIERARCHY (RAPS Model)                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  LEVEL 1: GLOBAL RULES                                                       │
│  ═══════════════════════════════════════════════════════════════════════    │
│  Location: ~/.config/[ide]/global-rules.md or equivalent                    │
│  Scope: ALL projects, ALL sessions                                          │
│  Contains:                                                                   │
│    • Universal coding standards                                              │
│    • Default confidence/autonomy settings                                    │
│    • Cross-project tool configurations                                       │
│    • Personal preferences and communication style                            │
│                                                                              │
│  LEVEL 2: WORKSPACE RULES                                                    │
│  ═══════════════════════════════════════════════════════════════════════    │
│  Location: /workspace/.rules or workspace-level config                      │
│  Scope: All projects within workspace/organization                          │
│  Contains:                                                                   │
│    • Team conventions                                                        │
│    • Shared tool configurations (MCP servers, APIs)                          │
│    • Organization-specific patterns                                          │
│    • Compliance requirements                                                 │
│                                                                              │
│  LEVEL 3: PROJECT RULES                                                      │
│  ═══════════════════════════════════════════════════════════════════════    │
│  Location: /project/claude.md, .cursorrules, etc.                           │
│  Scope: Single project only                                                  │
│  Contains:                                                                   │
│    • Project-specific stack decisions                                        │
│    • Current phase and state                                                 │
│    • Fix Ledger references                                                   │
│    • Deviation log                                                           │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  INHERITANCE RULE: Project > Workspace > Global                              │
│  (More specific rules override more general rules)                           │
│                                                                              │
│  CONFLICT RESOLUTION:                                                        │
│  • If conflict detected, PROJECT rules win                                   │
│  • Log deviation from Global/Workspace in project's Deviation Log            │
│  • Never silently override—always document                                   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 14.2 FOUR AGENT ARCHETYPES

When operating in multi-agent or parallel workflows, recognize these role patterns:

```
AGENT ARCHETYPES (for P-Thread / Multi-Agent Scenarios)
─────────────────────────────────────────────────────────────────────────────

┌─────────────────┐     ┌─────────────────┐
│  DESIGN LEAD    │     │    BUILDER      │
│  ─────────────  │     │  ─────────────  │
│  • Architecture │     │  • Implements   │
│  • Decisions    │     │  • Writes code  │
│  • Trade-offs   │     │  • Creates PRs  │
│  • Standards    │     │  • Executes     │
└─────────────────┘     └─────────────────┘

┌─────────────────┐     ┌─────────────────┐
│   QC / NERD     │     │   RESEARCH      │
│  ─────────────  │     │  ─────────────  │
│  • Reviews      │     │  • Investigates │
│  • Tests        │     │  • Documents    │
│  • Validates    │     │  • Explores     │
│  • Quality gates│     │  • Options      │
└─────────────────┘     └─────────────────┘

SINGLE-AGENT MODE:
When operating alone, cycle through these roles:
1. Research → Understand the problem space
2. Design Lead → Make architectural decisions
3. Builder → Implement the solution
4. QC/Nerd → Verify and test

MULTI-AGENT MODE:
When parallelizing, assign archetypes explicitly:
• P-Thread A: Builder (implements Feature X)
• P-Thread B: Builder (implements Feature Y)
• Supervisor: Design Lead (coordinates, resolves conflicts)
• Final Pass: QC/Nerd (validates all outputs)
```

### 14.2.1 Parallel Agent Orchestration

```text
╔══════════════════════════════════════════════════════════════════════════════╗
║              PARALLEL AGENT ORCHESTRATION — COMPLETE PLAYBOOK               ║
╚══════════════════════════════════════════════════════════════════════════════╝

CAPABILITY: Multi-Claude + Git Worktrees = a week of features in hours.
STATUS: Table stakes as of February 2026. All major AI tools now ship this.
NS RECOMMENDATION: Start with 2-3 agents, scale as you get comfortable.

────────────────────────────────────────────────────────────────────────────────

GIT WORKTREES — THE ISOLATION PRIMITIVE

Git worktrees let you have multiple working copies of the same repo, each on
a different branch, sharing the same git history. This is how you run multiple
Claude sessions safely without collision.

BUILT-IN SUPPORT:
  claude --worktree        # Creates new worktree automatically
  claude -w                # Shorthand

WHAT HAPPENS:
  → New directory: .claude/worktrees/<branch-name>/
  → Fresh branch off current HEAD
  → Isolated file state (changes in worktree don't affect main checkout)
  → Each Claude session only sees its own worktree

DESKTOP APP METHOD:
  → New Session → check "Use worktree" option
  → App manages worktree creation, monitoring, and cleanup

────────────────────────────────────────────────────────────────────────────────

MULTI-CLAUDE ORCHESTRATION PLAYBOOK

  STEP 1: DECOMPOSE
    Identify which features/tasks are truly independent (no shared files)
    
    ✓ Feature A modifies: src/auth/, tests/auth/
    ✓ Feature B modifies: src/payments/, tests/payments/
    ✓ Feature C modifies: src/notifications/, tests/notifications/
    ✗ Feature D requires Feature A to complete first → sequential, not parallel

  STEP 2: BRIEF EACH AGENT
    Each agent needs a complete brief before starting. Template:
    
    "You are working on [Feature Name] in your isolated worktree.
     Issue: #[number] — read it via GitHub CLI before starting.
     Files you own: [list]
     Files you must NOT touch: [list]
     Success criteria: [measurable criteria from plan.md]
     When done: run tests, then 'gh pr create --title "[title]" --body "[body]'"
     Use RPIT loop. Start with plan.md before any code."

  STEP 3: LAUNCH
    # Terminal approach
    claude -w  # Session 1: Feature A
    claude -w  # Session 2: Feature B (in new terminal tab)
    claude -w  # Session 3: Feature C (in new terminal tab)
    
    # Desktop App approach
    New Session → worktree ✓ → brief Feature A
    New Session → worktree ✓ → brief Feature B
    New Session → worktree ✓ → brief Feature C

  STEP 4: MONITOR
    → Check Desktop App sidebar for session status
    → Each session shows current task and context %
    → Sessions can run overnight; check PRs in the morning

  STEP 5: REVIEW AND MERGE
    → Review each PR independently
    → Merge in dependency order (if any)
    → Delete worktrees after merge: git worktree remove <path>

────────────────────────────────────────────────────────────────────────────────

ANTI-PATTERNS TO AVOID

  ❌ Shared file ownership between parallel agents
     → Two agents editing the same file = merge conflicts

  ❌ Launching too many agents before establishing test suites
     → Without tests, you can't verify each agent's work independently

  ❌ No success criteria per agent
     → Agents without clear success criteria wander

  ❌ Not using worktrees
     → Two sessions on the same branch will corrupt each other

────────────────────────────────────────────────────────────────────────────────

CONTEXT: WHERE THIS SITS IN YOUR WORKFLOW

  SINGLE FEATURE:     1 Claude + RPIT Loop
  MULTIPLE FEATURES:  Multi-Claude + Worktrees + RPIT per agent
  COMPLEX FEATURE:    Planner/Worker/Judge hierarchy (ENH-011)
  OVERNIGHT BUILDS:   Multi-Claude + RALPH Loop + GitHub Action
```

### 14.2.2 Agent Teams Pattern

```text
AGENT TEAMS — COORDINATED SPECIALIZED ROLES
──────────────────────────────────────────────────────────────────────────────

DISTINCTION: Agent Teams ≠ Multi-Clouding

  Multi-Clouding: Parallel agents working on DIFFERENT features independently
  Agent Teams:    Coordinated agents working on the SAME feature together

Agent Teams is Claude Code's newest capability. It splits complex work across
specialized instances that coordinate via a shared task list and messaging system.

IDEAL USE CASE: A large feature with clean role separation
  → Frontend Agent (owns: src/components/, src/pages/)
  → Backend Agent (owns: src/api/, src/services/, src/db/)
  → Testing Agent (owns: tests/, e2e/, writes tests for both other agents)

COORDINATION MECHANISM:
  → Shared task list (agents see each other's progress)
  → Messaging system (agents can request artifacts from each other)
  → Optional: worktree isolation per agent to prevent conflicts

SETUP:
  "Create an agent team for [feature]. Roles:
   - frontend-agent: implements UI components and pages
   - backend-agent: implements API endpoints and services
   - test-agent: writes tests for all code produced
   Each agent owns distinct files (see plan.md for file assignments).
   backend-agent completes API contracts before frontend-agent begins."

WORKTREE ISOLATION FOR TEAMS:
  By default, agent teammates share working directory → risk of conflicts.
  Add worktree isolation: each teammate gets its own repo copy.
  
  "Set up agent team with worktree isolation enabled."

WHEN TO USE VS. MULTI-CLOUDING:
  
  Use AGENT TEAMS when:
    ✓ Agents need to coordinate (frontend needs backend API contract)
    ✓ Work has clear role specialization within one feature
    ✓ You want built-in inter-agent communication
  
  Use MULTI-CLOUDING when:
    ✓ Features are truly independent (no coordination needed)
    ✓ You want maximum simplicity
    ✓ Features can be reviewed as isolated PRs
```

---

## 14.3 THREAD-BASED THINKING MODEL

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         THREAD TYPES                                         │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  BASE THREAD (Single Prompt → Work → Review)                                 │
│  ───────────────────────────────────────────────────────────────────────    │
│  Prompt → Agent works → Human reviews → Done                                 │
│  Use for: Simple, contained tasks                                            │
│                                                                              │
│  P-THREAD (Parallel)                                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│       ┌─► Thread A ─┐                                                        │
│  Start┼─► Thread B ─┼─► Merge → Done                                         │
│       └─► Thread C ─┘                                                        │
│  Use for: Independent tasks (e.g., multiple components)                      │
│                                                                              │
│  C-THREAD (Chained)                                                          │
│  ───────────────────────────────────────────────────────────────────────    │
│  Phase 1 → Checkpoint → Phase 2 → Checkpoint → Phase 3 → Done                │
│  Use for: Sequential dependencies, quality gates between phases              │
│                                                                              │
│  F-THREAD (Fusion / Best-of-N)                                               │
│  ───────────────────────────────────────────────────────────────────────    │
│  Same prompt → N agents → Compare outputs → Select best → Done               │
│  Use for: Creative tasks, critical decisions, architecture                   │
│                                                                              │
│  B-THREAD (Big / Meta with Sub-Agents)                                       │
│  ───────────────────────────────────────────────────────────────────────    │
│  Supervisor agent spawns sub-agents for sub-tasks                            │
│  Sub-agents report back, supervisor synthesizes                              │
│  Use for: Complex projects, multi-component systems                          │
│                                                                              │
│  L-THREAD (Long-Duration Autonomous)                                         │
│  ───────────────────────────────────────────────────────────────────────    │
│  Agent runs for extended period (hours/days)                                 │
│  Checkpoints periodically, human reviews at milestones                       │
│  Use for: Large codebases, extensive refactoring, migrations                 │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  EFFICIENCY METRICS (What "Better" Means):                                   │
│  • More threads = More parallelism                                           │
│  • Longer threads = More work per human intervention                         │
│  • Thicker threads = More tool calls per thread                              │
│  • Fewer checkpoints = Higher autonomy (when appropriate)                    │
│                                                                              │
│  GOAL: Z-THREAD (Zero-Touch) for routine tasks                               │
│  Human only involved at start (requirements) and end (acceptance)            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 14.4 SELF-HEALING WORKFLOW PATTERN

```
SELF-HEALING LOOP (PCE Framework Integration)
─────────────────────────────────────────────────────────────────────────────

       ┌────────────────────────────────────────────────┐
       │                                                │
       ▼                                                │
  ┌─────────┐     ┌─────────┐     ┌─────────┐    ┌─────┴─────┐
  │ EXECUTE │────►│  CHECK  │────►│  FAIL?  │───►│ AUTO-FIX  │
  └─────────┘     └─────────┘     └────┬────┘    └───────────┘
                                       │ PASS
                                       ▼
                                  ┌─────────┐
                                  │  DONE   │
                                  └─────────┘

IMPLEMENTATION:
─────────────────────────────────────────────────────────────────────────────
1. EXECUTE: Run the planned action (code, command, API call)
2. CHECK: Verify outcome matches expectation
3. IF FAIL:
   a. Capture error context (message, stack trace, state)
   b. Analyze error type (syntax, runtime, logic, external)
   c. Generate fix hypothesis
   d. Apply fix
   e. RETURN TO EXECUTE (max 3 iterations per error type)
4. IF PASS: Proceed to next action

CIRCUIT BREAKER:
─────────────────────────────────────────────────────────────────────────────
After 3 failed fix attempts on same error:
  □ STOP automated fixing
  □ Document in Fix Ledger
  □ Escalate to human (drop autonomy level)
  □ This IS the Ilya's Loop prevention (NS Section 7)

LOGGING REQUIREMENT:
─────────────────────────────────────────────────────────────────────────────
Every self-healing cycle must log:
  • Original error
  • Fix attempted
  • Outcome (success/fail)
  • Iteration count
```

---

## 14.5 PLAN MODE PROTOCOL

```
PLAN MODE (Question-Asking Before Building)
─────────────────────────────────────────────────────────────────────────────

PRINCIPLE: Asking good questions BEFORE building produces better outcomes
           than fixing problems AFTER building.

WHEN TO ENTER PLAN MODE:
─────────────────────────────────────────────────────────────────────────────
□ Starting a new feature or component
□ Requirements are ambiguous
□ Multiple valid approaches exist
□ Stakes are high (architecture, security, data)
□ Autonomy level is 1-4 (Suggest/Draft)

PLAN MODE SEQUENCE:
─────────────────────────────────────────────────────────────────────────────
1. UNDERSTAND
   • Restate the requirement in your own words
   • Identify what you know vs. what you assume
   • List explicit constraints

2. QUESTION
   • Ask clarifying questions (max 3-5)
   • Prioritize questions that would change approach
   • Don't ask questions you can answer from context

3. PROPOSE
   • Present 2-3 approaches with trade-offs
   • State confidence level for each
   • Recommend one with rationale

4. CONFIRM
   • Wait for human approval on approach
   • Document decision (in claude.md or ADR)
   • THEN proceed to execution

SKIP PLAN MODE WHEN:
─────────────────────────────────────────────────────────────────────────────
• Autonomy level is 5-7 (Execute/Autonomous)
• Task is well-understood and routine
• Pattern exists in Fix Ledger or codebase
• Human has pre-approved approach
```

---

## 14.6 PERMISSION ARCHITECTURE AWARENESS

```
PERMISSION LAYERS (Cowork/Computer Use Readiness)
─────────────────────────────────────────────────────────────────────────────

As agents gain OS-level capabilities (file system, browser, applications),
permission awareness becomes critical.

PERMISSION CATEGORIES:
─────────────────────────────────────────────────────────────────────────────

┌─────────────────────────────────────────────────────────────────────────┐
│  READ         │ View files, read configs, access docs                   │
│  WRITE        │ Create/modify files, update configs                     │
│  EXECUTE      │ Run commands, scripts, applications                     │
│  NETWORK      │ Make HTTP requests, access external services            │
│  SYSTEM       │ OS-level operations, install packages                   │
└─────────────────────────────────────────────────────────────────────────┘

SANDBOXING AWARENESS:
─────────────────────────────────────────────────────────────────────────────
• Assume sandboxed unless explicitly told otherwise
• Request minimum permissions needed for task
• Document permission requirements in task plan
• Never assume credentials are available—use proxying patterns

CONSEQUENTIAL ACTION GATES:
─────────────────────────────────────────────────────────────────────────────
Before executing consequential real-world actions:
□ Confirm human approval (reduce autonomy to Level 3-4)
□ Verify rollback path exists
□ Log action intent before execution
□ Capture before/after state

CONSEQUENTIAL ACTIONS INCLUDE:
  • Sending emails or messages
  • Making purchases or financial transactions
  • Modifying production systems
  • Deleting data
  • Publishing content
  • Interacting with external APIs with side effects
```

---

## 14.7 INTEGRATION WITH NS-MBF ECOSYSTEM

```
CROSS-REFERENCE: Agent Operation Patterns
─────────────────────────────────────────────────────────────────────────────

This Section 14 integrates with:

NS SECTIONS:
  • Section 17: Confidence Calibration → Use when reporting certainty
  • Section 18: Autonomy Dial → Use when determining independence level
  • Section 20: Memory Architecture → Use for context management
  • Section 23: Handoff Protocols → Use when transitioning sessions

MBF CATEGORIES:
  • Category 30: Autonomous Agents → Agent framework options
  • Category 31: MCPs & Tool Registries → Tool definition patterns
  • Category 40: Code Generation → AI coding assistant patterns
  • Category 45: Browser & Web Automation → Computer Use patterns

BRIDGE.MD ROUTING:
  "Need agent operation guidance" → This Section 14
  "Need agent technology options" → MBF Categories 29-35
  "Need orchestration methodology" → NS Part IV-V
```

---

### 14.7.4 The Code Cleanup Protocol (Claude Code)

```
CODE SIMPLIFICATION — Post-Session Cleanup
─────────────────────────────────────────────────────────────────────────────
After completing significant coding work, run the code-simplifier agent:
INSTALLATION (one-time):
claude plugin install code-simplifier
INVOCATION:
"Use the code-simplifier agent to clean up the code I just wrote"
WHEN TO RUN:
✓ End of long coding sessions
✓ Before merging complex PRs
✓ After major feature implementations
✓ Before code review
WHY IT MATTERS:
AI agents prioritize correctness, which often produces verbose code.
The simplifier preserves functionality while improving clarity.
• 20-30% reduction in token usage
• Clearer, more maintainable code
• Follows your CLAUDE.md conventions
• Same tool Anthropic uses internally
WHAT IT DOES:
• Removes unnecessary complexity
• Improves naming and organization
• Eliminates over-engineering
• Preserves exact functionality (NEVER changes what code does)
BEST PRACTICE:
Run in a git-tracked directory so you can review and revert if needed.
Always review changes before committing.
```

---

## 15. TOOL HIERARCHY & COMPOSITION

### 15.1 Tool Classification

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         TOOL HIERARCHY                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  TIER 1: FOUNDATIONAL TOOLS                                                  │
│  ───────────────────────────────────────────────────────────────────────    │
│  Core capabilities that all AI systems need.                                │
│                                                                              │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐           │
│  │ File Read   │ │ File Write  │ │   Search    │ │   Execute   │           │
│  │             │ │             │ │             │ │             │           │
│  │ Read any    │ │ Create/edit │ │ Find files  │ │ Run shell   │           │
│  │ file type   │ │ files       │ │ and content │ │ commands    │           │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘           │
│                                                                              │
│  TIER 2: DEVELOPMENT TOOLS                                                   │
│  ───────────────────────────────────────────────────────────────────────    │
│  Specialized tools for software development workflows.                      │
│                                                                              │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐           │
│  │    Git      │ │   Linter    │ │    Test     │ │   Build     │           │
│  │             │ │             │ │   Runner    │ │             │           │
│  │ Version     │ │ Code        │ │ Execute     │ │ Compile/    │           │
│  │ control     │ │ quality     │ │ tests       │ │ bundle      │           │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘           │
│                                                                              │
│  TIER 3: INTEGRATION TOOLS (MCPs)                                            │
│  ───────────────────────────────────────────────────────────────────────    │
│  External system integrations via Model Context Protocol.                   │
│                                                                              │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐           │
│  │  Database   │ │   Browser   │ │    API      │ │   Cloud     │           │
│  │    MCP      │ │    MCP      │ │    MCP      │ │    MCP      │           │
│  │             │ │             │ │             │ │             │           │
│  │ Query/      │ │ Navigate/   │ │ Call        │ │ Deploy/     │           │
│  │ modify DB   │ │ automate    │ │ external    │ │ provision   │           │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘           │
│                                                                              │
│  TIER 4: ORCHESTRATION TOOLS                                                 │
│  ───────────────────────────────────────────────────────────────────────    │
│  Meta-tools that coordinate other tools and agents.                         │
│                                                                              │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐           │
│  │  Sub-Agent  │ │   Workflow  │ │   Memory    │ │  Scheduler  │           │
│  │  Spawner    │ │   Engine    │ │   Manager   │ │             │           │
│  │             │ │             │ │             │ │             │           │
│  │ Create      │ │ Multi-step  │ │ Persist     │ │ Time-based  │           │
│  │ sub-agents  │ │ automation  │ │ context     │ │ triggers    │           │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 15.2 Tool Selection Principles

```
TOOL SELECTION PRINCIPLES
─────────────────────────────────────────────────────────────────────────────

PRINCIPLE 1: USE THE SIMPLEST TOOL THAT WORKS
─────────────────────────────────────────────────────────────────────────────
Don't use a database MCP when a file read will do.
Don't spawn a sub-agent for a simple task.
Simpler tools = fewer failure points = faster execution.

PRINCIPLE 2: VERIFY TOOL AVAILABILITY BEFORE USE
─────────────────────────────────────────────────────────────────────────────
Check that the tool exists in current context.
Check that the tool is properly configured.
Don't assume tools from other contexts are available.

PRINCIPLE 3: PREFER COMPOSABLE TOOLS
─────────────────────────────────────────────────────────────────────────────
Tools that do one thing well and combine easily.
Avoid monolithic tools that try to do everything.
Build complex workflows from simple primitives.

PRINCIPLE 4: HANDLE TOOL FAILURES GRACEFULLY
─────────────────────────────────────────────────────────────────────────────
Every tool call can fail.
Have fallback approaches ready.
Report failures clearly with context.

PRINCIPLE 5: MINIMIZE TOOL CALLS
─────────────────────────────────────────────────────────────────────────────
Each tool call has latency cost.
Batch operations where possible.
Cache results when appropriate.
```

### 15.3 Tool Composition Patterns

```
TOOL COMPOSITION PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN 1: SEQUENTIAL PIPELINE
─────────────────────────────────────────────────────────────────────────────
Tool A output → Tool B input → Tool C input → Final output

Example: Read file → Lint → Format → Write file

Use when: Each step transforms the previous output


PATTERN 2: PARALLEL EXECUTION
─────────────────────────────────────────────────────────────────────────────
              ┌─► Tool A ─┐
Input ───────►├─► Tool B ─├───► Combine outputs
              └─► Tool C ─┘

Example: Read multiple files simultaneously

Use when: Steps are independent and can run concurrently


PATTERN 3: CONDITIONAL BRANCHING
─────────────────────────────────────────────────────────────────────────────
              ┌─► Tool A (if condition)
Input → Check ┤
              └─► Tool B (else)

Example: If TypeScript file → TSC check, else → Syntax check

Use when: Different tools needed based on input characteristics


PATTERN 4: RETRY WITH FALLBACK
─────────────────────────────────────────────────────────────────────────────
Tool A → if fails → Tool A (retry) → if fails → Tool B (fallback)

Example: API call → retry with backoff → fallback to cached data

Use when: Reliability is critical and alternatives exist


PATTERN 5: VERIFICATION LOOP
─────────────────────────────────────────────────────────────────────────────
          ┌──────────────────────────┐
          │                          │
          ▼                          │
Create → Verify → if fails → Modify ─┘
          │
          └─► if passes → Done

Example: Generate code → Run tests → Fix failures → Repeat

Use when: Output must meet specific criteria
```

---

## 16. CONTEXT ENGINEERING PROTOCOL

### 16.1 Context Window Management

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     CONTEXT ENGINEERING                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  The context window is a FINITE, PRECIOUS resource.                         │
│  Every token matters. Waste nothing.                                        │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  CONTEXT BUDGET ALLOCATION                                                   │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                                                                      │    │
│  │  ████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │    │
│  │  │              │                                                │    │
│  │  │   System     │              Available for                     │    │
│  │  │   Context    │              Task Context                      │    │
│  │  │   (15-25%)   │              (75-85%)                          │    │
│  │  │              │                                                │    │
│  │  └──────────────┴────────────────────────────────────────────────┘    │
│  │                                                                      │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  SYSTEM CONTEXT (15-25%):                                                    │
│  • Blueprint principles (condensed)                                          │
│  • Project-specific rules (Superprompt)                                      │
│  • Current phase context                                                     │
│  • Critical constraints                                                      │
│                                                                              │
│  TASK CONTEXT (75-85%):                                                      │
│  • Relevant code files                                                       │
│  • Documentation needed                                                      │
│  • Conversation history                                                      │
│  • Tool outputs                                                              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 16.2 Context Loading Strategy

```
CONTEXT LOADING STRATEGY
─────────────────────────────────────────────────────────────────────────────

STEP 1: LOAD ESSENTIAL CONTEXT FIRST
─────────────────────────────────────────────────────────────────────────────
Priority order:
1. Current task requirements (what needs to be done)
2. Directly relevant code (files being modified)
3. Type definitions and interfaces
4. Related tests
5. Documentation for dependencies
6. Historical context (if relevant)

STEP 2: LOAD ON-DEMAND
─────────────────────────────────────────────────────────────────────────────
Don't load everything upfront:
• Load files as needed
• Use search to find relevant content
• Request specific sections, not entire files
• Summarize large documents

STEP 3: PRUNE AGGRESSIVELY
─────────────────────────────────────────────────────────────────────────────
Remove context that's no longer needed:
• Completed sub-tasks
• Resolved discussions
• Superseded information
• Verbose explanations (replace with summaries)

STEP 4: COMPRESS WHEN POSSIBLE
─────────────────────────────────────────────────────────────────────────────
• Summarize long conversations
• Extract key decisions from discussions
• Reference files by path instead of full content
• Use structured formats over prose
```

### 16.3 Context Priority Matrix

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      CONTEXT PRIORITY MATRIX                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PRIORITY │ CONTEXT TYPE              │ INCLUDE WHEN                        │
│  ─────────┼───────────────────────────┼─────────────────────────────────────│
│           │                           │                                     │
│  P0       │ Task requirements         │ ALWAYS                              │
│  CRITICAL │ Error messages            │ ALWAYS (when debugging)             │
│           │ Critical constraints      │ ALWAYS                              │
│           │                           │                                     │
│  ─────────┼───────────────────────────┼─────────────────────────────────────│
│           │                           │                                     │
│  P1       │ Files being modified      │ ALWAYS                              │
│  HIGH     │ Type definitions          │ When writing code                   │
│           │ Test files                │ When modifying tested code          │
│           │ API contracts             │ When working with APIs              │
│           │                           │                                     │
│  ─────────┼───────────────────────────┼─────────────────────────────────────│
│           │                           │                                     │
│  P2       │ Related files             │ When patterns needed                │
│  MEDIUM   │ Documentation             │ When clarification needed           │
│           │ Previous conversation     │ When continuity needed              │
│           │ Fix Ledger entries        │ When debugging                      │
│           │                           │                                     │
│  ─────────┼───────────────────────────┼─────────────────────────────────────│
│           │                           │                                     │
│  P3       │ Style guides              │ Reference, not full inclusion       │
│  LOW      │ Full file listings        │ Search instead of loading           │
│           │ Historical decisions      │ Only when directly relevant         │
│           │ Verbose logs              │ Summarize instead                   │
│           │                           │                                     │
│  ─────────┼───────────────────────────┼─────────────────────────────────────│
│           │                           │                                     │
│  P4       │ Unrelated files           │ NEVER                               │
│  EXCLUDE  │ Binary files              │ NEVER                               │
│           │ Generated code            │ NEVER (unless debugging it)         │
│           │ Duplicate information     │ NEVER                               │
│           │                           │                                     │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 16.4 Context Refresh Protocol

```
CONTEXT REFRESH PROTOCOL
─────────────────────────────────────────────────────────────────────────────

WHEN TO REFRESH CONTEXT:
─────────────────────────────────────────────────────────────────────────────
□ Starting a new task
□ Task scope changes significantly
□ External files have been modified
□ Context feels stale or confusing
□ AI responses suggest outdated understanding
□ Switching between features/areas
□ After significant time gap (> 1 hour)

HOW TO REFRESH:
─────────────────────────────────────────────────────────────────────────────
1. Summarize what's been accomplished
2. Clear task-specific context
3. Re-read essential files fresh
4. Verify current state of code
5. Confirm current requirements
6. Resume with clean context

INDICATORS CONTEXT NEEDS REFRESH:
─────────────────────────────────────────────────────────────────────────────
• AI refers to code that no longer exists
• AI suggests changes already made
• AI seems confused about current state
• AI gives inconsistent answers
• AI misses obvious context
• Conversation has grown very long
```

---

## 17. CONFIDENCE CALIBRATION ENGINE

### 17.1 Confidence Levels

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     CONFIDENCE CALIBRATION                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  AI confidence should be EXPLICIT and CALIBRATED.                           │
│  Overconfidence is dangerous. Underconfidence wastes time.                  │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  CONFIDENCE LEVELS:                                                          │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  ██████████ CERTAIN (95%+)                                                  │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Have verified information directly                                        │
│  • Based on read files and explicit documentation                           │
│  • Code tested and working                                                   │
│  • No assumptions made                                                       │
│                                                                              │
│  Action: Proceed without verification                                        │
│                                                                              │
│  ────────────────────────────────────────────────────────────────────────   │
│                                                                              │
│  ████████░░ HIGH (80-95%)                                                   │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Based on strong patterns and evidence                                    │
│  • Most similar cases follow this pattern                                   │
│  • Minor uncertainty in edge cases                                          │
│  • Source is reliable but not verified directly                             │
│                                                                              │
│  Action: Proceed with quick verification                                     │
│                                                                              │
│  ────────────────────────────────────────────────────────────────────────   │
│                                                                              │
│  ██████░░░░ MEDIUM (50-80%)                                                 │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Based on general knowledge or patterns                                   │
│  • Some assumptions made                                                     │
│  • Multiple valid approaches possible                                        │
│  • Would benefit from review                                                 │
│                                                                              │
│  Action: Verify before proceeding, consider alternatives                    │
│                                                                              │
│  ────────────────────────────────────────────────────────────────────────   │
│                                                                              │
│  ███░░░░░░░ LOW (20-50%)                                                    │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Speculation based on limited information                                 │
│  • Significant assumptions made                                              │
│  • Haven't seen the actual code/docs                                        │
│  • Best guess without verification                                           │
│                                                                              │
│  Action: Must verify, do not proceed without confirmation                   │
│                                                                              │
│  ────────────────────────────────────────────────────────────────────────   │
│                                                                              │
│  █░░░░░░░░░ UNCERTAIN (<20%)                                                │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Don't have enough information                                             │
│  • Outside area of knowledge                                                 │
│  • Conflicting information present                                           │
│  • Need more context before proceeding                                       │
│                                                                              │
│  Action: STOP, ask clarifying questions, gather more information            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 17.2 Confidence Indicators

```
CONFIDENCE INDICATORS
─────────────────────────────────────────────────────────────────────────────

INCREASES CONFIDENCE:
─────────────────────────────────────────────────────────────────────────────
✓ Have read the actual file/code
✓ Information from primary source
✓ Tested and verified working
✓ Consistent with multiple sources
✓ Within domain of expertise
✓ Recent, up-to-date information
✓ Explicit documentation exists
✓ Pattern seen multiple times

DECREASES CONFIDENCE:
─────────────────────────────────────────────────────────────────────────────
✗ Haven't read the actual file/code
✗ Information from memory only
✗ Assumptions about implementation
✗ Edge cases not considered
✗ Outside domain of expertise
✗ Information may be outdated
✗ No documentation available
✗ First time seeing this pattern
✗ Multiple conflicting approaches
✗ Complex interactions involved
```

### 17.3 Confidence Communication

```
CONFIDENCE COMMUNICATION PATTERNS
─────────────────────────────────────────────────────────────────────────────

CERTAIN:
  "This will work because I've verified it against the actual code."
  "The documentation explicitly states this."
  "I've tested this approach and confirmed it works."

HIGH:
  "Based on the code I've read, this should work."
  "This follows the established pattern in the codebase."
  "I'm confident this is correct, but let's verify."

MEDIUM:
  "I believe this is the right approach, but there are alternatives."
  "This should work based on general knowledge, but I'd recommend testing."
  "I'm not certain about edge cases here."

LOW:
  "I'm not sure this is correct—I haven't seen the actual implementation."
  "This is my best guess, but please verify."
  "I'd need to see the code to be confident."

UNCERTAIN:
  "I don't have enough information to answer this reliably."
  "Could you provide more context or show me the relevant code?"
  "I'm not confident in any approach without more information."
```

---

## 18. AUTONOMY DIAL SYSTEM

### 18.1 Autonomy Levels

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       AUTONOMY DIAL SYSTEM                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  The autonomy dial controls how independently the AI operates.              │
│  Adjust based on task criticality and trust level.                          │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│          1        2        3        4        5        6        7            │
│          │        │        │        │        │        │        │            │
│    ┌─────┴────────┴────────┴────────┴────────┴────────┴────────┴─────┐     │
│    │░░░░░░░░░░░░░░░████████████████████████████████████████████████│     │
│    └─────────────────────────────────────────────────────────────────┘     │
│    │              │                   │                            │        │
│    ▼              ▼                   ▼                            ▼        │
│  SUGGEST       DRAFT              EXECUTE                    AUTONOMOUS     │
│  ONLY          & WAIT             WITH CHECKS                               │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  LEVEL 1-2: SUGGEST ONLY                                                     │
│  ───────────────────────────────────────────────────────────────────────    │
│  AI explains what it would do but makes no changes.                         │
│  Human reviews and decides whether to proceed.                              │
│  Use for: Critical decisions, unfamiliar territory, learning                │
│                                                                              │
│  LEVEL 3-4: DRAFT & WAIT                                                     │
│  ───────────────────────────────────────────────────────────────────────    │
│  AI creates drafts and waits for approval before finalizing.                │
│  Human reviews output before it takes effect.                               │
│  Use for: Most development work, moderate risk tasks                        │
│                                                                              │
│  LEVEL 5-6: EXECUTE WITH CHECKS                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  AI executes and verifies, pausing only if issues found.                    │
│  Human is informed of results but doesn't gate every action.                │
│  Use for: Well-understood tasks, established patterns                       │
│                                                                              │
│  LEVEL 7: FULL AUTONOMOUS                                                    │
│  ───────────────────────────────────────────────────────────────────────    │
│  AI executes full workflow independently.                                   │
│  Human is informed at completion or on failure.                             │
│  Use for: Routine tasks, high trust, low risk                               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 18.2 Autonomy Selection Matrix

```
AUTONOMY SELECTION MATRIX
─────────────────────────────────────────────────────────────────────────────

                        │ Low Risk      │ Medium Risk   │ High Risk     │
────────────────────────┼───────────────┼───────────────┼───────────────│
                        │               │               │               │
Well-understood         │  Level 6-7    │  Level 5-6    │  Level 3-4    │
(familiar patterns)     │  Autonomous   │  Execute+Check│  Draft & Wait │
                        │               │               │               │
────────────────────────┼───────────────┼───────────────┼───────────────│
                        │               │               │               │
Moderate understanding  │  Level 5-6    │  Level 3-4    │  Level 2-3    │
(some unknowns)         │  Execute+Check│  Draft & Wait │  Suggest/Draft│
                        │               │               │               │
────────────────────────┼───────────────┼───────────────┼───────────────│
                        │               │               │               │
New/Unfamiliar          │  Level 3-4    │  Level 2-3    │  Level 1-2    │
(exploration)           │  Draft & Wait │  Suggest/Draft│  Suggest Only │
                        │               │               │               │
────────────────────────┴───────────────┴───────────────┴───────────────┘

RISK FACTORS:
  • Data loss potential
  • Security implications
  • User-facing impact
  • Reversibility difficulty
  • Cost of mistakes
```

### 18.3 Autonomy Escalation Protocol

```
AUTONOMY ESCALATION PROTOCOL
─────────────────────────────────────────────────────────────────────────────

AI SHOULD REDUCE AUTONOMY (pause and ask) WHEN:
─────────────────────────────────────────────────────────────────────────────
□ About to delete files or data
□ About to modify database schema
□ About to change authentication/authorization
□ Confidence drops below threshold
□ Multiple valid approaches exist
□ Unexpected error encountered
□ Action would affect production
□ Action is irreversible
□ Action conflicts with known constraints
□ Human input needed for business decision

AI SHOULD INCREASE AUTONOMY (proceed) WHEN:
─────────────────────────────────────────────────────────────────────────────
□ Task matches established pattern
□ All checks pass
□ Changes are easily reversible
□ Working in isolated environment
□ Human has explicitly granted autonomy
□ Following pre-approved procedure
□ Making read-only operations
□ Generating drafts (not final output)
```

---

## 19. MULTI-MODEL CONSENSUS FRAMEWORK

### 19.1 When to Use Multi-Model

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    MULTI-MODEL CONSENSUS                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  WHEN TO USE MULTI-MODEL VERIFICATION:                                       │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  ✅ REQUIRED:                                                                │
│  • Architecture decisions that are hard to reverse                          │
│  • Security-critical implementations                                         │
│  • Technology selection (database, framework, etc.)                         │
│  • Anything that affects data integrity                                      │
│  • Public API contract design                                                │
│                                                                              │
│  ⚠️  RECOMMENDED:                                                            │
│  • Complex business logic implementation                                     │
│  • Performance-critical code paths                                           │
│  • Unusual or novel approaches                                               │
│  • When single model confidence is < 80%                                    │
│  • Disagreement between AI and human intuition                              │
│                                                                              │
│  ○ OPTIONAL:                                                                 │
│  • Standard CRUD operations                                                  │
│  • Well-documented patterns                                                  │
│  • Low-risk changes                                                          │
│  • Time-critical tasks with established approaches                          │
│                                                                              │
│  ❌ NOT NEEDED:                                                              │
│  • Formatting and style                                                      │
│  • Simple bug fixes with clear cause                                        │
│  • Documentation updates                                                     │
│  • Test generation for existing code                                        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 19.2 Consensus Protocol

```
MULTI-MODEL CONSENSUS PROTOCOL
─────────────────────────────────────────────────────────────────────────────

STEP 1: FORMULATE THE QUERY
─────────────────────────────────────────────────────────────────────────────
• State the problem clearly and completely
• Include all relevant context
• Make the query identical across models
• Avoid leading toward a particular answer

STEP 2: QUERY MULTIPLE MODELS
─────────────────────────────────────────────────────────────────────────────
Minimum: 2 different model families
Recommended: 3 models from different providers

Example configuration:
  Model A: Claude (Anthropic)
  Model B: GPT-4 (OpenAI)
  Model C: Gemini (Google) or Llama (Meta)

STEP 3: ANALYZE RESPONSES
─────────────────────────────────────────────────────────────────────────────
For each response, identify:
  • Core recommendation
  • Reasoning provided
  • Confidence indicators
  • Trade-offs mentioned
  • Caveats or warnings

STEP 4: IDENTIFY CONSENSUS POINTS
─────────────────────────────────────────────────────────────────────────────
STRONG CONSENSUS: All models agree
  → High confidence in recommendation

MODERATE CONSENSUS: Majority agrees (2/3)
  → Likely correct, investigate minority view

WEAK CONSENSUS: Models disagree significantly
  → More investigation needed, may need human decision

STEP 5: INVESTIGATE DIVERGENCES
─────────────────────────────────────────────────────────────────────────────
When models disagree:
  • Identify the specific point of disagreement
  • Understand why each model reached its conclusion
  • Test both approaches if possible
  • Consider hybrid approach
  • Escalate to human decision if still unclear

STEP 6: DOCUMENT THE DECISION
─────────────────────────────────────────────────────────────────────────────
Record:
  • The question asked
  • Each model's response (summary)
  • Consensus points
  • Divergence points
  • Final decision and reasoning
  • Who made the final call
```

### 19.3 Consensus Documentation Template

```markdown
## MULTI-MODEL CONSENSUS: [Decision Title]

**Date:** [YYYY-MM-DD]
**Decision Maker:** [Name]

### Question Posed
[Exact question asked to all models]

### Models Consulted
- Model A: [Name/Version]
- Model B: [Name/Version]
- Model C: [Name/Version] (optional)

### Responses Summary

**Model A:**
- Recommendation: [Summary]
- Key reasoning: [Summary]
- Confidence: [High/Medium/Low]

**Model B:**
- Recommendation: [Summary]
- Key reasoning: [Summary]
- Confidence: [High/Medium/Low]

**Model C:** (if used)
- Recommendation: [Summary]
- Key reasoning: [Summary]
- Confidence: [High/Medium/Low]

### Consensus Analysis

**Agreement Points:**
- [Point 1]
- [Point 2]

**Disagreement Points:**
- [Point 1]: Model A says X, Model B says Y
- [Point 2]: [Description]

**Consensus Level:** Strong / Moderate / Weak

### Final Decision
[What was decided]

### Reasoning
[Why this decision was made, especially if models disagreed]

### Follow-up Actions
- [ ] [Action 1]
- [ ] [Action 2]
```

---


### Section 19B: RLM Context Management Patterns
```
#### The Load Balancing vs Token Burning Problem

| Approach | Description | When to Use |
|----------|-------------|-------------|
| **Linear Consumption** | Standard prompt → response | Simple queries |
| **Chunked Retrieval** | Break context into chunks | Long documents |
| **Streaming Fetch** | Load on-demand from store | Unlimited context |
| **Hierarchical Summary** | Summarize → detail when needed | Large codebases |

#### Confidence Calibration

```python
CONFIDENCE_THRESHOLDS = {
    "HIGH": 0.85,      # Auto-execute, notify
    "MEDIUM": 0.65,    # Execute with review window
    "LOW": 0.40,       # Pause, require approval
    "ABORT": 0.25      # Stop, escalate
}
```

#### Quality Gates for RLM

```
□ Context chunking strategy defined
□ Confidence thresholds calibrated
□ Runaway loop detection implemented
□ State persistence verified
```

---
## PART IV SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                   PART IV: AI ORCHESTRATION & INTELLIGENCE                   │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  MODEL INTELLIGENCE MATRIX:                                                  │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Frontier: Complex reasoning, architecture (expensive, slow)              │
│  • Balanced: Day-to-day development (good trade-off)                        │
│  • Speed: Simple tasks, bulk operations (fast, cheap)                       │
│  • Specialized: Domain-specific tasks                                        │
│  • Default to Balanced if unsure                                             │
│                                                                              │
│  THE CORE 4 PRIMITIVES:                                                      │
│  ─────────────────────────────────────────────────────────────────────────  │
│  RETRIEVE → REASON → CREATE → VERIFY                                        │
│  All AI work decomposes into these four capabilities                        │
│  Compose them into patterns for different workflows                          │
│                                                                              │
│  TOOL HIERARCHY:                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│  Tier 1: Foundational (file, search, execute)                               │
│  Tier 2: Development (git, lint, test, build)                               │
│  Tier 3: Integration (MCPs for external systems)                            │
│  Tier 4: Orchestration (sub-agents, workflows)                              │
│  Use simplest tool that works                                                │
│                                                                              │
│  CONTEXT ENGINEERING:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Context is precious—budget it carefully                                   │
│  • Load essential context first, on-demand for rest                         │
│  • Prune aggressively, compress when possible                               │
│  • Refresh when stale or switching tasks                                    │
│                                                                              │
│  CONFIDENCE CALIBRATION:                                                     │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Certain (95%+): Proceed without verification                             │
│  • High (80-95%): Quick verification                                        │
│  • Medium (50-80%): Verify, consider alternatives                           │
│  • Low (20-50%): Must verify, don't proceed blindly                         │
│  • Uncertain (<20%): STOP, gather more information                          │
│                                                                              │
│  AUTONOMY DIAL:                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│  1-2: Suggest only (critical decisions)                                      │
│  3-4: Draft & wait (most development)                                        │
│  5-6: Execute with checks (established patterns)                            │
│  7: Full autonomous (routine, low risk)                                      │
│                                                                              │
│  MULTI-MODEL CONSENSUS:                                                      │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Required for architecture and security decisions                         │
│  • Query 2-3 models with identical prompt                                   │
│  • Identify consensus and divergence points                                  │
│  • Document decisions and reasoning                                          │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
