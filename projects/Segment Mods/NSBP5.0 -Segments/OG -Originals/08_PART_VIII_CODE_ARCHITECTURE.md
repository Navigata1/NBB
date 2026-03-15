# PART VIII: CODE ARCHITECTURE & PATTERNS

---

## 37. ARCHITECTURE SELECTION MATRIX

> "Architecture is the art of how to waste space." — Philip Johnson
> "Software architecture is the art of how to waste complexity." — This Blueprint

### 37.1 Architecture Decision Framework

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    ARCHITECTURE SELECTION MATRIX                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Architecture decisions are expensive to change. Choose deliberately.       │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  ARCHITECTURE TYPES:                                                         │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ MONOLITH                                                             │    │
│  │                                                                      │    │
│  │ Single deployable unit                                               │    │
│  │ All code in one codebase                                             │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • New projects (start here)                                          │    │
│  │ • Small teams (< 5 developers)                                       │    │
│  │ • Rapid iteration                                                    │    │
│  │ • Simple deployment needs                                            │    │
│  │                                                                      │    │
│  │ AVOID WHEN:                                                          │    │
│  │ • Multiple teams need independent deployment                         │    │
│  │ • Vastly different scaling needs per component                       │    │
│  │ • Different tech stacks needed per component                         │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ MODULAR MONOLITH                                                     │    │
│  │                                                                      │    │
│  │ Single deployment with clear module boundaries                       │    │
│  │ Modules communicate through defined interfaces                       │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Growing projects                                                   │    │
│  │ • Teams wanting microservice benefits without complexity             │    │
│  │ • Preparing for potential future split                               │    │
│  │                                                                      │    │
│  │ AVOID WHEN:                                                          │    │
│  │ • Team lacks discipline for boundaries                               │    │
│  │ • True independent scaling needed                                    │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ MICROSERVICES                                                        │    │
│  │                                                                      │    │
│  │ Multiple independently deployable services                           │    │
│  │ Each owns its data and logic                                         │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Large organizations (multiple teams)                               │    │
│  │ • Different scaling requirements per service                         │    │
│  │ • Different tech stacks per service                                  │    │
│  │ • High availability requirements                                     │    │
│  │                                                                      │    │
│  │ AVOID WHEN:                                                          │    │
│  │ • Small team (< 10 developers)                                       │    │
│  │ • New project (premature optimization)                               │    │
│  │ • Tight coupling between components                                  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ SERVERLESS                                                           │    │
│  │                                                                      │    │
│  │ Functions as a service, event-driven                                 │    │
│  │ No server management                                                 │    │
│  │                                                                      │    │
│  │ BEST FOR:                                                            │    │
│  │ • Event-driven workloads                                             │    │
│  │ • Variable/unpredictable load                                        │    │
│  │ • Cost optimization (pay per use)                                    │    │
│  │ • Quick API endpoints                                                │    │
│  │                                                                      │    │
│  │ AVOID WHEN:                                                          │    │
│  │ • Long-running processes                                             │    │
│  │ • Consistent high load                                               │    │
│  │ • Complex state management                                           │    │
│  │ • Cold start latency is unacceptable                                 │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 37.2 Architecture Selection Decision Tree

```
ARCHITECTURE SELECTION DECISION TREE
─────────────────────────────────────────────────────────────────────────────

START: New project or major rewrite?

├── Team size?
│   ├── < 5 developers
│   │   └── MONOLITH (start simple)
│   │
│   ├── 5-15 developers
│   │   ├── Clear module boundaries needed?
│   │   │   ├── Yes → MODULAR MONOLITH
│   │   │   └── No → MONOLITH
│   │   │
│   └── > 15 developers
│       ├── Independent team deployment needed?
│       │   ├── Yes → MICROSERVICES
│       │   └── No → MODULAR MONOLITH
│
├── Workload characteristics?
│   ├── Event-driven, spiky load
│   │   └── Consider SERVERLESS (or hybrid)
│   │
│   ├── Consistent, predictable load
│   │   └── Traditional server architecture
│   │
│   └── Mixed workloads
│       └── Hybrid approach (monolith + serverless functions)

─────────────────────────────────────────────────────────────────────────────

GOLDEN RULE:
Start with the simplest architecture that could work.
You can always add complexity later.
You can rarely remove it.

─────────────────────────────────────────────────────────────────────────────
```

