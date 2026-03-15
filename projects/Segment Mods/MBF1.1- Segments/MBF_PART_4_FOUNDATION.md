# MASTER BUILD FRAMEWORK v1.1 — SEGMENT 4 of 4
## MBF_PART_4_FOUNDATION
### Contents: Tier 8 (Cat 50-56) + Usage Guide + Appendix + Addendum (Skills, RLM, Prompt Architecture)
### Lines: 3075-4935 of original
---
> **SEGMENT NAVIGATION:** This is a development segment. For full MBF, merge all 4 parts.
> For BRIDGE routing: Categories 50-56 + Skills/RLM/Prompt patterns are in this segment.
---

# TIER 8: SECURITY & FOUNDATION
## *Essential Systems That Span All Categories*

---

## Category 50: Authentication & Identity

### Scope
User authentication, SSO, OAuth, session management, user management.

### Technology Stack — Exhaustive

#### Auth Platforms
| Platform | Type |
|----------|------|
| **Clerk** | Modern auth |
| **Auth0** | Enterprise |
| **Supabase Auth** | Open-source |
| **WorkOS** | Enterprise features |
| **Stytch** | Passwordless |
| **Keycloak** | Open-source |

#### Auth Libraries
| Library | Framework |
|---------|-----------|
| **Auth.js (NextAuth)** | Next.js + more |
| **Lucia** | TypeScript |
| **better-auth** | TypeScript |

#### Protocols
| Protocol | Use |
|----------|-----|
| **OAuth 2.0** | Authorization |
| **OpenID Connect** | Authentication |
| **SAML** | Enterprise SSO |
| **WebAuthn/Passkeys** | Passwordless |

### Quality Gates

```
□ Secure password hashing (bcrypt/argon2)
□ Session management secure
□ CSRF protection enabled
□ Rate limiting on auth endpoints
□ MFA available
□ JWT properly validated
□ Audit logging enabled
```

### Agentic Prompt Hook

```
You are implementing authentication. Before implementation:

1. REQUIREMENTS
   - Define auth methods needed
   - Plan user journey
   - Consider enterprise needs (SSO)

2. ARCHITECTURE
   - Choose auth platform/library
   - Design session strategy
   - Plan MFA approach

3. SECURITY
   - Implement rate limiting
   - Add audit logging
   - Configure MFA

4. OUTPUT REQUIREMENTS
   - Secure authentication
   - Good user experience
   - Proper session management
   - Audit trail
```

### Cross-Category Dependencies
- **→ Category 1-6** (Build Targets) — Auth integration
- **→ Category 8** (APIs) — API auth
- **→ Category 52** (Security) — Security best practices

---

## Category 51: Payments & Billing

### Scope
Payment processing, subscriptions, invoicing, usage-based billing.

### Technology Stack — Exhaustive

#### Payment Processors
| Processor | Best For |
|-----------|----------|
| **Stripe** | Developer-friendly |
| **PayPal** | Consumer trust |
| **Paddle** | SaaS (MoR) |
| **Lemon Squeezy** | Digital products |

#### Subscription Management
| Platform | Features |
|----------|----------|
| **Stripe Billing** | Full-featured |
| **Chargebee** | Subscription platform |
| **Lago** | Open-source |
| **Orb** | Usage-based |

### Quality Gates

```
□ PCI compliance verified
□ Webhook handling robust
□ Idempotency implemented
□ Failed payment handling
□ Tax calculation correct
□ Refund flow tested
□ Multi-currency support
```

### Cross-Category Dependencies
- **→ Category 1-6** (Build Targets) — Payment integration
- **→ Category 50** (Auth) — Customer identity
- **→ Category 56** (Compliance) — PCI, tax compliance

---

## Category 52: Security & Encryption

### Scope
Application security, encryption, vulnerability management, penetration testing.

### Technology Stack — Exhaustive

#### Security Scanning
| Tool | Focus |
|------|-------|
| **Snyk** | Dependencies, code |
| **Semgrep** | Code patterns |
| **SonarQube** | Code quality |
| **Trivy** | Container security |
| **OWASP ZAP** | Web app security |

#### Encryption
| Library | Language |
|---------|----------|
| **libsodium** | Cross-platform |
| **Web Crypto API** | Browser |
| **node:crypto** | Node.js |

#### WAF & DDoS
| Service | Features |
|---------|----------|
| **Cloudflare** | WAF, DDoS |
| **AWS WAF** | AWS integration |

### Quality Gates

```
□ HTTPS enforced everywhere
□ Security headers configured
□ CSP implemented
□ Input validation complete
□ SQL injection prevented
□ XSS prevented
□ CSRF protection enabled
□ Dependencies audited
□ Secrets not in code
□ Encryption at rest
□ Penetration test passed
```

### Cross-Category Dependencies
- **→ All Categories** — Security applies everywhere
- **→ Category 50** (Auth) — Identity security
- **→ Category 53** (Secrets) — Key management

---

## Category 53: Secrets Management

### Scope
API keys, credentials, certificates, environment variables.

### Technology Stack — Exhaustive

#### Secret Managers
| Service | Type |
|---------|------|
| **HashiCorp Vault** | Full-featured |
| **AWS Secrets Manager** | AWS |
| **1Password** | Developer secrets |
| **Doppler** | Universal |
| **Infisical** | Open-source |

#### Configuration
| Tool | Use |
|------|-----|
| **dotenv** | Local env files |
| **SOPS** | Encrypted files |
| **direnv** | Directory env |

### Quality Gates

```
□ No secrets in code
□ No secrets in Git history
□ Secrets rotated regularly
□ Access audited
□ Least privilege access
□ Encryption at rest
□ Emergency access procedure
```

### Cross-Category Dependencies
- **→ All Categories** — Secrets used everywhere
- **→ Category 43** (CI/CD) — Pipeline secrets
- **→ Category 52** (Security) — Security integration

---

## Category 54: Analytics & Tracking

### Scope
Product analytics, user tracking, event tracking, experimentation.

### Technology Stack — Exhaustive

#### Product Analytics
| Platform | Best For |
|----------|----------|
| **PostHog** | Open-source, full-featured |
| **Amplitude** | Product analytics |
| **Mixpanel** | Event analytics |
| **Heap** | Autocapture |

#### Web Analytics
| Platform | Type |
|----------|------|
| **Plausible** | Privacy-friendly |
| **Fathom** | Privacy-friendly |
| **Umami** | Open-source |

#### Experimentation
| Platform | Features |
|----------|----------|
| **LaunchDarkly** | Feature flags |
| **Statsig** | Feature flags + analytics |
| **GrowthBook** | Open-source |
| **PostHog** | Built-in A/B |

### Quality Gates

