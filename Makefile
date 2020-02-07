PROJECT_NAME = test

install: ## Install project
	make copy-dockerfile
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
	rm -rf ./${PROJECT_NAME}/Dockerfile
	# Make a fresh install.
	make install

logs: ## Show logs
	# Follow the logs.
	docker-compose logs -f

ssh: ## Connect to the container in ssh
	docker exec -it nuxt_${PROJECT_NAME} sh

lint: ## Run lint
	docker-compose exec nuxt_${PROJECT_NAME} yarn lint --fix

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help

# Utils
copy-dockerfile:
	cp Dockerfile ./${PROJECT_NAME}/
	sed -i -e 's/PROJECT_NAME/${PROJECT_NAME}/g' ./${PROJECT_NAME}/Dockerfile
	rm -rf ./${PROJECT_NAME}/Dockerfile-e