### 37.3 Frontend Architecture Patterns

```
FRONTEND ARCHITECTURE PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN: SINGLE PAGE APPLICATION (SPA)
─────────────────────────────────────────────────────────────────────────────
Description: All UI rendered in browser, API-driven

Pros:
• Rich, app-like experience
• Fast after initial load
• Great for complex interactions

Cons:
• Poor initial SEO (without SSR)
• Large initial bundle
• Requires JavaScript

Best for: Dashboards, apps behind auth, complex UIs


PATTERN: SERVER-SIDE RENDERING (SSR)
─────────────────────────────────────────────────────────────────────────────
Description: HTML generated on server, hydrated in browser

Pros:
• Good SEO
• Fast first paint
• Works without JavaScript (basic)

Cons:
• Server load
• More complex setup
• Slower interactions

Best for: Content sites, e-commerce, public-facing apps


PATTERN: STATIC SITE GENERATION (SSG)
─────────────────────────────────────────────────────────────────────────────
Description: HTML generated at build time

Pros:
• Fastest possible delivery (CDN)
• No server needed (after build)
• Excellent SEO

Cons:
• Content is stale until rebuild
• Build time scales with pages
• Not for highly dynamic content

Best for: Blogs, documentation, marketing sites


PATTERN: INCREMENTAL STATIC REGENERATION (ISR)
─────────────────────────────────────────────────────────────────────────────
Description: Static pages regenerated on-demand

Pros:
• SSG benefits with fresher content
• Scales well
• Background regeneration

Cons:
• More complex
• Stale content possible
• Framework-specific

Best for: Large content sites, e-commerce catalogs


PATTERN: ISLANDS ARCHITECTURE
─────────────────────────────────────────────────────────────────────────────
Description: Static HTML with interactive "islands"

Pros:
• Minimal JavaScript shipped
• Fast initial load
• Progressive enhancement

Cons:
• Less cohesive for complex apps
• State sharing complexity
• Newer pattern, less tooling

Best for: Content-heavy sites with interactive elements
```

---

## 38. TECHNOLOGY STACK SELECTION

### 38.1 Stack Selection Principles

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    STACK SELECTION PRINCIPLES                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PRINCIPLE 1: BORING TECHNOLOGY                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  Choose technologies that are proven, well-documented, and widely used.    │
│  "Boring" technology has fewer surprises.                                   │
│                                                                              │
│  Questions to ask:                                                           │
│  • How long has it been in production use?                                  │
│  • How large is the community?                                              │
│  • How good is the documentation?                                           │
│  • Can I hire developers who know it?                                       │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 2: RIGHT TOOL FOR THE JOB                                        │
│  ───────────────────────────────────────────────────────────────────────    │
│  Each technology should be the best fit for its purpose.                   │
│  Don't use a hammer for screws.                                             │
│                                                                              │
│  Questions to ask:                                                           │
│  • What is this technology optimized for?                                   │
│  • Does it match our use case?                                              │
│  • What are we trading off?                                                  │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 3: MINIMIZE TECHNOLOGY COUNT                                      │
│  ───────────────────────────────────────────────────────────────────────    │
│  Every technology has a learning curve and maintenance cost.               │
│  Fewer technologies = simpler system = faster development.                  │
│                                                                              │
│  Questions to ask:                                                           │
│  • Can we reuse existing technology?                                        │
│  • Is the new technology worth the complexity?                              │
│  • What's the total cost of ownership?                                      │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 4: TEAM CAPABILITY                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│  The best technology is one your team can use effectively.                 │
│  A technology is only as good as its implementation.                       │
│                                                                              │
│  Questions to ask:                                                           │
│  • Does the team know this technology?                                      │
│  • How long to become productive?                                           │
│  • Are there training resources?                                            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 38.2 Stack Selection Matrix

