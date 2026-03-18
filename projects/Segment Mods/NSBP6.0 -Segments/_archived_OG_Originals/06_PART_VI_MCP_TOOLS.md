# PART VI: MCP & TOOL ORCHESTRATION

---

## 24. MCP POWER TOOLS MATRIX

> "MCP transforms AI from an advisor into an operator."

### 24.1 MCP Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        MCP POWER TOOLS MATRIX                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  WHAT IS MCP?                                                                │
│  Model Context Protocol - A standard for connecting AI models to            │
│  external tools, data sources, and services.                                │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  MCP ARCHITECTURE:                                                           │
│                                                                              │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐                      │
│  │   AI Model  │◄──►│  MCP Layer  │◄──►│  External   │                      │
│  │   (Claude)  │    │  (Protocol) │    │  Services   │                      │
│  └─────────────┘    └─────────────┘    └─────────────┘                      │
│                           │                                                  │
│                           │                                                  │
│              ┌────────────┼────────────┐                                    │
│              │            │            │                                    │
│              ▼            ▼            ▼                                    │
│         ┌────────┐  ┌────────┐  ┌────────┐                                  │
│         │ Tools  │  │Resources│  │ Prompts│                                  │
│         │        │  │        │  │        │                                  │
│         │Actions │  │Data    │  │Templates│                                 │
│         │to take │  │to read │  │to use   │                                 │
│         └────────┘  └────────┘  └────────┘                                  │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  WHY MCP MATTERS:                                                            │
│  • Standardized interface (same pattern for all integrations)               │
│  • Composable (combine multiple MCPs)                                        │
│  • Secure (controlled access to external systems)                           │
│  • Extensible (add new MCPs without changing model)                         │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 24.2 Core MCP Categories

```
CORE MCP CATEGORIES
─────────────────────────────────────────────────────────────────────────────

CATEGORY 1: FILE SYSTEM MCPs
─────────────────────────────────────────────────────────────────────────────
Purpose: Extended file operations

┌────────────────────────────────────────────────────────────────────────────┐
│ CAPABILITY           │ USE CASE                    │ EXAMPLE              │
├────────────────────────────────────────────────────────────────────────────┤
│ Recursive operations │ Process entire directories  │ Find all .ts files   │
│ File watching        │ Monitor for changes         │ Hot reload trigger   │
│ Glob patterns        │ Batch file selection        │ **/*.test.ts         │
│ Metadata access      │ File info without content   │ Size, dates, perms   │
│ Archive operations   │ Zip/unzip                   │ Package distribution │
└────────────────────────────────────────────────────────────────────────────┘


CATEGORY 2: DATABASE MCPs
─────────────────────────────────────────────────────────────────────────────
Purpose: Direct database interaction

┌────────────────────────────────────────────────────────────────────────────┐
│ CAPABILITY           │ USE CASE                    │ EXAMPLE              │
├────────────────────────────────────────────────────────────────────────────┤
│ Query execution      │ Read data                   │ SELECT * FROM users  │
│ Schema inspection    │ Understand structure        │ List tables/columns  │
│ Data modification    │ CRUD operations             │ INSERT, UPDATE       │
│ Migration support    │ Schema changes              │ Add column           │
│ Transaction handling │ Atomic operations           │ Multi-step updates   │
└────────────────────────────────────────────────────────────────────────────┘


CATEGORY 3: BROWSER MCPs
─────────────────────────────────────────────────────────────────────────────
Purpose: Web automation and testing

┌────────────────────────────────────────────────────────────────────────────┐
│ CAPABILITY           │ USE CASE                    │ EXAMPLE              │
├────────────────────────────────────────────────────────────────────────────┤
│ Navigation           │ Load pages                  │ goto(url)            │
│ Element interaction  │ Click, type, select         │ click('#submit')     │
│ Content extraction   │ Scrape data                 │ getText('.price')    │
│ Screenshot capture   │ Visual documentation        │ screenshot()         │
│ Network interception │ API monitoring              │ intercept requests   │
└────────────────────────────────────────────────────────────────────────────┘


CATEGORY 4: API MCPs
─────────────────────────────────────────────────────────────────────────────
Purpose: External API integration

┌────────────────────────────────────────────────────────────────────────────┐
│ CAPABILITY           │ USE CASE                    │ EXAMPLE              │
├────────────────────────────────────────────────────────────────────────────┤
│ REST calls           │ Standard API interaction    │ GET /api/users       │
│ GraphQL              │ Query languages             │ { user { name } }    │
│ Authentication       │ OAuth, API keys             │ Bearer token         │
│ Rate limiting        │ Respect API limits          │ Retry with backoff   │
│ Response parsing     │ Extract structured data     │ JSON to object       │
└────────────────────────────────────────────────────────────────────────────┘


CATEGORY 5: CLOUD MCPs
─────────────────────────────────────────────────────────────────────────────
Purpose: Cloud service management

┌────────────────────────────────────────────────────────────────────────────┐
│ CAPABILITY           │ USE CASE                    │ EXAMPLE              │
├────────────────────────────────────────────────────────────────────────────┤
│ Deployment           │ Ship to production          │ Deploy to Vercel     │
│ Configuration        │ Environment setup           │ Set env variables    │
│ Monitoring           │ Check system health         │ Get error logs       │
│ Scaling              │ Resource management         │ Scale instances      │
│ Storage              │ Object storage              │ S3 operations        │
└────────────────────────────────────────────────────────────────────────────┘
```

