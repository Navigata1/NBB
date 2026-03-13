# /update-docs

Review all changes made in this session and update project documentation accordingly.

## Steps

1. Run `git diff --name-only` to see all modified files
2. For each modified file, check if it introduces:
   - New conventions or patterns
   - New dependencies
   - Changed API contracts
   - New environment variables
   - Database schema changes
3. Update the relevant sections in `claude.md`:
   - Add new conventions to the "Conventions" section
   - Update "Current State" checkboxes if features were completed
   - Add any new "Known Issues" discovered during implementation
   - Add "Session Learnings" entry with today's date
4. If `prisma/schema.prisma` was modified, update `architecture.md` with the new model
5. Present a summary of all documentation changes for review

## Do NOT
- Overwrite existing session learnings — append new ones
- Remove known issues unless they were explicitly fixed and tested
- Modify the "Do NOT" section without explicit approval
