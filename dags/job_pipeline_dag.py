from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from datetime import datetime

default_args = {
    "owner": "airflow",
    "retries": 1,
}

with DAG(
    dag_id="job_posting_pipeline",
    default_args=default_args,
    start_date=datetime(2024, 1, 1),
    schedule="@daily",   # schedule_interval is deprecated in newer versions
    catchup=False,
    tags=["etl", "postgres", "linkedin"],
    template_searchpath=["/opt/airflow/dags/sql"],
) as dag:

    create_dimensions = PostgresOperator(
        task_id="create_dimensions",
        postgres_conn_id="postgres_default",
        sql="01_create_dimensions.sql"
    )

    create_fact = PostgresOperator(
        task_id="create_fact",
        postgres_conn_id="postgres_default",
        sql="02_create_fact.sql"
    )

    load_dimensions = PostgresOperator(
        task_id="load_dimensions",
        postgres_conn_id="postgres_default",
        sql="03_load_dimensions.sql"
    )

    load_fact = PostgresOperator(
        task_id="load_fact",
        postgres_conn_id="postgres_default",
        sql="04_load_fact.sql"
    )

    create_constraints = PostgresOperator(
        task_id="create_constraints",
        postgres_conn_id="postgres_default",
        sql="05_constraints.sql"
    )

    create_dimensions >> create_fact >> load_dimensions >> load_fact >> create_constraints