---
name: mcp-builder
description: Build MCP servers that expose external APIs as LLM-callable tools. Use when creating MCP servers, designing tool bridges for agent workflows, or wrapping APIs via Model Context Protocol.
license: CC BY-NC-SA-4.0
metadata:
  adapted_from: Anthropic official mcp-builder skill
  upstream_repo: https://github.com/anthropics/skills
  upstream_sha: b0cbd3df1533b396d281a6886d5132f623393a9c
  upstream_pinned: 2026-03-18
---

# MCP Builder

## Core Principle

An MCP server is only as good as the experience it creates for agents using it. Every design decision — tool naming, error messages, output shape — is evaluated from the agent's perspective: "Can the LLM discover what to call, when, and what the result means?"

## Execution Protocol

### 1. Research and Planning

- **Study MCP spec**: https://modelcontextprotocol.io/sitemap.xml (tool definitions, transport, structured content, annotations)
- **Read SDK docs** for your language:
  - TypeScript: https://raw.githubusercontent.com/modelcontextprotocol/typescript-sdk/main/README.md
  - Python: https://raw.githubusercontent.com/modelcontextprotocol/python-sdk/main/README.md
- **Understand target API**: Read official docs. Map endpoints, auth model, rate limits, data models, pagination, webhooks, streaming, long-running operations. Distinguish read-only vs. destructive.
- **Plan tools**: Prioritize comprehensive API coverage grouped by domain (`issues_*`, `repos_*`, etc.). Identify composable workflows. Note which are API-wrappers vs. workflow-level tools.
- **Choose transport**: Streamable HTTP for remote/production; stdio for local-only/CLI.
- **Output**: Write `plan.md` with tool selection rationale and data flow. Wait for approval before proceeding.

### 2. Implementation

**Project structure (TypeScript):**
```
my-mcp-server/
├── src/
│   ├── index.ts              # Entry point
│   ├── tools/                # Tool definitions (one file per domain)
│   ├── clients/              # API client wrappers
│   └── utils/                # Auth, pagination, error handling
├── package.json
└── README.md
```

**Project structure (Python):**
```
my-mcp-server/
├── src/my_mcp_server/
│   ├── server.py             # Entry point
│   ├── tools/                # Tool definitions
│   ├── clients/              # API client wrappers
│   └── utils/                # Auth, pagination, error handling
├── pyproject.toml
└── README.md
```

**Build infrastructure first:**
1. API client with auth, retries, rate-limit handling
2. Auth from environment variables (NEVER hardcode)
3. Structured error handling that produces actionable agent messages
4. Generic pagination helper for tools to reuse

**Tool implementation** — each tool requires:

| Aspect | Details |
|--------|---------|
| Name | Consistent prefix, action-oriented (e.g., `github_create_issue`, `slack_send_message`) |
| Description | Concise; tells agent WHEN and WHAT it returns |
| Input schema | Fully typed (Zod for TypeScript, Pydantic for Python); descriptions on every field |
| Annotations | `readOnlyHint` (GET-like), `destructiveHint` (DELETE), `idempotentHint` (PUT-like), `openWorldHint` (external state) |

**Error messages are agent instructions:**
```
BAD:  "Error 404"
GOOD: "Repository 'owner/repo' not found. Verify owner and repo are correct.
       Use github_list_repos to find available repositories."

BAD:  "Authentication failed"
GOOD: "GitHub token invalid/expired. Set GITHUB_TOKEN with valid personal access
       token having 'repo' scope."
```

### 3. Review and Test

**Code quality checklist:**
- [ ] No duplicated API call or error handling patterns
- [ ] Consistent error handling across tools
- [ ] Full type coverage (no `any` in TypeScript; no untyped dicts in Python)
- [ ] All credentials from environment variables
- [ ] Pagination supported where API supports it

**Build verification:**
```bash
npm run build          # TypeScript
python -m py_compile  # Python
```

**Test with MCP Inspector:**
```bash
npx @modelcontextprotocol/inspector
```
Verify: all tools appear, schemas are correct, calling returns expected output, error cases return actionable messages (not stack traces), pagination works end-to-end.

**Integration test:** Connect server to MCP-compatible client; run realistic multi-tool workflow.

### 4. Evaluation

Create 10 evaluation questions; each must be:
- Independent (answerable alone)
- Read-only (no destructive side effects)
- Complex (requires 2+ tool compositions)
- Realistic (something a real user would ask)
- Verifiable (deterministic correct answer)
- Stable (same answer across runs)

