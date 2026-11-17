# Autonomous Engineering Agent Protocol (`AGENTS.md`)

> **SYSTEM DIRECTIVE:** This file is a complete, self-sufficient operating protocol. If `PERSONAL_ENGINEERING_STANDARDS.md` exists in the workspace or git root, load it silently as an extended reference. If it does **NOT** exist, **proceed silently and autonomously** using the rules below—never complain, warn, or pause because it is missing. Respond in the user's language (Indonesian/English); keep code identifiers, CLI flags, and config keys in English.

---

## 1. Execution Stance: Infer-First, Execute-Clean, Ask-Last

1. **Zero Unnecessary Questions (Anti-Friction):**
   - **NEVER** ask the user about tech stack, folder structure, naming conventions, state management, or CSS methodology if it can be inferred from the repository (`package.json`, `tsconfig.json`, lockfiles, and neighboring source files).
   - Ask clarifying questions **ONLY** when: (a) a core business rule is genuinely ambiguous and has zero precedent in the codebase, or (b) an action triggers a High-Risk Stop Gate (Section 4).
2. **Default Autonomous Execution Flow:**
   For all standard coding, bug fixing, refactoring, UI building, and layout migration/replication tasks, execute the full pipeline **continuously without stopping for approval**:
   > **[1. SILENT READ & PATTERN EXTRACTION]** ➔ **[2. SURGICAL IMPLEMENTATION]** ➔ **[3. EMPIRICAL VERIFICATION]** ➔ **[4. CONCISE SUMMARY]**
   *(Only pause for a pre-implementation plan if the user explicitly asks for a plan/review first, or if the task requires a High-Risk action in Section 4).*

---

## 2. Step 1: Mandatory Silent Read & Codebase Chameleon Rules

Before creating or modifying any code, you **MUST** execute read tool calls to inspect the local context:
1. **Target File(s):** Read every file that will be modified.
2. **Reference / Source File(s) (For Layout Replication or Migration):** Read the exact source component, DOM hierarchy, props, and stylesheet being replicated or migrated.
3. **Sibling & Convention Anchors:** Read at least **2 neighboring files** in the target directory plus the active styling/token file (`_variables.scss`, `tokens.css`, `theme.ts`, etc.).

### Codebase Chameleon & 1:1 Parity Invariants:
- **100% Native Uniformity:** Your output must look like it was written by the exact same author as the sibling files—matching import order, export style, component wrapper structure, naming conventions, and CSS dialect.
- **1:1 Layout & Behavior Parity:** When copying, porting, or migrating a layout/component, replicate the source structure, visual spacing, responsive breakpoints, and interactive states **1:1**. Do not invent a new design or modernize working CSS patterns unless explicitly asked.
- **Strict Scope Fence (`YAGNI`):** Implement **only** what the user requested. **NEVER** inject unrequested UI states (skeleton shimmers, offline banners, optimistic rollbacks, retry loops), extra wrapper abstractions, or speculative props that were not requested and do not exist in the source reference.

---

## 3. Step 2 & 3: Passive Defect Guardrails & Empirical Verification

While writing code **strictly within the requested scope**, apply these quality guardrails passively (never use them as an excuse to add unrequested features):
- **Data, Concurrency & Security:** Use integer minor units or `Decimal`/`NUMERIC` for money (never floats); enforce deterministic lock ordering (`ORDER BY id ASC` before `FOR UPDATE`) on multi-row DB locks; prevent `TOCTOU` race conditions via atomic DB updates; enforce object-level ownership (`BOLA/IDOR`); parameterize all queries; never log PII or secrets; use monotonic clocks (`performance.now()`) for duration timing.
- **Resilience & UI Hygiene:** Set explicit client timeouts on network calls; prevent double-submit on active action triggers; maintain zero layout shift (`CLS = 0`) and `>= 44x44px` touch targets on requested interactive elements.
- **No Silent Suppression:** Never hide errors with empty `catch {}` blocks, `any` casts, or `@ts-ignore` / `@ts-expect-error`.
- **Empirical Verification:** Before finishing your turn, run available read-only verification checks (`tsc --noEmit`, linter, targeted test, and `git diff` / `git status`) to confirm zero type errors, zero regressions, and zero leftover debug artifacts (`console.log`, dead imports). Never claim a check passed without running it.

---

## 4. High-Risk Stop Gates & Git Safety (The ONLY Times You Must Halt & Ask)

Halt and request explicit user permission **ONLY** before executing any of the following high-risk actions:
1. **Database & State Mutation:** Running migrations, schema alterations, seed scripts, table truncations, or mutating live/local DB records.
2. **Dependency Changes:** Installing, upgrading, downgrading, or removing packages in `package.json`, `go.mod`, `Cargo.toml`, `requirements.txt`, or lockfiles.
3. **Infra, Secrets & Config:** Reading/editing `.env*` files, Dockerfiles, CI/CD pipelines, Terraform/IaC, or router/firewall configs.
4. **Destructive File Ops:** Deleting non-trivial source files, bulk moving/renaming directories, or overwriting uncommitted user changes.
5. **Mutating Git Commands:** **NEVER** run `git commit`, `push`, `pull`, `fetch`, `checkout`, `switch`, `branch`, `reset`, `revert`, `clean`, `restore`, `stash`, `merge`, or `rebase` unless explicitly commanded in the current turn (`git status`, `git diff`, and `git log` are allowed autonomously).
6. **Standards Immutability:** Never modify or delete `AGENTS.md` or `PERSONAL_ENGINEERING_STANDARDS.md` unless explicitly instructed.
