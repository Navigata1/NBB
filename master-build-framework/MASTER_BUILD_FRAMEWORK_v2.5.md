
# THE 62-CATEGORY MASTER BUILD FRAMEWORK
## v2.5 — March 2026

---

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     PART OF A UNIFIED FRAMEWORK ECOSYSTEM                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  This document is ONE component of a three-part system:                     │
│                                                                              │
│  ┌─────────────┐     ┌─────────────────────┐     ┌─────────────────────┐    │
│  │  BRIDGE.md  │────►│  NORTH STAR v6.5    │     │  MASTER BUILD v2.5  │    │
│  │  Navigation │     │  Methodology        │     │  (This Document)    │    │
│  └─────────────┘     │                     │     │                     │    │
│        │             │  HOW to build       │     │  WHAT to build with │    │
│        │             │  • Orchestration    │     │  • 62 categories    │    │
│        │             │  • Quality gates    │     │  • Tool matrices    │    │
│        │             │  • Context mgmt     │     │  • Stack selection  │    │
│        └─────────────┴─────────────────────┴─────┴─────────────────────┘    │
│                                                                              │
│  THIS DOCUMENT PROVIDES: Technology options, tool matrices, build patterns  │
│  FOR ORCHESTRATION: See North Star Blueprint v6.5 (handoffs, confidence,    │
│                     context engineering, load balancing, quality gates)     │
│  FOR NAVIGATION: See BRIDGE.md (routes you to the right document/section)   │
│                                                                              │
│  REMEMBER: MBF = WHAT (tools) | NS = HOW (methodology) | BRIDGE = NAVIGATE  │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# FRAMEWORK OVERVIEW

This document is an **exhaustive, autonomous execution framework** designed to be placed in front of any agentic model, IDE, or intelligent system to produce **maximum quality, production-ready outputs**.

## Core Principles

| Principle | Implementation |
|-----------|----------------|
| **Exhaustive** | Every category lists ALL top-tier tools, strategies, patterns — nothing held back |
| **Interconnected** | Categories pull from each other; dependencies are mapped explicitly |
| **Zero-to-Complete** | Full lifecycle coverage: ideation → architecture → implementation → testing → deployment → monitoring → iteration |
| **Quality-Gated** | Built-in phases for testing, security, performance, accessibility at every stage |
| **Agentic-Ready** | Prompt hooks for maximum output from any model |
| **Parallelism-Aware** | Designed for concurrent execution where possible |

## Framework Structure

- **8 Tiers** representing major domains
- **7 Categories per Tier** for deep coverage
- **62 Total Categories** — non-redundant, comprehensive
- **Cross-Category Dependencies** mapped throughout

---

# CODING AGENT BENCHMARKS & MODEL MATRIX

```text
CODING AGENT BENCHMARKS — MARCH 2026
──────────────────────────────────────────────────────────────────────────────

SWE-bench Verified (% of real GitHub issues resolved autonomously)
  GPT-5 + Aider:          88.0% 
  Cline + Claude Opus 4.6: 80.8%
  Claude Code (native):    ~80%
  GPT-4o + Cursor:         ~75%
  Devin:                   67% PR merge rate on defined tasks

Terminal-Bench 2.0
  GPT-5.3:                 77.3%

Real-World Production Metrics
  Claude Code at Anthropic: ~90% of Claude Code's own code is written by Claude Code
  Devin (enterprise):       67% PR merge rate on clearly scoped tasks
  Nubank (multi-agent):     12x efficiency on multi-million LOC ETL migration

Model Recommendation Matrix (NS Framework)
  ┌─────────────────────────────────────────────────────────────────────┐
  │  Task Type                    │  Recommended Model                  │
  ├─────────────────────────────────────────────────────────────────────┤
  │  Complex planning & design    │  Opus 4.6 (high effort mode)        │
  │  Standard feature development │  Sonnet 4.6 (default, cost balance) │
  │  Rapid codebase exploration   │  Haiku (via Explore sub-agent)      │
  │  Research reports             │  Sonnet 4.6 or Opus 4.6            │
  │  Parallel worker agents       │  Sonnet 4.6 (cost efficiency)       │
  │  Planner/Judge roles          │  Opus 4.6 (quality critical)        │
  └─────────────────────────────────────────────────────────────────────┘
```

---

# ALL 62 CATEGORIES AT A GLANCE

## Tier 1: Build Targets (What You Create)
1. **Web Applications** — SaaS, PWAs, dashboards, full-stack
   - Tools: React/Next.js, Vue/Nuxt, SvelteKit; Vercel/Netlify for deployment.
   - Patterns: Vertical slices (NS Part III); hero animations (Whisk/Flow sequencing for scroll-stoppers).
   - Quality Gates: First-impression test (load <2s); accessibility (WCAG 2.2).
   - Prompt Hook: "Build a SaaS web app for [idea], using Next.js + Tailwind; integrate scroll animation from transcripts; ensure efficiency with 50% faster loads via Framer Motion v11."
   - Dependencies: 8 (APIs), 15 (DBs), 36 (Image Gen for thumbnails).
2. **Mobile Applications** — iOS, Android, cross-platform
3. **Desktop Applications** — Windows, macOS, Linux, Electron, Tauri
4. **Websites & Landing Pages** — Marketing, blogs, e-commerce
5. **Generative & Immersive Web** — 3D, WebGL, AI-generated UI
6. **Operating Systems & Embedded** — Linux distros, IoT, RTOS
7. **Browser Extensions & Plugins** — Chrome, Firefox, Safari

## Tier 2: Compute & Infrastructure (Where It Runs)
8. **APIs & Backend Services** — REST, GraphQL, gRPC, tRPC
9. **Edge Computing & CDN** — Edge functions, global distribution
10. **Serverless Functions** — FaaS, event-driven compute
11. **GPU & ML Compute** — Training, inference, Modal, Replicate
12. **Container Orchestration** — Docker, Kubernetes, microservices
13. **Infrastructure as Code** — Terraform, Pulumi, CDK
14. **Platform Engineering** — IDPs, golden paths, developer experience

## Tier 3: Data & Persistence (Storage & Retrieval)
15. **Relational Databases** — PostgreSQL, MySQL, migrations, ORMs
16. **Vector Databases & Semantic Search** — Qdrant, Pinecone, embeddings
17. **Document & NoSQL Databases** — MongoDB, DynamoDB, graphs
18. **Local-First & Offline** — IndexedDB, SQLite, sync engines
19. **Object Storage & Files** — S3, R2, CDN delivery
20. **Data Warehousing & Analytics** — Snowflake, BigQuery, dbt
21. **Search Engines** — Elasticsearch, Meilisearch, Algolia

## Tier 4: AI & Agent Systems (Intelligence Layer)
22. **Caching & Performance** — Redis, CDN caching, query cache
23. **Message Queues & Streaming** — Kafka, SQS, BullMQ, Temporal
24. **Real-Time & WebSockets** — Pusher, Socket.io, Liveblocks
25. **Scheduled Jobs & Cron** — Vercel Cron, Inngest, Airflow
26. **Graph Processing & Knowledge** — Neo4j, knowledge graphs
27. **Data Transformation & ETL** — dbt, Airbyte, pipelines
28. **Feature Stores & ML Data** — Feast, experiment tracking

## Tier 5: AI Systems (Continued)
29. **Agentic RAG Systems** — LlamaIndex, LangChain, retrieval
30. **Autonomous Agents** — CrewAI, LangGraph, multi-agent
31. **MCPs & Tool Registries** — Function calling, tool definitions
   - Updated with skills as executable code
31E. **Memory Architecture** — Working/Episodic/Semantic/Procedural
   - Bolster: Embed RLM for infinite context (offload prompts to environment, recursive sub-calling).
   - Tools: Qdrant/Pinecone for embeddings; RLM with Ripple for 10M+ tokens (research: MIT v2, 2x cost reduction).
   - Patterns: Fork at 75-80% utilization (your idea); selective retrieval for efficiency.
   - Quality Gates: Context rot test (accuracy >95% at 1M tokens).
   - Prompt Hook: "Implement RLM for this agent's memory; fork context at 80% to avoid burn."
32. **Model Fine-Tuning** — LoRA, RLHF, domain adaptation
33. **Model Serving & Inference** — vLLM, TGI, quantization
34. **LLM Routing & Orchestration** — Gateways, prompt management
35. **AI Safety & Guardrails** — Content moderation, PII detection

## Tier 6: Content Generation (Media at Scale)
36. **Image Generation** — DALL-E, Flux, Midjourney, thumbnails
37. **Audio Generation** — ElevenLabs, Suno, voice synthesis
38. **Video Generation** — Runway, transcoding, streaming
39. **Document Generation** — PDFs, contracts, slides
40. **Code Generation** — AI assistants, transformation
41. **Data & Content Generation** — Synthetic data, content
42. **Translation & Localization** — i18n, machine translation

## Tier 7: Automation & DevOps (Building & Deploying)
43. **CI/CD Pipelines** — GitHub Actions, builds, releases
44. **Workflow Orchestration** — DAGs, long-running processes
45. **Browser & Web Automation** — Playwright, scraping, RPA
46. **Testing & QA** — Unit, E2E, performance, security
47. **Conversational & Voice** — Chatbots, voice assistants
48. **Documentation Systems** — Docs, API reference, wikis
49. **Dashboards & Internal Tools** — Admin panels, CRUD builders

## Tier 8: Security & Foundation (Cross-Cutting)
50. **Authentication & Identity** — OAuth, SSO, user management
51. **Payments & Billing** — Stripe, subscriptions, invoicing
52. **Security & Encryption** — WAF, scanning, protection
53. **Secrets Management** — Vault, credential storage
54. **Analytics & Tracking** — PostHog, Amplitude, experimentation
55. **Monitoring & Observability** — Metrics, logs, traces, alerts
56. **Compliance & Legal** — GDPR, SOC 2, accessibility

---

# CROSS-CATEGORY DEPENDENCY MATRIX

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         DEPENDENCY FLOW PATTERNS                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  TIER 1 (Build Targets) ──────────────────────────────────────────────────┐ │
│       │                                                                   │ │
│       ├──► TIER 2 (Compute) ──► Where it runs                            │ │
│       ├──► TIER 3 (Data) ──► What it stores/retrieves                    │ │
│       ├──► TIER 4-5 (AI) ──► Intelligence layer                          │ │
│       ├──► TIER 6 (Content) ──► Media generation                         │ │
│       ├──► TIER 7 (Automation) ──► CI/CD, workflows                      │ │
│       └──► TIER 8 (Foundation) ──► Auth, payments, security, compliance  │ │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Common Build Patterns

**SaaS Web Application:**
```
Categories: 1 + 8 + 15 + 22 + 43 + 46 + 49 + 50 + 51 + 52 + 54 + 55 + 56
```

**Autonomous Agent System:**
```
Categories: 29 + 30 + 31 + 32 + 33 + 34 + 35 + 16 + 22 + 23 + 11
```

**Content Generation Pipeline:**
```
Categories: 36 + 37 + 38 + 39 + 11 + 19 + 44 + 43
```

**Mobile App with AI:**
```
Categories: 2 + 8 + 15 + 29 + 33 + 50 + 51 + 54 + 55
```

---

# TIER 1: BUILD TARGETS
## *What You Are Creating*

---

## Category 1: Web Applications (Full-Stack)

### Scope
SaaS platforms, productivity tools, dashboards, admin panels, PWAs, real-time collaborative apps, marketplace platforms, social platforms, e-commerce storefronts.

### Technology Stack — Exhaustive

#### Frontend Frameworks
| Tool | Use Case | Why Choose |
|------|----------|------------|
| **Next.js 15** | Production React | Server components, App Router, streaming |
| **Remix** | Data-heavy apps | Nested routes, progressive enhancement |
| **Nuxt 4** | Vue ecosystem | Auto-imports, hybrid rendering |
| **SvelteKit 2** | Performance-critical | Smallest bundle, excellent DX |
| **SolidStart** | Maximum performance | Fine-grained reactivity |
| **Astro 5** | Content-heavy | Island architecture, any framework |
| **Qwik** | Instant loading | Resumability, lazy execution |

#### State Management
| Tool | Pattern | Best For |
|------|---------|----------|
| **Zustand** | Flux-lite | Simple global state |
| **Jotai** | Atomic | Fine-grained updates |
| **TanStack Query** | Server state | Caching, background sync |
| **Redux Toolkit** | Flux | Complex state machines |
| **XState** | State machines | Complex UI flows |
| **Legend State** | Observable | Real-time sync |

#### Styling Solutions
| Tool | Approach | Performance |
|------|----------|-------------|
| **Tailwind CSS 4** | Utility-first | Excellent |
| **CSS Modules** | Scoped CSS | Excellent |
| **Vanilla Extract** | Zero-runtime | Excellent |
| **Panda CSS** | Atomic CSS-in-JS | Excellent |
| **StyleX** | Atomic (Meta) | Excellent |

#### Component Libraries
| Library | Design System | Components |
|---------|---------------|------------|
| **shadcn/ui** | Radix + Tailwind | Copy-paste, customizable |
| **Radix UI** | Headless | Accessible primitives |
| **Ark UI** | Headless | Framework agnostic |
| **React Aria** | Adobe | Accessibility-first |
| **Mantine** | Full system | Feature-rich |

#### Animation Libraries
| Library | Type | Use Case |
|---------|------|----------|
| **Framer Motion** | Declarative | React animations |
| **GSAP** | Timeline | Complex sequences |
| **Motion One** | Web Animations API | Lightweight |
| **Lottie** | JSON | After Effects export |

#### Forms & Validation
| Tool | Approach |
|------|----------|
| **React Hook Form** | Uncontrolled, best perf |
| **Zod** | Schema validation, TS-first |
| **Valibot** | Schema (tiny bundle) |
| **TanStack Form** | Headless |

### Quality Gates

