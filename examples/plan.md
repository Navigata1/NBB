# Plan: Task Filtering and Search

**Feature:** Add filtering (by status, project, assignee) and full-text search to the task dashboard.
**RPIT Cycle:** 2 (Research complete, Plan approved, Implementation in progress)
**Session:** 2026-03-11
**Confidence:** High (85%) — familiar patterns, well-understood codebase

---

## Scope

### In Scope
- Filter tasks by: status (todo/in-progress/done), project, assignee
- Full-text search across task title and description
- URL-persisted filter state (shareable filtered views)
- Debounced search input (300ms)

### Out of Scope
- Saved filter presets (future feature)
- Advanced query syntax ("assignee:jon status:todo")
- Full-text search with PostgreSQL `tsvector` (premature — basic `ILIKE` is sufficient at current scale)

---

## Files Affected

| File | Action | Notes |
|------|--------|-------|
| `src/app/(auth)/dashboard/page.tsx` | Modify | Add filter UI, read search params |
| `src/components/tasks/task-filters.tsx` | Create | New filter bar component |
| `src/components/tasks/task-search.tsx` | Create | Debounced search input |
| `src/app/api/tasks/route.ts` | Modify | Add query param handling to GET |
| `src/lib/validations/task.ts` | Modify | Add filter schema |
| `src/hooks/use-task-filters.ts` | Create | URL state management hook |
| `tests/api/tasks-filter.test.ts` | Create | Integration tests for filter API |
| `tests/components/task-filters.test.tsx` | Create | Unit test for filter component |

---

## Implementation Steps

1. **[APPROVED]** Create Zod schema for filter params in `src/lib/validations/task.ts`
   - Status enum: `todo | in-progress | done`
   - ProjectId: optional string (UUID)
   - AssigneeId: optional string (UUID)
   - Search: optional string, max 200 chars

2. **[APPROVED]** Update `GET /api/tasks` to accept and apply filter query params
   - Parse query params with Zod schema
   - Build Prisma `where` clause conditionally
   - Search uses `ILIKE` on title and description (OR condition)
   - Default: no filters (return all tasks for user)

3. **[APPROVED]** Create `use-task-filters` hook for URL state management
   - Read filter state from `useSearchParams()`
   - Provide setter functions that update URL params
   - Use `useRouter().replace()` for URL updates (no history pollution)

4. **[APPROVED]** Create `task-search.tsx` component
   - Debounced input (300ms) using `useDeferredValue` or custom debounce
   - Clear button when search is active
   - Visual loading state during debounce

5. **[MODIFIED: Added project color indicator]** Create `task-filters.tsx` component
   - Dropdown selects for status, project, assignee
   - Project dropdown includes color indicator dot from project model
   - "Clear all" button when any filter is active
   - Filter count badge on mobile (collapsed state)

6. **[APPROVED]** Integrate filter components into dashboard page
   - Mount filter bar above task list
   - Pass filter state to API call via search params
   - Show "No tasks match filters" empty state
   - Preserve filters across page navigation

7. **[BLOCKED: Waiting on design review]** Add filter animation
   - Animate filter bar expand/collapse on mobile
   - Blocked: design team reviewing mobile filter UX — revisit after approval

8. **[APPROVED]** Write tests
   - API: test each filter individually and in combination
   - API: test search with special characters (SQL injection prevention)
   - Component: test filter state updates URL
   - Component: test debounce behavior

---

## Decisions

- **ILIKE over tsvector:** At current scale (<10K tasks per user), ILIKE with a simple index is sufficient. tsvector adds complexity for marginal gain. Revisit if search performance degrades.
- **URL state over React state:** Filters should be shareable and survive page refresh. URL params are the correct primitive for this.
- **No pagination in this cycle:** Current dashboard loads all tasks. Pagination is a separate RPIT cycle that should be paired with virtual scrolling.
