# BRIDGE.md — Navigation Layer
## Connecting North Star Blueprint + Master Build Framework

---

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│                              BRIDGE.md v1.5                                  │
│                                                                              │
│                    The Navigation Layer for North Star                       │
│                                                                              │
│                          ────────────────                                    │
│                                                                              │
│           "Don't read everything. Navigate to what you need."                │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │  North Star Blueprint v6.5  ←——— BRIDGE.md ———→  Master Build v2.5 │    │
│  │       (HOW to build)        (Navigation)      (WHAT to build with)  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  LICENSE: CC BY-NC-SA 4.0                                                   │
│  For commercial licensing: See repository for contact information           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# SECTION 1: DOCUMENT HIERARCHY & READING ORDER

```
FOR A NEW PROJECT:
─────────────────────────────────────────────────────────────────────────────
1. NORTH_STAR_BOOTSTRAP.md  → Ignition key (start here)
2. BRIDGE.md                → Navigation (this document)
3. NS Section 0             → Bootstrap protocol
4. Generate claude.md       → Project-specific guide
5. Reference NS/MBF on demand via this BRIDGE.md


FOR AN EXISTING PROJECT:
─────────────────────────────────────────────────────────────────────────────
1. claude.md       → Current project state (entry point)
2. BRIDGE.md       → Navigate to what you need
3. NS/MBF sections → On demand


FOR RETURNING TO A PAUSED SESSION:
─────────────────────────────────────────────────────────────────────────────
1. claude.md       → Check current state, handoff notes
2. Continue work   → Reference NS/MBF via BRIDGE.md as needed
```

---

# SECTION 2: PURPOSE & RELATIONSHIP

## What This Document Is

BRIDGE.md is the **navigation layer** between the two core framework documents. It tells you where to go based on what you need, without requiring you to read either document in full.

## The HOW vs WHAT Distinction

| Document | Provides | Size | When to Reference |
|----------|----------|------|-------------------|
| **North Star Blueprint v6.5** | HOW to build | ~910KB | Methodology, process, quality gates |
| **Master Build Framework v2.5** | WHAT to build with | ~158KB | Technology selection, tool matrices |

**Rule:** Reference on demand. Never load both fully into context simultaneously.

---

# SECTION 3: QUICK DECISION TREE

```
"I need to..." → Go here
─────────────────────────────────────────────────────────────────────────────

START A PROJECT
├─ "How do I begin?"                    → NS Section 0 (Bootstrap)
├─ "What tier is my project?"           → NS Section 2 (Project Tiers)
└─ "What should my claude.md contain?"  → NS Section 0.2 (Templates)

CHOOSE TECHNOLOGY
├─ "What database should I use?"        → MBF Category 15-17
├─ "What frontend framework?"           → MBF Category 1-2
├─ "What backend framework?"            → MBF Category 7-8
├─ "What AI/LLM provider?"              → MBF Category 33 + NS Section 13
├─ "What vector database?"              → MBF Category 16
├─ "What model registry?"               → MBF Category 32-33 (MLflow, Vertex)  ← v2.0
├─ "What caching solution?"             → MBF Category 22 (Redis, Upstash)     ← v2.0
└─ "What auth provider?"                → MBF Category 50

BUILD FEATURES
├─ "How do I structure my code?"        → NS Part VIII (Code Architecture)
├─ "How do I design the UI?"            → NS Part VII (Design System)
├─ "How do I add authentication?"       → NS Part X + MBF Category 50
├─ "How do I build an API?"             → NS Section 41 + MBF Category 8
└─ "How do I add payments?"             → MBF Category 49

WORK WITH AI/AGENTS
├─ "How do I build RAG?"                → MBF Category 29 + NS Part IV
├─ "How do I build agents?"             → MBF Categories 30-31 + NS Part V
├─ "How do I add guardrails?"           → MBF Category 35
├─ "How do I evaluate LLM outputs?"     → MBF Category 46 (AI Evaluation)
├─ "How do I manage prompts?"           → MBF Category 44B (PromptOps)      ← v2.0
├─ "How do I manage long contexts?"     → NS Section 19B (RLM Patterns)     ← v2.0
├─ "How do I design agent memory?"      → NS Section 20 + MBF 31E (Memory)  ← v2.0
├─ "How do I compress context?"         → NS Section 20.5 + MBF 34          ← v2.0
└─ "How do I prevent runaway loops?"    → NS Section 19B (Confidence Cal.)  ← v2.0

HUMAN-AI COLLABORATION                                                        ← v2.0
├─ "How do I build human-AI workflows?" → MBF Category 44A (Kanban)
├─ "How do I add approval checkpoints?" → MBF Category 44A + NS Section 19B
├─ "How do I route by confidence?"      → MBF Category 44A + NS Section 17
└─ "What tools for HITL patterns?"      → MBF Category 44A (Trigger.dev, LangGraph)

TEST & QUALITY
├─ "How do I test?"                     → NS Part IX + MBF Category 46
├─ "What testing tools?"                → MBF Category 46
├─ "How do I test AI/LLM systems?"      → MBF Category 46 (AI Evaluation)
└─ "What coverage should I target?"     → NS Section 43

SECURITY
├─ "How do I secure my app?"            → NS Part X + MBF Categories 50-53
├─ "How do I handle secrets?"           → MBF Category 53
└─ "What about compliance?"             → MBF Category 56

DEPLOY & OPERATE
├─ "How do I deploy?"                   → NS Part XI + MBF Category 43
├─ "What hosting should I use?"         → MBF Categories 9-10
├─ "How do I monitor?"                  → MBF Category 55
└─ "How do I set up CI/CD?"             → MBF Category 43

WORKFLOW & ORCHESTRATION
├─ "How do I orchestrate workflows?"    → MBF Category 44
├─ "How do I add human checkpoints?"    → MBF Category 44A (Kanban)         ← v2.0
├─ "How do I version prompts?"          → MBF Category 44B (PromptOps)      ← v2.0
└─ "What about browser automation?"     → MBF Category 45

GO-TO-MARKET                                                                  ← v2.0
├─ "How do I position this framework?"  → BRIDGE Section 11 (GTM)
├─ "What communities should I target?"  → BRIDGE Section 11 (GTM)
└─ "What's the launch checklist?"       → BRIDGE Section 11 (GTM)

STUCK OR LOST
├─ "I don't know where to start"        → NS Section 0.5 (When Stuck)
├─ "I'm overwhelmed"                    → NS Section 0.4 (Load Balancing)
└─ "Nothing is working"                 → NS Section 0.5 + Part IX

WORK ASYNC / AWAY FROM DESK
├─ "How do I trigger builds from my phone?"    → OpenClaw Bridge (ENH-002)
├─ "How do I delegate and review later?"       → NS Section 0: Async Delegation
├─ "Can Claude work while I sleep?"            → GitHub Action + RALPH Loop
└─ "Multi-repo async management?"             → MBF Category 60 (OpenClaw)

SPEC-DRIVEN DEVELOPMENT
├─ "How do I prevent Claude writing wrong code?" → ENH-009: Plan.md Annotation
├─ "What's the best feature development loop?"   → ENH-008: RPIT Loop (NS Part I)
├─ "How do I define success before building?"    → NS Section 0: Spec Protocol
└─ "Kiro-style event-driven automation?"         → ENH-015: Hooks Architecture

MULTI-AGENT ORCHESTRATION
├─ "Run multiple Claudes safely?"              → ENH-012: Git Worktrees
├─ "Coordinate specialized agent roles?"       → ENH-013: Agent Teams
├─ "Independent parallel features?"           → ENH-001: Multi-Agent Bootstrap
└─ "What orchestration framework to use?"     → MBF Category 57

CHOOSE TOOLING (new categories)
├─ "Agent orchestration framework?"           → MBF Category 57 (CrewAI/ADK/Strands)
├─ "AI-native IDE beyond VS Code?"            → MBF Category 58 (Kiro/Zed/Cline)
├─ "Prompt evaluation and versioning?"        → MBF Category 59 (Vellum/PromptLayer)
├─ "Life OS / async agent?"                   → MBF Category 60 (OpenClaw)
└─ "Enterprise agent governance?"             → MBF Category 61 (ServiceNow/Boomi)

SELF-IMPROVEMENT / CONTINUOUS LEARNING
├─ "How does Claude learn from mistakes?"     → ENH-016: Retro Skill / Feedback Loop
├─ "Auto-creating skills from sessions?"      → ENH-032: Claudeception Integration
├─ "Improve claude.md automatically?"         → ENH-018: Living claude.md Protocol
└─ "RALPH loop implementation?"               → NS Section 23 + MBF Category 44
```