### 24.3 MCP Selection Guide

```
MCP SELECTION DECISION TREE
─────────────────────────────────────────────────────────────────────────────

What are you trying to do?

├── Work with LOCAL FILES
│   ├── Simple read/write → Built-in tools (no MCP needed)
│   └── Complex operations → File System MCP
│       • Recursive search
│       • Batch operations
│       • File watching
│
├── Work with DATABASES
│   ├── Read data for analysis → Database MCP
│   ├── Modify schema → Database MCP (with caution)
│   └── App database queries → Code the queries (not MCP)
│
├── Work with WEB PAGES
│   ├── Fetch content → Built-in web_fetch
│   ├── Search the web → Built-in web_search
│   └── Automate interactions → Browser MCP
│       • Form filling
│       • Multi-step flows
│       • Screenshots
│
├── Work with EXTERNAL APIS
│   ├── Simple REST calls → Built-in fetch or API MCP
│   └── Complex integrations → Dedicated service MCP
│       • Slack MCP
│       • GitHub MCP
│       • etc.
│
└── Work with CLOUD SERVICES
    └── Use cloud-specific MCP
        • AWS MCP
        • GCP MCP
        • Azure MCP
        • Vercel MCP
        • etc.
```

---

## 25. MCP-FIRST ARCHITECTURE

### 25.1 MCP-First Principles

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       MCP-FIRST ARCHITECTURE                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  MCP-FIRST MEANS:                                                            │
│  Design systems assuming AI agents will be primary operators.               │
│  Every capability should be MCP-accessible.                                 │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 1: EVERY OPERATION SHOULD BE TOOLABLE                            │
│  ───────────────────────────────────────────────────────────────────────    │
│  If a human can do it, an agent should be able to do it via MCP.           │
│                                                                              │
│  ANTI-PATTERN:                                                               │
│  • Operations that require GUI interaction                                   │
│  • Processes that need manual intervention                                   │
│  • Workflows that can't be automated                                        │
│                                                                              │
│  PATTERN:                                                                    │
│  • CLI equivalents for all GUI operations                                   │
│  • API endpoints for all interactions                                        │
│  • Scriptable workflows                                                      │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 2: STRUCTURED DATA OVER UNSTRUCTURED                             │
│  ───────────────────────────────────────────────────────────────────────    │
│  AI agents work better with structured, typed data.                         │
│                                                                              │
│  ANTI-PATTERN:                                                               │
│  • Prose-based configuration                                                 │
│  • Free-form logging                                                         │
│  • Unstructured error messages                                               │
│                                                                              │
│  PATTERN:                                                                    │
│  • JSON/YAML configuration                                                   │
│  • Structured logging (JSON logs)                                            │
│  • Error codes with structured details                                       │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 3: IDEMPOTENT OPERATIONS                                          │
│  ───────────────────────────────────────────────────────────────────────    │
│  Same operation, same result—safe to retry.                                 │
│                                                                              │
│  ANTI-PATTERN:                                                               │
│  • Operations that fail on duplicate execution                              │
│  • Side effects that compound                                                │
│  • State-dependent behavior                                                  │
│                                                                              │
│  PATTERN:                                                                    │
│  • Idempotency keys                                                          │
│  • Upsert instead of insert                                                  │
│  • Declarative state (desired state, not mutations)                         │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 25.2 MCP Integration Architecture

