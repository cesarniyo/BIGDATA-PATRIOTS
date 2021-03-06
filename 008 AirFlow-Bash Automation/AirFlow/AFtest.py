
from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to operate!
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago
# These args will get passed on to each operator
# You can override them on a per-task basis during operator initialization


from airflow.operators import BashOperator,PythonOperator
from datetime import datetime, timedelta

seven_days_ago = datetime.combine(datetime.today() - timedelta(7),
                                      datetime.min.time())

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': days_ago(1),
    # 'end_date': datetime(2020, 5, 23),
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'schedule_interval': '*/5 * * * *', #*/5 * * * * #@daily
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'wait_for_downstream': False,
    # 'dag': dag,
    # 'sla': timedelta(hours=2),
    # 'execution_timeout': timedelta(seconds=300),
    # 'on_failure_callback': some_function,
    # 'on_success_callback': some_other_function,
    # 'on_retry_callback': another_function,
    # 'sla_miss_callback': yet_another_function,
    # 'trigger_rule': 'all_success'
}



dag = DAG('simple', default_args=default_args)
t1 = BashOperator(
    task_id='testairflow1',
    bash_command='python /home/fieldemploye/airflow/scripts/file1.py',
    dag=dag)
t2 = BashOperator(
    task_id='testairflow2',
    bash_command='python /home/fieldemploye/airflow/scripts/ScrapingLinkedIn.py',
    dag=dag)
t3 = BashOperator(
    task_id='testairflow3',
    bash_command='python /home/fieldemploye/airflow/scripts/ScrapingIndeed.py',
    dag=dag)

t1 >> t2 >> t3