```
□ TypeScript strict mode enabled
□ ESLint + Prettier configured
□ Unit tests (Vitest/Jest) — 80%+ coverage
□ E2E tests (Playwright/Cypress)
□ Accessibility audit (axe-core)
□ Lighthouse score > 90 all categories
□ Bundle analysis completed
□ Security headers configured
□ Error boundaries implemented
□ Loading/error states for all async
□ SEO meta tags + OpenGraph
□ Mobile responsive verified
□ Cross-browser tested
```

### Agentic Prompt Hook

```
You are building a production web application. Before writing any code:

1. ARCHITECTURE PHASE
   - Define rendering strategy (SSR/SSG/ISR/CSR)
   - Choose state management based on complexity
   - Plan component hierarchy and data flow
   - Identify API boundaries

2. IMPLEMENTATION PHASE
   - Use TypeScript strict mode
   - Implement error boundaries at route level
   - Add loading states for all async operations
   - Ensure accessible markup (ARIA, semantic HTML)

3. QUALITY PHASE
   - Write tests alongside features
   - Run accessibility audits
   - Profile performance
   - Analyze bundle size

4. OUTPUT REQUIREMENTS
   - Production-ready code
   - Comprehensive error handling
   - Full TypeScript types
   - Documented complex logic
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Data fetching
- **→ Category 15** (Relational DB) — Persistence
- **→ Category 22** (Caching) — Performance
- **→ Category 43** (DevOps) — Deployment
- **→ Category 50** (Auth) — Identity
- **→ Category 51** (Payments) — Monetization

---

## Category 2: Mobile Applications

### Scope
iOS apps, Android apps, cross-platform apps, native apps, hybrid apps, tablet-optimized apps, wearable companion apps.

### Technology Stack — Exhaustive

#### Cross-Platform Frameworks
| Framework | Language | Best For |
|-----------|----------|----------|
| **React Native 0.76+** | TypeScript | React teams, large ecosystem |
| **Expo** | TypeScript | Rapid development, managed workflow |
| **Flutter** | Dart | Pixel-perfect UI, animations |
| **Kotlin Multiplatform** | Kotlin | Shared business logic |
| **Capacitor** | Web tech | Web-first teams |

#### Native Development
| Platform | Language | Framework |
|----------|----------|-----------|
| **iOS** | Swift | SwiftUI, UIKit |
| **Android** | Kotlin | Jetpack Compose |

#### React Native Ecosystem
| Category | Libraries |
|----------|-----------|
| **Navigation** | React Navigation, Expo Router |
| **State** | Zustand, Jotai, Legend State |
| **UI Kits** | Tamagui, NativeWind, Gluestack |
| **Storage** | MMKV, WatermelonDB |
| **Animation** | Reanimated 3, Moti |
| **Testing** | Jest, Detox, Maestro |

#### Mobile Backend Services
| Service | Features |
|---------|----------|
| **Firebase** | Auth, Firestore, Push, Analytics |
| **Supabase** | Postgres, Auth, Realtime |
| **AWS Amplify** | Full AWS integration |
| **Appwrite** | Open-source BaaS |

### Quality Gates

```
□ TypeScript/Dart strict mode
□ Performance profiled (60fps animations)
□ Offline mode implemented
□ Deep linking configured
□ Push notifications tested
□ Biometric auth implemented
□ Accessibility (VoiceOver/TalkBack tested)
□ App size optimized (<50MB)
□ Startup time <2 seconds
□ Crash-free rate >99.5%
□ E2E tests passing (Detox/Maestro)
□ Store compliance verified
```

### Agentic Prompt Hook

```
You are building a production mobile application. Before writing any code:

1. PLATFORM STRATEGY
   - Define target platforms (iOS, Android, both)
   - Choose framework based on team expertise
   - Plan native module needs

2. ARCHITECTURE PHASE
   - Define navigation structure
   - Plan offline-first data strategy
   - Design state management approach

3. IMPLEMENTATION PHASE
   - Use platform-appropriate patterns
   - Implement proper lifecycle handling
   - Handle all permission flows
   - Support accessibility throughout

4. RELEASE PHASE
   - Configure CI/CD for stores
   - Set up crash reporting
   - Plan OTA update strategy

5. OUTPUT REQUIREMENTS
   - Production-ready, store-compliant
   - All edge cases handled
   - Accessibility verified
   - Performance optimized
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Backend communication
- **→ Category 50** (Auth) — User identity
- **→ Category 51** (Payments) — In-app purchases
- **→ Category 54** (Analytics) — User tracking
- **→ Category 55** (Monitoring) — Crash reporting

---

## Category 3: Desktop Applications

### Scope
Windows apps, macOS apps, Linux apps, cross-platform desktop, system utilities, creative tools, developer tools.

### Technology Stack — Exhaustive

#### Cross-Platform Frameworks
| Framework | Language | Bundle Size | Best For |
|-----------|----------|-------------|----------|
| **Tauri 2.0** | Rust + Web | ~3-10MB | Small bundles, security |
| **Electron** | JS/TS | ~150MB+ | Large ecosystem |
| **Flutter Desktop** | Dart | ~20MB | Consistent UI |
| **Qt** | C++/Python | ~30MB+ | Native performance |
| **Wails** | Go + Web | ~8MB | Go backends |

#### Platform-Specific Features
| Feature | Windows | macOS | Linux |
|---------|---------|-------|-------|
| **System Tray** | Native API | NSStatusItem | libappindicator |
| **Notifications** | Windows Toast | UserNotifications | libnotify |
| **Installer** | MSIX, NSIS | DMG, PKG | DEB, AppImage |
| **Code Signing** | Authenticode | Apple Developer ID | N/A |

### Quality Gates

```
□ Cross-platform tested (Win/Mac/Linux)
□ Native integrations (tray, notifications)
□ Auto-updater implemented
□ Code signed (all platforms)
□ macOS notarized
□ Memory usage profiled
□ High DPI/Retina support
□ Keyboard shortcuts implemented
□ Accessibility verified
□ Crash reporting integrated
```

### Agentic Prompt Hook

```
You are building a production desktop application. Before writing code:

1. FRAMEWORK SELECTION
   - Tauri for small bundles + security
   - Electron for largest ecosystem
   - Native for maximum platform integration

2. ARCHITECTURE PHASE
   - Plan main/renderer process split
   - Design IPC communication
   - Plan local data storage

3. DISTRIBUTION PHASE
   - Set up code signing for all platforms
   - Configure auto-updater
   - Create installers for each OS

4. OUTPUT REQUIREMENTS
   - All platforms working identically
   - Native integrations complete
   - Signed and notarized
   - Auto-update functional
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Cloud sync
- **→ Category 18** (Local DB) — Local storage
- **→ Category 43** (CI/CD) — Multi-platform builds

---

## Category 4: Websites & Landing Pages

### Scope
Marketing sites, landing pages, corporate websites, portfolios, blogs, documentation, e-commerce storefronts.

### Technology Stack — Exhaustive

#### Static Site Generators
| Tool | Language | Best For |
|------|----------|----------|
| **Astro 5** | Any | Content sites, partial hydration |
| **Next.js** | React | Hybrid static/dynamic |
| **Nuxt** | Vue | Vue ecosystem |
| **Hugo** | Go | Fastest builds |
| **VitePress** | Vue | Documentation |
| **Docusaurus** | React | Documentation |

#### No-Code/Low-Code
| Platform | Best For |
|----------|----------|
| **Webflow** | Designer-driven sites |
| **Framer** | Interactive prototypes |
| **Squarespace** | Beautiful templates |

#### AI-Powered Generation
| Tool | Capability |
|------|------------|
| **V0.dev** | React component generation |
| **Builder.io** | Visual AI editing |
| **Relume** | Wireframe to design |

#### Animation & 3D
| Library | Use Case |
|---------|----------|
| **GSAP** | Complex sequences, scroll |
| **Three.js** | 3D graphics |
| **Spline** | No-code 3D scenes |
| **Lottie** | After Effects animations |

### Quality Gates

```
□ Lighthouse score > 95 all categories
□ Core Web Vitals passing
□ Mobile-first responsive
□ SEO meta tags complete
□ OpenGraph + Twitter cards
□ Structured data (JSON-LD)
□ Sitemap.xml generated
□ Accessibility WCAG 2.1 AA
□ Images optimized (WebP, AVIF)
□ Critical CSS inlined
```

### Agentic Prompt Hook

```
You are building a production website. Before writing code:

1. GOAL DEFINITION
   - Define primary conversion goal
   - Identify target audience
   - Plan content hierarchy

2. TECHNICAL STRATEGY
   - Choose rendering (static, SSR, hybrid)
   - Plan image optimization
   - Define animation approach

3. SEO PHASE
   - Research target keywords
   - Plan URL structure
   - Define structured data

4. OUTPUT REQUIREMENTS
   - Lighthouse > 95 all categories
   - Mobile-first responsive
   - SEO-optimized
   - Accessibility compliant
```

### Cross-Category Dependencies
- **→ Category 9** (Edge) — CDN delivery
- **→ Category 43** (DevOps) — Deployment
- **→ Category 54** (Analytics) — Tracking

---

## Category 5: Generative & Immersive Web

### Scope
AI-generated interfaces, V0-powered applications, 3D experiences, WebGL/WebGPU, AR/VR web, creative coding.

### Technology Stack — Exhaustive

#### Generative UI Tools
| Tool | Capability |
|------|------------|
| **V0.dev** | React/Tailwind generation |
| **Vercel AI SDK** | Streaming UI |
| **Anthropic Artifacts** | Interactive code |
| **Cursor** | AI-native editor |
| **Bolt.new** | Full-stack generation |

#### 3D Graphics
| Library | Best For |
|---------|----------|
| **Three.js** | Full control |
| **React Three Fiber** | Declarative 3D |
| **Babylon.js** | Game-quality |
| **Spline** | No-code 3D |

#### Data Visualization
| Library | Type |
|---------|------|
| **D3.js** | Low-level, flexible |
| **Chart.js** | Simple charts |
| **Recharts** | React charts |
| **Deck.gl** | Geospatial |

### Quality Gates

```
□ 60fps maintained on target devices
□ Progressive enhancement (fallbacks)
□ Memory leaks monitored
□ Loading states for 3D assets
□ Mobile touch interactions work
□ Accessibility alternatives provided
□ WebGL context loss handled
```

### Cross-Category Dependencies
- **→ Category 29** (AI) — Generative content
- **→ Category 36** (Image Gen) — AI visuals
- **→ Category 11** (GPU) — Generation compute

---

## Category 6: Operating Systems & Embedded

### Scope
Custom Linux distros, Raspberry Pi systems, IoT firmware, RTOS, robotics, automotive.

### Technology Stack — Exhaustive

#### Linux Distribution Building
| Tool | Purpose |
|------|---------|
| **Yocto Project** | Custom embedded Linux |
| **Buildroot** | Simple embedded Linux |
| **Ubuntu Core** | Snap-based IoT |

#### Real-Time Operating Systems
| RTOS | Best For |
|------|----------|
| **FreeRTOS** | Microcontrollers, AWS IoT |
| **Zephyr** | Modern, scalable |
| **QNX** | Automotive, safety |

#### Firmware Development
| Framework | Language |
|-----------|----------|
| **Arduino** | C++ |
| **PlatformIO** | C/C++ |
| **ESP-IDF** | C (ESP32) |
| **Embassy** | Rust async |
| **MicroPython** | Python |

### Quality Gates

```
□ Boot time optimized
□ Memory footprint minimized
□ Power consumption profiled
□ OTA update mechanism working
□ Secure boot configured
□ Watchdog timer implemented
□ Production image reproducible
```

### Agentic Prompt Hook

```
You are building an embedded system. Before writing code:

1. REQUIREMENTS ANALYSIS
   - Define hardware constraints
   - Identify real-time requirements
   - Plan power budget

2. PLATFORM SELECTION
   - Choose base OS/RTOS
   - Select build system
   - Define bootloader

3. OUTPUT REQUIREMENTS
   - Reproducible builds
   - OTA update capable
   - Security hardened
```

### Cross-Category Dependencies
- **→ Category 9** (Edge) — IoT connectivity
- **→ Category 52** (Security) — Secure boot

---

## Category 7: Browser Extensions & Plugins

### Scope
Chrome extensions, Firefox add-ons, Safari extensions, Edge extensions, productivity tools, developer tools.

### Technology Stack — Exhaustive

#### Extension Frameworks
| Framework | Features |
|-----------|----------|
| **Plasmo** | React-based, cross-browser |
| **WXT** | Vite-based, TypeScript |
| **CRXJS** | Vite plugin for Chrome |
| **WebExtension Polyfill** | Cross-browser API |

#### Key APIs
| API | Capability |
|-----|------------|
| **storage** | Local/sync storage |
| **tabs** | Tab manipulation |
| **scripting** | Script injection |
| **sidePanel** | Chrome side panel |
| **declarativeNetRequest** | Network rules |

### Quality Gates

```
□ Manifest V3 compliant (Chrome)
□ Minimum permissions requested
□ Privacy policy published
□ Cross-browser tested
□ Content Security Policy configured
□ No eval() or inline scripts
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Backend services
- **→ Category 50** (Auth) — User identity
- **→ Category 52** (Security) — Data protection

---

# TIER 2: COMPUTE & INFRASTRUCTURE
## *Where and How It Runs*

---

## Category 8: APIs & Backend Services

### Scope
REST APIs, GraphQL APIs, gRPC services, tRPC backends, WebSocket servers, microservices.

### Technology Stack — Exhaustive

#### Backend Frameworks
| Framework | Language | Best For |
|-----------|----------|----------|
| **Hono** | TypeScript | Edge, speed |
| **Elysia** | TypeScript | Bun-native, performance |
| **Fastify** | TypeScript | Production APIs |
| **NestJS** | TypeScript | Enterprise, DI |
| **tRPC** | TypeScript | End-to-end types |
| **FastAPI** | Python | APIs, auto-docs |
| **Django** | Python | Batteries-included |
| **Gin** | Go | Fast APIs |
| **Axum** | Rust | Modern, Tower ecosystem |
| **Spring Boot** | Java/Kotlin | Enterprise |

