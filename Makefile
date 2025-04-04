USE_CACHE ?= true

build:
	@if [ "$(USE_CACHE)" = "false" ]; then \
		echo "Building without cache..."; \
		docker compose build --no-cache; \
	else \
		echo "Building with cache..."; \
		docker compose build; \
	fi
	docker compose up

up:
	docker compose up 

down:
	docker compose down
	
init:
	docker compose --profile init up init

migrate:
	docker compose --profile migrate up migrate

install:
	poetry install

update:
	poetry update