---

# SECTION 4: THE TWO FRAMEWORKS AT A GLANCE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    NORTH STAR BLUEPRINT v6.5                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  STRUCTURE: 14 Parts, ~65 Sections                                          │
│                                                                              │
│  Part I     → Foundation & Philosophy                                       │
│  Part II    → Project Classification & Tiers                                │
│  Part III   → Context & Memory Architecture                                 │
│  Part IV    → Orchestration & Control Flow                                  │
│  Part V     → Agent Composition & Multi-Agent                               │
│  Part VI    → Tool Integration & MCP                                        │
│  Part VII   → Design System & UI/UX                                         │
│  Part VIII  → Code Architecture & Patterns                                  │
│  Part IX    → Testing & Verification                                        │
│  Part X     → Security & Authentication                                     │
│  Part XI    → DevOps & Deployment                                           │
│  Part XII   → Operational Excellence                                        │
│  Part XIII  → Special Domains                                               │
│  Part XIV   → Human-Agent Collaboration                                     │
│                                                                              │
│  FOCUS: Methodology, process, quality gates, decision frameworks            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│                    MASTER BUILD FRAMEWORK v2.5                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  STRUCTURE: 9 Tiers, 60+ Categories                                         │
│                                                                              │
│  Tier 1 (1-6)    → Frontend & UI                                           │
│  Tier 2 (7-14)   → Backend & Infrastructure                                │
│  Tier 3 (15-22)  → Data & Storage                                          │
│  Tier 4 (23-28)  → Integration & Processing                                │
│  Tier 5 (29-35)  → AI & Machine Learning                                   │
│  Tier 6 (36-42)  → Content Generation                                      │
│  Tier 7 (43-49)  → Operations & Business                                   │
│  Tier 8 (50-56)  → Security & Compliance                                   │
│  Tier 9 (57-62)  → Specialized & Niche                                     │
│                                                                              │
│  NEW in v2.0:                                                               │
│  • Category 44A → Kanban & Visual Task Management (HITL)                   │
│  • Category 44B → PromptOps (Prompt Versioning & Management)               │
│                                                                              │
│  NEW in v2.1:                                                               │
│  • Category 57 → Agent Orchestration Frameworks (CrewAI/ADK/Strands)       │
│  • Category 58 → AI-Native IDEs & Coding Agents (Kiro/Zed/Cline)          │
│  • Category 59 → Prompt Orchestration & Eval (Vellum/PromptLayer)          │
│  • Category 60 → Life OS Agents (OpenClaw)                                 │
│  • Category 61 → Enterprise Agent Governance (ServiceNow/Boomi)            │
│  • Category 62 → Memory Infrastructure                                     │
│                                                                              │
│  FOCUS: Technology options, tool comparisons, stack selection               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# SECTION 5: CROSS-REFERENCE MATRIX

## Complete NS ↔ MBF Mapping

### Foundation & Setup

```
NS Part I (Foundation)                ←→  MBF Overview
├─ NS Section 0: Bootstrap            ←→  MBF Build Patterns
├─ NS Section 1: Philosophy           ←→  (No MBF equivalent)
└─ NS Section 2: Project Tiers        ←→  MBF Tier Selection
```

### AI & Agents