#### API Protocols
| Protocol | Best For |
|----------|----------|
| **REST** | Universal compatibility |
| **GraphQL** | Flexible data fetching |
| **gRPC** | High-performance microservices |
| **tRPC** | Full-stack TypeScript |
| **WebSocket** | Real-time bidirectional |

#### API Documentation
| Tool | Purpose |
|------|---------|
| **OpenAPI/Swagger** | REST specification |
| **Postman** | Testing, documentation |
| **GraphQL Playground** | GraphQL IDE |

### Quality Gates

```
□ OpenAPI/GraphQL schema defined
□ Input validation on all endpoints
□ Rate limiting implemented
□ Authentication/authorization complete
□ Error responses standardized
□ Pagination implemented
□ CORS configured correctly
□ Health check endpoint
□ Request logging enabled
□ Database connection pooling
□ Integration tests passing
```

### Agentic Prompt Hook

```
You are building a production API. Before writing code:

1. API DESIGN
   - Define resource model
   - Choose protocol (REST/GraphQL/gRPC)
   - Plan versioning strategy

2. ARCHITECTURE
   - Define service boundaries
   - Plan database schema
   - Design caching strategy

3. SECURITY
   - Implement authentication
   - Add authorization checks
   - Configure rate limiting

4. OUTPUT REQUIREMENTS
   - Schema documented
   - All endpoints tested
   - Rate limited and secured
```

### Cross-Category Dependencies
- **→ Category 15-17** (Databases) — Data persistence
- **→ Category 22** (Caching) — Performance
- **→ Category 50** (Auth) — Identity
- **→ Category 52** (Security) — Protection

---

## Category 9: Edge Computing & CDN

### Scope
Edge functions, CDN logic, global distribution, edge databases, low-latency computing.

### Technology Stack — Exhaustive

#### Edge Platforms
| Platform | Cold Start | Best For |
|----------|------------|----------|
| **Cloudflare Workers** | <5ms | Fastest, global |
| **Vercel Edge Functions** | <5ms | Next.js integration |
| **Deno Deploy** | <10ms | Deno ecosystem |
| **Fastly Compute** | <10ms | High performance |
| **Fly.io** | ~100ms | Full containers at edge |

#### Edge Databases
| Service | Type |
|---------|------|
| **Cloudflare KV** | Key-value |
| **Cloudflare Durable Objects** | Coordinated state |
| **Cloudflare D1** | SQLite at edge |
| **Cloudflare R2** | Object storage (no egress) |
| **Turso** | Distributed SQLite |
| **Upstash Redis** | Global Redis |

#### CDN Providers
| Provider | Specialty |
|----------|-----------|
| **Cloudflare** | Security + performance |
| **Fastly** | Real-time purging |
| **AWS CloudFront** | AWS integration |
| **Bunny CDN** | Cost-effective |

### Quality Gates

```
□ Cold start time <50ms
□ Global latency tested
□ Cache headers optimized
□ Purge strategy implemented
□ DDoS protection enabled
□ HTTP/3 enabled
□ Brotli compression
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Origin servers
- **→ Category 22** (Caching) — Cache strategies
- **→ Category 52** (Security) — DDoS, WAF

---

## Category 10: Serverless Functions

### Scope
FaaS, event-driven compute, webhooks, scheduled jobs, queue processors.

### Technology Stack — Exhaustive

#### Serverless Platforms
| Platform | Cold Start | Best For |
|----------|------------|----------|
| **AWS Lambda** | 100-500ms | AWS ecosystem |
| **Vercel Functions** | <100ms | Vercel deployments |
| **Cloudflare Workers** | <5ms | Edge, speed |
| **Supabase Edge Functions** | <50ms | Supabase integration |

#### Serverless Frameworks
| Framework | Features |
|-----------|----------|
| **SST** | TypeScript-first, AWS |
| **Serverless Framework** | Multi-cloud |
| **AWS SAM** | Official AWS |
| **Pulumi** | Real programming languages |

### Quality Gates

```
□ Cold start time optimized
□ Idempotency implemented
□ Error handling with retries
□ Dead letter queues configured
□ Structured logging
□ Tracing enabled
□ Local development working
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — HTTP triggers
- **→ Category 23** (Queues) — Async triggers
- **→ Category 43** (DevOps) — Deployment

---

## Category 11: GPU & ML Compute

### Scope
GPU workloads, ML training, inference serving, batch processing, model deployment.

### Technology Stack — Exhaustive

#### GPU Cloud Platforms
| Platform | Best For |
|----------|----------|
| **Modal** | Serverless GPU, Python-native |
| **Replicate** | Model hosting, API |
| **RunPod** | Affordable GPU |
| **Lambda Labs** | Training |
| **Together AI** | Inference API |
| **Fireworks AI** | Fast inference |
| **Groq** | Ultra-fast inference |

#### Inference Engines
| Engine | Best For |
|--------|----------|
| **vLLM** | High-throughput LLM |
| **TGI** | HuggingFace serving |
| **TensorRT-LLM** | NVIDIA optimized |
| **llama.cpp** | CPU/Metal |
| **Ollama** | Local LLMs |

#### Optimization Techniques
| Technique | Purpose |
|-----------|---------|
| **Quantization** | Model compression |
| **Continuous batching** | Throughput |
| **Speculative decoding** | Latency |
| **PagedAttention** | Memory efficiency |

### Quality Gates

```
□ GPU utilization monitored
□ Memory management verified
□ Inference latency profiled
□ Cost per inference calculated
□ Auto-scaling configured
□ Health checks implemented
□ Model versioning in place
```

### Cross-Category Dependencies
- **→ Category 29-33** (AI) — Model deployment
- **→ Category 44** (Workflows) — Pipelines
- **→ Category 55** (Monitoring) — GPU metrics

---

## Category 12: Container Orchestration

### Scope
Docker containers, Kubernetes, service meshes, auto-scaling, microservices.

### Technology Stack — Exhaustive

#### Container Runtimes
| Runtime | Use Case |
|---------|----------|
| **Docker** | Standard containers |
| **containerd** | Kubernetes default |
| **Podman** | Rootless, daemonless |

#### Orchestration Platforms
| Platform | Type |
|----------|------|
| **Kubernetes** | Self-managed |
| **Amazon EKS** | Managed K8s |
| **Google GKE** | Managed K8s |
| **Fly.io** | Managed containers |
| **Railway** | PaaS |
| **Render** | PaaS |

#### Kubernetes Ecosystem
| Category | Tools |
|----------|-------|
| **Package Management** | Helm, Kustomize |
| **GitOps** | ArgoCD, Flux |
| **Service Mesh** | Istio, Linkerd |
| **Ingress** | NGINX, Traefik |
| **Autoscaling** | KEDA, Karpenter |
| **Security** | Falco, OPA, Trivy |

### Quality Gates

```
□ Multi-stage Dockerfile optimized
□ Health checks configured
□ Resource limits set
□ Horizontal pod autoscaling
□ Network policies defined
□ RBAC configured
□ Image scanning enabled
□ GitOps workflow established
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Services to deploy
- **→ Category 43** (DevOps) — CI/CD
- **→ Category 52** (Security) — Container security

---

## Category 13: Infrastructure as Code

### Scope
Cloud provisioning, infrastructure automation, configuration management.

### Technology Stack — Exhaustive

#### IaC Tools
| Tool | Language | Best For |
|------|----------|----------|
| **Terraform** | HCL | Industry standard |
| **OpenTofu** | HCL | Open-source Terraform |
| **Pulumi** | TS/Python/Go | Real languages |
| **AWS CDK** | TS/Python | AWS-native |
| **SST** | TypeScript | Serverless apps |

#### State Management
| Solution | Type |
|----------|------|
| **Terraform Cloud** | Managed |
| **S3 + DynamoDB** | AWS self-hosted |
| **Spacelift** | Enterprise platform |

### Quality Gates

```
□ State backend configured (remote)
□ State locking enabled
□ Current state file accessible and recent
□ Modules properly versioned
□ Variables documented
□ Drift detection automated
□ Plan review required
□ Sensitive values encrypted
□ Delete protection enabled on stateful resources
□ Backup independence verified
```

### Backup Independence Principle

```
BACKUP RULE:
A backup that can be destroyed by the same operation that destroys the
primary data is NOT a backup.

VERIFICATION CHECKLIST:
□ Database backups exist outside the database instance lifecycle
□ Infrastructure state is stored outside the infrastructure it describes
□ At least one backup copy exists in a different account or region
□ Backup deletion requires separate credentials from primary resource
□ Regular restore testing is scheduled
```

### Environment Isolation Principle

```
RULE:
Unrelated services must not share production infrastructure.

ISOLATION LEVELS:
  • Separate accounts — strongest
  • Separate VPCs — recommended minimum
  • Separate namespaces — acceptable for related services
  • Shared-everything — never for unrelated production services

COST vs RISK:
Saving a few dollars per month is not worth expanding blast radius across
multiple services.
```

### Agent Interaction Protocol for IaC

```
PRE-FLIGHT CHECKLIST
□ State backend verified as remote and accessible
□ State file freshness confirmed
□ Delete protection enabled on stateful resources
□ Backup independence verified
□ Environment isolation confirmed
□ Human informed of blast radius tier

PLAN-ONLY MODE (Default)
  • terraform plan (not apply)
  • pulumi preview (not up)
  • cdk diff (not deploy)

APPLY RESTRICTIONS
  • terraform apply -> Tier 4 minimum
  • production apply -> human-executed after review
  • terraform destroy -> HARD STOP, always human-executed

STATE FILE HANDLING
  • Never unpack, modify, or switch state files without explicit human direction
  • If multiple state files are discovered -> STOP and present findings
  • If state is missing or stale -> STOP

CLEANUP OPERATIONS
  • Prefer targeted cleanup over `terraform destroy`
  • Never batch-delete infrastructure without itemized review
```

### Cross-Category Dependencies
- **→ Category 12** (Containers) — K8s infrastructure
- **→ Category 43** (DevOps) — Automation
- **→ Category 53** (Secrets) — Secret management

---

## Category 14: Platform Engineering

### Scope
Internal developer platforms, self-service infrastructure, golden paths, developer experience.

### Technology Stack — Exhaustive

#### Internal Developer Platforms
| Platform | Type |
|----------|------|
| **Backstage** | Spotify's IDP |
| **Port** | Developer portal |
| **Cortex** | Service catalog |

#### Developer Experience
| Tool | Purpose |
|------|---------|
| **Gitpod** | Cloud dev environments |
| **GitHub Codespaces** | GitHub cloud dev |
| **Tilt** | Local K8s dev |
| **Telepresence** | Local-to-cluster |

### Quality Gates

```
□ Self-service provisioning working
□ Golden paths documented
□ Developer onboarding automated
□ Service ownership clear
□ Cost visibility per team
□ Security guardrails automated
```

### Cross-Category Dependencies
- **→ Category 12-13** (Infrastructure) — Infrastructure
- **→ Category 43** (DevOps) — CI/CD
- **→ Category 48** (Docs) — Documentation

---

## Category 58: AI-Native IDEs & Coding Agents

### Scope
Purpose-built AI coding environments, terminal agents, spec-driven IDEs,
agent client protocols, IDE-agnostic coding agents.

### Technology Stack — Exhaustive

#### Terminal-Based Agents
| Tool | Key Differentiator | Monthly Cost |
|------|-------------------|-------------|
| **Claude Code** | NS Framework native, hooks, skills, plugins, worktrees | $20-200/mo |
| **Cline** | BYOK, 80.8% SWE-bench, VS Code extension, 5M installs | Free + API |
| **OpenCode** | Open-source, multi-LLM, Go-based TUI, 95K stars | Free + API |
| **Aider** | Repo maps, architect mode, 88% SWE-bench with GPT-5 | Free + API |

#### AI-Native Terminals & Bridges
| Tool | Key Differentiator |
|------|-------------------|
| **Warp** | AI-native terminal with split panes, file preview, multi-session management |
| **Happy Engineering** | Mobile-to-desktop terminal bridge — run Claude Code sessions from phone (happy.engineering) |

#### IDE Environments
| IDE | Key Differentiator | Price |
|-----|-------------------|-------|
| **Cursor** | FastRender planner/worker/judge, Claude + GPT-5 | $20/mo |
| **Windsurf** | SWE-grep RL-trained search, $15/mo value play | $15/mo |
| **Kiro (Amazon)** | Spec-driven development, event-driven hooks | TBD |
| **Zed + ACP** | Rust/GPU editor, Agent Client Protocol, open standard | $10/mo |
| **Google Antigravity** | Multi-agent visual dashboard, Gemini 3 Pro + Claude | Preview |

#### Agent Client Protocol (ACP) — Open Standard
| Aspect | Detail |
|--------|--------|
| Created by | Zed Industries |
| Purpose | Standard for plugging external agents into any IDE |
| Status | Open standard, growing adoption Feb 2026 |
| Benefit | Write an agent once, use in any ACP-compatible IDE |

### Selection Decision Tree
```text
Do you use Claude Code as primary agent? YES → Enhance with skills/plugins
Need open-source, BYOK flexibility?    YES → OpenCode or Cline
Need spec-driven workflow natively?    YES → Kiro
Need GPU-accelerated Rust editor?      YES → Zed + ACP
Need enterprise multi-agent dashboard? YES → Google Antigravity
Want maximum SWE-bench performance?    YES → Aider with Opus 4.6
```

### Quality Gates
```text
□ Agent is connected to your test runner
□ Hooks configured (at minimum: stop hook)
□ Permissions pre-configured and committed to git
□ claude.md or equivalent context file populated
□ Repository map available for large codebases
```

### Cross-Category Dependencies
- → Category 57 (Agent Orchestration) — for multi-agent coordination
- → Category 43 (CI/CD) — for automated validation
- → NS Part I (RPIT Loop) — feature development methodology

---

---


# TIER 3: DATA & PERSISTENCE
## *How Data Is Stored, Retrieved, and Managed*

---

## Category 15: Relational Databases

### Scope
SQL databases, PostgreSQL, MySQL, SQLite, transactional systems, migrations, ORMs.

### Technology Stack — Exhaustive

#### Database Engines
| Database | Best For |
|----------|----------|
| **PostgreSQL** | General purpose, extensions |
| **MySQL/MariaDB** | Web applications |
| **SQLite** | Embedded, local-first |
| **CockroachDB** | Distributed SQL |

#### Managed Services
| Service | Database |
|---------|----------|
| **Supabase** | PostgreSQL + backend |
| **Neon** | Serverless PostgreSQL |
| **PlanetScale** | Serverless MySQL |
| **AWS RDS** | Multiple |
| **Turso** | Distributed SQLite |

#### ORMs & Query Builders
| Tool | Language |
|------|----------|
| **Prisma** | TypeScript |
| **Drizzle** | TypeScript |
| **Kysely** | TypeScript |
| **SQLAlchemy** | Python |
| **GORM** | Go |

### Quality Gates

```
□ Indexes on foreign keys
□ Connection pooling configured
□ Query performance analyzed
□ N+1 queries eliminated
□ Migrations reversible
□ Backups automated
□ Replication configured (if needed)
□ Slow query logging enabled
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Data layer
- **→ Category 22** (Caching) — Query caching
- **→ Category 43** (DevOps) — Backup automation

