# Research Report: Real-Time Collaboration for TaskFlow

**Date:** 2026-03-09
**RPIT Phase:** Research (pre-Plan)
**Researcher:** Claude (Sonnet 4) — directed by developer
**Confidence:** Medium (65%) — multiple viable approaches, no clear winner yet

---

## Research Question

How should TaskFlow implement real-time collaboration (live task updates, presence indicators, collaborative editing) given the current Supabase + Vercel stack?

---

## Options Evaluated

### Option A: Supabase Realtime (Broadcast + Presence)

**How it works:** Supabase provides a built-in Realtime service with Broadcast channels (pub/sub messaging) and Presence tracking (who's online). Database changes can be broadcast via Postgres `LISTEN/NOTIFY` channels.

**Pros:**
- Already in our stack — no new infrastructure
- Presence tracking is built-in
- Direct Postgres change streaming for task updates
- Free tier includes Realtime (no additional cost at current scale)

**Cons:**
- Limited to 200 concurrent connections on free tier, 500 on Pro
- Broadcast is best-effort delivery — no guaranteed ordering
- Collaborative text editing (task descriptions) would need a separate CRDT layer
- Supabase Realtime client SDK adds ~15KB to bundle

**Verdict:** Strong fit for task status updates and presence. Not sufficient for collaborative description editing.

### Option B: Liveblocks

**How it works:** Third-party collaboration infrastructure. Provides presence, broadcast, and CRDT-based collaborative editing (Yjs integration) out of the box.

**Pros:**
- CRDT-based editing handles conflicts automatically
- Purpose-built for exactly this use case
- React hooks API (`useOthers`, `useMyPresence`, `useMutation`)
- Handles offline/reconnection gracefully

**Cons:**
- Additional dependency and vendor lock-in
- Pricing: Free for 300 MAU, then $8/MAU/month — scales poorly
- Another SDK to maintain and update
- Supabase Auth integration requires custom auth endpoint

**Verdict:** Best DX for collaborative editing, but expensive at scale and adds vendor dependency.

### Option C: PartyKit / Cloudflare Durable Objects

**How it works:** Server-side WebSocket rooms running on Cloudflare's edge. Each "room" (e.g., a project board) maintains its own state and broadcasts to connected clients.

**Pros:**
- Full control over message handling and conflict resolution
- Edge-deployed — low latency globally
- Can integrate Yjs for CRDT editing
- Predictable pricing (Cloudflare Workers pricing model)

**Cons:**
- Separate infrastructure from Vercel (deployment complexity)
- Requires building presence and reconnection logic from scratch
- More code to maintain than managed solutions
- Team has no Cloudflare Workers experience

**Verdict:** Maximum flexibility, but significant implementation effort and new infrastructure.

---

## Recommendation

**Phase 1: Supabase Realtime** for task status updates and basic presence (who's viewing a project board). This covers 80% of the "real-time" value with zero new infrastructure.

**Phase 2 (if needed): Evaluate Liveblocks** for collaborative task description editing, but only if user research confirms demand. The cost and dependency are only justified if collaborative editing is a core feature, not a nice-to-have.

**Do not pursue Option C** unless we outgrow Supabase Realtime's connection limits or need global edge deployment.

---

## Open Questions (for Plan phase)

1. Do we need real-time updates across all projects or only the currently-viewed project?
2. What's the expected concurrent user count per project board? (Affects Supabase tier choice)
3. Should presence show cursors/selections or just "User X is viewing this board"?
4. How should offline edits reconcile when the user reconnects?

---

## Sources Consulted

- Supabase Realtime documentation (verified 2026-03-09)
- Liveblocks pricing page and React SDK docs (verified 2026-03-09)
- PartyKit documentation and examples (verified 2026-03-09)
- Vercel + Supabase integration guide for Realtime