```
NS Part III (Context/Memory)          ←→  MBF Tier 5 (AI/ML)
├─ NS Section 13: Model Intelligence  ←→  MBF 33: Model Providers
├─ NS Section 14: Prompt Engineering  ←→  MBF 34: Prompt Tools
├─ NS Section 15: Tool Schemas        ←→  MBF 31: Tool Frameworks
├─ NS Section 16: Context Engineering ←→  MBF 29: RAG Systems
├─ NS Section 17: Confidence          ←→  MBF 44A: Kanban (routing)      ← v2.0
├─ NS Section 19B: RLM Patterns       ←→  MBF 31, 44A (context mgmt)     ← v2.0
└─ NS Section 20: Memory Architecture ←→  MBF 31E: Memory Systems

NS Part IV (Orchestration)            ←→  MBF Tier 5 + Tier 7
├─ NS Section 21: Control Flow        ←→  MBF 30: Agent Frameworks
├─ NS Section 22: Error Handling      ←→  MBF 30: Error patterns
└─ NS Section 23: State Management    ←→  MBF 44: Workflow Orchestration

NS Part V (Agent Composition)         ←→  MBF Categories 29-35
├─ NS Section 24: MCP Integration     ←→  MBF 31: MCP Tools
├─ NS Section 25: Multi-Agent         ←→  MBF 30: Multi-agent frameworks
└─ NS Section 26: Agent Patterns      ←→  MBF 30-31: Implementation
```

### Workflow & Human-AI Collaboration (v2.0)

```
WORKFLOW & ORCHESTRATION DOMAIN
─────────────────────────────────────────────────────────────────────────────
NS Section 17 (Confidence)            ←→  MBF 44A: Confidence-based routing
NS Section 19B (RLM Patterns)         ←→  MBF 44A: HITL checkpoints
NS Part V (Agent Composition)         ←→  MBF 44A: Agent task contracts
NS Part IV (Orchestration)            ←→  MBF 44: Workflow engines
(Prompt Management)                   ←→  MBF 44B: PromptOps

MBF 44A (Kanban) connects to:
├─ NS Section 17 (Confidence calibration)
├─ NS Section 19B (RLM context management)
├─ NS Part V (Agent execution layer)
└─ MBF 44 (Workflow orchestration layer)

MBF 44B (PromptOps) connects to:
├─ NS Section 14 (Prompt engineering methodology)
├─ MBF 34 (Prompt tools)
├─ MBF 46 (Evaluation & regression testing)
└─ MBF 29-35 (AI systems using prompts)

NEW CATEGORY ROUTING (v2.1 additions)
─────────────────────────────────────────────────────────────────
Category 57 | Agent Orchestration Frameworks  | MBF_PART_2_DATA_AI
Category 58 | AI-Native IDEs & Coding Agents  | MBF_PART_1_CORE
Category 59 | Prompt Orchestration & Eval      | MBF_PART_2_DATA_AI
Category 60 | Life OS Agents                   | MBF_PART_4_FOUNDATION
Category 61 | Enterprise Agent Governance      | MBF_PART_4_FOUNDATION
Category 62 | Memory Infrastructure            | MBF_PART_2_DATA_AI
```

### Data & Storage

```
NS Part III (Context)                 ←→  MBF Tier 3 (Data)
├─ NS Section 16: Context Engineering ←→  MBF 15-17: Databases
├─ NS Section 20: Memory              ←→  MBF 16: Vector DBs
└─ NS Section 38: Tech Selection      ←→  MBF 15-22: All data categories

DATA OPERATIONS (v2.0 Enhanced)
─────────────────────────────────────────────────────────────────────────────
(Data Versioning)                     ←→  MBF 27: DVC, lakeFS integration
(Data Quality)                        ←→  MBF 27: dbt, Great Expectations
(Feature Stores)                      ←→  MBF 28: Feast, Tecton
```

### Frontend & Design

```
NS Part VII (Design System)           ←→  MBF Tier 1 (Frontend)
├─ NS Section 27: Visual Language     ←→  MBF 3: CSS Frameworks
├─ NS Section 28: Component Systems   ←→  MBF 5: Component Libraries
├─ NS Section 29: Interaction         ←→  MBF 4: Animation (GSAP, Framer)
├─ NS Section 30: Animation Specs     ←→  MBF 4: Animation libraries
└─ NS Section 35: Accessibility       ←→  MBF 56: Compliance (a11y)
```

### Testing & Quality

```
NS Part IX (Testing)                  ←→  MBF Category 46
├─ NS Section 42: Testing Philosophy  ←→  MBF 46: Testing strategies
├─ NS Section 43: Coverage            ←→  MBF 46: Testing tools
├─ NS Section 44: Testing Patterns    ←→  MBF 46: Testing patterns
└─ NS Section 45: Test Infrastructure ←→  MBF 46: Testing infrastructure

AI/LLM EVALUATION (v2.0 Enhanced)
─────────────────────────────────────────────────────────────────────────────
(LLM Evaluation)                      ←→  MBF 46: DeepEval, RAGAS metrics
(Prompt Testing)                      ←→  MBF 46 + 44B: Regression testing
(AI Quality Gates)                    ←→  MBF 46: Evaluation pipelines
```

### Security & Compliance

```
NS Part X (Security)                  ←→  MBF Tier 8 (Security)
├─ NS Section 46: Security-First      ←→  MBF 52: Security & Encryption
├─ NS Section 47: Authentication      ←→  MBF 50: Auth Providers
├─ NS Section 48: Authorization       ←→  MBF 50: Auth Providers
└─ NS Section 49: Data Protection     ←→  MBF 53: Secrets Management

AI SAFETY (v2.0 Enhanced)
─────────────────────────────────────────────────────────────────────────────
(AI Guardrails)                       ←→  MBF 35: Guardrails deep dive
(Input/Output validation)             ←→  MBF 35: NeMo, Guardrails AI
(Adversarial defense)                 ←→  MBF 35: Prompt injection prevention
```

### DevOps & Deployment

