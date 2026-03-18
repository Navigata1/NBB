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

### 14.1 The Four Primitives

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          THE CORE 4 PRIMITIVES                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                         1. RETRIEVE                                  │    │
│  │              "Find and access relevant information"                  │    │
│  │                                                                      │    │
│  │  • Search through files and documents                               │    │
│  │  • Access external knowledge bases                                   │    │
│  │  • Query databases                                                   │    │
│  │  • Fetch from APIs                                                   │    │
│  │  • Load context into memory                                          │    │
│  │                                                                      │    │
│  │  TOOLS: File readers, search, RAG, MCP file tools                   │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                         2. REASON                                    │    │
│  │              "Analyze, plan, and make decisions"                     │    │
│  │                                                                      │    │
│  │  • Understand requirements                                           │    │
│  │  • Analyze problems                                                  │    │
│  │  • Generate solutions                                                │    │
│  │  • Make trade-off decisions                                          │    │
│  │  • Plan multi-step approaches                                        │    │
│  │                                                                      │    │
│  │  TOOLS: Model inference, chain-of-thought, planning prompts         │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                         3. CREATE                                    │    │
│  │              "Generate new content and artifacts"                    │    │
│  │                                                                      │    │
│  │  • Write code                                                        │    │
│  │  • Generate documentation                                            │    │
│  │  • Create configurations                                             │    │
│  │  • Produce test cases                                                │    │
│  │  • Draft communications                                              │    │
│  │                                                                      │    │
│  │  TOOLS: Code generation, text generation, file writers              │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                         4. VERIFY                                    │    │
│  │              "Check correctness and quality"                         │    │
│  │                                                                      │    │
│  │  • Run tests                                                         │    │
│  │  • Check syntax                                                      │    │
│  │  • Validate output                                                   │    │
│  │  • Review for errors                                                 │    │
│  │  • Compare against requirements                                      │    │
│  │                                                                      │    │
│  │  TOOLS: Linters, test runners, validators, diff tools               │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 14.2 Primitive Composition Patterns

```
PRIMITIVE COMPOSITION PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN 1: RETRIEVE-REASON-CREATE (Standard Development)
─────────────────────────────────────────────────────────────────────────────

  ┌──────────┐    ┌──────────┐    ┌──────────┐
  │ RETRIEVE │───►│  REASON  │───►│  CREATE  │
  │          │    │          │    │          │
  │ Read     │    │ Analyze  │    │ Write    │
  │ existing │    │ approach │    │ new code │
  │ code     │    │          │    │          │
  └──────────┘    └──────────┘    └──────────┘

  USE WHEN: Building new features based on existing patterns


PATTERN 2: RETRIEVE-REASON-CREATE-VERIFY (Full Cycle)
─────────────────────────────────────────────────────────────────────────────

  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
  │ RETRIEVE │───►│  REASON  │───►│  CREATE  │───►│  VERIFY  │
  │          │    │          │    │          │    │          │
  └──────────┘    └──────────┘    └──────────┘    └────┬─────┘
                                                       │
                       ┌───────────────────────────────┘
                       │ If verification fails
                       ▼
                  Back to REASON

  USE WHEN: Production code that must be correct


PATTERN 3: REASON-CREATE-VERIFY-ITERATE (Exploratory)
─────────────────────────────────────────────────────────────────────────────

  ┌──────────┐    ┌──────────┐    ┌──────────┐
  │  REASON  │───►│  CREATE  │───►│  VERIFY  │
  │          │    │          │    │          │
  └──────────┘    └──────────┘    └────┬─────┘
       ▲                               │
       │                               │
       └───────────────────────────────┘
              Iterate until correct

  USE WHEN: Exploring solutions without existing patterns


PATTERN 4: RETRIEVE-VERIFY (Audit Pattern)
─────────────────────────────────────────────────────────────────────────────

  ┌──────────┐    ┌──────────┐
  │ RETRIEVE │───►│  VERIFY  │
  │          │    │          │
  │ Load     │    │ Check    │
  │ code     │    │ quality  │
  └──────────┘    └──────────┘

  USE WHEN: Code review, security audit, quality checks
```

### 14.3 Primitive Quality Requirements

```
PRIMITIVE QUALITY REQUIREMENTS
─────────────────────────────────────────────────────────────────────────────

RETRIEVE QUALITY
─────────────────────────────────────────────────────────────────────────────
□ Retrieved content is current (not stale cache)
□ Retrieved content is complete (not truncated)
□ Retrieved content is relevant (not noise)
□ Source is identified and traceable
□ No hallucinated file contents

REASON QUALITY
─────────────────────────────────────────────────────────────────────────────
□ Reasoning is explicit (chain-of-thought visible)
□ Assumptions are stated
□ Alternatives are considered
□ Trade-offs are acknowledged
□ Confidence level is indicated

CREATE QUALITY
─────────────────────────────────────────────────────────────────────────────
□ Output matches requirements
□ Output follows existing patterns
□ Output is complete (not partial)
□ Output is properly formatted
□ Output is immediately usable

VERIFY QUALITY
─────────────────────────────────────────────────────────────────────────────
□ Verification is comprehensive
□ Verification is automated where possible
□ Verification results are clear
□ Failures include actionable information
□ False positives/negatives are minimized
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
