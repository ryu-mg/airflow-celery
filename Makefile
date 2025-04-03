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
	
db_init:
	docker compose -f airflow-db-init.yml up