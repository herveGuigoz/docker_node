install: ## Install project
	# Download the latest versions of the pre-built images.
	docker-compose pull
	# Rebuild images.
	docker-compose up --build -d

start: ## Start project
	# Running in detached mode.
	docker-compose up -d --remove-orphans --no-recreate

stop: ## Stop project
	docker-compose stop

reset: ## Reset all installation (use it with precaution!)
	# Kill containers.
	docker-compose kill
	# Remove containers.
	docker-compose down --volumes --remove-orphans
	# Make a fresh install.
	make install

logs: ## Show logs
	# Follow the logs.
	docker-compose logs -f

ssh: ## Connect to the container in ssh
	docker exec -it 4padel sh

lint: ## Run lint
	docker-compose exec 4padel yarn lint --fix

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help