```
□ Tracking plan documented
□ Event naming consistent
□ User identification correct
□ Privacy compliance (GDPR)
□ Consent management
□ PII handling correct
```

### Cross-Category Dependencies
- **→ Category 1-6** (Build Targets) — Tracking integration
- **→ Category 20** (Warehousing) — Data destination
- **→ Category 56** (Compliance) — Privacy compliance

---

## Category 55: Monitoring & Observability

### Scope
Application monitoring, infrastructure monitoring, logging, tracing, alerting.

### Technology Stack — Exhaustive

#### Full-Stack Observability
| Platform | Features |
|----------|----------|
| **Datadog** | Full platform |
| **New Relic** | Full platform |
| **Grafana Cloud** | Grafana managed |

#### Metrics
| Tool | Type |
|------|------|
| **Prometheus** | Time-series |
| **Grafana** | Visualization |
| **Victoria Metrics** | Prometheus-compatible |

#### Logging
| Tool | Type |
|------|------|
| **Loki** | Grafana logs |
| **Axiom** | Modern logging |
| **Better Stack (Logtail)** | Managed logging |

#### Tracing
| Tool | Type |
|------|------|
| **Jaeger** | Open-source |
| **Tempo** | Grafana tracing |
| **Honeycomb** | Observability |
| **OpenTelemetry** | Standard |

#### Error Tracking
| Tool | Focus |
|------|-------|
| **Sentry** | Error tracking |
| **Bugsnag** | Error monitoring |

#### Incident Management
| Tool | Features |
|------|----------|
| **PagerDuty** | On-call management |
| **incident.io** | Incident response |
| **Better Uptime** | Status pages |

### Quality Gates

```
□ Metrics collection complete
□ Logging structured (JSON)
□ Tracing implemented
□ Dashboards created
□ Alerts configured
□ On-call rotation set
□ Runbooks documented
□ SLOs defined
□ Error tracking enabled
□ Uptime monitoring active
```

### Agentic Prompt Hook

```
You are implementing monitoring and observability. Before implementation:

1. STRATEGY
   - Define SLOs/SLIs
   - Identify critical paths
   - Plan alert thresholds

2. IMPLEMENTATION
   - Instrument metrics
   - Configure logging
   - Add tracing

3. VISUALIZATION
   - Create dashboards
   - Set up alerts
   - Configure notifications

4. OPERATIONS
   - Document runbooks
   - Set up on-call
   - Plan incident response

5. OUTPUT REQUIREMENTS
   - Full observability
   - Actionable alerts
   - Clear dashboards
   - Fast incident response
```

### Cross-Category Dependencies
- **→ All Categories** — Monitoring applies everywhere
- **→ Category 43** (CI/CD) — Deployment monitoring

---

## Category 56: Compliance & Legal

### Scope
GDPR, CCPA, SOC 2, HIPAA, accessibility, privacy policies, data governance.

### Technology Stack — Exhaustive

#### Privacy Compliance
| Platform | Focus |
|----------|-------|
| **OneTrust** | Privacy management |
| **Osano** | Consent management |
| **Termly** | Compliance generator |
| **iubenda** | Legal documents |

#### Security Compliance
| Platform | Standards |
|----------|-----------|
| **Vanta** | SOC 2, ISO, HIPAA |
| **Drata** | Compliance automation |
| **Secureframe** | Compliance automation |

#### Accessibility
| Standard | Tools |
|----------|-------|
| **WCAG 2.1** | Guidelines |
| **axe-core** | Testing |
| **Pa11y** | Automated testing |

### Compliance Requirements

#### GDPR (EU)
```
□ Lawful basis for processing
□ Privacy policy comprehensive
□ Cookie consent implemented
□ Data subject rights (access, deletion, portability)
□ Data Processing Agreements
□ Data breach notification procedure
□ Privacy by design
```

#### SOC 2
```
□ Security policies documented
□ Access controls implemented
□ Change management process
□ Risk assessment completed
□ Incident response plan
□ Business continuity plan
□ Employee training
□ Monitoring and logging
□ Encryption implemented
```

### Quality Gates

```
□ Privacy policy published
□ Terms of service published
□ Cookie consent implemented
□ Data subject rights workflow
□ Data retention policy
□ Security certifications current
□ Accessibility tested
□ Regular compliance audits
```

### Cross-Category Dependencies
- **→ All Categories** — Compliance applies everywhere
- **→ Category 50** (Auth) — Identity verification
- **→ Category 52** (Security) — Security controls
- **→ Category 54** (Analytics) — Consent integration

---

# FRAMEWORK USAGE GUIDE

## How to Use This Framework

### For New Projects

1. **Identify Primary Build Target** (Categories 1-7)
   - What are you building?

2. **Map Required Supporting Categories**
   - Use dependency matrix
   - Include all necessary tiers

3. **Execute Category by Category**
   - Follow quality gates
   - Use agentic prompts

4. **Validate Completeness**
   - Cross-check dependencies
   - Verify all gates passed

### For Agentic Development

When presenting to an AI model (Claude, GPT, etc.):

1. **Provide Framework Context**
   - Share relevant category definitions
   - Include quality gates

2. **Use Agentic Prompt Hooks**
   - Start with the category's prompt hook
   - Customize for specific needs

3. **Enforce Quality Gates**
   - Check each gate during review
   - Don't skip any checks

---

## Build Pattern Templates

### SaaS Application (Full Stack)
```
Required Categories:
├── 1 (Web App)
├── 8 (APIs & Backend)
├── 15 (Relational Database)
├── 22 (Caching)
├── 24 (Real-Time - optional)
├── 43 (CI/CD)
├── 46 (Testing)
├── 50 (Authentication)
├── 51 (Payments)
├── 52 (Security)
├── 54 (Analytics)
├── 55 (Monitoring)
└── 56 (Compliance)
```

### AI-Powered Application
```
Required Categories:
├── 1 or 2 (Web/Mobile App)
├── 8 (APIs & Backend)
├── 16 (Vector Database)
├── 29 (Agentic RAG)
├── 30 (Autonomous Agents - optional)
├── 31 (MCPs & Tools)
├── 33 (Model Serving)
├── 34 (LLM Routing)
├── 35 (AI Safety)
└── 50-56 (Foundation Tier)
```

### Content Generation Pipeline
```
Required Categories:
├── 36 (Image Generation)
├── 37 (Audio Generation)
├── 38 (Video Processing)
├── 39 (Document Generation)
├── 11 (GPU Compute)
├── 19 (Object Storage)
├── 44 (Workflow Orchestration)
└── 43 (CI/CD)
```