Save as `evals/mcp-server-eval.xml`:
```xml
<evaluations>
  <evaluation id="1">
    <question>How many open issues in [repo]?</question>
    <expected_tools>github_list_issues</expected_tools>
    <verification>Count matches GitHub UI</verification>
  </evaluation>
</evaluations>
```

Execute each question; record tools invoked, response quality, latency. Flag questions where agent couldn't find the right tool.

## Tool Design Guidelines

1. **Balance API coverage vs. workflow tools.** Wrap individual endpoints first; add composite tools only when a common workflow requires 3+ calls.
2. **Names are discoverability.** Agents pick from name+description alone. Be specific.
3. **Descriptions are instructions.** "List all open pull requests for a repository. Returns title, number, author, creation date. Use github_get_pull_request for full details."
4. **Support pagination everywhere the API does.** Agents need to handle large result sets. Provide cursor or page/per_page parameters.
5. **Return focused data.** Filter API responses to relevant fields. Agent doesn't need 50 fields when 8 answer the question.
6. **Error messages guide resolution.** Include: what went wrong, why, what to try next.

## Quality Criteria

A good MCP server:
- [ ] All tools have clear descriptions and fully typed input schemas
- [ ] Error messages guide agents toward resolution, not just failure reports
- [ ] No duplicated code (shared client, shared error handling)
- [ ] Full type coverage (no `any`, no untyped dicts)
- [ ] Pagination supported where underlying API supports it
- [ ] Tested with MCP Inspector; all tools discoverable with correct schemas
- [ ] README documents: setup, environment variables, available tools, example usage
- [ ] Credentials from environment variables only

## Anti-Patterns (What NOT to Do)

- **Skip API docs reading** → wrong assumptions about endpoints/behavior
- **Vague tool descriptions** → agents can't discover the right tool
- **Raw API responses** → token waste; filter to relevant fields
- **Missing error handling** → agents need actionable messages, not stack traces
- **Hardcoded credentials** → security risk; always use environment variables
- **No MCP Inspector testing** → broken schemas in production
- **Monolithic tools** → agents can't do partial work; prefer composable tools
- **Missing annotations** → agents can't distinguish read-only from destructive
- **Endpoint wrapping without workflow thinking** → creates unusable tool surface

## When NOT to Use

This skill is the wrong choice if:

- **You're building a Claude integration without MCP** — Use direct Claude API integration instead.
- **You need to wrap a simple one-off API call** — Use direct HTTP client code; MCP overhead isn't justified.
- **You're debugging an existing MCP server's runtime behavior** — Use MCP Inspector directly; this skill covers design/build, not troubleshooting deployed servers.
- **You need to modify Claude's core system prompts or tools** — That's not possible; MCP servers expose new tools only, not replace system behavior.
- **You're building a general-purpose HTTP proxy** — Not a good MCP use case; MCP is for semantic tool exposure, not generic request forwarding.

## Portability

This skill is portable across Claude Code, Claude Desktop, Codex, Cursor, and Antigravity:

- **MCP Inspector** (`npx @modelcontextprotocol/inspector`) works in any shell with Node.js.
- **SDK docs** (TypeScript/Python) are GitHub-hosted; fetch them with any HTTP client.
- **Project structure** (src/, tools/, clients/, utils/) is language-agnostic and IDE-neutral.
- **All code examples** (TypeScript, Python, error messages, test patterns) are self-contained; copy/paste into any editor.
- **No Claude-Code-specific steps.** All workflows use standard tools: npm/pip, TypeScript/Python compilers, git, shell commands.

For offline/air-gapped environments: download SDK READMEs and MCP spec sitemap once; reference locally during implementation.

## Protocol family (NBB)

MCP is ONE of five interop layers in the NBB edition; build only what the project
needs. See `docs/protocols/README.md` for the full set:

- **MCP** (this skill) - agent <-> tools/data.
- **A2A** - agent <-> agent delegation (pairs with skill `parallel-agent`).
- **AG-UI** - live agent->user event stream (a Part VII design concern).
- **A2UI** - declarative agent->UI from a pre-approved component catalog (no code exec).
- **ACP** - IDE <-> agent, LSP-style.

When an MCP server must persist state across sessions/harnesses, use the swappable
memory interface in `docs/protocols/MEMORY_BACKEND.md` rather than rolling bespoke
storage. Treat every MCP server as a privilege boundary (see `docs/governance/`).
