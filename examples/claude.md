# TaskFlow — Project Context

## Identity

You are a senior full-stack engineer working on TaskFlow, a task management web application. You write clean, type-safe TypeScript. You prefer explicit over clever. You test before you commit.

## Tech Stack

| Layer | Technology | Version |
|-------|-----------|---------|
| Framework | Next.js (App Router) | 14.2.x |
| Language | TypeScript | 5.4.x |
| Styling | Tailwind CSS | 3.4.x |
| ORM | Prisma | 5.x |
| Database | PostgreSQL | 16 (Supabase) |
| Auth | Supabase Auth | 2.x |
| Testing | Vitest + Playwright | latest |
| Deployment | Vercel | — |

## Architecture Overview

```
src/
├── app/                    # Next.js App Router pages
│   ├── (auth)/             # Auth-gated routes (layout with session check)
│   │   ├── dashboard/      # Main task dashboard
│   │   ├── projects/       # Project management
│   │   └── settings/       # User preferences
│   ├── (public)/           # Public routes
│   │   ├── login/
│   │   └── signup/
│   ├── api/                # API routes
│   │   ├── tasks/
│   │   ├── projects/
│   │   └── webhooks/
│   └── layout.tsx          # Root layout
├── components/
│   ├── ui/                 # Primitives (Button, Input, Card, etc.)
│   ├── tasks/              # Task-specific components
│   └── layout/             # Shell, Sidebar, Header
├── lib/
│   ├── db.ts               # Prisma client singleton
│   ├── auth.ts             # Supabase auth helpers
│   ├── validations/        # Zod schemas
│   └── utils/              # Shared utilities
├── hooks/                  # Custom React hooks
└── types/                  # Shared TypeScript types
```

## Conventions

- **File naming:** kebab-case for files, PascalCase for components
- **Imports:** Use `@/` path alias for `src/`
- **API responses:** Always return `{ data, error }` shape — never throw from API routes
- **Database:** All queries through Prisma — no raw SQL unless performance-critical (document why)
- **Error handling:** Use Result pattern (`{ success: true, data } | { success: false, error }`)
- **Components:** Server Components by default. Add `"use client"` only when interactivity is required.
- **State:** URL state (search params) over React state where possible
- **Tests:** Every API route gets an integration test. Every complex component gets a unit test.

## Current State

### Completed
- [x] Auth flow (login, signup, password reset)
- [x] Dashboard layout with sidebar navigation
- [x] Basic task CRUD (create, read, update, delete)
- [x] Project creation and listing
- [x] Task assignment to projects

### In Progress
- [ ] Task filtering and search (plan approved — see plan.md)
- [ ] Drag-and-drop task reordering

### Planned
- [ ] Real-time collaboration (researching — see research/auth-research-2026-03.md)
- [ ] Recurring tasks
- [ ] Email notifications

## Known Issues

- **Prisma cold start:** First API call after deploy takes 2-3s due to Prisma connection pooling on Vercel serverless. Mitigation: keep-alive ping in middleware. Not yet implemented.
- **Optimistic updates:** Task status toggle doesn't use optimistic UI — there's a visible delay. Fix when implementing drag-and-drop.

## Session Learnings (from retros)

- **2026-03-01:** Supabase Auth `getSession()` is deprecated in favor of `getUser()` for server-side checks. Agent kept using the old pattern until we added this note. Always use `getUser()` server-side.
- **2026-03-05:** Prisma `findMany` with nested includes on tasks + assignees + projects causes N+1 in the dashboard query. Solution: use `relationLoadStrategy: "join"` in Prisma 5.x. Document in db.ts.
- **2026-03-08:** Tailwind `@apply` in component files causes build warnings in Next.js 14. Prefer inline utility classes. Only use `@apply` in `globals.css` for base styles.
- **2026-03-10:** The Zod schema for task creation was missing `projectId` as optional, causing API failures when creating tasks without a project. Always validate schemas against the Prisma model when adding fields.

## Do NOT

- Do not use `any` type. If you're uncertain about a type, define an explicit interface and mark fields with `// TODO: verify type`.
- Do not install new dependencies without checking the plan first. State the package, version, and reason.
- Do not modify `prisma/schema.prisma` without creating a migration plan. Schema changes require a plan.md entry.
- Do not write to `src/components/ui/` — these are design-system primitives maintained separately.
