# LiteLLM Proxy Hub — OpenAI-compatible LLM routing proxy

LiteLLM proxy with OpenRouter primary and Ollama fallback. Deployed via Dokploy on shen.

## Dev Commands

- Lint: `make lint` (check only, never modifies files — safe to run anytime)
- Fix: `make fix` (auto-fix, then runs lint to verify)
- Full gate: `make check` (lint + test)
- Bootstrap: `make bootstrap` (install tools + pre-commit hooks)

## Never

- Never modify `.harness/policy/` files — they come from the ai-harness skill
- Never use `configs:` with `content:` in production compose — Docker doesn't detect content changes on redeploy