```
MCP INTEGRATION ARCHITECTURE
─────────────────────────────────────────────────────────────────────────────

┌─────────────────────────────────────────────────────────────────────────────┐
│                           AI ORCHESTRATOR                                    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                        MCP ROUTER                                    │    │
│  │                                                                      │    │
│  │  Routes requests to appropriate MCP based on:                       │    │
│  │  • Operation type                                                    │    │
│  │  • Target system                                                     │    │
│  │  • Current context                                                   │    │
│  │  • User permissions                                                  │    │
│  │                                                                      │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│         ┌──────────────────────────┼──────────────────────────┐             │
│         │                          │                          │             │
│         ▼                          ▼                          ▼             │
│  ┌─────────────┐           ┌─────────────┐           ┌─────────────┐        │
│  │   MCP 1     │           │   MCP 2     │           │   MCP 3     │        │
│  │  (Files)    │           │ (Database)  │           │  (Cloud)    │        │
│  │             │           │             │           │             │        │
│  │ • read      │           │ • query     │           │ • deploy    │        │
│  │ • write     │           │ • insert    │           │ • config    │        │
│  │ • search    │           │ • update    │           │ • monitor   │        │
│  │ • delete    │           │ • delete    │           │ • scale     │        │
│  └──────┬──────┘           └──────┬──────┘           └──────┬──────┘        │
│         │                          │                          │             │
│         ▼                          ▼                          ▼             │
│  ┌─────────────┐           ┌─────────────┐           ┌─────────────┐        │
│  │ Local File  │           │  Database   │           │   Cloud     │        │
│  │   System    │           │   Server    │           │  Provider   │        │
│  └─────────────┘           └─────────────┘           └─────────────┘        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 25.3 MCP Error Handling

```
MCP ERROR HANDLING PROTOCOL
─────────────────────────────────────────────────────────────────────────────

ERROR CATEGORIES:

1. CONNECTION ERRORS
─────────────────────────────────────────────────────────────────────────────
   Symptom: Can't reach MCP server
   Response: Retry with exponential backoff
   Fallback: Use alternative method or notify user
   
   Example:
   ```
   Error: MCP_CONNECTION_FAILED
   Retrying in 1s... 2s... 4s...
   Fallback: Using cached data
   ```

2. AUTHENTICATION ERRORS
─────────────────────────────────────────────────────────────────────────────
   Symptom: Permission denied
   Response: Check credentials, refresh tokens
   Fallback: Escalate to user for re-authentication
   
   Example:
   ```
   Error: MCP_AUTH_FAILED
   Action: Token expired, refreshing...
   If refresh fails: Request user re-authentication
   ```

3. OPERATION ERRORS
─────────────────────────────────────────────────────────────────────────────
   Symptom: Operation failed
   Response: Understand error, attempt alternative
   Fallback: Report to user with context
   
   Example:
   ```
   Error: MCP_OPERATION_FAILED (file not found)
   Attempted: Read /path/to/file.ts
   Alternative: Search for similar files
   If no alternative: Report to user
   ```

4. RATE LIMIT ERRORS
─────────────────────────────────────────────────────────────────────────────
   Symptom: Too many requests
   Response: Wait and retry per limit headers
   Fallback: Queue operations, batch where possible
   
   Example:
   ```
   Error: MCP_RATE_LIMITED
   Retry-After: 60 seconds
   Action: Queuing operation, will retry at [time]
   ```

5. DATA ERRORS
─────────────────────────────────────────────────────────────────────────────
   Symptom: Invalid data format
   Response: Validate and transform data
   Fallback: Report specific validation error
   
   Example:
   ```
   Error: MCP_INVALID_DATA
   Field: email
   Issue: Invalid format
   Action: Prompt for correction
   ```
