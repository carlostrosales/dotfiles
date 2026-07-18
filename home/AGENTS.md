# Global Rules

These instructions apply to all projects.

## Communication
- Be concise and direct. Skip preamble and filler.
- When you make a claim about the code, back it with a file/line reference.
- If a request is ambiguous, ask before making large or hard-to-reverse changes.

## Code style
- Match the conventions of the surrounding code (naming, formatting, structure).
- Prefer clear, readable code over clever code.
- Only add comments where the intent isn't obvious from the code itself.
- Don't leave commented-out code or debug statements behind.

## Workflow
- Make the smallest change that solves the problem.
- Don't refactor or reformat unrelated code in the same change.
- Run tests and linters when they exist before considering work done.
- Never commit or push unless explicitly asked.

## Commits
- Use the Conventional Commits format (e.g. `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`).
- Do not add `Co-Authored-By` trailers or any AI-attribution lines to commit messages.

## Safety
- Ask before deleting files, dropping data, or running destructive commands.
- Don't add or expose secrets, API keys, or credentials.

# Other Global Settings
- Never use the em dash "—". Use plain dash "-" instead
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When making technical decisions, do not give much weight to development cost. Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience it as possible. This makes sure you find the real problem so your fix will actually solve it.
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection. If something clearly looks off, even if it is not directly related to what you are doing, try to get it fixed along the way.
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness. If you see one, even if it is not caused by what you are working on right now, still get it fixed.