### Mobile App with Backend
```
Required Categories:
├── 2 (Mobile Application)
├── 8 (APIs & Backend)
├── 15 (Relational Database)
├── 19 (Object Storage)
├── 50 (Authentication)
├── 51 (Payments - if needed)
├── 54 (Analytics)
└── 55 (Monitoring)
```

### Embedded/IoT System
```
Required Categories:
├── 6 (Operating Systems & Embedded)
├── 8 (APIs - cloud connectivity)
├── 9 (Edge Computing)
├── 17 (Document/NoSQL - time series)
├── 52 (Security)
└── 55 (Monitoring)
```

### Internal Tools & Dashboard
```
Required Categories:
├── 49 (Dashboards & Internal Tools)
├── 8 (APIs & Backend)
├── 15 (Relational Database)
├── 50 (Authentication)
├── 52 (Security)
└── 55 (Monitoring)
```

---

## Master Agentic Prompt

Use this prompt to invoke the full framework with any AI model:

```
You are operating as a Master Build Framework Agent. You have access to a 56-category exhaustive build framework covering:

TIER 1: Build Targets (1-7) - Web, Mobile, Desktop, Websites, Immersive, Embedded, Extensions
TIER 2: Compute & Infrastructure (8-14) - APIs, Edge, Serverless, GPU, Containers, IaC, Platform Engineering
TIER 3: Data & Persistence (15-21) - SQL, Vector, NoSQL, Local-First, Storage, Warehousing, Search
TIER 4: AI & Agent Systems (22-35) - Caching, Queues, Real-Time, Cron, Graphs, ETL, Features, RAG, Agents, MCPs, Fine-Tuning, Inference, Routing, Safety
TIER 5: Content Generation (36-42) - Image, Audio, Video, Documents, Code, Data, Translation
TIER 6: Automation & DevOps (43-49) - CI/CD, Workflows, Browser Automation, Testing, Voice, Docs, Dashboards
TIER 8: Security & Foundation (50-56) - Auth, Payments, Security, Secrets, Analytics, Monitoring, Compliance

For every build request:
1. Identify the primary build target category
2. Map all required supporting categories
3. For each category, apply the exhaustive tool/tech stack
4. Execute all quality gates
5. Document cross-category dependencies
6. Produce production-ready, tested, verified output

Your output must be:
- Maximum quality, industry standard
- Fully tested and verified
- Security-hardened
- Observable and monitored
- Compliant with relevant regulations
```

---

# VERSION HISTORY

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | January 2026 | Initial 56-category framework |

---

# APPENDIX: QUICK REFERENCE

## All 56 Categories Summary

| # | Category | Tier |
|---|----------|------|
| 1 | Web Applications | Build Targets |
| 2 | Mobile Applications | Build Targets |
| 3 | Desktop Applications | Build Targets |
| 4 | Websites & Landing Pages | Build Targets |
| 5 | Generative & Immersive Web | Build Targets |
| 6 | Operating Systems & Embedded | Build Targets |
| 7 | Browser Extensions & Plugins | Build Targets |
| 8 | APIs & Backend Services | Compute |
| 9 | Edge Computing & CDN | Compute |
| 10 | Serverless Functions | Compute |
| 11 | GPU & ML Compute | Compute |
| 12 | Container Orchestration | Compute |
| 13 | Infrastructure as Code | Compute |
| 14 | Platform Engineering | Compute |
| 15 | Relational Databases | Data |
| 16 | Vector Databases & Semantic Search | Data |
| 17 | Document & NoSQL Databases | Data |
| 18 | Local-First & Offline Databases | Data |
| 19 | Object Storage & File Systems | Data |
| 20 | Data Warehousing & Analytics | Data |
| 21 | Search Engines | Data |
| 22 | Caching & Performance | AI Systems |
| 23 | Message Queues & Event Streaming | AI Systems |
| 24 | Real-Time & WebSockets | AI Systems |
| 25 | Scheduled Jobs & Cron | AI Systems |
| 26 | Graph Processing & Knowledge | AI Systems |
| 27 | Data Transformation & ETL | AI Systems |
| 28 | Feature Stores & ML Data | AI Systems |
| 29 | Agentic RAG Systems | AI Systems |
| 30 | Autonomous Agents | AI Systems |
| 31 | MCPs & Tool Registries | AI Systems |
| 32 | Model Fine-Tuning & Training | AI Systems |
| 33 | Model Serving & Inference | AI Systems |
| 34 | LLM Routing & Orchestration | AI Systems |
| 35 | AI Safety & Guardrails | AI Systems |
| 36 | Image Generation | Content |
| 37 | Audio Generation | Content |
| 38 | Video Generation & Processing | Content |
| 39 | Document Generation | Content |
| 40 | Code Generation | Content |
| 41 | Data & Content Generation | Content |
| 42 | Translation & Localization | Content |
| 43 | CI/CD Pipelines | Automation |
| 44 | Workflow Orchestration | Automation |
| 45 | Browser & Web Automation | Automation |
| 46 | Testing & Quality Assurance | Automation |
| 47 | Conversational & Voice Interfaces | Automation |
| 48 | Documentation Systems | Automation |
| 49 | Dashboards & Internal Tools | Automation |
| 50 | Authentication & Identity | Foundation |
| 51 | Payments & Billing | Foundation |
| 52 | Security & Encryption | Foundation |
| 53 | Secrets Management | Foundation |
| 54 | Analytics & Tracking | Foundation |
| 55 | Monitoring & Observability | Foundation |
| 56 | Compliance & Legal | Foundation |

---

*End of Framework v1.0 — January 2026*

---

# ADDENDUM: SKILLS, REASONING LOOPS & PROMPT ARCHITECTURE
## *v1.1 Patch — Critical Framework Extensions*

---

## Category 31B: Skills & Capability Packaging

### Scope
Skill manifests, capability packaging, skill composition, skill registries, versioning, invocation patterns, skill-to-tool relationships.

### Understanding Skills vs MCPs vs Tools

| Concept | What It Is | How It Works |
|---------|------------|--------------|
| **Tool** | A single callable function | `get_weather(city)` → returns data |
| **MCP** | Protocol for tool communication | Standard interface between model and tools |
| **Skill** | Packaged capability with instructions | Contains: instructions, patterns, examples, quality gates, prompts |

**Key Distinction:**
- **Tools** = The *what* (capability)
- **MCPs** = The *how* (protocol)
- **Skills** = The *wisdom* (instructions + patterns + quality criteria)

### Skill Architecture

#### Skill Manifest Structure
```
/skill-name/
├── SKILL.md           # Core instructions, patterns, best practices
├── manifest.json      # Metadata, version, dependencies
├── examples/          # Sample inputs and expected outputs
│   ├── input-1.json
│   └── output-1.json
├── templates/         # Reusable templates
├── quality-gates.md   # Validation criteria
└── hooks/             # Agentic invocation prompts
    └── invoke.md
```

