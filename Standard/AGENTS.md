# Engineering Standards Directive

This workspace is governed by the principles, workflows, and approval boundaries defined in `PERSONAL_ENGINEERING_STANDARDS.md`.

## Agent Instructions:
1. **Primary Reference:** Check for `PERSONAL_ENGINEERING_STANDARDS.md` in the workspace root. Adhere strictly to its rules, workflow, and approval gates throughout your tasks.
2. **Context-Efficient Reading:** Reference the document targetedly based on your current task phase (e.g., consult Planning & Approval Gates before making architectural decisions; consult Testing & Git Policy before finalizing changes) rather than exhausting context unnecessarily.
3. **Strict Boundaries:** Treat all `[MANDATORY]` clauses—especially around high-risk operations (migrations, deployments, destructive commands) and Git boundaries—as non-negotiable hard constraints.
4. **Fallback:** If `PERSONAL_ENGINEERING_STANDARDS.md` is absent or unreadable, inform the user and proceed with standard senior engineering discipline: maintain strict scope control, avoid speculative changes, and ask before executing any destructive action.
5. **Immutability:** Never modify, overwrite, or delete `PERSONAL_ENGINEERING_STANDARDS.md` unless explicitly commanded by the user.
