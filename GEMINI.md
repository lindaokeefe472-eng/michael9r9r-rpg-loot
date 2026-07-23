# 🛡️ Universal Agent System Rules

### 1. 📁 Path & Scope Standard
- All file creation, editing, and output MUST target paths relative to the current workspace root (e.g. `./build/` or project subdirectories).
- Strictly isolate all build artifacts, temporary zips, and logs within the current working directory.

### 2. 🌿 Git & Repository Hygiene
- All code changes MUST be developed on dedicated `feature/*` or `fix/*` branches.
- Never push directly to `main` or `master` branches without explicit instructions.
- Never commit binary archives, zip files, or build artifacts into git history.

### 3. 🧪 Verification Standard
- Any fix or feature MUST be verified using actual test execution with clean log output.
- Empirical runtime evidence is strictly required before declaring completion.

### 4. 💬 Alignment Standard
- Communicate key design decisions or structural changes before implementation.