```
STACK SELECTION BY PROJECT TYPE
─────────────────────────────────────────────────────────────────────────────

PROJECT: STARTUP MVP / RAPID PROTOTYPE
─────────────────────────────────────────────────────────────────────────────
Priority: Speed, iteration, minimal infrastructure

Recommended Stack:
• Frontend: Next.js (full-stack capabilities)
• Backend: Next.js API routes or separate Node/Python
• Database: PostgreSQL (Supabase/Neon for managed)
• Auth: Clerk, Supabase Auth, or NextAuth
• Hosting: Vercel, Railway, or Render
• Styling: Tailwind CSS

Reasoning: Full-stack framework reduces decisions, managed services reduce ops


PROJECT: ENTERPRISE APPLICATION
─────────────────────────────────────────────────────────────────────────────
Priority: Maintainability, scalability, security

Recommended Stack:
• Frontend: React/Vue with strong typing
• Backend: Node.js/Java/.NET with strict architecture
• Database: PostgreSQL/Oracle with proper migrations
• Auth: Enterprise SSO (Okta, Azure AD)
• Hosting: Cloud provider (AWS/GCP/Azure)
• Styling: Component library (MUI, Ant Design)

Reasoning: Proven technologies with enterprise support and tooling


PROJECT: CONTENT-HEAVY SITE
─────────────────────────────────────────────────────────────────────────────
Priority: SEO, performance, content management

Recommended Stack:
• Framework: Next.js, Astro, or Remix
• CMS: Sanity, Contentful, or Strapi
• Database: PostgreSQL or CMS-provided
• Hosting: Vercel, Netlify, or Cloudflare
• Styling: Tailwind CSS

Reasoning: SSG/SSR capabilities, headless CMS flexibility


PROJECT: REAL-TIME APPLICATION
─────────────────────────────────────────────────────────────────────────────
Priority: Low latency, live updates, scalability

Recommended Stack:
• Frontend: React with real-time library
• Backend: Node.js with WebSocket support
• Real-time: Supabase Realtime, Pusher, or Socket.io
• Database: PostgreSQL with change streams
• Hosting: Fly.io, Railway, or AWS

Reasoning: WebSocket-native infrastructure, edge deployment


PROJECT: AI-POWERED APPLICATION
─────────────────────────────────────────────────────────────────────────────
Priority: AI integration, processing capability, cost management

Recommended Stack:
• Frontend: Next.js or React
• Backend: Python (FastAPI) or Node.js
• AI: Anthropic API, OpenAI API, local models
• Database: PostgreSQL + pgvector for embeddings
• Queue: Redis or cloud queues for async processing
• Hosting: Vercel + serverless functions or dedicated GPU

Reasoning: Python ecosystem for AI, vector storage for embeddings
```

---

## 39. CODE ORGANIZATION STANDARDS