---

## Category 16: Vector Databases & Semantic Search

### Scope
Embeddings storage, similarity search, RAG retrieval, recommendation systems.

### Technology Stack — Exhaustive

#### Vector Databases
| Database | Best For |
|----------|----------|
| **Qdrant** | Full-featured, filtering |
| **Pinecone** | Serverless, simple |
| **Weaviate** | GraphQL, multimodal |
| **Chroma** | Embedded, local |
| **pgvector** | Existing PostgreSQL |
| **LanceDB** | Embedded, serverless |

#### Embedding Models
| Provider | Models |
|----------|--------|
| **OpenAI** | text-embedding-3-* |
| **Cohere** | embed-v3 |
| **Voyage AI** | voyage-3, voyage-code |
| **BGE/E5** | Open-source |

#### Search Enhancement
| Technique | Tools |
|-----------|-------|
| **Hybrid Search** | BM25 + vector |
| **Re-ranking** | Cohere Rerank, BGE |
| **HyDE** | Query expansion |

### Quality Gates

```
□ Embedding model benchmarked
□ Chunk size optimized
□ Metadata schema defined
□ Recall measured
□ Re-ranking evaluated
□ Query latency profiled
□ Hybrid search tested
```

### Cross-Category Dependencies
- **→ Category 29-31** (AI) — RAG systems
- **→ Category 15** (Relational) — Metadata storage
- **→ Category 11** (GPU) — Embedding compute

---

## Category 17: Document & NoSQL Databases

### Scope
Document databases, key-value stores, graph databases, time-series.

### Technology Stack — Exhaustive

#### Document Databases
| Database | Best For |
|----------|----------|
| **MongoDB** | General document storage |
| **Firestore** | Firebase, real-time |
| **DynamoDB** | AWS serverless |

#### Graph Databases
| Database | Query Language |
|----------|---------------|
| **Neo4j** | Cypher |
| **Amazon Neptune** | Gremlin |
| **ArangoDB** | AQL (multi-model) |

#### Time-Series
| Database | Best For |
|----------|----------|
| **InfluxDB** | Metrics, IoT |
| **TimescaleDB** | PostgreSQL-based |
| **ClickHouse** | Analytics |

### Quality Gates

```
□ Data model matches access patterns
□ Indexes support all queries
□ Partition key chosen correctly
□ Replication configured
□ Backup strategy implemented
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Data layer
- **→ Category 22** (Caching) — Cache integration

---

## Category 18: Local-First & Offline Databases

### Scope
Client-side databases, offline-first, sync engines, CRDTs.

### Technology Stack — Exhaustive

#### Browser Databases
| Database | Type |
|----------|------|
| **IndexedDB** | Native browser |
| **Dexie.js** | IndexedDB wrapper |
| **SQLite WASM** | SQL in browser |
| **PouchDB** | CouchDB sync |

#### Sync Engines
| Engine | Approach |
|--------|----------|
| **PowerSync** | PostgreSQL sync |
| **ElectricSQL** | PostgreSQL sync |
| **Y.js** | CRDT |
| **Automerge** | CRDT |
| **Liveblocks** | Real-time sync |

### Quality Gates

```
□ Offline functionality tested
□ Sync conflicts handled
□ Storage limits understood
□ Migration strategy defined
□ Encryption at rest (if needed)
```

### Cross-Category Dependencies
- **→ Category 1-3** (Apps) — Client applications
- **→ Category 15** (Relational) — Server database
- **→ Category 24** (Real-time) — Sync layer

---

## Category 19: Object Storage & File Systems

### Scope
Cloud storage, file uploads, CDN for assets, presigned URLs.

### Technology Stack — Exhaustive

#### Cloud Object Storage
| Service | Best For |
|---------|----------|
| **Amazon S3** | Industry standard |
| **Cloudflare R2** | No egress fees |
| **Backblaze B2** | Cost-effective |
| **Supabase Storage** | Supabase integration |
| **Uploadthing** | Simple uploads |

#### File Processing
| Tool | Purpose |
|------|---------|
| **Sharp** | Image processing |
| **FFmpeg** | Video/audio |
| **Cloudinary** | CDN + processing |

### Quality Gates

```
□ Presigned URLs for uploads
□ File type validation
□ File size limits enforced
□ CDN configured
□ Lifecycle policies set
□ Encryption at rest
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Upload endpoints
- **→ Category 9** (Edge) — CDN delivery
- **→ Category 36-38** (Content) — Media processing

---

## Category 20: Data Warehousing & Analytics

### Scope
Analytics databases, OLAP, data lakes, ETL, business intelligence.

### Technology Stack — Exhaustive

#### Cloud Data Warehouses
| Warehouse | Best For |
|-----------|----------|
| **Snowflake** | Multi-cloud |
| **BigQuery** | Serverless, GCP |
| **Redshift** | AWS |
| **Databricks** | Lakehouse, ML |
| **ClickHouse** | Real-time analytics |
| **DuckDB** | Embedded OLAP |

#### ETL/ELT Tools
| Tool | Type |
|------|------|
| **dbt** | Transform (ELT) |
| **Airbyte** | Extract/Load |
| **Fivetran** | Managed EL |
| **Apache Airflow** | Orchestration |
| **Dagster** | Modern orchestration |

#### BI & Visualization
| Tool | Type |
|------|------|
| **Metabase** | Open-source BI |
| **Apache Superset** | Open-source BI |
| **Looker** | Google BI |

### Quality Gates

```
□ Data model documented
□ ETL jobs monitored
□ Data quality checks
□ Freshness SLAs defined
□ Access controls in place
```

### Cross-Category Dependencies
- **→ Category 15-17** (Databases) — Source systems
- **→ Category 44** (Workflows) — Orchestration
- **→ Category 49** (Dashboards) — Visualization

---

## Category 21: Search Engines

### Scope
Full-text search, faceted search, autocomplete, typo tolerance.

### Technology Stack — Exhaustive

#### Search Engines
| Engine | Best For |
|--------|----------|
| **Meilisearch** | Developer experience |
| **Typesense** | Typo-tolerance |
| **Algolia** | Speed, relevance |
| **Elasticsearch** | Enterprise, analytics |

#### Search UI
| Library | Framework |
|---------|-----------|
| **InstantSearch** | React, Vue |
| **DocSearch** | Documentation |

### Quality Gates

```
□ Relevance tested with real queries
□ Typo tolerance configured
□ Autocomplete latency <100ms
□ Search latency <200ms
□ Indexing pipeline reliable
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Search API
- **→ Category 16** (Vector) — Semantic search

---

# TIER 4: AI & AGENT SYSTEMS
## *Intelligence, Reasoning, and Autonomous Capability*

---

## Category 22: Caching & Performance

### Scope
In-memory caching, distributed caching, CDN caching, query caching.

### Technology Stack — Exhaustive

#### In-Memory Caches
| Cache | Best For |
|-------|----------|
| **Redis** | General purpose |
| **Upstash Redis** | Serverless |
| **Dragonfly** | High performance |
| **Momento** | Serverless |

#### Caching Patterns
| Pattern | Use Case |
|---------|----------|
| **Cache-Aside** | General caching |
| **Read-Through** | Simplified reads |
| **Write-Behind** | Performance |

### Quality Gates

```
□ Cache hit rate monitored
□ TTL values appropriate
□ Cache invalidation strategy
□ Connection pooling
□ Failover tested
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Response caching
- **→ Category 9** (Edge) — Edge caching
- **→ Category 15** (Databases) — Query caching

---

## Category 23: Message Queues & Event Streaming

### Scope
Async messaging, job queues, event-driven architecture, pub/sub.

### Technology Stack — Exhaustive

#### Message Queues
| Queue | Best For |
|-------|----------|
| **BullMQ** | Node.js jobs |
| **RabbitMQ** | Reliable messaging |
| **Amazon SQS** | AWS serverless |

#### Event Streaming
| Platform | Best For |
|----------|----------|
| **Apache Kafka** | High-throughput |
| **Redpanda** | Kafka-compatible |
| **NATS** | Lightweight |

#### Workflow Engines
| Tool | Type |
|------|------|
| **Temporal** | Durable execution |
| **Inngest** | Serverless workflows |
| **Trigger.dev** | Background jobs |

### Quality Gates

```
□ Message durability configured
□ Dead letter queues set up
□ Retry policies defined
□ Idempotency implemented
□ Consumer scaling tested
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Event triggers
- **→ Category 10** (Serverless) — Function triggers
- **→ Category 44** (Workflows) — Orchestration

---

## Category 24: Real-Time & WebSockets

### Scope
WebSocket servers, real-time updates, presence, collaboration.

### Technology Stack — Exhaustive

#### Real-Time Platforms
| Platform | Best For |
|----------|----------|
| **Pusher** | Managed, simple |
| **Ably** | Enterprise |
| **Socket.io** | Self-hosted |
| **Liveblocks** | Collaboration |
| **PartyKit** | Edge real-time |
| **Supabase Realtime** | PostgreSQL changes |

#### Collaboration Tools
| Tool | Features |
|------|----------|
| **Liveblocks** | Presence, storage |
| **Y.js** | CRDT, offline |
| **Automerge** | CRDT |

### Quality Gates

```
□ Connection handling robust
□ Reconnection logic implemented
□ Room/channel cleanup
□ Horizontal scaling tested
□ Authentication on connect
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — REST fallback
- **→ Category 50** (Auth) — Connection auth

---

## Category 25: Scheduled Jobs & Cron

### Scope
Scheduled tasks, cron jobs, recurring jobs, batch processing.

### Technology Stack — Exhaustive

#### Serverless Scheduling
| Service | Platform |
|---------|----------|
| **Vercel Cron** | Vercel |
| **Upstash QStash** | Serverless |
| **Inngest** | Cron + events |
| **Trigger.dev** | Background jobs |

#### Self-Hosted
| Tool | Language |
|------|----------|
| **node-cron** | Node.js |
| **APScheduler** | Python |
| **Celery Beat** | Python |

#### Monitoring
| Tool | Purpose |
|------|---------|
| **Cronitor** | Cron monitoring |
| **Healthchecks.io** | Dead man's switch |

### Quality Gates

```
□ Jobs idempotent
□ Overlapping runs prevented
□ Failure alerting
□ Dead man's switch monitoring
□ Run history stored
```

### Cross-Category Dependencies
- **→ Category 10** (Serverless) — Job execution
- **→ Category 23** (Queues) — Job queuing
- **→ Category 55** (Monitoring) — Job monitoring

---

## Category 26: Graph Processing & Knowledge

### Scope
Knowledge graphs, ontologies, graph algorithms, entity resolution.

### Technology Stack — Exhaustive

#### Graph Databases
| Database | Query Language |
|----------|---------------|
| **Neo4j** | Cypher |
| **Amazon Neptune** | Gremlin |
| **TypeDB** | TypeQL |

#### Graph Processing
| Framework | Best For |
|-----------|----------|
| **NetworkX** | Python analysis |
| **Neo4j GDS** | Neo4j algorithms |

### Quality Gates

```
□ Ontology/schema defined
□ Query performance optimized
□ Graph algorithms tested
□ Access controls configured
```

### Cross-Category Dependencies
- **→ Category 16** (Vector) — Semantic enrichment
- **→ Category 29** (RAG) — Knowledge retrieval

---

## Category 27: Data Transformation & ETL

### Scope
Data pipelines, ETL/ELT, data cleaning, schema evolution.

### Technology Stack — Exhaustive

#### ETL/ELT Frameworks
| Tool | Type |
|------|------|
| **dbt** | SQL transforms |
| **Airbyte** | Connectors |
| **Apache Spark** | Big data |
| **Polars** | Fast DataFrames |
| **DuckDB** | Embedded OLAP |

#### Data Validation
| Tool | Purpose |
|------|---------|
| **Great Expectations** | Data quality |
| **Pydantic** | Python validation |
| **Zod** | TypeScript validation |

### Quality Gates

```
□ Source validation implemented
□ Data quality checks automated
□ Idempotent transforms
□ Audit logging enabled
□ Data lineage tracked
```
### Data Versioning with DVC

#### Why Data Versioning Matters
ML projects require reproducibility. Code versioning (Git) is solved. **Data versioning is not.**