#### Skill Manifest Schema (manifest.json)
```json
{
  "name": "skill-name",
  "version": "1.0.0",
  "description": "What this skill does",
  "author": "creator",
  "category": "document|code|integration|reasoning|generation",
  "dependencies": ["other-skill@1.x"],
  "tools_required": ["tool-a", "tool-b"],
  "mcps_required": ["mcp-server-name"],
  "quality_gates": ["gate-1", "gate-2"],
  "agentic_hooks": {
    "invoke": "hooks/invoke.md",
    "validate": "hooks/validate.md"
  },
  "inputs": {
    "required": ["input-a"],
    "optional": ["input-b"]
  },
  "outputs": {
    "primary": "output-type",
    "artifacts": ["file-types"]
  }
}
```

### Skill Categories

| Category | Purpose | Examples |
|----------|---------|----------|
| **Document Skills** | Create/edit professional documents | docx, pdf, pptx, xlsx |
| **Code Skills** | Language-specific patterns & generation | frontend-design, mcp-builder |
| **Integration Skills** | Connect external services | stripe-integration, oauth-flows |
| **Reasoning Skills** | Analysis, planning, evaluation | research, comparison, critique |
| **Generation Skills** | Content & media creation | image-gen, audio-gen, data-gen |
| **Automation Skills** | Workflow & task execution | browser-automation, data-pipeline |

### Skill Composition Patterns

#### Sequential Composition
```
Skill A → Skill B → Skill C
(research) → (synthesize) → (document)
```

#### Parallel Composition
```
      ┌→ Skill B ─┐
Skill A           ├→ Skill D
      └→ Skill C ─┘
```

#### Conditional Composition
```
Skill A → [condition] → Skill B (if true)
                     → Skill C (if false)
```

#### Iterative Composition
```
Skill A → Skill B → [evaluate] → loop back or exit
```

### Skill Invocation Protocol

```markdown
## When to Read a Skill

BEFORE executing any task that matches a skill category:
1. Check /mnt/skills/ for relevant skills
2. Use `view` tool to read SKILL.md
3. Follow the skill's instructions precisely
4. Apply the skill's quality gates
5. Use the skill's agentic hooks

## Skill Loading Priority

1. User skills (/mnt/skills/user/) — highest priority
2. Private skills (/mnt/skills/private/)
3. Public skills (/mnt/skills/public/)
4. Example skills (/mnt/skills/examples/)

## Skill Invocation Pattern

1. IDENTIFY: What type of output is needed?
2. LOCATE: Which skill(s) apply?
3. LOAD: Read the SKILL.md file
4. EXECUTE: Follow skill instructions
5. VALIDATE: Apply quality gates
6. OUTPUT: Deliver skill-compliant result
```

### Quality Gates for Skills

```
□ Skill manifest complete and valid
□ SKILL.md contains clear instructions
□ Examples provided and tested
□ Quality gates are measurable
□ Agentic hooks are copy-paste ready
□ Dependencies documented
□ Version follows semver
□ Backward compatibility noted
□ Error handling defined
□ Edge cases documented
```

### Agentic Prompt Hook — Skill Invocation

```
You are operating with skill-augmented capabilities. Before any significant output:

1. SKILL IDENTIFICATION
   - What type of output is requested?
   - Check available skills in /mnt/skills/
   - Identify primary and supporting skills

2. SKILL LOADING
   - Use `view` tool to read SKILL.md
   - Note required tools and MCPs
   - Understand quality criteria

3. SKILL EXECUTION
   - Follow skill instructions precisely
   - Use skill templates where available
   - Apply skill-specific patterns

4. SKILL VALIDATION
   - Check output against quality gates
   - Verify all requirements met
   - Self-correct if needed

5. OUTPUT REQUIREMENTS
   - Skill-compliant output
   - Quality gates passed
   - Proper formatting per skill
```

### Cross-Category Dependencies
- **→ Category 31** (MCPs) — Tool protocols
- **→ Category 30** (Agents) — Skill execution
- **→ Category 31C** (Reasoning) — Reasoning skills
- **→ Category 40** (Code Gen) — Code skills

---

## Category 31C: Agentic Reasoning Loops

### Scope
Structured reasoning patterns, self-correction mechanisms, iterative refinement, bounded execution, reasoning verification.

### Core Reasoning Loop Patterns

#### RALPH Loop (Recommended Primary Pattern)

```
┌─────────────────────────────────────────────────────────┐
│                    RALPH LOOP                           │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────┐                                          │
│  │  REASON  │ ← Analyze task, state, constraints       │
│  └────┬─────┘                                          │
│       ↓                                                │
│  ┌──────────┐                                          │
│  │   ACT    │ ← Execute next step (tool/generation)   │
│  └────┬─────┘                                          │
│       ↓                                                │
│  ┌──────────┐                                          │
│  │  LEARN   │ ← Evaluate result, extract insights     │
│  └────┬─────┘                                          │
│       ↓                                                │
│  ┌──────────┐                                          │
│  │   PLAN   │ ← Update strategy based on learning     │
│  └────┬─────┘                                          │
│       ↓                                                │
│  ┌──────────┐                                          │
│  │HYPOTHESIZE│ ← Predict outcomes, identify risks     │
│  └────┬─────┘                                          │
│       ↓                                                │
│  [Continue or Exit based on completion criteria]       │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

**RALPH Implementation:**
```
REASON:
- What is the current state?
- What is the goal state?
- What constraints apply?
- What information do I have/need?

ACT:
- Select appropriate tool/skill
- Execute with proper parameters
- Capture full output

LEARN:
- Did the action succeed?
- What unexpected results occurred?
- What new information was revealed?
- What patterns are emerging?

PLAN:
- How should strategy adjust?
- What's the optimal next step?
- Are there shortcuts now available?
- Should approach change entirely?

HYPOTHESIZE:
- What will likely happen next?
- What could go wrong?
- What assumptions am I making?
- How confident am I?
```

#### ReAct Pattern (Reasoning + Acting)

```
THOUGHT: [Internal reasoning about current state]
ACTION: [Tool call or generation action]
OBSERVATION: [Result of the action]
... repeat ...
THOUGHT: [Final reasoning]
ANSWER: [Final output]
```

**When to Use ReAct:**
- Simple tool-use tasks
- Linear problem solving
- When you need clear audit trail

#### ReWOO Pattern (Reason Without Observation)

```
PLAN:
- Step 1: [action] → [expected_output_variable]
- Step 2: [action using variable] → [next_variable]
- Step 3: [action using variables] → [final_output]

EXECUTE:
- Run all steps
- Collect all outputs