```

---

## 26. VOICE-NATIVE DEVELOPMENT WORKFLOWS

### 26.1 Voice Development Philosophy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    VOICE-NATIVE DEVELOPMENT                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Voice isn't just an input method—it's a fundamentally different           │
│  way of interacting with development tools.                                 │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  VOICE ADVANTAGES:                                                           │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Higher bandwidth for complex requests                                    │
│  • More natural for creative/exploratory work                               │
│  • Hands-free operation                                                      │
│  • Faster for experienced users                                              │
│  • Better for explaining context                                             │
│                                                                              │
│  VOICE CHALLENGES:                                                           │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Less precise for exact code                                               │
│  • Ambient noise issues                                                      │
│  • Harder to reference specific line numbers                                │
│  • Can't easily "show" visual elements                                      │
│  • Requires clear enunciation                                                │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  OPTIMAL VOICE TASKS:                                                        │
│  ───────────────────────────────────────────────────────────────────────    │
│  ✅ High-level planning and architecture                                    │
│  ✅ Explaining requirements and context                                     │
│  ✅ Code review and discussion                                              │
│  ✅ Debugging conversation                                                  │
│  ✅ Documentation dictation                                                 │
│  ✅ Quick commands and navigation                                           │
│                                                                              │
│  SUBOPTIMAL VOICE TASKS:                                                     │
│  ───────────────────────────────────────────────────────────────────────    │
│  ⚠️ Precise code editing (use text)                                        │
│  ⚠️ Complex regex patterns (use text)                                      │
│  ⚠️ Exact file paths (use text or autocomplete)                            │
│  ⚠️ Symbol-heavy code (use text)                                           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 26.2 Voice Command Patterns

```
VOICE COMMAND PATTERNS
─────────────────────────────────────────────────────────────────────────────

NAVIGATION COMMANDS:
─────────────────────────────────────────────────────────────────────────────
"Open the user service file"
"Go to the authentication module"
"Show me the tests for this component"
"Find all files that import this function"

CREATION COMMANDS:
─────────────────────────────────────────────────────────────────────────────
"Create a new component called UserProfile"
"Add a function to validate email addresses"
"Generate tests for the shopping cart"
"Make a new API endpoint for user preferences"

MODIFICATION COMMANDS:
─────────────────────────────────────────────────────────────────────────────
"Add error handling to this function"
"Refactor this to use async await"
"Extract this logic into a separate function"
"Update the types to include the new field"

REVIEW COMMANDS:
─────────────────────────────────────────────────────────────────────────────
"Review this file for potential issues"
"Check if this follows our patterns"
"Look for security vulnerabilities"
"Analyze the performance of this function"

EXECUTION COMMANDS:
─────────────────────────────────────────────────────────────────────────────
"Run the tests"
"Build the project"
"Deploy to staging"
"Start the development server"

QUERY COMMANDS:
─────────────────────────────────────────────────────────────────────────────
"What does this function do?"
"Why are we using this pattern?"
"How is authentication implemented?"
"Where is this variable defined?"
```

### 26.3 Voice Session Structure

```
VOICE SESSION STRUCTURE
─────────────────────────────────────────────────────────────────────────────

PHASE 1: CONTEXT SETTING (Opening)
─────────────────────────────────────────────────────────────────────────────
Human: "Hey Claude, I'm working on the user dashboard feature. 
        We left off yesterday adding the chart component."

Agent: [Loads project context, finds previous work, summarizes state]
       "I see we have the chart component structure in place. 
        The data fetching is done, but rendering isn't connected yet.
        Should we continue with that?"


PHASE 2: PLANNING (Direction)
─────────────────────────────────────────────────────────────────────────────
Human: "Yes, and I also want to add a date range selector. 
        Let's plan both of those."

Agent: [Plans the work]
       "Okay, I'd suggest:
        1. First connect the chart data binding
        2. Add the date range selector component
        3. Wire up the selector to filter the chart data
        Should I start with step 1?"