#### Recommended Stack
| Tool | Purpose | Integration |
|------|---------|-------------|
| **DVC** | Data + model versioning | Git-native |
| **LakeFS** | Git-like data lake | S3-compatible |
| **Delta Lake** | Versioned data tables | Spark ecosystem |

#### DVC Quick Start
```bash
# Initialize DVC in existing Git repo
dvc init

# Track large data file
dvc add data/training_set.parquet

# Push to remote storage
dvc remote add -d myremote s3://mybucket/dvc
dvc push
```

#### Data Lineage Pattern
```yaml
# dvc.yaml pipeline definition
stages:
  prepare:
    cmd: python src/prepare.py
    deps:
      - src/prepare.py
      - data/raw/
    outs:
      - data/prepared/
  
  train:
    cmd: python src/train.py
    deps:
      - src/train.py
      - data/prepared/
    outs:
      - models/model.pkl
``````

### Cross-Category Dependencies
- **→ Category 15-17** (Databases) — Source/target
- **→ Category 20** (Warehousing) — Destination
- **→ Category 44** (Workflows) — Orchestration
```
---

## Category 28: Feature Stores & ML Data

### Scope
Feature engineering, feature stores, training data, experiment tracking.

### Technology Stack — Exhaustive

#### Feature Stores
| Store | Type |
|-------|------|
| **Feast** | Open-source |
| **Tecton** | Managed |
| **Databricks Feature Store** | Databricks |

#### Experiment Tracking
| Tool | Features |
|------|----------|
| **MLflow** | End-to-end MLOps |
| **Weights & Biases** | Experiment tracking |
| **DVC** | Data versioning |

### Quality Gates

```
□ Feature definitions documented
□ Training/serving parity verified
□ Feature freshness monitored
□ Data drift detection
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Model training
- **→ Category 32** (Fine-tuning) — Training data

---

## Category 29: Agentic RAG Systems

### Scope
Retrieval-augmented generation, multi-hop reasoning, document processing.

### Technology Stack — Exhaustive

#### RAG Frameworks
| Framework | Best For |
|-----------|----------|
| **LlamaIndex** | Data framework |
| **LangChain** | Chains, agents |
| **Haystack** | Search pipelines |
| **DSPy** | Programmatic optimization |

#### Document Processing
| Tool | Purpose |
|------|---------|
| **Unstructured** | Document parsing |
| **LlamaParse** | LlamaIndex parsing |
| **Marker** | PDF to markdown |
| **Tesseract** | OCR |

#### Chunking Strategies
| Strategy | Use Case |
|----------|----------|
| **Fixed size** | Simple, predictable |
| **Semantic** | Meaning preservation |
| **Parent-child** | Context preservation |

#### Advanced Retrieval
| Technique | Purpose |
|-----------|---------|
| **Hybrid search** | BM25 + vector |
| **Re-ranking** | Relevance ordering |
| **Multi-hop** | Complex reasoning |
| **RAPTOR** | Tree-structured |

#### Chunking Strategy Selection Matrix

| Document Type | Recommended Strategy | Chunk Size | Overlap |
|---------------|---------------------|------------|---------|
| Technical docs | Semantic | 512-1024 | 50-100 |
| Legal/Financial | Page-level | 1 page | 0 |
| Code files | AST-based | Function | 0 |
| Conversations | Message-based | 1 message | Context |
| Research papers | Section-based | Section | Abstract |

#### Query Type Affects Optimal Size
| Query Type | Optimal Chunk Size | Rationale |
|------------|-------------------|-----------|
| Factoid ("What is X?") | 256-512 tokens | Precise answers |
| Analytical ("Why does X?") | 1024+ tokens | Needs context |
| Comparative ("X vs Y?") | 512-768 tokens | Multiple facts |
| Summarization | 2048+ tokens | Broad coverage |

#### Chunk Validation Pattern
```python
def validate_chunks(chunks):
    issues = []
    for i, chunk in enumerate(chunks):
        tokens = count_tokens(chunk)
        if tokens < 100:
            issues.append(f"Chunk {i}: Too small")
        if tokens > 2000:
            issues.append(f"Chunk {i}: Too large")
    return issues
```

#### Context Management Systems

Beyond memory stores, modern agent frameworks need active context management:

| Pattern | Tool/Approach | Use Case |
|---------|--------------|----------|
| **Repo Maps** | tree-sitter + PageRank | Large codebase navigation |
| **Context Compaction** | /clear, session management | Prevent context degradation |
| **Progressive Disclosure** | Skills architecture | Load knowledge on demand |
| **Structured Handoffs** | plan.md + session artifacts | Cross-session continuity |
| **Context Budgets** | Context % monitoring | Proactive management |

#### Context & MCP Enhancement Tools

| Tool | Type | Purpose |
|------|------|---------|
| **Context7** | MCP Server / Plugin | Real-time up-to-date API and library documentation for all major frameworks |
| **Sequential Thinking** | MCP Server | Chain-of-thought reasoning server for deeper analysis and planning |
| **cc-status-line** | CLI Tool | Context window percentage display — install via `npx cc-status-line@latest` |

#### Repo Map Generation
```bash
# Install aider for repo map generation
pip install aider-chat

# Generate repo map (can be added to claude.md or BRIDGE context)
aider --map-tokens 2048 --show-repo-map > docs/repo-map.txt
```

#### Context Efficiency Rules
1. Never load both NSB and MBF simultaneously (BRIDGE handles routing)
2. Link to files instead of embedding content in claude.md
3. Use skills for specialized knowledge (loaded on demand)
4. Clear context between distinct tasks, not just when stuck
5. Keep plan.md updated so it serves as session state

---

### Quality Gates

```
□ Chunking strategy validated
□ Embedding model benchmarked
□ Retrieval recall measured
□ Re-ranker evaluated
□ Citation accuracy verified
□ Hallucination rate monitored
□ Latency requirements met
```

### Agentic Prompt Hook

```
You are building an Agentic RAG system. Before writing code:

1. DATA PREPARATION
   - Analyze document types
   - Design chunking strategy
   - Plan metadata schema

2. RETRIEVAL DESIGN
   - Select embedding model
   - Implement hybrid search
   - Add re-ranking

3. GENERATION DESIGN
   - Design prompt templates
   - Implement citation
   - Add guardrails

4. EVALUATION
   - Create test dataset
   - Measure retrieval recall
   - Test end-to-end accuracy

5. OUTPUT REQUIREMENTS
   - High retrieval recall
   - Accurate citations
   - Low hallucination rate
   - Acceptable latency
```

### Cross-Category Dependencies
- **→ Category 16** (Vector) — Retrieval
- **→ Category 30** (Agents) — Agent integration
- **→ Category 31** (MCPs) — Tool calling
- **→ Category 11** (GPU) — Inference

---

## Category 30: Autonomous Agents

### Scope
Task agents, workflow agents, multi-agent systems, tool use.

### Technology Stack — Exhaustive

#### Agent Frameworks
| Framework | Best For |
|-----------|----------|
| **LangGraph** | Stateful workflows |
| **CrewAI** | Multi-agent teams |
| **AutoGen** | Microsoft agents |
| **Agency Swarm** | Customizable |
| **Claude Computer Use** | Computer control |

#### Agent Components
| Component | Options |
|-----------|---------|
| **Planning** | ReAct, Plan-and-Execute |
| **Memory** | Conversation, Episodic |
| **Tools** | Code execution, web, APIs |
| **Reflection** | Self-critique |

#### Multi-Agent Patterns
| Pattern | Use Case |
|---------|----------|
| **Supervisor** | Centralized control |
| **Swarm** | Decentralized |
| **Debate** | Reasoning improvement |

### Quality Gates

```
□ Agent loops bounded
□ Error recovery implemented
□ Tool calls validated
□ Human-in-loop capability
□ Costs tracked per run
□ Security boundaries enforced
```

### Agentic Prompt Hook

```
You are building an autonomous agent. Before writing code:

1. DESIGN PHASE
   - Define agent objective
   - Plan tool requirements
   - Design state machine
   - Set autonomy level (→ NS Section 18: Autonomy Dial)

2. SAFETY PHASE
   - Implement loop bounds
   - Add human-in-loop gates
   - Set resource limits
   - Calibrate confidence thresholds (→ NS Section 17)

3. IMPLEMENTATION PHASE
   - Build tool integrations
   - Implement memory (→ NS Section 20: Memory Architecture)
   - Add reflection

4. EVALUATION PHASE
   - Create test scenarios
   - Measure success rate
   - Profile costs

5. OUTPUT REQUIREMENTS
   - Bounded execution
   - Human oversight
   - Reliable tool use
   - Observable runs
   - Handoff capability (→ NS Section 23: Handoff Protocols)

FOR ORCHESTRATION METHODOLOGY: See North Star Blueprint v6.0
  → Part IV (Sections 13-19): AI Orchestration
  → Part V (Sections 20-23): Agent Composition
```

### Cross-Category Dependencies
- **→ Category 29** (RAG) — Knowledge retrieval
- **→ Category 31** (MCPs) — Tool definitions
- **→ Category 44** (Workflows) — Orchestration

---

## Category 31: MCPs & Tool Registries

### Scope
Model Context Protocol, function calling, tool definitions, skill manifests.

### Technology Stack — Exhaustive

#### MCP & Tool Frameworks
| Framework | Provider |
|-----------|----------|
| **Model Context Protocol** | Anthropic |
| **Function Calling** | OpenAI |
| **Tool Use** | Various LLMs |

#### Tool Definition Standards
| Standard | Use |
|----------|-----|
| **OpenAPI** | REST API description |
| **JSON Schema** | Parameter validation |

### Quality Gates

```
□ Tool schemas validated
□ Parameter descriptions clear
□ Error responses defined
□ Audit logging enabled
□ Tool documentation complete
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Tool backends
- **→ Category 29-30** (AI) — Agent integration
- **→ Category 50** (Auth) — Tool authentication

---

## Category 32: Model Fine-Tuning & Training

### Scope
LLM fine-tuning, LoRA adapters, RLHF, domain adaptation.

### Technology Stack — Exhaustive

#### Fine-Tuning Frameworks
| Framework | Best For |
|-----------|----------|
| **Axolotl** | Full-featured |
| **Unsloth** | Fast, memory-efficient |
| **TRL** | HuggingFace official |
| **LLaMA-Factory** | User-friendly |

#### Training Techniques
| Technique | Use Case |
|-----------|----------|
| **Full fine-tuning** | Maximum customization |
| **LoRA** | Efficient adaptation |
| **QLoRA** | Memory-constrained |
| **DPO** | Preference alignment |

#### Evaluation
| Tool | Purpose |
|------|---------|
| **lm-eval-harness** | Benchmark eval |
| **Promptfoo** | Prompt testing |
| **DeepEval** | LLM testing |
| **Ragas** | RAG evaluation |

### Quality Gates

```
□ Training data validated
□ Baseline performance measured
□ Evaluation suite comprehensive
□ Overfitting checked
□ Safety evaluation included
□ Model card created
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Training compute
- **→ Category 28** (Feature Store) — Training data
- **→ Category 33** (Inference) — Deployment

---

## Category 33: Model Serving & Inference

### Scope
LLM inference, model deployment, quantization, batching, caching.

### Technology Stack — Exhaustive

#### Inference Engines
| Engine | Best For |
|--------|----------|
| **vLLM** | High-throughput LLM |
| **TGI** | HuggingFace serving |
| **TensorRT-LLM** | NVIDIA optimized |
| **llama.cpp** | CPU/Metal |
| **Ollama** | Local LLMs |
| **SGLang** | Fast serving |

#### Serving Platforms
| Platform | Type |
|----------|------|
| **Replicate** | Managed models |
| **Modal** | Serverless GPU |
| **Together AI** | Inference API |
| **Fireworks AI** | Fast inference |
| **Groq** | Ultra-fast |

#### Optimization
| Technique | Purpose |
|-----------|---------|
| **Quantization** | Model compression |
| **Continuous batching** | Throughput |
| **Speculative decoding** | Latency |

### Quality Gates

```
□ Latency requirements met
□ Throughput benchmarked
□ Memory usage profiled
□ Auto-scaling tested
□ Health checks implemented
□ Cost per token calculated
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Compute resources
- **→ Category 22** (Caching) — Response cache
- **→ Category 55** (Monitoring) — Inference metrics

---

## Category 34: LLM Routing & Orchestration

### Scope
Model selection, router logic, fallbacks, cost optimization, prompt management.

### Technology Stack — Exhaustive

#### LLM Gateways
| Gateway | Features |
|---------|----------|
| **LiteLLM** | 100+ providers |
| **Portkey** | Gateway + observability |
| **Helicone** | Logging + caching |
| **OpenRouter** | Multi-provider |

#### Prompt Management
| Tool | Features |
|------|----------|
| **Langfuse** | Open-source tracing |
| **LangSmith** | LangChain native |
| **PromptLayer** | Versioning |

### Quality Gates

```
□ Routing logic tested
□ Fallbacks configured
□ Cost tracking enabled
□ Prompt versions managed
□ Observability complete
```

### Cross-Category Dependencies
- **→ Category 29-33** (AI) — Model backends
- **→ Category 22** (Caching) — Response cache
- **→ Category 55** (Monitoring) — LLM metrics

---

## Category 35: AI Safety & Guardrails

### Scope
Content moderation, output validation, jailbreak prevention, PII detection.

### Technology Stack — Exhaustive

#### Guardrail Frameworks
| Framework | Features |
|-----------|----------|
| **Guardrails AI** | Output validation |
| **NeMo Guardrails** | NVIDIA framework |
| **LLM Guard** | Input/output safety |

#### Content Moderation
| Service | Provider |
|---------|----------|
| **OpenAI Moderation** | OpenAI |
| **Perspective API** | Google |
| **Azure Content Safety** | Microsoft |

#### PII Detection
| Tool | Type |
|------|------|
| **Presidio** | Microsoft OSS |
| **AWS Comprehend PII** | Managed |