```
NS Part XI (DevOps)                   ←→  MBF Tier 7 (Operations)
├─ NS Section 50: CI/CD Philosophy    ←→  MBF 43: CI/CD Pipelines
├─ NS Section 51: Deployment          ←→  MBF 43: Deployment strategies
├─ NS Section 52: Monitoring          ←→  MBF 55: Monitoring & Observability
└─ NS Section 53: Incident Response   ←→  MBF 55: Alerting
```

---

# SECTION 6: USE CASE ROUTING

## 6.1 Starting a New Project

```
USE CASE: Starting a New Project
─────────────────────────────────────────────────────────────────────────────

STEP 1: Bootstrap
├─ Read: NS Section 0.1 (Quick-Start Directive)
├─ Do: Generate claude.md using template from NS Section 0.2
└─ Set: Project tier using NS Section 2

STEP 2: Technology Selection
├─ Reference: MBF for each technology category needed
├─ Use: NS Section 38 for selection criteria
└─ Document: Choices in claude.md

STEP 3: Architecture
├─ Reference: NS Part VIII for code structure
├─ Choose: Patterns from MBF relevant categories
└─ Document: Key decisions as ADRs

STEP 4: Begin Building
├─ Follow: NS quality gates at each step
├─ Reference: MBF for implementation details
└─ Update: claude.md as project evolves
```

## 6.2 Building an AI Agent System

```
USE CASE: Building an AI Agent System
─────────────────────────────────────────────────────────────────────────────

STEP 1: Bootstrap
├─ Read: NS Section 0.1 (Quick-Start Directive)
├─ Do: Generate claude.md
└─ Set: Likely "Sky" or "Space" tier

STEP 2: Agent Architecture
├─ Reference: NS Part V (Agent Composition)
├─ Choose: Framework from MBF Category 30
├─ Design: Tool schemas using NS Section 15
└─ Implement: MCP integration using NS Section 24 + MBF Category 31

STEP 3: Memory & Context
├─ Design: Using NS Section 20 (Memory Architecture)
├─ Implement: Context engineering using NS Section 16
├─ Choose: Vector DB using MBF Category 16
├─ Add: RLM patterns using NS Section 19B                    ← v2.0
└─ Build: Knowledge graph if needed using MBF Category 26

STEP 4: Skills & Tools
├─ Define: Skills using MBF 31B (Skill Manifests)
├─ Integrate: MCP tools using NS Section 24 + MBF Category 31
└─ Test: Using NS Part IX + MBF Category 46

STEP 5: Safety & Deployment
├─ Implement: Guardrails using MBF Category 35
├─ Set: Autonomy level using NS Section 18
├─ Calibrate: Confidence thresholds using NS Section 17
├─ Add: HITL checkpoints using MBF Category 44A             ← v2.0
└─ Monitor: Using NS Section 52 + MBF Category 55
```

## 6.3 Building a Human-AI Collaborative Workflow (v2.0)

```
USE CASE: Human-AI Collaborative Workflow
─────────────────────────────────────────────────────────────────────────────

STEP 1: Design Collaboration Contract
├─ Reference: MBF Category 44A (Kanban & Visual Task Management)
├─ Choose: Linear (dev-focused) or Notion (flexible) or GitHub Projects
├─ Define: What constitutes a "work request" vs "approval needed"
└─ Document: Confidence thresholds and routing rules

STEP 2: Implement Orchestration Layer
├─ Reference: MBF Category 44 (Workflow Orchestration)
├─ Choose: Trigger.dev (Waitpoint Tokens) or LangGraph (interrupt)
├─ Connect: Kanban board via MCP or API
└─ Configure: Timeout and fallback behaviors

STEP 3: Add Context Management
├─ Reference: NS Section 19B (RLM Patterns)
├─ Implement: Chunked retrieval for long sessions
├─ Add: Confidence calibration to prevent runaway loops
└─ Configure: State persistence for resumption

STEP 4: Configure Confidence-Based Routing
├─ Reference: NS Section 17 (Confidence Calibration)
├─ Set: Thresholds (≥0.85 auto, 0.65-0.84 review, <0.65 pause)
├─ Implement: Kanban status updates based on confidence
└─ Define: Escalation paths for low-confidence situations

STEP 5: Test & Deploy
├─ Test: HITL flows with real approval scenarios
├─ Monitor: Agent comment patterns and human response times
└─ Iterate: Adjust thresholds based on observed behavior
```

## 6.4 Adding AI Features to Existing Application

```
USE CASE: Adding AI to Existing App
─────────────────────────────────────────────────────────────────────────────

STEP 1: Assessment
├─ Review: Existing claude.md (or create one)
├─ Identify: Integration points
└─ Determine: AI capability needed (chat, RAG, agents, generation)

STEP 2: AI Architecture
├─ Read: NS Part IV Section 13 (Model Intelligence Matrix)
├─ Choose: Model(s) using NS Section 13 + MBF Category 33
├─ Decide: RAG if needed using MBF Category 29
└─ Plan: Memory using NS Section 20 + MBF 31E

STEP 3: Integration
├─ API Design: NS Section 41 + MBF Category 8
├─ Tool Integration: NS Section 24 (MCP) + MBF Category 31
└─ Testing: NS Part IX with AI-specific considerations

STEP 4: Production
├─ Safety: MBF Category 35 (Guardrails)
├─ Monitoring: AI-specific metrics (NS Section 52)
├─ Cost: Model routing considerations (NS Section 13)
└─ Iterate: Based on user feedback
```

## 6.5 Managing Prompts at Scale (v2.0)