### 39.1 Project Structure Patterns

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    PROJECT STRUCTURE PATTERNS                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PATTERN: FEATURE-BASED (Recommended for most projects)                     │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  project/                                                                    │
│  ├── src/                                                                    │
│  │   ├── features/                 # Feature modules                        │
│  │   │   ├── auth/                                                          │
│  │   │   │   ├── components/       # Feature-specific components           │
│  │   │   │   ├── hooks/            # Feature-specific hooks                 │
│  │   │   │   ├── api/              # Feature-specific API calls            │
│  │   │   │   ├── utils/            # Feature-specific utilities            │
│  │   │   │   ├── types.ts          # Feature-specific types                │
│  │   │   │   └── index.ts          # Public exports                         │
│  │   │   ├── dashboard/                                                     │
│  │   │   └── settings/                                                      │
│  │   │                                                                      │
│  │   ├── shared/                   # Shared across features                 │
│  │   │   ├── components/           # Shared UI components                   │
│  │   │   ├── hooks/                # Shared hooks                           │
│  │   │   ├── utils/                # Shared utilities                       │
│  │   │   └── types/                # Shared types                           │
│  │   │                                                                      │
│  │   ├── lib/                      # Third-party configurations            │
│  │   ├── styles/                   # Global styles                          │
│  │   └── app/                      # App entry, routing                     │
│  │                                                                          │
│  ├── tests/                        # Test files (or co-located)            │
│  ├── public/                       # Static assets                          │
│  └── docs/                         # Documentation                          │
│                                                                              │
│  BENEFITS:                                                                   │
│  • Related code is co-located                                               │
│  • Easy to find files                                                        │
│  • Features can be moved/deleted easily                                     │
│  • Clear boundaries between features                                        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 39.2 Naming Conventions

```
NAMING CONVENTIONS
─────────────────────────────────────────────────────────────────────────────

FILES & DIRECTORIES:
─────────────────────────────────────────────────────────────────────────────
Components:     PascalCase.tsx       UserProfile.tsx
Hooks:          camelCase.ts         useAuth.ts
Utilities:      camelCase.ts         formatDate.ts
Types:          camelCase.ts         user.types.ts
Tests:          same-name.test.ts    UserProfile.test.tsx
Styles:         same-name.css        UserProfile.module.css
Constants:      camelCase.ts         config.ts
API:            camelCase.ts         userApi.ts


VARIABLES & FUNCTIONS:
─────────────────────────────────────────────────────────────────────────────
Variables:      camelCase            userName, isLoading
Constants:      SCREAMING_SNAKE      MAX_RETRY_COUNT, API_URL
Functions:      camelCase            getUserById, formatDate
Components:     PascalCase           UserProfile, Button
Hooks:          use prefix           useAuth, useLocalStorage
Event handlers: handle prefix        handleClick, handleSubmit
Boolean vars:   is/has/should        isLoading, hasError, shouldRender


TYPES & INTERFACES:
─────────────────────────────────────────────────────────────────────────────
Types:          PascalCase           User, CreateUserInput
Interfaces:     PascalCase           UserRepository, AuthService
Enums:          PascalCase           UserRole, OrderStatus
Type params:    Single letter or     T, K, V or TData, TError
                descriptive


CSS CLASSES:
─────────────────────────────────────────────────────────────────────────────
BEM style:      block__element--modifier
                card__title--large
                button--primary
                form__input--error

Tailwind:       Utility classes (no custom naming needed)
CSS Modules:    camelCase (auto-scoped)
```

### 39.3 Import Organization

```
IMPORT ORGANIZATION
─────────────────────────────────────────────────────────────────────────────

ORDER (top to bottom):
─────────────────────────────────────────────────────────────────────────────
1. External packages (node_modules)
2. Internal packages (@company/*)
3. Absolute imports from src (@/*)
4. Relative imports (../, ./)
5. Type imports (if separate)
6. Style imports

EXAMPLE:
```typescript
// 1. External packages
import React, { useState, useEffect } from 'react';
import { useQuery } from '@tanstack/react-query';
import clsx from 'clsx';

// 2. Internal packages (if monorepo)
import { Button } from '@company/ui';

// 3. Absolute imports
import { api } from '@/lib/api';
import { formatDate } from '@/shared/utils';

// 4. Relative imports
import { UserAvatar } from './UserAvatar';
import { useUserData } from '../hooks/useUserData';

// 5. Type imports
import type { User } from '@/shared/types';

// 6. Style imports
import styles from './UserProfile.module.css';
```

ESLINT CONFIGURATION:
```json
{
  "rules": {
    "import/order": [
      "error",
      {
        "groups": [
          "builtin",
          "external",
          "internal",
          "parent",
          "sibling",
          "index",
          "type"
        ],
        "newlines-between": "always",
        "alphabetize": {
          "order": "asc"
        }
      }
    ]
  }
}
```
```