#### Validation Tools
| Tool | Purpose |
|------|---------|
| **Pydantic** | Schema validation |
| **Instructor** | Structured outputs |
| **Outlines** | Constrained generation |

#### NeMo Guardrails Deep Dive

NVIDIA's NeMo Guardrails: **89% accuracy on prompt injection** (vs 67% Llama Guard).

**Rail Types:**
| Rail | Purpose | When Triggered |
|------|---------|----------------|
| **Input Rails** | Filter user input | Before LLM call |
| **Dialog Rails** | Control conversation | During interaction |
| **Output Rails** | Validate response | After LLM call |
| **Retrieval Rails** | Filter RAG context | Before injection |
| **Execution Rails** | Control tool calls | Before action |

#### Destructive Command Interception

Execution rails must include destructive-command interception so agents do not
autonomously execute catastrophic infrastructure or database operations.

| Severity | Examples | Agent Behavior |
|----------|----------|----------------|
| **CRITICAL** | `terraform destroy`, `DROP DATABASE`, `rm -rf /` | Never execute — present to human |
| **HIGH** | `TRUNCATE`, force-push to protected branch, force schema push | Explicit confirmation + delay |
| **MEDIUM** | `DROP TABLE`, destructive migration | Show blast radius + recovery path |
| **LOW** | Scoped delete with clear predicate | Standard approval flow |

**Colang 2.0 Example:**
```colang
define user express harmful intent
  "how do I hack"
  "write malware"

define flow handle harmful
  user express harmful intent
  bot refuse with explanation
```

Example execution rail:
```colang
define flow block destructive commands
  user requests infrastructure destruction
  bot refuse with command presentation
  bot "I cannot execute this command directly. Here is the command for manual human execution."
```

#### Guardrails AI Pattern
```python
from guardrails import Guard
from guardrails.hub import ToxicLanguage, PIIDetection

guard = Guard().use_many(
    ToxicLanguage(threshold=0.5, on_fail="fix"),
    PIIDetection(on_fail="anonymize"),
)
```


---

### Quality Gates

```
□ Input validation implemented
□ Output validation configured
□ PII detection enabled
□ Jailbreak tests passed
□ Bias evaluation completed
□ Audit logging enabled
□ Incident response planned
```

### Cross-Category Dependencies
- **→ Category 29-34** (AI) — AI systems to protect
- **→ Category 52** (Security) — Security integration
- **→ Category 56** (Compliance) — Regulatory compliance

---

## Category 57: Agent Orchestration Frameworks

### Scope
Multi-agent frameworks, visual agent builders, enterprise orchestration platforms,
swarm architectures, multi-model agent coordination.

### Technology Stack — Exhaustive

#### Enterprise Platforms
| Framework | Key Differentiator | Best For |
|-----------|-------------------|----------|
| **CrewAI AMP** | Visual editor + API, enterprise-grade, human-in-the-loop training | Enterprise teams, visual orchestration |
| **Google ADK** | Open-source, polyglot (Python/TS), deploys to Vertex AI Agent Engine | Google Cloud stacks, polyglot teams |
| **OpenAI Agents SDK** | Codex-1 (o3) reasoning, desktop command center for parallel agents | OpenAI-native stacks |
| **Strands Agent (AWS)** | Apache-licensed, swarm architectures, Bedrock integration | AWS-native, cloud-centric |
| **Agency Swarm** | Scalable MAS, simulation/visualization tools | Complex hierarchical agent systems |
| **LangGraph** | Graph-based state machines, stateful workflows | Complex branching logic |
| **AutoGen (Microsoft)** | Conversational agents, group chat, code execution | Research, prototyping |

#### Lightweight / Open Source
| Framework | Stars | Key Differentiator |
|-----------|-------|-------------------|
| **OpenCode** | 95K+ | Open-source Claude Code alternative, multi-LLM |
| **Cline** | 5M installs | BYOK, 80.8% SWE-bench with Opus 4.6 |
| **Aider** | High | Terminal-based, repo maps, 88% SWE-bench |
| **Agency Swarm** | Growing | Scalable, visualization |

#### Claude Code Native Orchestration
| Pattern | Implementation |
|---------|---------------|
| **Multi-Claude + Worktrees** | Built-in (`claude --worktree`) |
| **Agent Teams** | Built-in (specialized role coordination) |
| **Parallel Sub-Agents** | Built-in task sub-agent |
| **RALPH Loop** | Ralph Loop plugin from Anthropic |

### Selection Matrix
| Need | Recommended |
|------|-------------|
| Claude Code power user, multi-feature | Multi-Claude + Worktrees (built-in) |
| Enterprise, visual management | CrewAI AMP |
| Google Cloud native | Google ADK |
| AWS native | Strands Agent |
| Open-source maximum flexibility | OpenCode or Aider |
| Complex stateful workflows | LangGraph |

### Quality Gates
```
□ Agent isolation strategy defined (worktrees, containers, or sandboxes)
□ Success criteria defined per agent before launch
□ Human review points specified in orchestration plan
□ Failure modes documented (what happens if agent gets stuck)
□ Cost estimation done (parallel agents multiply token usage)
□ Merge/integration strategy defined for parallel work
```

### Benchmarks (March 2026)
| System | SWE-bench Verified |
|--------|-------------------|
| GPT-5 + Aider | 88% |
| Cline + Claude Opus 4.6 | 80.8% |
| Claude Code (native) | ~80% |
| Devin | 67% PR merge rate |

### Cross-Category Dependencies
- → Category 31 (Agent Frameworks) — foundational patterns
- → Category 44 (Workflow Orchestration) — pipeline integration
- → Category 58 (AI-Native IDEs) — development environment
- → NS Part IV (AI Orchestration) — methodology

---

## Category 59: Prompt Orchestration & Evaluation

### Scope
Prompt versioning, A/B testing for prompts, LLM evaluation pipelines,
production prompt management, regression testing for AI behavior.

### Technology Stack — Exhaustive

#### Prompt Management Platforms
| Tool | Key Differentiator | Best For |
|------|-------------------|----------|
| **Vellum AI** | Prompt versioning + evaluation + controlled deployment | Production LLM deployments |
| **PromptLayer** | Observability, A/B testing, cost tracking | Teams iterating on prompts |
| **LangSmith** | LangChain-native, tracing, evaluation datasets | LangChain stacks |
| **Weave (W&B)** | ML-native, experiment tracking for prompts | ML teams |
| **Helicone** | Lightweight observability, caching, cost management | Cost-conscious teams |

#### Evaluation Frameworks
| Tool | Purpose |
|------|---------|
| **RAGAS** | RAG pipeline evaluation |
| **DeepEval** | Unit tests for LLM outputs |
| **Promptfoo** | CLI-based prompt testing, red-teaming |
| **Inspect (UK AISI)** | Safety-focused evaluation |

### Why This Category Matters (March 2026)
  Prompt regressions are the silent killer of production AI apps.
  A model update, a prompt change, or a new edge case can silently
  degrade quality without anyone noticing for days.
  
  Treat prompts as code. Version them. Test them. Deploy them carefully.

### Production Prompt Management Pattern
```
DEV (prompt draft)
  → STAGING (evaluation against test dataset: 50-200 examples)
  → CANARY (5% of production traffic)
  → PRODUCTION (full rollout with monitoring)
```

### Quality Gates
```
□ Prompts versioned in git or dedicated prompt management system
□ Evaluation dataset created (min 50 representative examples)
□ Automated regression test runs on every prompt change
□ Cost per prompt tracked and budgeted
□ Latency p95 monitored
□ Rollback procedure documented
```

### Cross-Category Dependencies
- → Category 33 (LLM Providers) — models being prompted
- → Category 35 (AI Safety) — safety evaluation
- → Category 47 (Testing) — evaluation methodology
- → Category 55 (Monitoring) — production observability

---

## Category 62: Memory Infrastructure

> *Added in v2.1 (ENH-041)*

### Scope
Agent memory systems, cross-session persistence frameworks, memory managers,
long-term knowledge stores for AI agents, semantic caching.

### Technology Stack — Exhaustive

#### Production Memory Manager Frameworks
| Framework | Key Differentiator | Best For |
|-----------|-------------------|----------|
| **Mem0** | Production-ready, all memory types, Python/TS SDK, hosted or self-hosted | Teams needing production memory fast |
| **Zep** | Long-term memory for LLMs, temporal awareness, user preference learning | Conversational agents, user modeling |
| **MemGPT / Letta** | Self-editing memory, agent controls its own memory, tiered storage | Autonomous long-running agents |
| **Cognee** | Knowledge graph memory, decision trail, team memory sharing | Complex reasoning, multi-agent teams |
| **mem.ai** | Personal AI memory layer, cross-app, long-form notes | Personal assistant agents |

#### Minimal / Build-Your-Own
| Approach | Complexity | Best For |
|----------|-----------|----------|
| **SQLite + pgvector** | Low | Learning, POC, small projects |
| **Supabase + pgvector** | Low | Managed, production-capable |
| **Chroma** | Low | In-process vector store, rapid prototyping |
| **Custom MemoryManager class** | Medium | Full control, specific requirements |

#### Semantic Caching
| Tool | Purpose |
|------|---------|
| **GPTCache** | Semantic cache for LLM calls — cache similar queries |
| **Redis + embedding index** | Production semantic cache |

### The Three-Pillar Selection Guide

Select based on your position in the three-pillar architecture (NS Blueprint, Memory Architecture section):

MEMORY CORE selection:
  Learning / POC:         SQLite + pgvector extension
  Professional team:      Supabase or Neon (managed Postgres)
  Production / scale:     Dedicated solution matching your scale (Qdrant, Weaviate, or Oracle)

MEMORY MANAGER selection:
  "I want to understand it first":    Build minimal MemoryManager (~50-100 lines Python)
  "I need it to work now":            Mem0 (most comprehensive SDK)
  "My agents are conversational":     Zep (temporal + conversational focus)
  "My agents are autonomous/long-running": MemGPT / Letta (self-managing memory)
  "I need team/multi-agent memory":   Cognee (knowledge graph approach)

### Memory Unit Schema Reference
```json
{
  "type": "workflow | conversation | knowledge | entity | association | tool",
  "content": "string",
  "embedding": "vector[1536]",
  "metadata": {
    "created_at": "ISO8601",
    "source": "string",
    "relevance_score": "float",
    "importance_score": "float",
    "recency_decay": "float"
  },
  "weight": "α·relevance + β·importance + γ·recency"
}
```

### Quality Gates
```text
□ Memory Core selected based on tier and data type requirements
□ Memory Manager chosen (or custom built and understood)
□ All 5 memory types mapped to your use case
□ Compaction strategy implemented (summarization or externalization)
□ Memory weighting algorithm calibrated (α, β, γ values tuned)
□ Forgetting threshold set (recommend 0.1)
□ Cross-session continuity tested (session ends → new session recovers state)
□ Privacy/security: PII in memory? Data handling policy documented
□ Cost model: memory retrieval calls counted in token budget
```

### NS Framework Integration Points
→ Fix Ledger becomes Workflow Memory (procedural, captures failure+resolution)
→ plan.md + CHANGELOG = Episodic Memory (what happened)
→ architecture.md + MBF = Semantic Memory (what things are)
→ Skills + slash commands = Procedural Memory (how to do things)
→ Repository maps = Associative Memory (what connects to what)

### Cross-Category Dependencies
- → Category 16 (Vector Databases) — storage layer for semantic memory
- → Category 29 (Agent Memory) — existing memory patterns
- → Category 31 (Agent Frameworks) — harness layer above memory
- → Category 35 (AI Safety) — memory access control and privacy
- → NS Part XII (Memory Architecture) — full methodology

---

---


# TIER 5: CONTENT GENERATION
## *Creating Media and Documents at Scale*

---

## Category 36: Image Generation

### Scope
AI image generation, thumbnails, product shots, social graphics.

### Technology Stack — Exhaustive

#### Image Generation Models
| Model | Provider | Best For |
|-------|----------|----------|
| **DALL-E 3** | OpenAI | Quality, safety |
| **Midjourney** | Midjourney | Artistic |
| **Stable Diffusion XL** | Stability AI | Open-source |
| **Flux** | Black Forest Labs | Quality, speed |
| **Ideogram** | Ideogram | Text in images |

#### Generation Platforms
| Platform | Features |
|----------|----------|
| **Replicate** | Model hosting |
| **Modal** | Custom pipelines |
| **Fal.ai** | Fast inference |
| **ComfyUI** | Node-based workflow |

#### Image Processing
| Tool | Purpose |
|------|---------|
| **Sharp** | Node.js processing |
| **Cloudinary** | CDN + processing |
| **imgix** | Real-time transforms |

### Quality Gates

```
□ Prompt engineering optimized
□ Consistency maintained
□ Resolution appropriate
□ CDN delivery configured
□ Content moderation active
□ Cost per image tracked
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Generation compute
- **→ Category 19** (Storage) — Asset storage
- **→ Category 35** (Safety) — Content moderation

---

## Category 37: Audio Generation

### Scope
Voice synthesis, text-to-speech, music generation, voice cloning.

### Technology Stack — Exhaustive

#### Text-to-Speech
| Service | Best For |
|---------|----------|
| **ElevenLabs** | Voice cloning, quality |
| **OpenAI TTS** | Simple, integrated |
| **Resemble AI** | Voice cloning |
| **Bark** | Open-source |

#### Music Generation
| Service | Features |
|---------|----------|
| **Suno** | Full songs |
| **Udio** | Music creation |
| **MusicGen** | Meta research |

#### Real-Time Voice
| Service | Use Case |
|---------|----------|
| **Vapi** | Voice AI agents |
| **Retell AI** | Voice agents |
| **Vocode** | Voice apps |
| **LiveKit** | Real-time audio |

### Quality Gates

```
□ Audio quality verified
□ Pronunciation accuracy
□ Latency acceptable
□ Rights/licensing clear
□ Voice consent obtained
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Generation compute
- **→ Category 19** (Storage) — Audio storage
- **→ Category 47** (Voice) — Voice interfaces

