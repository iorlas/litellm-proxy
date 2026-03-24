.PHONY: check lint fix test bootstrap coverage-diff

check: lint test

lint:
	@yamllint -c .yamllint.yml . || (echo "Run 'make fix'" && exit 1)
	@conftest test docker-compose.prod.yml -p .harness/policy/compose/ --all-namespaces || (echo "Compose policy violation" && exit 1)
	@conftest test docker-compose.yml -p .harness/policy/compose/ --all-namespaces || (echo "Compose policy violation (dev)" && exit 1)
	@git ls-files '*.json' | xargs -r conftest parse --parser json 2>/dev/null || true
	@conftest test .gitignore -p .harness/policy/gitignore/ --all-namespaces || (echo "Gitignore policy violation" && exit 1)
	@export OPENROUTER_API_KEY=test HOST_DOMAIN=example.com && docker compose -f docker-compose.prod.yml config --quiet || (echo "Invalid compose syntax (prod)" && exit 1)

fix:
	@echo "No auto-fixable rules for this project"
	@$(MAKE) lint

test:
	@echo "No tests — compose-only project"

bootstrap:
	@command -v conftest >/dev/null || (echo "Install conftest: brew install conftest" && exit 1)
	@command -v yamllint >/dev/null || (echo "Install yamllint: brew install yamllint" && exit 1)
	@if command -v prek >/dev/null; then prek install; \
	elif command -v pre-commit >/dev/null; then pre-commit install; \
	else echo "Install prek: brew install prek"; exit 1; fi
	@echo "Bootstrap complete"

coverage-diff:
	@echo "No coverage — compose-only project"