PHASE 3: EXECUTION (Implementation)
─────────────────────────────────────────────────────────────────────────────
Human: "Go ahead with step 1"

Agent: [Executes, shows progress]
       "I've connected the chart to the data hook. 
        The chart should now render the user activity data.
        Want me to show you the changes or run it?"


PHASE 4: VERIFICATION (Review)
─────────────────────────────────────────────────────────────────────────────
Human: "Run it and show me"

Agent: [Runs, captures state]
       "The dev server is running. The chart is displaying but 
        I noticed the Y-axis labels are overlapping. 
        Should I fix that before moving on?"


PHASE 5: ITERATION (Refinement)
─────────────────────────────────────────────────────────────────────────────
Human: "Yes, fix that and then let's move to the date selector"

Agent: [Fixes, continues]
       "Fixed the Y-axis with responsive sizing. 
        Now starting on the date range selector..."


PHASE 6: WRAP-UP (Closing)
─────────────────────────────────────────────────────────────────────────────
Human: "Let's stop here for now"

Agent: [Summarizes, saves state]
       "Got it. Here's what we accomplished:
        - Chart component connected and rendering
        - Date selector component created
        - Basic filtering working
        
        Next session we could:
        - Add preset date ranges
        - Improve the selector UX
        
        I've updated the project status."
```

---

## 27. IDE ROUTING STRATEGY

### 27.1 IDE Selection Matrix

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        IDE ROUTING STRATEGY                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Different environments are optimal for different tasks.                    │
│  Route work to the right environment.                                       │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  ENVIRONMENT OPTIONS:                                                        │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ CHAT INTERFACE (Claude.ai / App)                                     │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Planning and architecture discussion                               │    │
│  │ • Code review and analysis                                           │    │
│  │ • Learning and exploration                                           │    │
│  │ • Document creation (Word, Excel, PPT)                               │    │
│  │ • Quick questions                                                    │    │
│  │                                                                      │    │
│  │ LIMITATIONS:                                                         │    │
│  │ • Limited file system access                                         │    │
│  │ • Manual copy-paste for code                                         │    │
│  │ • No live project integration                                        │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ CLAUDE CODE (CLI)                                                    │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Agentic coding (autonomous implementation)                         │    │
│  │ • Multi-file changes                                                 │    │
│  │ • Project-wide refactoring                                           │    │
│  │ • Test generation and execution                                      │    │
│  │ • Git operations                                                     │    │
│  │                                                                      │    │
│  │ LIMITATIONS:                                                         │    │
│  │ • Terminal-based (no visual preview)                                 │    │
│  │ • Requires CLI comfort                                               │    │
│  │ • Can be overkill for simple tasks                                   │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ IDE EXTENSIONS (VS Code, etc.)                                       │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Inline code completion                                             │    │
│  │ • Quick edits with context                                           │    │
│  │ • Code explanation while reading                                     │    │
│  │ • Small, focused changes                                             │    │
│  │ • Working within existing IDE workflow                               │    │
│  │                                                                      │    │
│  │ LIMITATIONS:                                                         │    │
│  │ • Less autonomous than Claude Code                                   │    │
│  │ • Limited multi-file coordination                                    │    │
│  │ • May have smaller context window                                    │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ API (Custom Integration)                                             │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Custom workflows                                                   │    │
│  │ • Automated pipelines                                                │    │
│  │ • Integration with other tools                                       │    │
│  │ • Batch processing                                                   │    │
│  │                                                                      │    │
│  │ LIMITATIONS:                                                         │    │
│  │ • Requires development effort                                        │    │
│  │ • No built-in UI                                                     │    │
│  │ • Management overhead                                                │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 27.2 Task-to-Environment Routing

```
TASK-TO-ENVIRONMENT ROUTING
─────────────────────────────────────────────────────────────────────────────

TASK                              │ RECOMMENDED ENVIRONMENT
──────────────────────────────────┼─────────────────────────────────────────
                                  │
PLANNING & DESIGN                 │
──────────────────────────────────┼─────────────────────────────────────────
Architecture planning             │ Chat Interface
System design discussion          │ Chat Interface
API design                        │ Chat Interface
Database schema design            │ Chat Interface
                                  │