---

## Category 38: Video Generation & Processing

### Scope
AI video generation, transcoding, compositing, streaming.

### Technology Stack — Exhaustive

#### Video Generation
| Service | Features |
|---------|----------|
| **Runway** | Gen-3, motion |
| **Pika** | Text-to-video |
| **HeyGen** | Avatar videos |
| **Synthesia** | Presenter videos |

#### Video Processing
| Tool | Purpose |
|------|---------|
| **FFmpeg** | Universal processing |
| **Remotion** | React videos |
| **Shotstack** | API editing |

#### Streaming & Delivery
| Service | Features |
|---------|----------|
| **Mux** | Streaming platform |
| **Cloudflare Stream** | Edge delivery |
| **api.video** | Full platform |

### Quality Gates

```
□ Video quality appropriate
□ Encoding optimized
□ Adaptive bitrate configured
□ Subtitles synchronized
□ CDN delivery configured
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Processing compute
- **→ Category 19** (Storage) — Video storage
- **→ Category 9** (Edge) — CDN delivery

---

## Category 39: Document Generation

### Scope
PDF generation, reports, contracts, invoices, slides.

### Technology Stack — Exhaustive

#### PDF Generation
| Tool | Best For |
|------|----------|
| **Puppeteer** | HTML to PDF |
| **Playwright** | HTML to PDF |
| **WeasyPrint** | CSS to PDF |
| **pdf-lib** | Manipulation |
| **Gotenberg** | Docker service |

#### Slide Generation
| Tool | Features |
|------|----------|
| **Slidev** | Markdown slides |
| **Reveal.js** | HTML slides |
| **python-pptx** | PowerPoint |
| **Gamma** | AI slides |

#### Contract & Legal
| Tool | Purpose |
|------|---------|
| **DocuSign** | E-signatures |
| **PandaDoc** | Document automation |

### Quality Gates

```
□ Template validation
□ PDF/A compliance (if required)
□ Accessibility checked
□ Font embedding correct
□ File size optimized
```

### Cross-Category Dependencies
- **→ Category 19** (Storage) — Document storage
- **→ Category 44** (Workflows) — Generation pipelines

---

## Category 40: Code Generation

### Scope
AI-assisted coding, code completion, code transformation.

### Technology Stack — Exhaustive

#### AI Coding Assistants
| Tool | Features |
|------|----------|
| **GitHub Copilot** | Inline completion |
| **Cursor** | AI-native IDE |
| **Claude Code** | Agentic coding |
| **Aider** | CLI assistant |
| **Codeium** | Free completion |

#### Code Transformation
| Tool | Purpose |
|------|---------|
| **jscodeshift** | JS codemods |
| **Semgrep** | Pattern matching |
| **ast-grep** | Structural search |

### Quality Gates

```
□ Code quality validated
□ Tests generated/passing
□ Security scan passed
□ Style guide followed
```

### Cross-Category Dependencies
- **→ Category 29** (RAG) — Codebase retrieval
- **→ Category 46** (Testing) — Generated tests

---

## Category 41: Data & Content Generation

### Scope
Synthetic data generation, content creation, dataset augmentation.

### Technology Stack — Exhaustive

#### Synthetic Data
| Tool | Purpose |
|------|---------|
| **Faker** | Fake data |
| **Gretel** | Privacy-preserving |
| **SDV** | Statistical generation |

#### Content Generation
| Tool | Features |
|------|----------|
| **Jasper** | Marketing content |
| **Copy.ai** | Copywriting |

### Quality Gates

```
□ Data distribution validated
□ Privacy preserved
□ Bias evaluated
□ Format consistent
```

### Cross-Category Dependencies
- **→ Category 28** (Feature Store) — Training data
- **→ Category 46** (Testing) — Test data

---

## Category 42: Translation & Localization

### Scope
Machine translation, i18n, l10n, content adaptation.

### Technology Stack — Exhaustive

#### Translation Services
| Service | Features |
|---------|----------|
| **DeepL** | High quality |
| **Google Translate** | Many languages |
| **OpenAI/Claude** | Context-aware |

#### i18n Frameworks
| Framework | Language |
|-----------|----------|
| **react-i18next** | React |
| **next-intl** | Next.js |
| **FormatJS** | JavaScript |

#### Localization Platforms
| Platform | Features |
|----------|----------|
| **Crowdin** | Translation management |
| **Lokalise** | Translation platform |
| **Weblate** | Open-source |

### Quality Gates

```
□ All strings externalized
□ Context provided for translators
□ Pluralization handled
□ RTL layout tested
□ Cultural adaptation reviewed
```

### Cross-Category Dependencies
- **→ Category 1-4** (Apps/Websites) — UI localization
- **→ Category 56** (Compliance) — Regional compliance

---

# TIER 6: AUTOMATION & DEVOPS
## *Building, Deploying, and Orchestrating*

---

## Category 43: CI/CD Pipelines

### Scope
Continuous integration, continuous deployment, build automation, release management.

### Technology Stack — Exhaustive

#### CI/CD Platforms
| Platform | Best For |
|----------|----------|
| **GitHub Actions** | GitHub repos |
| **GitLab CI** | GitLab repos |
| **CircleCI** | Parallel builds |
| **Buildkite** | Scale |

#### Specialized Tools
| Tool | Purpose |
|------|---------|
| **Nx Cloud** | Monorepo CI |
| **Turborepo** | Monorepo builds |
| **Depot** | Fast Docker builds |
| **Dagger** | Programmable CI |

#### Release Management
| Tool | Purpose |
|------|---------|
| **Semantic Release** | Automated versioning |
| **Changesets** | Monorepo versioning |
| **GoReleaser** | Go releases |

### Quality Gates

```
□ All tests passing
□ Code coverage threshold met
□ Linting passed
□ Security scan clean
□ Build reproducible
□ Dependencies audited
□ Rollback tested
□ Notifications configured
```

### Cross-Category Dependencies
- **→ Category 12-13** (Infrastructure) — Deployment targets
- **→ Category 46** (Testing) — Test execution
- **→ Category 53** (Secrets) — Credential management

---

## Category 44: Workflow Orchestration

### Scope
DAG orchestration, multi-step pipelines, human-in-loop workflows.

### Technology Stack — Exhaustive

#### Workflow Engines
| Engine | Best For |
|--------|----------|
| **Temporal** | Durable execution |
| **Apache Airflow** | Data pipelines |
| **Dagster** | Data orchestration |
| **Prefect** | Modern orchestration |
| **Inngest** | Serverless workflows |
| **Trigger.dev** | Background jobs |
| **n8n** | Visual automation |

#### Automation Platforms
| Platform | Focus |
|----------|-------|
| **Zapier** | No-code automation |
| **Make** | Visual automation |
| **Pipedream** | Developer-first |

#### Data Pipeline Orchestration (with HITL Patterns)
| Tool | Key Differentiator | HITL Support |
|------|-------------------|-------------|
| **Prefect** | Python-native, intelligent LLM retries, HITL workflows | ✓ Native |
| **Dagster** | Asset-based, observable, type-safe pipelines | ✓ Via sensors |
| **Airflow** | Mature, massive ecosystem, XML-heavy | Limited |
| **Temporal** | Durable execution, language-agnostic | ✓ Activities |

#### Prefect HITL Pattern (LLM Validation)
```python
from prefect import flow, task
from prefect.input import RunInput

@task
def process_with_llm(data: dict) -> dict:
    # LLM processing step
    result = claude_api.process(data)
    confidence = result.confidence_score
    
    if confidence < 0.85:
        raise Exception("Low confidence — needs human review")
    
    return result

@flow
def data_pipeline_with_hitl(data: list):
    results = []
    for item in data:
        try:
            result = process_with_llm(item)
            results.append(result)
        except Exception as e:
            # HITL gate: pause and wait for human input
            human_input = RunInput.receive(
                prompt=f"Low confidence on: {item}\nProvide correction or approve:",
                timeout=3600  # 1 hour timeout
            )
            results.append(human_input.value)
    
    return results
```

#### NS Framework Recommendation
For AI pipelines with validation requirements:
→ Prefect for Python-native AI teams (best LLM integration)
→ Dagster for data-intensive, asset-tracked pipelines
→ Temporal for long-running durable workflows (days/weeks)

### Quality Gates

```
□ Idempotency implemented
□ Retry logic configured
□ Timeouts set
□ Error handling comprehensive
□ State persistence reliable
□ Monitoring enabled
□ Audit logging complete
```

### Cross-Category Dependencies
- **→ Category 10** (Serverless) — Task execution
- **→ Category 23** (Queues) — Event triggers
- **→ Category 55** (Monitoring) — Workflow monitoring

---
## Category 44A: Kanban & Visual Task Management

### Scope
Visual task management as the collaboration contract between humans and AI agents.

### The Three-Layer Architecture

```
┌─────────────────────────────────────────────────┐
│     BUSINESS LAYER (Kanban/PM)                  │
│     Linear, Notion, Jira, GitHub Projects       │
├─────────────────────────────────────────────────┤
│     ORCHESTRATION LAYER (Workflow)              │
│     Temporal, Inngest, Trigger.dev              │
├─────────────────────────────────────────────────┤
│     AGENT EXECUTION LAYER                       │
│     Claude, GPT-4, Custom Agents                │
└─────────────────────────────────────────────────┘
```

### Technology Stack

#### Kanban Platforms with AI Integration
| Tool | MCP Support | Best For |
|------|-------------|----------|
| **Linear** | ✅ Official | Dev teams, AI-native |
| **Notion** | ✅ Official | Flexible databases |
| **GitHub Projects** | Via Actions | Code-centric |
| **Jira** | Atlassian MCP | Enterprise |

#### HITL Workflow Engines
| Engine | HITL Feature |
|--------|--------------|
| **Trigger.dev** | Waitpoint Tokens |
| **LangGraph** | interrupt() primitive |
| **Inngest** | waitForEvent() |

### Core Primitives

```typescript
interface KanbanTaskContract {
  id: string;
  title: string;
  assignee: "human" | "agent" | string;
  status: "todo" | "in_progress" | "review" | "done";
  confidence?: number;
}

interface AgentComment {
  type: "progress" | "question" | "approval_request";
  content: string;
  confidence: number;
}
```

### Confidence-Based Routing

| Confidence | Action | Kanban Update |
|------------|--------|---------------|
| ≥ 0.85 | Auto-execute | Move to "Done" |
| 0.65-0.84 | Execute + review | Add "Needs Review" |
| 0.40-0.64 | Pause for approval | Move to "Blocked" |
| < 0.40 | Escalate to human | Assign to human |

### Quality Gates

```
□ Kanban board connected via MCP/API
□ Confidence thresholds configured
□ Agent comment patterns documented
□ Approval timeouts with fallbacks
□ Escalation paths defined
```

### Cross-Category Dependencies
- **→ Category 44** (Workflow) — Orchestration layer
- **→ Category 30** (Agents) — Agent execution
- **→ Category 55** (Monitoring) — Status tracking

---

## Category 44B: PromptOps

### Scope
Prompt versioning, A/B testing, optimization, and deployment management.

### Technology Stack

#### Prompt Management Platforms
| Tool | Versioning | A/B Test | Optimization | Self-Host |
|------|------------|----------|--------------|-----------|
| **Langfuse** | ✅ | ✅ | Manual | ✅ |
| **PromptLayer** | ✅ | ✅ | Manual | ❌ |
| **Agenta** | ✅ | ✅ | ✅ | ✅ |
| **DSPy** | Code-based | Via evals | ✅ Auto | ✅ |

### Prompt Versioning Pattern

```python
from langfuse import Langfuse

langfuse = Langfuse()

# Fetch versioned prompt
prompt = langfuse.get_prompt(
    name="summarization-v2",
    version=3,  # or label="production"
)
```

### Rollback Pattern

```python
# Instant rollback via label change
langfuse.update_prompt_label(
    name="summarization-v2",
    from_version=4,  # Problematic
    to_version=3,    # Known-good
    label="production"
)
```

### Quality Gates

```
□ Prompt versioning configured
□ Production/staging labels defined
□ Rollback procedure documented
□ A/B testing framework ready
□ Change approval process defined
```

### Cross-Category Dependencies
- **→ Category 29-34** (AI) — LLM applications
- **→ Category 43** (CI/CD) — Deployment
- **→ Category 55** (Monitoring) — Performance tracking

---
## Category 45: Browser & Web Automation

### Scope
Web scraping, browser automation, RPA, testing automation.

### Technology Stack — Exhaustive

#### Browser Automation
| Tool | Best For |
|------|----------|
| **Playwright** | Modern, fast |
| **Puppeteer** | Chrome/Chromium |
| **Selenium** | Broad support |

#### Headless Browsers
| Service | Features |
|---------|----------|
| **Browserbase** | Cloud browsers |
| **Browserless** | Managed Puppeteer |
| **Apify** | Scraping platform |
| **Steel** | Cloud browser API |

#### AI-Powered Automation
| Tool | Features |
|------|----------|
| **Browser Use** | LLM browser control |
| **Claude Computer Use** | Computer control |

#### Data Extraction
| Tool | Purpose |
|------|---------|
| **Cheerio** | HTML parsing |
| **Firecrawl** | Web scraping API |
| **Crawlee** | Scraping toolkit |

### Quality Gates

```
□ Rate limiting implemented
□ Robots.txt respected
□ Error handling robust
□ Session management
□ Legal compliance verified
```

### Cross-Category Dependencies
- **→ Category 44** (Workflows) — Orchestration
- **→ Category 46** (Testing) — E2E testing
- **→ Category 30** (Agents) — AI automation

---

## Category 46: Testing & Quality Assurance

### Scope
Unit testing, integration testing, E2E testing, performance testing, security testing.

### Technology Stack — Exhaustive

#### Unit Testing
| Framework | Language |
|-----------|----------|
| **Vitest** | Vite ecosystem |
| **Jest** | JavaScript |
| **pytest** | Python |

#### E2E Testing
| Tool | Best For |
|------|----------|
| **Playwright** | Cross-browser |
| **Cypress** | Developer experience |
| **Detox** | React Native |
| **Maestro** | Mobile |

#### Performance Testing
| Tool | Type |
|------|------|
| **k6** | Load testing |
| **Locust** | Python load testing |
| **Artillery** | Load testing |

#### Security Testing
| Tool | Focus |
|------|-------|
| **OWASP ZAP** | Web security |
| **Snyk** | Dependencies |
| **Trivy** | Container security |
| **Semgrep** | Code patterns |

#### Visual Testing
| Tool | Features |
|------|----------|
| **Percy** | Visual regression |
| **Chromatic** | Storybook testing |

#### AI/LLM Evaluation Testing
| Framework | Best For | Key Feature |
|-----------|----------|-------------|
| **DeepEval** | LLM apps | 14+ metrics, CI/CD native |
| **RAGAS** | RAG systems | Faithfulness, relevancy |
| **Evidently** | ML monitoring | Drift detection |
| **Promptfoo** | Prompt testing | Red-teaming |

#### LLM Evaluation Metrics
| Metric | Range | Good Threshold |
|--------|-------|----------------|
| Answer Relevancy | 0-1 | ≥ 0.8 |
| Faithfulness | 0-1 | ≥ 0.9 |
| Hallucination Rate | 0-1 | ≤ 0.05 |
| Toxicity Score | 0-1 | ≤ 0.01 |

#### CI/CD Evaluation Gate
```yaml
# .github/workflows/eval.yml
- name: Run DeepEval
  run: |
    pip install deepeval
    deepeval test run tests/eval/
