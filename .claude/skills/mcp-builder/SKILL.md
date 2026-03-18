---
name: mcp-builder
version: 1.0
author: NavigatingTruth / NorthStarFramework
upstream_repo: https://github.com/anthropics/skills
upstream_sha: b0cbd3df1533b396d281a6886d5132f623393a9c
upstream_pinned: 2026-03-18
description: >
  Guide for creating MCP (Model Context Protocol) servers that enable LLMs
  to interact with external services through well-designed tools. Use when
  building MCP servers, integrating external APIs via MCP, or creating
  tool bridges for agent workflows. Triggers: "build an MCP server",
  "create MCP tools", "MCP integration", "Model Context Protocol",
  "connect to API via MCP", "MCP server", "tool server".
triggers:
  - "build an MCP server"
  - "create MCP tools"
  - "MCP integration"
  - "Model Context Protocol"
  - "connect to API via MCP"
  - "MCP server"
  - "tool server"
---

# MCP Builder Skill

## Purpose
Create high-quality MCP servers that enable LLMs to accomplish real-world tasks
through well-designed tools. Quality is measured by how effectively agents can
discover, invoke, and compose tools to solve problems — not by how many
endpoints are wrapped.

Adapted from Anthropic's official mcp-builder skill for NS Framework conventions.

## When to Activate
- User wants to build an MCP server for an external API
- User needs to create tool bridges for agent workflows
- User is integrating a service via Model Context Protocol
- User asks about MCP best practices or server architecture
- User wants to expose existing functionality as MCP tools

## Core Principle
An MCP server is only as good as the experience it creates for the agent using
it. Every design decision — tool naming, error messages, output shape — should
be evaluated from the agent's perspective: "Can the LLM figure out what to call,
when, and what the result means?"

## Execution Protocol

### Phase 1: Research and Planning (do not skip)

**Step 1: Study the MCP specification**
- Read the spec sitemap: https://modelcontextprotocol.io/sitemap.xml
- Focus on: tool definitions, transport options, structured content, annotations

**Step 2: Read the SDK docs for your target language**
- TypeScript (default): https://raw.githubusercontent.com/modelcontextprotocol/typescript-sdk/main/README.md
- Python (if user specifies): https://raw.githubusercontent.com/modelcontextprotocol/python-sdk/main/README.md
- Default to TypeScript unless user explicitly requests otherwise

**Step 3: Understand the target API**
- Read the API's official documentation (Tier A source — verify, don't assume)
- Map out: endpoints, authentication model, rate limits, data models, pagination
- Identify which operations are read-only vs. destructive
- Note any webhooks, streaming, or long-running operations

**Step 4: Plan tool selection**
- Prioritize comprehensive API coverage — agents need access to the full surface
- Group tools by domain (e.g., `issues_*`, `repos_*`, `users_*`)
- Identify which tools compose well together (multi-step workflows)
- Distinguish between API-wrapping tools and workflow-level tools

**Step 5: Choose transport**
- **Streamable HTTP** — for remote servers, multi-client access, production use
- **stdio** — for local-only tools, CLI integration, development/testing

Output: Write a plan to `plan.md` following the plan-annotator format.
Wait for explicit approval before Phase 2.

### Phase 2: Implementation

**Step 1: Project structure setup**
```
my-mcp-server/
├── src/
│   ├── index.ts          # Server entry point
│   ├── tools/            # Tool definitions (one file per domain)
│   ├── clients/          # API client wrappers
│   └── utils/            # Shared utilities (pagination, errors, auth)
├── package.json
├── tsconfig.json
└── README.md
```

For Python projects:
```
my-mcp-server/
├── src/
│   └── my_mcp_server/
│       ├── __init__.py
│       ├── server.py     # Server entry point
│       ├── tools/        # Tool definitions
│       ├── clients/      # API client wrappers
│       └── utils/        # Shared utilities
├── pyproject.toml
└── README.md
```

**Step 2: Core infrastructure**
Build these first, before any tools:
1. **API client** — centralized HTTP client with auth, retries, rate limit handling
2. **Auth** — environment variable-based credentials (NEVER hardcode)
3. **Error handling** — structured errors that produce actionable agent messages
4. **Pagination** — generic pagination helper the tools can reuse

**Step 3: Tool implementation**
For each tool, define:

| Aspect | TypeScript | Python |
|--------|-----------|--------|
| Input schema | Zod | Pydantic |
| Output | `structuredContent` where possible | `structuredContent` where possible |
| Validation | Zod `.parse()` | Pydantic model validation |

Every tool MUST have:
- **Name:** consistent prefix, action-oriented (e.g., `github_create_issue`, `slack_send_message`)
- **Description:** concise, tells the agent WHEN to use this tool and WHAT it returns
- **Input schema:** fully typed, with descriptions on every field
- **Annotations:**
  - `readOnlyHint` — true for GET-like operations
  - `destructiveHint` — true for DELETE or irreversible operations
  - `idempotentHint` — true for PUT-like operations (safe to retry)
  - `openWorldHint` — true if the tool interacts with external state

