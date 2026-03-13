# North Star Framework — Example Project

## TaskFlow: A Task Manager Web App

This directory contains a complete, realistic set of project artifacts demonstrating what the North Star Framework looks like in practice. The scenario is a fictional task manager web application — simple enough to be immediately comprehensible, real enough to show the patterns meaningfully.

### What's Here

```
examples/
├── README.md                 ← You are here
├── claude.md                 ← Project context file (the most important file)
├── plan.md                   ← Example feature plan with annotations
├── architecture.md           ← System overview for agent context
├── .claude/
│   ├── settings.json         ← Pre-configured permissions
│   ├── hooks/
│   │   ├── stop.sh           ← Stop hook (prevents runaway execution)
│   │   └── pre-write.sh      ← File protection hook
│   ├── commands/
│   │   ├── update-docs.md    ← Slash command: update documentation
│   │   └── whats-next.md     ← Slash command: show next task
│   └── skills/
│       └── retro/
│           └── SKILL.md      ← Retro skill (post-session learnings)
└── research/
    └── auth-research-2026-03.md  ← Example research report
```

### How to Use These Examples

**If you're new to the framework:** Start with `claude.md`. This is the file that gives your AI agent project context. Every NS Framework project has one. Study its structure, then create your own.

**If you're setting up a real project:** Copy the `.claude/` directory structure into your project and customize each file for your needs. The permissions, hooks, and commands are working examples — not templates to fill in.

**If you're learning the RPIT Loop:** Read `plan.md` to see what an annotated feature plan looks like. Then read `research/auth-research-2026-03.md` to see the Research phase output. Together, they show the R→P flow.

### The Scenario

TaskFlow is a task management web app with the following stack:
- **Frontend:** Next.js 14 (App Router) + TypeScript + Tailwind CSS
- **Backend:** Next.js API routes + Prisma ORM
- **Database:** PostgreSQL (Supabase-hosted)
- **Auth:** Supabase Auth (email/password + OAuth)
- **Deployment:** Vercel

The examples show the project mid-development — some features are built, one is in progress, and one is in the research phase. This reflects real project state, not a pristine starting point.

---

> Part of the [North Star Framework](https://github.com/Navigata1/NorthStarBuild_5.0)
> Created by [@NavigatingTruth](https://twitter.com/NavigatingTruth)