```
```

---

### Quality Gates

```
□ Unit test coverage > 80%
□ Integration tests passing
□ E2E tests passing
□ Performance benchmarks met
□ Security scan clean
□ Accessibility audit passed
□ Visual regression checked
□ Cross-browser tested
```

### Cross-Category Dependencies
- **→ Category 43** (CI/CD) — Test execution
- **→ Category 52** (Security) — Security testing
- **→ NS Part IX** (Sections 42-45) — Testing philosophy, coverage strategies, patterns

---

## Category 47: Conversational & Voice Interfaces

### Scope
Chatbots, voice assistants, conversational AI, multimodal interfaces.

### Technology Stack — Exhaustive

#### Chatbot Frameworks
| Framework | Best For |
|-----------|----------|
| **Vercel AI SDK** | React/Next.js |
| **LangChain** | Complex chains |
| **Botpress** | Visual builder |

#### Voice Assistants
| Service | Platform |
|---------|----------|
| **Vapi** | Voice AI agents |
| **Retell AI** | Voice agents |
| **OpenAI Realtime API** | Voice conversation |

#### Real-Time Communication
| Service | Features |
|---------|----------|
| **LiveKit** | WebRTC infrastructure |
| **Daily** | Video/voice API |
| **Twilio** | Phone/SMS/video |

### Quality Gates

```
□ Conversation design documented
□ Intent recognition accurate
□ Fallback handling graceful
□ Latency acceptable
□ Multi-turn context maintained
```

### Cross-Category Dependencies
- **→ Category 29-34** (AI) — Language models
- **→ Category 37** (Audio) — Voice generation
- **→ Category 24** (Real-time) — WebSocket/WebRTC

---

## Category 48: Documentation Systems

### Scope
Technical documentation, API documentation, knowledge bases, wikis.

### Technology Stack — Exhaustive

#### Documentation Frameworks
| Framework | Best For |
|-----------|----------|
| **Docusaurus** | React docs |
| **VitePress** | Vue docs |
| **Starlight** | Astro docs |
| **Mintlify** | Beautiful API docs |
| **ReadMe** | API documentation |

#### API Documentation
| Tool | Features |
|------|----------|
| **Swagger UI** | OpenAPI viewer |
| **Scalar** | Modern API docs |

#### Knowledge Management
| Platform | Type |
|----------|------|
| **Notion** | All-in-one |
| **Confluence** | Enterprise wiki |
| **Outline** | Open-source |

### Quality Gates

```
□ Documentation complete
□ Code examples tested
□ API reference accurate
□ Search working
□ Versioning implemented
```

### Cross-Category Dependencies
- **→ Category 4** (Websites) — Documentation sites
- **→ Category 8** (APIs) — API reference
- **→ Category 43** (CI/CD) — Doc generation

---

## Category 49: Dashboards & Internal Tools

### Scope
Admin panels, analytics dashboards, internal tools, CRUD builders.

### Technology Stack — Exhaustive

#### Low-Code Builders
| Platform | Best For |
|----------|----------|
| **Retool** | Internal tools |
| **Appsmith** | Open-source |
| **Budibase** | Open-source |

#### Dashboard Libraries
| Library | Framework |
|---------|-----------|
| **Tremor** | React dashboards |
| **Recharts** | React charts |
| **D3.js** | Custom visualizations |

#### Admin Frameworks
| Framework | Stack |
|-----------|-------|
| **AdminJS** | Node.js |
| **React Admin** | React |
| **Refine** | React |

#### Monitoring Dashboards
| Tool | Focus |
|------|-------|
| **Grafana** | Observability |
| **Metabase** | BI/Analytics |

### Quality Gates

```
□ Data accuracy verified
□ Performance acceptable
□ Access controls implemented
□ Audit logging enabled
□ Mobile responsive
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Data sources
- **→ Category 15-17** (Databases) — Data layer
- **→ Category 50** (Auth) — Access control

---


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

## Category 61: Enterprise Agent Governance

### Scope
Agent registries, guardrail systems, lifecycle management for AI agents,
audit trails for agent actions, enterprise oversight and control.

### Technology Stack

#### Enterprise Governance Platforms
| Tool | Key Differentiator | Best For |
|------|-------------------|----------|
| **ServiceNow AI Control Tower** | Governance for enterprise agents, workflow integration | ServiceNow shops |
| **Boomi AgentStudio** | Agent registry, guardrails, MCP support, lifecycle management | Boomi integration platform users |
| **LogicMonitor Edwin** | Enterprise monitoring with agent integration | Infrastructure-heavy enterprises |
| **Anthropic's Claude Trust Layer** | Built-in for Claude Code enterprise, constitutional AI | Claude-native stacks |

#### Governance Primitives
| Primitive | Purpose | Implementation |
|-----------|---------|---------------|
| Agent Registry | Catalog of all deployed agents | Boomi AgentStudio / custom |
| Guardrails | Pre/post filters on agent actions | Built-in hooks + LLM guard |
| Audit Trails | Complete log of agent actions | PostBash hooks → SIEM |
| Human Escalation | When agents must stop and ask | Confidence calibration gates |
| Cost Controls | Budget limits per agent/project | API quota management |
| Rollback Protocol | Undo agent changes | Git checkpoints + permissions |

### NS Framework Governance Model

For NS Framework projects, governance is built via:

1. PERMISSIONS (see ENH-003)
   Pre-configured, committed to git, reviewed by team

2. HOOKS AUDIT TRAIL
   ```bash
   # .claude/hooks/post-bash.sh
   echo "[$(date)] $(whoami) executed: $COMMAND" >> .claude/audit.log
   ```

3. HUMAN GATES (confidence calibration)
   Built into NS Foundation — agent stops and asks at specified uncertainty thresholds

4. CHECKPOINT PROTOCOL
   Every prompt creates a checkpoint. Use /rewind for instant rollback.
   For production: every agent action creates a git commit (atomic rollback).

5. PR-GATED DEPLOYMENT
   No agent work reaches production without human PR review.
   This is the enterprise-grade NS standard regardless of agent autonomy level.

### Quality Gates
```text
□ Agent registry exists (even if just a README listing deployed agents)
□ All agent permissions documented and committed to version control
□ Audit log configured for all bash commands
□ Human escalation paths defined for each agent type
□ Cost monitoring alerts configured
□ Rollback procedure tested and documented
□ Compliance review: does agent have access to PII? If yes, data handling policy documented
```

### Cross-Category Dependencies
- → Category 52 (Security) — access control and audit
- → Category 56 (Compliance) — regulatory requirements
- → Category 55 (Monitoring) — agent observability
- → NS Part X (Security) — security-first development

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
## *v2.0 Patch — Critical Framework Extensions*

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

## All Categories Including v2.0 Additions

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
| 31B | **Skills & Capability Packaging** | **AI Systems** | **v2.0 NEW** |
| 31C | **Agentic Reasoning Loops** | **AI Systems** | **v2.0 NEW** |
| 31D | **Prompt Engineering Patterns** | **AI Systems** | **v2.0 NEW** |
| 31E | **Memory Architecture** | **AI Systems** | **v2.0 NEW** |
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
| 57 | Agent Orchestration Frameworks | AI Systems | v2.1 NEW |
| 58 | AI-Native IDEs | AI Systems | v2.1 NEW |
| 59 | Prompt Orchestration & Eval | AI Systems | v2.1 NEW |
| 60 | Life OS Agents | AI Systems | v2.1 NEW |
| 61 | Enterprise Agent Governance | Foundation | v2.1 NEW |
| 62 | Memory Infrastructure | AI Systems | v2.1 NEW |

**Total: 56 base categories + 6 v2.1 additions = 62 categories**

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
| 2.0 | January 2026 | Added: Skills (31B), Reasoning Loops (31C), Prompt Patterns (31D), Memory Architecture (31E) |
| **2.1** | **March 2026** | **Added: Cat 57-61, OpenClaw Integration, RPIT Loop Sync, Enhanced Skill Discovery** |

---

## Category 60: Life OS Agents

### Scope
Always-on personal AI agents, messaging-app-connected automation,
autonomous task management, local-first AI assistants.

### What This Category Is
Life OS Agents are a distinct category from coding agents. They are:
- Always running (daemon processes)
- Connected to messaging apps (WhatsApp, Telegram, Slack, Discord)
- Model-agnostic (connect to any LLM)
- Optimized for non-developer tasks (scheduling, research, inbox management)

They complement coding agents like Claude Code — they are the DISPATCH LAYER,
while Claude Code is the EXECUTION LAYER.

### Technology Stack

#### Leading Platforms
| Tool | Stars | Key Differentiator | Status |
|------|-------|-------------------|--------|
| **OpenClaw** | 199K+ | Original, messaging-native, 5,700+ community skills, ClawHub | OpenAI-backed foundation |
| **NanoClaw** | Growing | Minimal OpenClaw (Raspberry Pi-compatible), ~80% features | Open-source |
| **Nanobot (HKU)** | 26,800 | 4,000 lines Python, readable codebase, learning platform | Open-source |
| **memU** | Growing | Memory-first, anticipatory, secretary model | Commercial |

#### OpenClaw Architecture
```text
┌─────────────────────────────────────────────────────────────────────┐
│                        OPENCLAW STACK                               │
│                                                                     │
│  Messaging Layer:  WhatsApp │ Telegram │ Slack │ Discord │ iMessage │
│         │                                                           │
│         ▼                                                           │
│  OpenClaw Core: Message routing + Intent parsing + Memory          │
│         │                                                           │
│         ▼                                                           │
│  Skills Layer (ClawHub: 5,700+ skills):                            │
│    Spotify Control │ Grocery List │ Calendar │ Email │ Shell cmds  │
│         │                                                           │
│         ▼                                                           │
│  LLM Layer: Claude │ GPT-4o │ Gemini │ DeepSeek │ Ollama (local)  │
│         │                                                           │
│         ▼                                                           │
│  System Layer: File system │ Calendar │ Browser │ Smart Home       │
└─────────────────────────────────────────────────────────────────────┘
```

#### ClawHub vs NS Skills Architecture
| Aspect | ClawHub (OpenClaw) | NS Skills (.claude/skills/) |
|--------|-------------------|------------------------------|
| Discovery | Registry with 5,700+ skills | Progressive disclosure in session |
| Trigger | Keyword/intent matching | Description-based auto-discovery |
| Scope | Cross-app, always-on | Per-session, per-project |
| Best for | Life automation | Development workflows |

### High-Value Use Cases for Developers
1. **Async Claude Code triggers** — "Fix bug #47" from WhatsApp → OpenClaw → claude CLI → PR
2. **Multi-repo monitoring** — Morning summary of all open PR status
3. **Scheduled framework maintenance** — Weekly cron: run retro skill, update changelog
4. **Cross-platform context** — Meeting notes → OpenClaw → GitHub issue → Claude Code implements
5. **Development status updates** — Telegram notification when RALPH loop completes

### Security Considerations
```text
⚠️  OpenClaw has FULL SYSTEM ACCESS by default. Scope carefully:
□ Run in Docker container with limited volume mounts
□ Never run as root
□ Whitelist only necessary directories
□ Audit installed skills before enabling
□ Use local LLM (Ollama) for sensitive/private data
□ Review OpenClaw's network traffic if concerned about data sovereignty
```

### Selection Guide
| Need | Recommendation |
|------|---------------|
| Maximum features + community skills | OpenClaw |
| Minimal, auditable, learning project | Nanobot |
| Raspberry Pi / low-resource device | NanoClaw |
| Privacy-first, no cloud | Nanobot + Ollama |
| Enterprise messaging integration | OpenClaw + Slack |

### Cross-Category Dependencies
- → Category 58 (AI-Native IDEs) — Claude Code as execution layer
- → Category 44 (Workflow Orchestration) — for automation pipelines
- → Category 31 (Agent Frameworks) — agent composition patterns

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

This Master Build Framework pairs with the **North Star Blueprint v6.5** for complete coverage:

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

*End of Framework v2.1 — March 2026*
*Patched with Skills, Reasoning, Prompts, Memory Architecture*
*Part of the unified NS + MBF ecosystem — see BRIDGE.md for navigation*

---