SYNTHESIZE:
- Combine outputs
- Generate final answer
```

**When to Use ReWOO:**
- When planning is more efficient than iterating
- Parallel execution opportunities
- Reduced latency requirements

#### Reflexion Pattern (Self-Correction)

```
┌─────────────────────────────────────────┐
│            REFLEXION LOOP               │
├─────────────────────────────────────────┤
│                                         │
│  ATTEMPT → EVALUATE → REFLECT → RETRY   │
│     ↑                              │    │
│     └──────────────────────────────┘    │
│                                         │
└─────────────────────────────────────────┘

ATTEMPT:
- Execute task with current approach

EVALUATE:
- Score the output (0-10)
- Identify specific failures
- Note what worked well

REFLECT:
- Why did failures occur?
- What would fix them?
- What should change?

RETRY:
- Implement improvements
- Execute again
- Compare to previous attempt
```

#### Tree of Thought (Branching Reasoning)

```
                    [Problem]
                        │
          ┌─────────────┼─────────────┐
          ↓             ↓             ↓
      [Path A]      [Path B]      [Path C]
       Score:8       Score:6       Score:9
          │             ✗             │
     ┌────┴────┐              ┌───────┴───────┐
     ↓         ↓              ↓               ↓
  [A.1]     [A.2]          [C.1]           [C.2]
  Score:7   Score:9        Score:8         Score:10
              │                               │
              ↓                               ↓
         [Continue]                    [Best Solution]
```

**When to Use Tree of Thought:**
- Complex problems with multiple valid approaches
- When you need to explore alternatives
- High-stakes decisions requiring validation

#### OODA Loop (Observe-Orient-Decide-Act)

```
OBSERVE: Gather information about current state
ORIENT: Analyze and synthesize observations
DECIDE: Choose course of action
ACT: Execute the decision
... repeat with new observations ...
```

**When to Use OODA:**
- Dynamic environments
- Real-time adaptation needed
- Adversarial or competitive scenarios

### Loop Selection Guide

| Scenario | Recommended Loop | Why |
|----------|------------------|-----|
| General complex task | RALPH | Balanced reasoning + learning |
| Simple tool use | ReAct | Clear, auditable |
| Multi-step planning | ReWOO | Efficient execution |
| Quality-critical output | Reflexion | Self-correction |
| Exploring solutions | Tree of Thought | Multiple paths |
| Dynamic/changing input | OODA | Adaptive |
| Research/investigation | RALPH + Reflexion | Depth + correction |

### Loop Execution Bounds

**Critical: All loops MUST have bounds**

```
LOOP_BOUNDS:
  max_iterations: 10          # Hard stop
  max_time: 300               # Seconds
  max_cost: 1.00              # API cost limit
  exit_conditions:
    - task_complete: true
    - confidence: > 0.95
    - no_progress_iterations: 3
  escalation:
    - at_iteration: 7 → warn user
    - at_iteration: 10 → stop and summarize
```

### Quality Gates for Reasoning

```
□ Loop pattern selected and documented
□ Bounds configured (iterations, time, cost)
□ Exit conditions defined
□ Progress tracked per iteration
□ Self-evaluation implemented
□ Escalation path defined
□ Audit trail maintained
□ Final confidence score provided
```

### Agentic Prompt Hook — Reasoning Loops

```
You are executing with structured reasoning loops. For complex tasks:

1. LOOP SELECTION
   - Assess task complexity
   - Select appropriate loop pattern
   - Configure bounds and exit conditions

2. LOOP INITIALIZATION
   - Document starting state
   - Define success criteria
   - Set iteration counter to 0

3. LOOP EXECUTION (example: RALPH)
   
   ITERATION {n}:
   
   REASON: [Analyze current state vs goal]
   
   ACT: [Execute next step]
   
   LEARN: [Evaluate result, extract insights]
   
   PLAN: [Adjust strategy]
   
   HYPOTHESIZE: [Predict next iteration outcome]
   
   CHECK: [Exit conditions met?]
   - If yes → proceed to output
   - If no → continue to iteration {n+1}
   - If bounds exceeded → escalate/summarize

4. LOOP TERMINATION
   - Document final state
   - Provide confidence score
   - Summarize key learnings
   - Present output

5. OUTPUT REQUIREMENTS
   - Loop execution trace available
   - Confidence score: X/10
   - Iterations used: N of max
   - Quality gates: passed/failed
```

### Cross-Category Dependencies
- **→ Category 30** (Agents) — Agent execution
- **→ Category 31B** (Skills) — Skill invocation
- **→ Category 35** (Safety) — Bounded execution
- **→ Category 31D** (Prompts) — Prompt patterns

---

## Category 31D: Prompt Engineering Patterns

### Scope
Prompt architecture, system prompts, few-shot patterns, chain of thought, constitutional patterns, prompt optimization.

### Prompt Architecture Layers

```
┌─────────────────────────────────────────────────────────┐
│                  PROMPT ARCHITECTURE                    │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │              SYSTEM PROMPT LAYER                │   │
│  │  - Identity and role                            │   │
│  │  - Core capabilities                            │   │
│  │  - Constraints and boundaries                   │   │
│  │  - Output format defaults                       │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↓                               │
│  ┌─────────────────────────────────────────────────┐   │
│  │              CONTEXT LAYER                      │   │
│  │  - Retrieved documents (RAG)                    │   │
│  │  - Conversation history                         │   │
│  │  - User preferences/memory                      │   │
│  │  - Skill instructions                           │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↓                               │
│  ┌─────────────────────────────────────────────────┐   │
│  │              INSTRUCTION LAYER                  │   │
│  │  - Task-specific instructions                   │   │
│  │  - Few-shot examples                            │   │
│  │  - Output format requirements                   │   │
│  │  - Quality criteria                             │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↓                               │
│  ┌─────────────────────────────────────────────────┐   │
│  │              USER INPUT LAYER                   │   │
│  │  - The actual user request                      │   │
│  │  - Attached files/images                        │   │
│  │  - Clarifications                               │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Core Prompt Patterns

#### Chain of Thought (CoT)
```
Let's work through this step by step:

Step 1: [First reasoning step]
Step 2: [Second reasoning step]
Step 3: [Third reasoning step]
...
Therefore: [Conclusion]
```

**Trigger phrases:**
- "Let's think step by step"
- "Let's work through this"
- "Let me break this down"

#### Zero-Shot Chain of Thought
```
[Question]

Let's approach this step by step.
```
*Simply adding "Let's think step by step" improves reasoning*

#### Few-Shot Prompting
```
Here are some examples:

Example 1:
Input: [example input 1]
Output: [example output 1]

Example 2:
Input: [example input 2]
Output: [example output 2]

Now, for the actual task:
Input: [actual input]
Output:
```