**Step 4: Tool naming convention**
```
[service]_[action]_[resource]

Examples:
  github_list_issues
  github_create_issue
  github_get_pull_request
  slack_send_message
  stripe_create_customer
```

**Step 5: Error messages**
Error messages are instructions to the agent. They must be actionable:

```
BAD:  "Error 404"
GOOD: "Repository 'owner/repo' not found. Verify the owner and repo name
       are correct. Use github_list_repos to find available repositories."

BAD:  "Authentication failed"
GOOD: "GitHub token is invalid or expired. Ensure GITHUB_TOKEN environment
       variable is set with a valid personal access token that has 'repo' scope."
```

### Phase 3: Review and Test

**Step 1: Code quality review**
Check for:
- [ ] DRY — no duplicated API call patterns or error handling
- [ ] Consistent error handling across all tools
- [ ] Full type coverage (no `any` in TypeScript, no untyped dicts in Python)
- [ ] All credentials from environment variables
- [ ] Pagination supported where the API supports it

**Step 2: Build verification**
```bash
# TypeScript
npm run build

# Python
python -m py_compile src/my_mcp_server/server.py
```

**Step 3: Test with MCP Inspector**
```bash
npx @modelcontextprotocol/inspector
```
Verify:
- [ ] All tools appear in the tool listing
- [ ] Each tool's input schema is correct and complete
- [ ] Calling each tool returns expected output shape
- [ ] Error cases return actionable messages (not stack traces)
- [ ] Pagination works end-to-end

**Step 4: Manual integration test**
- Connect the server to an MCP-compatible client
- Run through a realistic multi-tool workflow
- Verify tool composition works as planned

### Phase 4: Evaluation

**Step 1: Create evaluation questions**
Write 10 questions that test the server's capability. Each question must be:
- **Independent** — answerable without prior questions
- **Read-only** — no destructive side effects
- **Complex** — requires composing 2+ tools
- **Realistic** — something a real user would ask
- **Verifiable** — has a deterministic correct answer
- **Stable** — answer doesn't change between runs

**Step 2: Output as evaluation file**
Save to `evals/mcp-server-eval.xml`:
```xml
<evaluations>
  <evaluation id="1">
    <question>How many open issues are in the [repo] repository?</question>
    <expected_tools>github_list_issues</expected_tools>
    <verification>Count matches GitHub UI</verification>
  </evaluation>
  <!-- ... 10 total -->
</evaluations>
```

**Step 3: Run evaluations**
- Execute each question against the running server
- Record: tools invoked, response quality, latency
- Flag any question where the agent couldn't find the right tool

## Tool Design Guidelines

1. **Balance API coverage vs. workflow tools.** Wrap individual endpoints first,
   then add composite tools only when a common workflow requires 3+ tool calls.
2. **Names are discoverability.** An agent with 100 tools available needs to pick
   the right one from the name and description alone. Be specific.
3. **Descriptions are instructions.** Write them as if briefing an agent:
   "List all open pull requests for a repository. Returns title, number, author,
   and creation date. Use github_get_pull_request for full details."
4. **Support pagination everywhere the API does.** Agents need to handle large
   result sets. Provide `cursor` or `page`/`per_page` parameters.
5. **Return focused data.** Filter API responses to relevant fields. An agent
   doesn't need 50 fields when 8 answer the question.
6. **Error messages are agent instructions.** Always include: what went wrong,
   why, and what to try next.

## Quality Criteria
A good MCP server:
- [ ] All tools have clear descriptions and fully typed input schemas
- [ ] Error messages guide the agent toward resolution, not just report failure
- [ ] No duplicated code across tools (shared client, shared error handling)
- [ ] Full type coverage — no `any`, no untyped dictionaries
- [ ] Pagination supported where the underlying API supports it
- [ ] Tested with MCP Inspector — all tools discoverable and returning correct schemas
- [ ] README documents: setup, environment variables, available tools, example usage
- [ ] Credentials are NEVER hardcoded — always environment variables

## Anti-Patterns
- Building tools without reading the target API docs first → wrong assumptions
- Vague tool descriptions that don't help agents discover the right tool
- Returning raw API responses without filtering to relevant fields → token waste
- Missing error handling — agents need actionable error messages, not stack traces
- Hardcoding credentials instead of using environment variables → security risk
- Not testing with MCP Inspector before shipping → broken schemas in production
- Building monolithic tools instead of composable ones → agents can't do partial work
- Skipping annotations → agents can't distinguish read-only from destructive tools
- Wrapping every endpoint without considering which tools compose into workflows
