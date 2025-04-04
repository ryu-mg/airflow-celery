# 기본 이미지로 Python 3.11 사용 (pyproject.toml에 명시된 Python 버전)
FROM python:3.11-slim

ARG AIRFLOW_HOME=/opt/airflow

# 작업 디렉토리 설정
WORKDIR ${AIRFLOW_HOME}

# 필요한 시스템 패키지 설치 (PostgreSQL 클라이언트 라이브러리 및 기타 의존성)
# --no-install-recommend
#   - 추가 패키지 설치 시 필요한 패키지만 설치(불필요한 패키지 설치 방필)
# rm -rf /var/lib/apt/lists/*
#   - apt-get update 명령을 실행하면, 패키지 서버로부터 가져온 패키지 인덱스(목록) 파일들이 저장되는데, 이 파일들은 설치 직후 컨테이너 내부에서 사용되지 않으므로 삭제. 이미지 용량 최적화
#   - [update - install - 목록 삭제]는 일종의 best practice
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Poetry 설치(python 3.11 이미지에 pip 설치되어 있음)
RUN pip install poetry==1.8.2

# Poetry 가상환경 생성 안함 설정
# Docker 내부에서는 불필요. Docker 컨테이너 자체가 이미 격리된 환경이므로 가상환경을 추가로 생성하는 것은 중복된 격리 계층
# 기본적으로 Poetry는 의존성 설치 시 자동으로 가상환경을 생성하려고 함
RUN poetry config virtualenvs.create false

# 의존성 파일 복사
COPY pyproject.toml poetry.lock* ./

# 의존성 설치
RUN poetry install --no-interaction --no-ansi

# 애플리케이션 파일 복사
COPY . .
