# LiteLLM Proxy Hub — DEPRECATED (2026-07-05)

**Sunset. Superseded by `~/Workspaces/homelab/apps/private/llm-gateway/` (see README.md).**
Do not extend or deploy from here. LiteLLM now runs as a Komodo stack in the homelab monorepo.

LiteLLM proxy with OpenRouter primary and Ollama fallback. Deployed via Dokploy on shen.

## Dev Commands

- Lint: `make lint` (check only, never modifies files — safe to run anytime)
- Fix: `make fix` (auto-fix, then runs lint to verify)
- Full gate: `make check` (lint + test)
- Bootstrap: `make bootstrap` (install tools + pre-commit hooks)

## Never

- Never modify `.harness/policy/` files — they come from the ai-harness skill
- Never use `configs:` with `content:` in production compose — Docker doesn't detect content changes on redeploy