---

## 40. DATABASE PATTERNS

### 40.1 Database Selection

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       DATABASE SELECTION                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  DATABASE TYPE        │ BEST FOR                    │ EXAMPLES              │
│  ─────────────────────┼─────────────────────────────┼───────────────────── │
│                       │                             │                       │
│  RELATIONAL (SQL)     │ Structured data             │ PostgreSQL           │
│                       │ Complex queries             │ MySQL                │
│                       │ ACID transactions           │ SQLite               │
│                       │ Relationships               │                       │
│                       │                             │                       │
│  ─────────────────────┼─────────────────────────────┼───────────────────── │
│                       │                             │                       │
│  DOCUMENT (NoSQL)     │ Flexible schema             │ MongoDB              │
│                       │ Nested data                 │ Firestore            │
│                       │ Rapid iteration             │ CouchDB              │
│                       │ Horizontal scaling          │                       │
│                       │                             │                       │
│  ─────────────────────┼─────────────────────────────┼───────────────────── │
│                       │                             │                       │
│  KEY-VALUE            │ Caching                     │ Redis                │
│                       │ Session storage             │ DynamoDB             │
│                       │ Simple lookups              │ Memcached            │
│                       │ High throughput             │                       │
│                       │                             │                       │
│  ─────────────────────┼─────────────────────────────┼───────────────────── │
│                       │                             │                       │
│  VECTOR               │ AI embeddings               │ Pinecone             │
│                       │ Similarity search           │ pgvector             │
│                       │ Recommendation              │ Weaviate             │
│                       │ Semantic search             │ Chroma               │
│                       │                             │                       │
│  ─────────────────────┼─────────────────────────────┼───────────────────── │
│                       │                             │                       │
│  GRAPH                │ Relationships               │ Neo4j                │
│                       │ Social networks             │ Amazon Neptune       │
│                       │ Recommendation              │ ArangoDB             │
│                       │ Knowledge graphs            │                       │
│                       │                             │                       │
└─────────────────────────────────────────────────────────────────────────────┘

DEFAULT CHOICE: PostgreSQL
─────────────────────────────────────────────────────────────────────────────
PostgreSQL is the default recommendation because:
• Handles 90% of use cases
• JSON support for document-like needs
• pgvector for AI embeddings
• Excellent tooling and hosting options
• ACID compliance
• Open source with no licensing concerns
```

### 40.2 Database Schema Patterns

```
DATABASE SCHEMA PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN: STANDARD ENTITY COLUMNS
─────────────────────────────────────────────────────────────────────────────
Every table should have:

```sql
CREATE TABLE users (
  -- Primary key
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  
  -- Entity-specific columns
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  
  -- Standard audit columns
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  
  -- Soft delete (optional but recommended)
  deleted_at TIMESTAMPTZ
);

-- Auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_updated_at
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();
```

PATTERN: PROPER FOREIGN KEYS
─────────────────────────────────────────────────────────────────────────────
```sql
CREATE TABLE posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Always index foreign keys
CREATE INDEX posts_user_id_idx ON posts(user_id);
```

PATTERN: ENUM TYPES
─────────────────────────────────────────────────────────────────────────────
```sql
-- Define enum type
CREATE TYPE order_status AS ENUM (
  'pending',
  'processing',
  'shipped',
  'delivered',
  'cancelled'
);

-- Use in table
CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  status order_status NOT NULL DEFAULT 'pending',
  -- ...
);
```

PATTERN: JSON COLUMNS (When appropriate)
─────────────────────────────────────────────────────────────────────────────
```sql
CREATE TABLE user_preferences (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- JSONB for flexible, queryable data
  preferences JSONB NOT NULL DEFAULT '{}',
  
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Index for JSON queries
CREATE INDEX user_preferences_gin ON user_preferences USING GIN (preferences);
```
```

### 40.3 Migration Discipline

```
MIGRATION DISCIPLINE
─────────────────────────────────────────────────────────────────────────────