#### Self-Consistency
```
Generate 5 different approaches to this problem.
For each approach, show your reasoning.
Then, identify which answer appears most frequently 
or has the strongest reasoning.
```

#### Constitutional Pattern
```
You must always:
1. [Constraint 1]
2. [Constraint 2]
3. [Constraint 3]

You must never:
1. [Prohibition 1]
2. [Prohibition 2]

If asked to violate these, explain why you cannot.
```

#### Persona Pattern
```
You are [specific role/expert].

Your expertise includes:
- [Domain 1]
- [Domain 2]

Your communication style is:
- [Style attribute 1]
- [Style attribute 2]

Respond as this persona would.
```

#### Structured Output Pattern
```
Respond in the following JSON format:
{
  "analysis": "your analysis here",
  "recommendation": "your recommendation",
  "confidence": 0.0-1.0,
  "reasoning": ["step1", "step2", "step3"]
}

Only output valid JSON, no other text.
```

#### Decomposition Pattern
```
Break this complex task into subtasks:

1. First, identify [component 1]
2. Then, analyze [component 2]
3. Next, evaluate [component 3]
4. Finally, synthesize into [final output]

Execute each subtask before moving to the next.
```

#### Verification Pattern
```
After generating your response:

1. Review for accuracy
2. Check for completeness
3. Verify logical consistency
4. Confirm format compliance

If any issues found, revise before presenting.
```

### System Prompt Template

```markdown
# System Prompt Template

## Identity
You are [name/role], a [description of capabilities].

## Core Capabilities
You can:
- [Capability 1]
- [Capability 2]
- [Capability 3]

You have access to:
- [Tool/Resource 1]
- [Tool/Resource 2]

## Behavioral Guidelines
- [Guideline 1]
- [Guideline 2]
- [Guideline 3]

## Output Standards
- [Standard 1]
- [Standard 2]
- [Standard 3]

## Constraints
You must not:
- [Constraint 1]
- [Constraint 2]

## When Uncertain
If uncertain, [specific guidance on handling uncertainty]

## Error Handling
If something goes wrong, [specific guidance]
```

### Prompt Pattern Selection Guide

| Need | Pattern | Example Trigger |
|------|---------|-----------------|
| Complex reasoning | Chain of Thought | "Explain your reasoning" |
| Consistent format | Structured Output | "Return as JSON" |
| Expert knowledge | Persona | "As a [role]..." |
| Multiple solutions | Self-Consistency | "Give me 3 approaches" |
| Task breakdown | Decomposition | "Break this into steps" |
| Quality assurance | Verification | "Double-check your work" |
| Behavior control | Constitutional | "Never do X" |
| Learning from examples | Few-Shot | "Here are examples..." |

### Prompt Optimization Techniques

| Technique | Description |
|-----------|-------------|
| **Specificity** | More specific prompts yield better results |
| **Positive framing** | Say what TO do, not just what NOT to do |
| **Examples** | Show don't tell when possible |
| **Structure** | Use clear formatting, headers, lists |
| **Context** | Provide relevant background information |
| **Constraints** | Define boundaries clearly |
| **Output format** | Specify exactly what format you want |
| **Iteration** | Refine prompts based on outputs |

### Quality Gates for Prompts

```
□ Prompt has clear objective
□ Instructions are unambiguous
□ Output format specified
□ Examples provided (if few-shot)
□ Constraints defined
□ Error handling addressed
□ Edge cases considered
□ Prompt tested with variations
□ Token efficiency optimized
□ Version controlled
```

### Agentic Prompt Hook — Prompt Engineering

```
You are crafting prompts for optimal output. For each prompt:

1. OBJECTIVE CLARITY
   - What is the exact desired outcome?
   - What format should the output take?
   - What constraints apply?

2. PATTERN SELECTION
   - Does this need step-by-step reasoning? → CoT
   - Does this need examples? → Few-Shot
   - Does this need multiple attempts? → Self-Consistency
   - Does this need expert voice? → Persona
   - Does this need structure? → Structured Output

3. PROMPT CONSTRUCTION
   - Clear instruction first
   - Context and background
   - Examples if needed
   - Output format specification
   - Constraints and boundaries

4. PROMPT VALIDATION
   - Is it unambiguous?
   - Could it be misinterpreted?
   - Are edge cases handled?

5. OUTPUT REQUIREMENTS
   - Prompt achieves objective
   - Output is consistent
   - Format is correct
   - Quality is acceptable
```

### Cross-Category Dependencies
- **→ Category 29** (RAG) — Context injection
- **→ Category 30** (Agents) — Agent prompting
- **→ Category 31C** (Reasoning) — Reasoning prompts
- **→ Category 35** (Safety) — Safety prompts

---

## Category 31E: Memory Architecture

### Scope
Working memory, episodic memory, semantic memory, procedural memory, memory retrieval, memory consolidation.

### Memory Type Taxonomy

```
┌─────────────────────────────────────────────────────────┐
│                 MEMORY ARCHITECTURE                     │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │            WORKING MEMORY                       │   │
│  │  - Current context window                       │   │
│  │  - Active scratchpad                            │   │
│  │  - Immediate task state                         │   │
│  │  Capacity: Limited (context window)             │   │
│  │  Duration: Current session                      │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↑↓                              │
│  ┌─────────────────────────────────────────────────┐   │
│  │            EPISODIC MEMORY                      │   │
│  │  - Conversation history                         │   │
│  │  - Past interactions                            │   │
│  │  - Specific events and outcomes                 │   │
│  │  Storage: Vector DB, conversation logs          │   │
│  │  Retrieval: Semantic search, recency            │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↑↓                              │
│  ┌─────────────────────────────────────────────────┐   │
│  │            SEMANTIC MEMORY                      │   │
│  │  - Facts and knowledge                          │   │
│  │  - Concepts and relationships                   │   │
│  │  - User preferences and profile                 │   │
│  │  Storage: Knowledge graphs, embeddings          │   │
│  │  Retrieval: Entity lookup, graph traversal      │   │
│  └─────────────────────────────────────────────────┘   │
│                         ↑↓                              │
│  ┌─────────────────────────────────────────────────┐   │
│  │           PROCEDURAL MEMORY                     │   │
│  │  - How to do things                             │   │
│  │  - Skill execution patterns                     │   │
│  │  - Successful approaches                        │   │
│  │  Storage: Skill manifests, pattern library      │   │
│  │  Retrieval: Task matching, skill lookup         │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Memory Implementation Patterns

#### Working Memory Management
```python
# Working memory structure
working_memory = {
    "current_task": "...",
    "task_state": "in_progress",
    "scratchpad": [],
    "active_context": [],
    "loop_iteration": 0,
    "intermediate_results": {}
}

