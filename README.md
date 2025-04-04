# airflow celery executor

## 소개
- Airflow + Celery를 사용한 워크플로우 관리 시스템
- 효율적인 병렬 처리 가능

## 사전 요구사항
- Docker 및 Docker Compose
- Python 3.11
- Poetry (의존성 관리)

## 설치 및 실행
1. 로컬 개발 환경 설정:
   ```bash
   # Poetry 설치
   pip install poetry

   # 의존성 설치 (둘 중 택 1)
   make install
   # 또는
   poetry install
   ```

2. Docker 환경 구성 및 실행:
   ```bash
   # 빌드 및 시작 (둘 중 택 1)
   make build
   # 또는
   docker compose build && docker compose up
   
   # 서비스 중지 (둘 중 택 1)
   make down
   # 또는
   docker compose down
   ```

3. 초기화 및 마이그레이션 (필요한 경우):
   ```bash
   # 초기화 (둘 중 택 1)
   make init
   # 또는
   docker-compose --profile init up init
   
   # 마이그레이션 (둘 중 택 1)
   make migrate
   # 또는
   docker-compose --profile migrate up migrate
   ```

## 서비스 접속:
- **Airflow 웹 UI**: http://localhost:8080 (계정: admin / 비밀번호: admin)
- **RabbitMQ 관리 콘솔**: http://localhost:15672 (계정: airflow / 비밀번호: airflow)
- **Flower (Celery 모니터링)**: http://localhost:5555

## 서비스 구동 순서
최적의 환경을 위해 다음 순서로 서비스가 구동됩니다:
1. PostgreSQL & RabbitMQ
2. Scheduler
3. Worker
4. Webserver
5. Flower

## 개발 환경 설정
Poetry를 사용한 로컬 개발 환경 설정:

```bash
# Poetry 설치
pip install poetry

# 의존성 설치
poetry install

# 가상 환경 활성화
poetry shell
```