RULE 1: MIGRATIONS ARE IMMUTABLE
─────────────────────────────────────────────────────────────────────────────
Once a migration has been run in any environment:
• NEVER modify it
• Create a new migration for changes
• Previous migrations are history


RULE 2: MIGRATIONS MUST BE REVERSIBLE
─────────────────────────────────────────────────────────────────────────────
Every "up" should have a corresponding "down":

```typescript
// Good: Reversible
export async function up(db) {
  await db.schema.createTable('posts', (t) => {
    t.uuid('id').primaryKey();
    t.string('title').notNull();
  });
}

export async function down(db) {
  await db.schema.dropTable('posts');
}
```


RULE 3: TEST MIGRATIONS BEFORE PRODUCTION
─────────────────────────────────────────────────────────────────────────────
□ Run migration against copy of production data
□ Verify data integrity after migration
□ Test rollback procedure
□ Estimate migration duration
□ Plan for zero-downtime if required


RULE 4: NAMING CONVENTION
─────────────────────────────────────────────────────────────────────────────
Format: [timestamp]_[description].ts

Examples:
  20240115120000_create_users_table.ts
  20240115130000_add_email_to_users.ts
  20240115140000_create_posts_table.ts


RULE 5: MIGRATION CHECKLIST
─────────────────────────────────────────────────────────────────────────────
□ Migration file created with timestamp
□ Up migration written and tested
□ Down migration written and tested
□ Indexes added for foreign keys
□ Constraints are appropriate
□ Default values considered
□ Null handling explicit
□ Migration reviewed by another developer
□ Tested against production-like data
□ Rollback procedure documented
```

---

## 41. API DESIGN PRINCIPLES

### 41.1 RESTful API Guidelines

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       RESTful API GUIDELINES                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  RESOURCE NAMING                                                             │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Use nouns, not verbs: /users not /getUsers                              │
│  • Use plural: /users not /user                                            │
│  • Use kebab-case: /user-profiles not /userProfiles                        │
│  • Nest for relationships: /users/{id}/posts                               │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  HTTP METHODS                                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  GET     │ Read resource(s)      │ GET /users                              │
│          │ Idempotent, safe      │ GET /users/123                          │
│          │                       │                                         │
│  POST    │ Create resource       │ POST /users                             │
│          │ Not idempotent        │ Body: { name: "..." }                   │
│          │                       │                                         │
│  PUT     │ Replace resource      │ PUT /users/123                          │
│          │ Idempotent            │ Body: { full object }                   │
│          │                       │                                         │
│  PATCH   │ Partial update        │ PATCH /users/123                        │
│          │ Idempotent            │ Body: { fields to update }              │
│          │                       │                                         │
│  DELETE  │ Remove resource       │ DELETE /users/123                       │
│          │ Idempotent            │                                         │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  STATUS CODES                                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│                                                                              │
│  2xx SUCCESS                                                                 │
│  200 OK              │ General success                                      │
│  201 Created         │ Resource created (POST)                              │
│  204 No Content      │ Success, no body (DELETE)                           │
│                                                                              │
│  4xx CLIENT ERROR                                                            │
│  400 Bad Request     │ Invalid request syntax/body                          │
│  401 Unauthorized    │ Authentication required                              │
│  403 Forbidden       │ Authenticated but not authorized                     │
│  404 Not Found       │ Resource doesn't exist                               │
│  409 Conflict        │ Resource conflict (duplicate)                        │
│  422 Unprocessable   │ Validation failed                                    │
│  429 Too Many Reqs   │ Rate limited                                         │
│                                                                              │
│  5xx SERVER ERROR                                                            │
│  500 Internal Error  │ Server error (our fault)                             │
│  502 Bad Gateway     │ Upstream service failed                              │
│  503 Unavailable     │ Service temporarily down                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 41.2 API Response Formats

```
API RESPONSE FORMATS
─────────────────────────────────────────────────────────────────────────────