# Scratchpad operations
def add_to_scratchpad(item):
    working_memory["scratchpad"].append(item)
    
def get_scratchpad():
    return working_memory["scratchpad"]
    
def clear_scratchpad():
    working_memory["scratchpad"] = []
```

#### Episodic Memory Retrieval
```python
# Retrieve relevant past conversations
def retrieve_episodes(query, k=5):
    # Semantic search over conversation history
    results = vector_db.search(
        query=embed(query),
        collection="conversations",
        top_k=k,
        filters={"user_id": current_user}
    )
    return results

# Store new episode
def store_episode(conversation):
    vector_db.insert(
        collection="conversations",
        document=conversation,
        embedding=embed(conversation),
        metadata={
            "timestamp": now(),
            "user_id": current_user,
            "outcome": conversation.outcome
        }
    )
```

#### Semantic Memory Structure
```python
# Knowledge graph structure
semantic_memory = {
    "entities": {
        "user_preferences": {...},
        "domain_knowledge": {...},
        "relationships": {...}
    },
    "facts": [
        {"subject": "...", "predicate": "...", "object": "..."}
    ]
}

# Fact retrieval
def get_facts_about(entity):
    return [f for f in semantic_memory["facts"] 
            if f["subject"] == entity or f["object"] == entity]
```

#### Procedural Memory (Skills)
```python
# Skill pattern matching
def find_applicable_skills(task_description):
    skills = []
    for skill in skill_registry:
        if skill.matches(task_description):
            skills.append(skill)
    return sorted(skills, key=lambda s: s.confidence)

# Record successful procedure
def remember_procedure(task, approach, outcome):
    if outcome.success:
        procedural_memory.store({
            "task_pattern": task.pattern,
            "approach": approach,
            "success_rate": update_success_rate(task, approach)
        })
```

### Memory Retrieval Strategies

| Strategy | When to Use | Implementation |
|----------|-------------|----------------|
| **Recency** | Recent context matters most | Sort by timestamp, decay weight |
| **Relevance** | Semantic similarity needed | Vector similarity search |
| **Importance** | Critical facts needed | Importance scoring, pinned items |
| **Frequency** | Common patterns | Access count tracking |
| **Contextual** | Situation-specific | Multi-factor retrieval |

### Memory Consolidation

```
CONSOLIDATION PROCESS:

1. WORKING → EPISODIC
   - After task completion
   - Store conversation + outcome
   - Tag with metadata

2. EPISODIC → SEMANTIC
   - Extract recurring facts
   - Update user model
   - Identify patterns

3. EPISODIC → PROCEDURAL
   - Successful approaches → skills
   - Failed approaches → anti-patterns
   - Update success rates
```

### Quality Gates for Memory

```
□ Working memory bounded (context limits)
□ Episodic retrieval tested
□ Semantic facts validated
□ Procedural patterns documented
□ Memory retrieval latency acceptable
□ Privacy-sensitive data handled
□ Memory decay/forgetting implemented
□ Consolidation process defined
□ Memory conflicts resolved
□ User control over memory
```

### Agentic Prompt Hook — Memory Systems

```
You are operating with a structured memory system:

1. WORKING MEMORY (Current Session)
   - Maintain scratchpad for intermediate results
   - Track current task state
   - Store loop iteration data

2. EPISODIC MEMORY (Past Conversations)
   - Retrieve relevant past interactions
   - Use conversation_search tool when needed
   - Consider past outcomes for similar tasks

3. SEMANTIC MEMORY (Facts & Knowledge)
   - Recall user preferences
   - Apply known facts
   - Use userMemories context

4. PROCEDURAL MEMORY (Skills)
   - Check /mnt/skills for applicable skills
   - Apply successful patterns from past
   - Avoid previously failed approaches

5. MEMORY HYGIENE
   - Don't hallucinate memories
   - Verify retrieved memories are relevant
   - Update memory after successful tasks
   - Respect user memory controls
