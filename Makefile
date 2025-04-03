build:
	docker build -t airflow-celery:latest .


db_init:
	docker compose -f airflow-db-init.yml up