```
USE CASE: PromptOps - Managing Prompts at Scale
─────────────────────────────────────────────────────────────────────────────

STEP 1: Establish Prompt Management
├─ Reference: MBF Category 44B (PromptOps)
├─ Choose: PromptLayer, Langfuse, or Humanloop
├─ Set up: Version control for prompts
└─ Define: Naming conventions and ownership

STEP 2: Implement Evaluation Pipeline
├─ Reference: MBF Category 46 (AI Evaluation)
├─ Create: Golden datasets for regression testing
├─ Configure: DeepEval or RAGAS metrics
└─ Automate: Pre-deployment prompt testing

STEP 3: Production Deployment
├─ Implement: A/B testing for prompt variants
├─ Monitor: Performance metrics per prompt version
├─ Configure: Rollback procedures
└─ Document: Prompt changelog

STEP 4: Continuous Improvement
├─ Analyze: User feedback and edge cases
├─ Iterate: Prompt versions based on data
├─ Consider: DSPy for programmatic optimization
└─ Track: Cost and latency per prompt version
```


---

# SECTION 6.7: TOP-25 WORKFLOW PLAYBOOK (Secondary Routes + Default Questions)

Use this when you want **high precision routing** and consistent **Ask-User-Questions** behavior.

**Rule of thumb**
- If requirements are missing → ask **2–4 questions** before routing deeply.
- If user requests “fast” → use Utility model; if “mission critical” → use Primary.

| ID | Primary Route | Secondary Route | Default Clarifying Questions (2–4) |
|----|---------------|----------------|------------------------------------|
| W01 | BRIDGE 6.1 → NS 0.1/0.2 | NS 2 (tiers) | What are we building? target users? deadline? preferred stack? |
| W02 | BRIDGE 6.2 → NS Part V + MBF 30/31 | NS 15 (tool schemas) | What tasks? what tools/APIs? single vs multi-agent? autonomy level? |
| W03 | BRIDGE 6.3 → MBF 44A + NS 17 | NS 19B | What needs approval? who approves? confidence thresholds? escalation path? |
| W04 | BRIDGE 6.5 → MBF 44B + MBF 46 | NS 14 | Where are prompts stored? eval dataset? regression gate? rollback plan? |
| W05 | BRIDGE 6.4 → NS Part IV + MBF 29/33 | NS 20 | Chat vs RAG vs agents? data source? latency/cost constraints? |
| W06 | NS 19B + MBF 16/29 | MBF 46 | What corpus? update frequency? chunking strategy? eval metric? |
| W07 | MBF 46 + NS Part IX | MBF 44B | What’s the golden set? success metric? CI gate? drift threshold? |
| W08 | MBF 35 + NS Part X | NS 17 | Risk level? sensitive data? injection threat model? allowed actions? |
| W09 | MBF 28/55 | MBF 46 | Ground truth source? drift type? alerting channel? retrain trigger? |
| W10 | MBF 32/33 | MBF 43 | Who promotes models? staging vs prod? rollback method? signing? |
| W11 | MBF 22 + MBF 34 | MBF 55 | What to cache (embeddings/prompt/results)? TTL? invalidation rules? |
| W12 | MBF 30/35 + NS Part III | NS 22 | Which tools? pre/post hook behavior? retries? non-blocking hooks? |
| W13 | NS 20.5 + MBF 34 | NS 19B | Token budget? must-keep context? compression strategy? retrieval plan? |
| W14 | Bootstrap 0–3 | GLOBAL_IDE_RULES | Team conventions? repo standard? approval policy? default autonomy? |
| W15 | NS Part VIII + MBF 8 | MBF 50 | REST vs GraphQL? auth method? rate limits? error handling? |
| W16 | NS Part XI + MBF 43 | MBF 46 | Target platform? deploy frequency? test gates? secrets strategy? |
| W17 | MBF 55 | MBF 46 | What traces? spans? PII rules? dashboards? oncall alerts? |
| W18 | NS 17–18 + Bootstrap 12 | MBF 44A | Allowed actions? confidence thresholds? HITL points? rollback? |
| W19 | NS 13 + MBF 33 | MBF 22 | Cost ceiling? latency target? accuracy bar? safety constraints? |
| W20 | MBF 44 + NS Part IV | MBF 44A | Workflow steps? state storage? human interrupts? timeouts? |
| W21 | GLOBAL_IDE_RULES | NS Part VIII | Language? formatter/linter? commit rules? test standard? |
| W22 | NS Part IX + MBF 46 | MBF 44B | Baseline? regression gate? golden set ownership? reporting? |
| W23 | Bootstrap 8 + NS 0.4 | BRIDGE load balancing | When to delete scaffolds? submission protocol? backups? |
| W24 | NS 13 + MBF 33 | MBF 22 | What’s “cheap enough”? what failure rate ok? routing policy? |
| W25 | Ask-User-Questions | BRIDGE 3 | Who is user? what outcomes? scope? constraints? acceptance criteria? |


---

# SECTION 7: COMBINED WORKFLOW EXAMPLES

## Example 1: Building a SaaS with AI Features

```
SCENARIO: Building a B2B SaaS with AI-powered document analysis
─────────────────────────────────────────────────────────────────────────────

PHASE 1: FOUNDATION
├─ Bootstrap: NS Section 0 → Generate claude.md
├─ Tier: "Sky" (Production-bound SaaS)
├─ Core stack selection:
│   ├─ Frontend: MBF Cat 1 (Next.js) + Cat 3 (Tailwind)
│   ├─ Backend: MBF Cat 7 (Node.js/tRPC)
│   ├─ Database: MBF Cat 15 (PostgreSQL) + Cat 16 (Pinecone)
│   └─ Auth: MBF Cat 50 (Clerk)

PHASE 2: AI INTEGRATION
├─ RAG Pipeline: MBF Cat 29 (LlamaIndex)
├─ Model: MBF Cat 33 (Claude via Anthropic API)
├─ Document Processing: MBF Cat 29 (Unstructured)
├─ Chunking: MBF Cat 29 (Semantic, 512-1024 tokens)
├─ Guardrails: MBF Cat 35 (NeMo Guardrails)
└─ Evaluation: MBF Cat 46 (RAGAS metrics)

PHASE 3: PRODUCTION
├─ Hosting: MBF Cat 9 (Vercel) + Cat 10 (serverless functions)
├─ CI/CD: MBF Cat 43 (GitHub Actions)
├─ Monitoring: MBF Cat 55 (Sentry + Langfuse)
├─ Testing: NS Part IX + MBF Cat 46
└─ Security: NS Part X + MBF Cats 50-53
```

