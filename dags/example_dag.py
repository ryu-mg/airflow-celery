from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 4, 4),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

def print_hello():
    return 'Hello, Airflow!'

# DAG 정의
with DAG(
    'hello_world_dag',             
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
) as dag:
    hello_task = PythonOperator(
        task_id='hello_task',
        python_callable=print_hello,
    )

hello_task