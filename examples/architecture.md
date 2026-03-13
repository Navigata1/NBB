# TaskFlow — Architecture Overview

## System Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                          Client (Browser)                        │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Next.js App Router (React Server Components + Client)    │  │
│  │  ├── Server Components → Direct DB access via Prisma      │  │
│  │  └── Client Components → API routes for mutations         │  │
│  └───────────────────────────────────────────────────────────┘  │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                    ┌──────────┴──────────┐
                    │   Vercel Edge       │
                    │   (Middleware)       │
                    │   - Auth check      │
                    │   - Redirect logic  │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
    ┌─────────┴──────┐ ┌──────┴───────┐ ┌──────┴───────┐
    │  API Routes     │ │  Supabase    │ │  Vercel      │
    │  /api/tasks     │ │  Auth        │ │  Blob Store  │
    │  /api/projects  │ │  (JWT auth)  │ │  (avatars)   │
    │  /api/webhooks  │ │              │ │              │
    └─────────┬──────┘ └──────────────┘ └──────────────┘
              │
    ┌─────────┴──────┐
    │  Prisma ORM     │
    │  (Connection     │
    │   pooling via    │
    │   Supabase)      │
    └─────────┬──────┘
              │
    ┌─────────┴──────┐
    │  PostgreSQL 16  │
    │  (Supabase)     │
    │                 │
    │  Tables:        │
    │  - users        │
    │  - tasks        │
    │  - projects     │
    │  - task_assigns │
    └────────────────┘
```

## Key Data Models

```prisma
model Task {
  id          String    @id @default(uuid())
  title       String
  description String?
  status      Status    @default(TODO)
  priority    Int       @default(0)
  projectId   String?
  project     Project?  @relation(fields: [projectId], references: [id])
  createdBy   String
  assignees   TaskAssignment[]
  createdAt   DateTime  @default(now())
  updatedAt   DateTime  @updatedAt
}

model Project {
  id        String   @id @default(uuid())
  name      String
  color     String   @default("#6366f1")
  ownerId   String
  tasks     Task[]
  createdAt DateTime @default(now())
}

enum Status {
  TODO
  IN_PROGRESS
  DONE
}
```

## Auth Flow

1. User hits any `(auth)` route
2. Middleware checks Supabase session via `getUser()`
3. No session → redirect to `/login`
4. Valid session → attach `userId` to request context
5. API routes extract `userId` from session — never from client payload

## Deployment

- **Hosting:** Vercel (auto-deploy from `main` branch)
- **Database:** Supabase managed PostgreSQL (connection string in Vercel env vars)
- **Preview deployments:** Every PR gets a preview URL with isolated Supabase branch DB
- **Environment variables:** Managed in Vercel dashboard, never committed