## Example 2: Building an Autonomous Agent System with HITL (v2.0)

```
SCENARIO: Multi-agent system for automated code review with human oversight
─────────────────────────────────────────────────────────────────────────────

PHASE 1: AGENT ARCHITECTURE
├─ Framework: MBF Cat 30 (LangGraph for orchestration)
├─ Memory: MBF Cat 31E (Redis for session state)
├─ Tools: MBF Cat 31 (MCP servers for GitHub, Linear)
├─ Context: NS Section 19B (RLM patterns for large PRs)          ← v2.0
└─ Models: MBF Cat 33 (Claude for analysis, Haiku for triage)

PHASE 2: HUMAN-AI COLLABORATION                                   ← v2.0
├─ Kanban: MBF Cat 44A (Linear as collaboration contract)
├─ Orchestration: MBF Cat 44 (Trigger.dev with Waitpoints)
├─ Confidence routing:
│   ├─ High (≥0.85): Auto-approve minor suggestions
│   ├─ Medium (0.65-0.84): Post for human review
│   └─ Low (<0.65): Escalate with detailed context
└─ Prompts: MBF Cat 44B (version control via PromptLayer)

PHASE 3: SAFETY & MONITORING
├─ Guardrails: MBF Cat 35 (prevent destructive suggestions)
├─ Loop prevention: NS Section 19B (iteration bounds)
├─ Evaluation: MBF Cat 46 (track suggestion acceptance rate)
└─ Monitoring: MBF Cat 55 (agent traces via Langfuse)
```

---

# SECTION 8: LOAD BALANCING REMINDER

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         LOAD BALANCING PRINCIPLE                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ╔═══════════════════════════════════════════════════════════════════════╗  │
│  ║                                                                       ║  │
│  ║   DO NOT CONSUME ALL FRAMEWORK DOCUMENTS BEFORE STARTING             ║  │
│  ║                                                                       ║  │
│  ║   Combined framework size: ~2.0 MB                                   ║  │
│  ║   This will overload any context window.                             ║  │
│  ║                                                                       ║  │
│  ╚═══════════════════════════════════════════════════════════════════════╝  │
│                                                                              │
│  CORRECT APPROACH:                                                           │
│                                                                              │
│  1. Start with Bootstrap (this is the ignition key)                         │
│  2. Use BRIDGE.md to navigate (this document)                               │
│  3. Fetch ONLY the sections you need                                        │
│  4. Unload sections when done                                               │
│                                                                              │
│  CONTEXT PRIORITY:                                                           │
│  1. Project code (always highest)                                           │
│  2. Project intelligence file (claude.md)                                   │
│  3. Bootstrap (methodology essentials)                                      │
│  4. Specific NS/MBF sections (on demand)                                    │
│                                                                              │
│  ANTI-PATTERN:                                                               │
│  ✗ Loading NS v6.1 + MBF v2.5 + Bootstrap simultaneously                   │
│  ✗ Reading entire framework before starting work                            │
│  ✗ Keeping unused sections in context                                       │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# SECTION 9: TEMPLATE REFERENCE

## Available Templates

| Template | Location | Purpose |
|----------|----------|---------|
| **claude.md** | NS Section 0.2 | Project intelligence file |
| **handoff.md** | NS Section 0.3 | Session handoff format |
| **skill-manifest.json** | MBF 31B | Agent skill packaging |
| **adr.md** | NS Part VIII | Architecture decision record |

## When to Use Each

```
STARTING A PROJECT
└─ Generate: claude.md from NS Section 0.2 template

PAUSING WORK
└─ Create: handoff.md using NS Section 0.3 format

DEFINING AGENT SKILLS
└─ Create: skill-manifest.json using MBF 31B schema

MAKING ARCHITECTURE DECISIONS
└─ Document: Using ADR template from NS Part VIII
```

---

# SECTION 10: VERSION INFORMATION

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         VERSION INFORMATION                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  BRIDGE.md                                                                   │
│  Version: 1.2                                                                │
│  Updated: March 2026                                                         │
│                                                                              │
│  COMPATIBLE WITH:                                                            │
│  • North Star Blueprint v6.5                                                │
│  • Master Build Framework v2.5                                              │
│  • North Star Bootstrap v1.5                                                │
│                                                                              │
│  CHANGELOG:                                                                  │
│  v1.2 (March 2026)                                                          │
│    • ENH-005: Added 6 new decision tree branches (async, spec-driven,       │
│      multi-agent, tooling, self-improvement)                                │
│    • ENH-006: Added MBF routing for new categories 57–62                    │
│    • ENH-007: Added Section 12 — Creator-Proven Patterns (Boris Cherny)     │
│    • ENH-034: Added OpenClaw Integration Guide addendum                     │
│    • Updated version refs to Blueprint v6.5, MBF v2.5, Bootstrap v1.5      │
│                                                                              │
│  v2.0 (January 2026)                                                        │
│    • Added routing for Category 44A (Kanban & HITL)                         │
│    • Added routing for Category 44B (PromptOps)                             │
│    • Added routing for NS Section 19B (RLM Patterns)                        │
│    • Added Section 11 (GTM/Community)                                       │
│    • Added Use Case 6.3 (Human-AI Collaborative Workflow)                   │
│    • Added Use Case 6.5 (PromptOps at Scale)                                │
│    • Updated cross-reference matrix for new categories                      │
│    • Updated Example 2 with HITL patterns                                   │
│                                                                              │
│  v1.0 (January 2025) — Initial release                                      │
│    • Document hierarchy and reading order                                   │
│    • Complete cross-reference matrix                                        │
│    • Use case routing                                                        │
│    • Combined workflow examples                                              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# SECTION 11: COMMUNITY & GO-TO-MARKET (v2.0)

## Framework Identity