SUCCESS RESPONSE (Single Resource):
```json
{
  "data": {
    "id": "123",
    "type": "user",
    "attributes": {
      "email": "user@example.com",
      "name": "John Doe",
      "createdAt": "2024-01-15T12:00:00Z"
    }
  }
}
```

SUCCESS RESPONSE (Collection):
```json
{
  "data": [
    { "id": "1", "type": "user", "attributes": { ... } },
    { "id": "2", "type": "user", "attributes": { ... } }
  ],
  "meta": {
    "total": 100,
    "page": 1,
    "perPage": 20,
    "totalPages": 5
  },
  "links": {
    "self": "/api/users?page=1",
    "next": "/api/users?page=2",
    "last": "/api/users?page=5"
  }
}
```

ERROR RESPONSE:
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": [
      {
        "field": "email",
        "message": "Email is already taken"
      },
      {
        "field": "password",
        "message": "Password must be at least 8 characters"
      }
    ]
  }
}
```

SIMPLER ALTERNATIVE (For smaller APIs):
```json
// Success
{
  "id": "123",
  "email": "user@example.com",
  "name": "John Doe"
}

// Error
{
  "error": "Validation failed",
  "code": "VALIDATION_ERROR",
  "details": { ... }
}
```
```

### 41.3 API Versioning

```
API VERSIONING STRATEGIES
─────────────────────────────────────────────────────────────────────────────

STRATEGY 1: URL PATH (Recommended)
─────────────────────────────────────────────────────────────────────────────
/api/v1/users
/api/v2/users

Pros: Clear, easy to understand, easy to route
Cons: URL pollution, harder to sunset

STRATEGY 2: HEADER
─────────────────────────────────────────────────────────────────────────────
GET /api/users
Accept-Version: v1

Pros: Clean URLs
Cons: Hidden, easy to forget, harder to test

STRATEGY 3: QUERY PARAMETER
─────────────────────────────────────────────────────────────────────────────
/api/users?version=1

Pros: Visible, easy to change
Cons: Query string pollution, caching issues

─────────────────────────────────────────────────────────────────────────────

RECOMMENDATION: URL Path versioning

• Start with /api/v1/
• Only increment major version for breaking changes
• Maintain previous version for reasonable deprecation period
• Communicate deprecation timeline clearly
```

---

## PART VIII SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                  PART VIII: CODE ARCHITECTURE & PATTERNS                     │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ARCHITECTURE SELECTION:                                                     │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Monolith: Start here (< 5 devs, new projects)                           │
│  • Modular Monolith: Growing projects, want boundaries                      │
│  • Microservices: Large orgs, independent scaling needs                     │
│  • Serverless: Event-driven, variable load                                  │
│  • Golden Rule: Start simple, add complexity only when needed              │
│                                                                              │
│  STACK SELECTION:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Boring technology (proven, documented, community)                         │
│  • Right tool for the job                                                    │
│  • Minimize technology count                                                 │
│  • Team capability matters                                                   │
│  • Default: PostgreSQL + Next.js for most projects                          │
│                                                                              │
│  CODE ORGANIZATION:                                                          │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Feature-based structure (recommended)                                     │
│  • Consistent naming conventions                                             │
│  • Organized imports (external → internal → relative)                       │
│  • Clear module boundaries                                                   │
│                                                                              │
│  DATABASE PATTERNS:                                                          │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • PostgreSQL as default choice                                              │
│  • Standard columns: id, created_at, updated_at, deleted_at                 │
│  • Always index foreign keys                                                 │
│  • Migrations are immutable and reversible                                   │
│                                                                              │
│  API DESIGN:                                                                 │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • RESTful principles (nouns, plural, proper methods)                       │
│  • Correct status codes                                                      │
│  • Consistent response formats                                               │
│  • URL path versioning (/api/v1/)                                           │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
