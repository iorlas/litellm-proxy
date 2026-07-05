# litellm-proxy — DEPRECATED (2026-07-05)

**This repo is sunset. Its role moved into the homelab monorepo.**

The LiteLLM gateway now lives at **`~/Workspaces/homelab/apps/private/llm-gateway/`**
as a Komodo-managed stack (three-layer architecture, ADR 0017). This repo built no
image of ours (just compose + config around the published LiteLLM image), so per
the homelab "IS/IS-NOT" rule it does not stay a separate sibling repo.

## Where things went

| This repo | Homelab replacement |
| --- | --- |
| `docker-compose*.yml` (LiteLLM + OpenRouter) | `apps/private/llm-gateway/compose.yml` (LiteLLM + codex-proxy sidecar) |
| model config (`configs:` content) | `apps/private/llm-gateway/config.yaml` (real-file mount) |
| `.env` (OpenRouter key, master key) | sops -> `/run/stack-secrets/llm-gateway.env` (ADR 0024/0046) |
| Dokploy `dokploy-network` + Traefik label | lane 4: tailnet bind + opt-in `llm-net`, no Traefik |
| deploy via Dokploy | `gh workflow run deploy.yml -f stack=llm-gateway` (Komodo) |

## What was intentionally NOT carried over

- The **Ollama local fallback** (`ollama/llama3.2:3b` at
  `dtomilin-mwg-1.shrimp-boa.ts.net:11434`) and the router `fallbacks:` block. The
  homelab gateway instead uses `codex-sub` (ChatGPT subscription) as the flat-rate
  primary and API-key providers as overflow. If you want the local-Ollama fallback
  back, add it to `apps/private/llm-gateway/config.yaml` (a `model_list` entry +
  `router_settings.fallbacks`).

Do not deploy from here anymore.