| Element | Value |
|---------|-------|
| **Brand** | @NavigatingTruth |
| **Framework** | North Star Blueprint |
| **Tagline** | "The compass for AI-native development" |

## Competitive Positioning

| Competitor | Their Focus | North Star Differentiation |
|------------|-------------|---------------------------|
| **Cursor** | AI code editor | Framework-agnostic, methodology-first |
| **Claude Code** | CLI coding agent | Full lifecycle, not just code |
| **Auto Claude** | Automation | Quality gates, confidence calibration |
| **Aider** | Git-focused AI coding | Broader scope, human-AI collaboration |

## Key Differentiators

```
NORTH STAR vs ALTERNATIVES
─────────────────────────────────────────────────────────────────────────────

1. LOAD BALANCING vs TOKEN BURNING
   └─ Competitors: "Load everything into context"
   └─ North Star: "Fetch what you need, unload when done"

2. CONFIDENCE CALIBRATION vs RUNAWAY EXECUTION
   └─ Competitors: "Execute until done or fail"
   └─ North Star: "Calibrate confidence, pause when uncertain"

3. SELF-CLEANING vs PERMANENT BLOAT
   └─ Competitors: "Accumulate state indefinitely"
   └─ North Star: "Scaffolding that cleans up after itself"

4. METHODOLOGY-FIRST vs TOOL-FIRST
   └─ Competitors: "Here's a tool, figure out the process"
   └─ North Star: "Here's the process, tools plug in"
```

## Target Communities

**Primary (Launch):**
- r/ClaudeAI (AI practitioners)
- r/MachineLearning (ML engineers)
- Anthropic Discord (Claude users)

**Secondary (Growth):**
- Hacker News (developers)
- r/programming (general devs)
- Twitter/X AI community

## Launch Checklist

```
□ README compelling and complete
□ Demo video or GIF created
□ Example projects included
□ Contributing guidelines written
□ Discord/community link active
□ Analytics tracking (stars, forks, clones)
□ License clearly stated (CC BY-NC-SA 4.0)
□ Commercial licensing path documented
```

---

# SECTION 12: CREATOR-PROVEN PATTERNS

```
CREATOR-PROVEN PATTERNS — From the Claude Code Creator's Workflow
──────────────────────────────────────────────────────────────────────────────

Boris Cherny (Claude Code creator) shared his personal workflow in Jan 2026.
These are the patterns he uses at Anthropic — the most battle-tested approaches
available.

PARALLEL CHECKOUTS (not worktrees):
  → Cherny uses separate full git checkouts per session, NOT branches/worktrees
  → Reason: Maximum isolation, no shared state, simplest to reason about
  → Runs 5 local sessions + 5-10 remote on Anthropic's web app simultaneously
  → Remote sessions started with & from CLI for background execution
  → Uses --teleport to move sessions between web and local

PATTERN: "5 local + 5-10 remote"
  ┌──────────────────────────────────────────────────────────────┐
  │  LOCAL (5 sessions)          REMOTE (5-10 sessions)          │
  │  ─────────────────────       ──────────────────────          │
  │  Complex features            Background tasks                 │
  │  Needs testing/debugging     Fire-and-forget tasks            │
  │  Requires local tools        Review-later PRs                 │
  │  Sensitive code              Research/documentation           │
  └──────────────────────────────────────────────────────────────┘

SESSION ABANDONMENT STRATEGY:
  → Cherny accepts ~10-20% session abandonment as normal
  → If unexpected scenario arises, abandon and restart with better context
  → This is NOT failure — it's efficient resource management

NS FRAMEWORK RECOMMENDATION:
  → Use worktrees for most multi-agent work (simpler, built into Claude Code)
  → Use separate checkouts when you need maximum isolation for sensitive features
  → Use remote sessions for all research, documentation, and async tasks
```

---

# ADDENDUM: OPENCLAW INTEGRATION GUIDE

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║              OPENCLAW INTEGRATION GUIDE — NS FRAMEWORK ADDENDUM             ║
║                                                                              ║
║         Connecting the Life OS Layer to Your Development Stack              ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

## WHAT IS OPENCLAW?

OpenClaw is an open-source "Life OS" agent — a 24/7 personal AI assistant
that lives on your machine and connects to messaging apps you already use.

Created by Peter Steinberger (PSPDFKit founder) in Nov 2025. Reached 199K+
GitHub stars by Feb 2026. Creator joined OpenAI in Feb 2026. Now maintained
by an open-source foundation with OpenAI backing.

IMPORTANT DISTINCTION:
  OpenClaw ≠ Claude Code replacement
  OpenClaw = the DISPATCH LAYER that makes Claude Code hands-free

  Claude Code:  Coding agent. Lives in terminal. Does one thing excellently.
  OpenClaw:     Life OS. Lives in messaging apps. Does everything else.

────────────────────────────────────────────────────────────────────────────────

## THE NS FRAMEWORK + OPENCLAW ARCHITECTURE

                    YOUR PHONE OR MESSAGING APP
                           │
                    WhatsApp / Telegram / Slack
                           │
                    ┌──────▼──────────┐
                    │  OpenClaw       │
                    │  (always-on     │
                    │   daemon)       │
                    └──────┬──────────┘
                           │ Routes intent to action
                           │
              ┌────────────┼────────────┐
              │            │            │
        ┌─────▼────┐ ┌─────▼────┐ ┌───▼──────┐
        │ Claude   │ │ Calendar │ │ Email    │
        │ Code     │ │ /Notion  │ │ / Slack  │
        │ (RPIT)   │ │ (tasks)  │ │ (comms)  │
        └─────┬────┘ └──────────┘ └──────────┘
              │
        ┌─────▼────┐
        │ GitHub   │
        │ (PRs,    │
        │ Issues)  │
        └──────────┘

────────────────────────────────────────────────────────────────────────────────

## 5 HIGH-VALUE USE CASES FOR NS FRAMEWORK USERS