IMPLEMENTATION                    │
──────────────────────────────────┼─────────────────────────────────────────
New feature (multi-file)          │ Claude Code
New feature (single file)         │ IDE Extension
Bug fix (known location)          │ IDE Extension
Bug fix (unknown location)        │ Claude Code
Refactoring                       │ Claude Code
Quick edit                        │ IDE Extension
                                  │
REVIEW & ANALYSIS                 │
──────────────────────────────────┼─────────────────────────────────────────
Code review                       │ Chat Interface or IDE
Security review                   │ Chat Interface
Architecture review               │ Chat Interface
                                  │
DOCUMENTATION                     │
──────────────────────────────────┼─────────────────────────────────────────
Write technical docs              │ Chat Interface
Update README                     │ Claude Code
Generate API docs                 │ Claude Code
Create presentations              │ Chat Interface
                                  │
TESTING                           │
──────────────────────────────────┼─────────────────────────────────────────
Write tests                       │ Claude Code
Run tests                         │ Claude Code or IDE
Debug failing tests               │ Claude Code
                                  │
OPERATIONS                        │
──────────────────────────────────┼─────────────────────────────────────────
Git operations                    │ Claude Code
Deployment                        │ Claude Code
Environment setup                 │ Claude Code
```

### 27.3 Environment Handoff Protocol

```
ENVIRONMENT HANDOFF PROTOCOL
─────────────────────────────────────────────────────────────────────────────

SCENARIO: Chat to Claude Code
─────────────────────────────────────────────────────────────────────────────
When: Architecture is planned, ready to implement

Chat Output:
```
## Ready for Implementation

We've designed the authentication system:
- JWT tokens with refresh
- Role-based access control
- Session management

### Claude Code Command:
cd /path/to/project && claude "Implement the authentication system 
we designed. See docs/auth-design.md for specifications."

### Files to Create:
- src/auth/jwt.ts
- src/auth/roles.ts
- src/auth/session.ts
- src/middleware/auth.ts
```

─────────────────────────────────────────────────────────────────────────────

SCENARIO: Claude Code to Chat
─────────────────────────────────────────────────────────────────────────────
When: Hit a design decision, need discussion

Claude Code Output:
```
I've implemented the basic structure but hit a design question:

Should we use:
A) Centralized session store (Redis)
B) Distributed JWT claims

Each has trade-offs. Let's discuss in chat.

Context file created: .claude/session-design-question.md
```

─────────────────────────────────────────────────────────────────────────────

SCENARIO: IDE to Claude Code
─────────────────────────────────────────────────────────────────────────────
When: Small edit revealed need for larger refactor

IDE Extension Note:
```
This function needs more than a quick fix.
Consider running Claude Code for full refactor:

claude "Refactor the user service to use the repository pattern.
Current implementation in src/services/user.ts has grown too complex."
```
```

---

## PART VI SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    PART VI: MCP & TOOL ORCHESTRATION                         │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  MCP POWER TOOLS:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • MCP = Standard protocol for AI-external system integration               │
│  • Categories: File System, Database, Browser, API, Cloud                   │
│  • Use simplest tool that works                                              │
│  • Built-in tools often sufficient                                           │
│                                                                              │
│  MCP-FIRST ARCHITECTURE:                                                     │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Every operation should be toolable                                        │
│  • Structured data over unstructured                                         │
│  • Idempotent operations (safe to retry)                                    │
│  • Route through MCP layer                                                   │
│  • Handle errors gracefully with fallbacks                                   │
│                                                                              │
│  VOICE-NATIVE DEVELOPMENT:                                                   │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Best for: Planning, review, discussion, high-level commands              │
│  • Suboptimal for: Precise code editing, symbol-heavy work                  │
│  • Session structure: Context → Plan → Execute → Verify → Iterate           │
│  • Save state for session continuity                                         │
│                                                                              │
│  IDE ROUTING:                                                                │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Chat Interface: Planning, review, documents                               │
│  • Claude Code: Multi-file implementation, refactoring, tests               │
│  • IDE Extensions: Quick edits, inline completion                           │
│  • API: Custom workflows, automation                                         │
│  • Hand off between environments with clear context                          │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