```

### Cross-Category Dependencies
- **→ Category 16** (Vector DB) — Embedding storage
- **→ Category 26** (Graphs) — Knowledge graphs
- **→ Category 29** (RAG) — Retrieval patterns
- **→ Category 31B** (Skills) — Procedural memory

---

# UPDATED APPENDIX: COMPLETE CATEGORY REFERENCE

## All Categories Including v1.1 Additions

| # | Category | Tier | Status |
|---|----------|------|--------|
| 1 | Web Applications | Build Targets | v1.0 |
| 2 | Mobile Applications | Build Targets | v1.0 |
| 3 | Desktop Applications | Build Targets | v1.0 |
| 4 | Websites & Landing Pages | Build Targets | v1.0 |
| 5 | Generative & Immersive Web | Build Targets | v1.0 |
| 6 | Operating Systems & Embedded | Build Targets | v1.0 |
| 7 | Browser Extensions & Plugins | Build Targets | v1.0 |
| 8 | APIs & Backend Services | Compute | v1.0 |
| 9 | Edge Computing & CDN | Compute | v1.0 |
| 10 | Serverless Functions | Compute | v1.0 |
| 11 | GPU & ML Compute | Compute | v1.0 |
| 12 | Container Orchestration | Compute | v1.0 |
| 13 | Infrastructure as Code | Compute | v1.0 |
| 14 | Platform Engineering | Compute | v1.0 |
| 15 | Relational Databases | Data | v1.0 |
| 16 | Vector Databases & Semantic Search | Data | v1.0 |
| 17 | Document & NoSQL Databases | Data | v1.0 |
| 18 | Local-First & Offline Databases | Data | v1.0 |
| 19 | Object Storage & File Systems | Data | v1.0 |
| 20 | Data Warehousing & Analytics | Data | v1.0 |
| 21 | Search Engines | Data | v1.0 |
| 22 | Caching & Performance | AI Systems | v1.0 |
| 23 | Message Queues & Event Streaming | AI Systems | v1.0 |
| 24 | Real-Time & WebSockets | AI Systems | v1.0 |
| 25 | Scheduled Jobs & Cron | AI Systems | v1.0 |
| 26 | Graph Processing & Knowledge | AI Systems | v1.0 |
| 27 | Data Transformation & ETL | AI Systems | v1.0 |
| 28 | Feature Stores & ML Data | AI Systems | v1.0 |
| 29 | Agentic RAG Systems | AI Systems | v1.0 |
| 30 | Autonomous Agents | AI Systems | v1.0 |
| 31 | MCPs & Tool Registries | AI Systems | v1.0 |
| 31B | **Skills & Capability Packaging** | **AI Systems** | **v1.1 NEW** |
| 31C | **Agentic Reasoning Loops** | **AI Systems** | **v1.1 NEW** |
| 31D | **Prompt Engineering Patterns** | **AI Systems** | **v1.1 NEW** |
| 31E | **Memory Architecture** | **AI Systems** | **v1.1 NEW** |
| 32 | Model Fine-Tuning & Training | AI Systems | v1.0 |
| 33 | Model Serving & Inference | AI Systems | v1.0 |
| 34 | LLM Routing & Orchestration | AI Systems | v1.0 |
| 35 | AI Safety & Guardrails | AI Systems | v1.0 |
| 36 | Image Generation | Content | v1.0 |
| 37 | Audio Generation | Content | v1.0 |
| 38 | Video Generation & Processing | Content | v1.0 |
| 39 | Document Generation | Content | v1.0 |
| 40 | Code Generation | Content | v1.0 |
| 41 | Data & Content Generation | Content | v1.0 |
| 42 | Translation & Localization | Content | v1.0 |
| 43 | CI/CD Pipelines | Automation | v1.0 |
| 44 | Workflow Orchestration | Automation | v1.0 |
| 45 | Browser & Web Automation | Automation | v1.0 |
| 46 | Testing & Quality Assurance | Automation | v1.0 |
| 47 | Conversational & Voice Interfaces | Automation | v1.0 |
| 48 | Documentation Systems | Automation | v1.0 |
| 49 | Dashboards & Internal Tools | Automation | v1.0 |
| 50 | Authentication & Identity | Foundation | v1.0 |
| 51 | Payments & Billing | Foundation | v1.0 |
| 52 | Security & Encryption | Foundation | v1.0 |
| 53 | Secrets Management | Foundation | v1.0 |
| 54 | Analytics & Tracking | Foundation | v1.0 |
| 55 | Monitoring & Observability | Foundation | v1.0 |
| 56 | Compliance & Legal | Foundation | v1.0 |

**Total: 56 base categories + 4 v1.1 additions = 60 categories**

---

## Reasoning Loop Quick Reference

| Loop | Pattern | Best For |
|------|---------|----------|
| **RALPH** | Reason→Act→Learn→Plan→Hypothesize | General complex tasks |
| **ReAct** | Thought→Action→Observation | Simple tool use |
| **ReWOO** | Plan all→Execute all→Synthesize | Parallel execution |
| **Reflexion** | Attempt→Evaluate→Reflect→Retry | Quality-critical output |
| **Tree of Thought** | Branch→Evaluate→Prune→Expand | Exploring solutions |
| **OODA** | Observe→Orient→Decide→Act | Dynamic environments |

---

## Skill Manifest Quick Template

```json
{
  "name": "skill-name",
  "version": "1.0.0",
  "description": "What this skill does",
  "category": "document|code|integration|reasoning|generation",
  "dependencies": [],
  "tools_required": [],
  "quality_gates": [],
  "agentic_hooks": {
    "invoke": "hooks/invoke.md"
  }
}
```

---

## Memory Type Quick Reference

| Memory Type | Storage | Retrieval | Duration |
|-------------|---------|-----------|----------|
| **Working** | Context window | Immediate | Session |
| **Episodic** | Vector DB | Semantic search | Persistent |
| **Semantic** | Knowledge graph | Entity lookup | Persistent |
| **Procedural** | Skill manifests | Task matching | Persistent |

---

## Prompt Pattern Quick Reference

| Pattern | Trigger | Use Case |
|---------|---------|----------|
| **Chain of Thought** | "step by step" | Complex reasoning |
| **Few-Shot** | Provide examples | Pattern learning |
| **Self-Consistency** | "multiple approaches" | Validation |
| **Persona** | "as a [role]" | Expert voice |
| **Structured Output** | "return as JSON" | Parsing needed |
| **Constitutional** | "never/always" | Behavior control |

---

# UPDATED VERSION HISTORY

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | January 2026 | Initial 56-category framework |
| **1.1** | **January 2026** | **Added: Skills (31B), Reasoning Loops (31C), Prompt Patterns (31D), Memory Architecture (31E)** |

---
## Appendix: GTM Roadmap
Pre-launch polish (1-2 weeks), GitHub release v1.0, X threads (#AIBuilders), Reddit posts (r/ClaudeAI), Dev.to articles.

---

# FRAMEWORK INTEGRATION POINTS

## Where Your Personal Frameworks Can Integrate

The following sections are designed as **extension points** where custom frameworks, methodologies, or domain-specific patterns can be integrated:

### Extension Point 1: Custom Skills
**Location:** Category 31B — Skills & Capability Packaging
**How to Integrate:** Create skill manifests in `/mnt/skills/user/` following the skill architecture defined. Your personal frameworks become invocable skills.

### Extension Point 2: Custom Reasoning Patterns
**Location:** Category 31C — Agentic Reasoning Loops
**How to Integrate:** Define your reasoning methodology using the loop template. Add to the Loop Selection Guide.

### Extension Point 3: Custom Prompt Libraries
**Location:** Category 31D — Prompt Engineering Patterns
**How to Integrate:** Add your prompt patterns to the pattern library. Document trigger phrases and use cases.

### Extension Point 4: Domain-Specific Categories
**Location:** Any Tier where your domain fits
**How to Integrate:** Create new category following the established template:
- Scope definition
- Exhaustive technology stack
- Quality gates
- Agentic prompt hook
- Cross-category dependencies

### Extension Point 5: Build Pattern Templates
**Location:** Framework Usage Guide → Build Pattern Templates
**How to Integrate:** Define your project archetypes as category combinations with required quality gates.

---

## North Star Blueprint Integration

This Master Build Framework pairs with the **North Star Blueprint v5.0** for complete coverage:

| This Framework Provides | North Star Provides |
|-------------------------|---------------------|
| Technology options (WHAT) | Methodology (HOW) |
| Tool matrices | Quality gates & standards |
| Stack selection | Confidence calibration |
| Build patterns | Context engineering |
| Reasoning loop definitions | Handoff protocols |
| Skill manifest templates | Load balancing strategies |

**Key NS Sections for MBF Users:**
- **NS Section 0:** Agentic Bootstrap Protocol — How to start
- **NS Section 17:** Confidence Calibration — When to escalate
- **NS Section 18:** Autonomy Dial — Setting control level
- **NS Section 23:** Handoff Protocols — Session continuity
- **NS Part IV:** AI Orchestration — Complete agent methodology

**Navigation:** Use **BRIDGE.md** to route between frameworks efficiently.

---

*End of Framework v1.1 — January 2026*
*Patched with Skills, Reasoning, Prompts, Memory Architecture*
*Part of the unified NS + MBF ecosystem — see BRIDGE.md for navigation*