### USE CASE 1: Async Claude Code Triggering
Mobile-triggered development. Delegate without being at your desk.

  You send (WhatsApp): "Fix the bug in issue #47 and create a PR"
  OpenClaw executes:   claude --model sonnet "Work on GitHub issue #47.
                       Read it first. Use RPIT loop. When done, create PR."
  You receive:         "PR #83 created: Fix: resolved auth timeout bug in #47"

Setup:
  1. Create OpenClaw skill: dev-delegate
  2. Skill watches for: "fix", "implement", "work on", "build"
  3. Routes to: claude CLI with structured prompt
  4. Reports back: PR URL or error summary

### USE CASE 2: Multi-Repo Morning Briefing
Start every day knowing where all your projects stand.

  6:00 AM cron: OpenClaw runs briefing
  7:30 AM (you wake up and check Telegram):
    "DAILY BRIEFING:
     • project-alpha: 2 open PRs ready for review (#45, #46)
     • project-beta: Build failing on main (3 commits since fix)
     • project-gamma: 5 issues assigned to you, 2 due this week
     • Most urgent: project-beta build needs attention"

Setup:
  1. OpenClaw skill: morning-dev-briefing
  2. Runs at 6 AM via cron
  3. Uses GitHub CLI to fetch status across repos
  4. Formats and sends to your Telegram

### USE CASE 3: RALPH Loop Completion Notifications
Know when overnight builds complete without checking constantly.

  Night: You start RALPH loop on a complex refactor
  2:47 AM: RALPH completes successfully  
  Morning:  Telegram: "RALPH loop complete ✅
             52 iterations | 3 failures resolved
             Tests: 847/847 passing
             PR #91 created — ready for your review"

Setup:
  1. Add session-end hook to Claude Code that sends HTTP request
  2. OpenClaw skill receives webhook → formats → sends Telegram

### USE CASE 4: Spec-to-Issue Pipeline
Convert voice/text ideas into GitHub issues instantly.

  Sunday 9 PM (on couch): 
    WhatsApp: "we should add export to CSV on the data table, mobile-friendly,
               under 3 seconds, include filters"
  
  OpenClaw → Claude API:
    - Parses intent
    - Formats as GitHub issue with acceptance criteria
    - Creates: gh issue create --title "Feature: CSV export for data table"
               --body "[formatted spec]" --label "feature"
  
  Monday AM: Issue #52 waiting for you in GitHub

### USE CASE 5: Cross-Platform Context Bridge
Capture ideas wherever you are, automatically available in Claude Code.

  Meeting notes → OpenClaw → Creates .context/meeting-[date].md in repo
  When you start Claude Code: "There are new meeting notes from today,
                               shall I review them before we begin?"

────────────────────────────────────────────────────────────────────────────────

## SHOULD YOU USE OPENCLAW?

Do you frequently think of dev tasks away from your desk?    YES → worth trying
Are you running multi-day parallel agent workflows?          YES → high value
Do you want to delegate without opening terminal?            YES → good fit
Is your primary pain point coding quality, not delegation?   NO  → skip for now
Are you concerned about security/data privacy?               → read security section
Are you a team of 1 building solo?                          → medium value

────────────────────────────────────────────────────────────────────────────────

## SECURITY AND PRIVACY

OpenClaw has full system access by design. This is powerful and risky.

MINIMUM SECURITY SETUP:
  □ Run OpenClaw in Docker container with explicit volume mounts
  □ Create a dedicated user with minimal permissions
  □ Never run as root
  □ Whitelist only the directories it needs (your project repos, not /)
  □ Review each ClawHub skill source code before installing
  □ Use local LLM (Ollama + Kimi 2.5 or Llama 3.3) for anything sensitive
  □ Separate OpenClaw instance for work vs personal if mixing contexts

DATA SOVEREIGNTY OPTIONS:
  → Cloud models (Claude/GPT): your messages leave your machine
  → Local models (Ollama): completely offline, slower, comparable quality

────────────────────────────────────────────────────────────────────────────────

## GETTING STARTED

1. Install OpenClaw: github.com/OpenClaw-AI/OpenClaw
2. Connect one messaging app (start with Telegram — easiest setup)
3. Install one skill: dev-status (shows your GitHub notifications)
4. Verify it works before connecting to Claude Code automation
5. Add one automation: morning briefing (low risk, high value)
6. Then: async Claude Code triggering (higher risk — test thoroughly)

For the ClawHub skill registry: clawhu.b.io (5,700+ community skills)

────────────────────────────────────────────────────────────────────────────────

## SEE ALSO
- MBF Category 60: Life OS Agents (full technology matrix)
- ENH-002: Bootstrap async delegation bridge
- ENH-012: Parallel agent orchestration
- ENH-016: Feedback loop + RALPH completion notifications
```

---

# QUICK REFERENCE CARD

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     BRIDGE.md QUICK REFERENCE                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  START HERE:           NORTH_STAR_BOOTSTRAP.md (ignition key)               │
│  NAVIGATE WITH:        BRIDGE.md (this document)                            │
│  HOW TO BUILD:         North Star Blueprint v6.5                            │
│  WHAT TO BUILD WITH:   Master Build Framework v2.5                          │
│  PROJECT STATE:        claude.md (your project's file)                      │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  COMMON ROUTES:                                                              │
│  • Starting project     → NS 0 + NS 2 + MBF Build Patterns                  │
│  • Choosing tech        → MBF Categories + NS 38                            │
│  • Building features    → NS 11 + MBF relevant category                     │
│  • AI/Agents            → NS IV-V + MBF 29-35                               │
│  • Human-AI workflows   → MBF 44A + NS 19B + NS 17                ← v2.0    │
│  • Prompt management    → MBF 44B + MBF 46                        ← v2.0    │
│  • Testing              → NS IX + MBF 46                                    │
│  • Security             → NS X + MBF 50-53                                  │
│  • Stuck                → NS 0.5                                            │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  REMEMBER: Reference on demand. Don't consume everything upfront.           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

*End of BRIDGE.md v1.5*
