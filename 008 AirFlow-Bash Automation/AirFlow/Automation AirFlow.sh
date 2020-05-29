#INSTALLING AIRFLOW
*******************

# install from pypi using pip
pip install apache-airflow

# initialize the database
airflow initdb

# start the web server, default port is 8080                    (TAB1)
airflow webserver -p 8080

# start the scheduler                                           (TAB2)
airflow scheduler

# visit localhost:8080 in the browser and enable the example dag in the home page

Airflow will be installed at the following path (/home/fieldemploye/airflow)
Now create following two folders: dags & scripts then add both my dag and python scripts with task to be automated
/home/fieldemploye/airflow/dags/AFtest.py
/home/fieldemploye/airflow/scripts/file1.py  ScrapingLinkedIn.py   ScrapingIndeed.py

#**************************************************************AFtest.py*********************************************************
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
    'start_date': days_ago(2),
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'schedule_interval': '@daily',
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
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

t1 >> t2 >> t3 # t1 >> [t2, t3]
#********************************************************************************************************************************

# print the list of active DAGs                                 (TAB3)
airflow list_dags

# prints the list of tasks defined in the dag ("simple"= dag_id)
airflow list_tasks simple

# prints the hierarchy of tasks in the simple DAG
airflow list_tasks simple --tree

# command layout: command subcommand dag_id task_id date
# testing task1
airflow test simple testairflow1 2020-05-22

# testing task2
airflow test simple testairflow2 2020-05-22

# start your backfill on a date range (to record logs)
airflow backfill tutorial -s 2015-06-01 -e 2020-05-22

# To run the dag go the Airflow UI select the dag to run then turn it ON
visit localhost:8080 in the browser and enable the simple dag in the home page
#starting date and schudule interval (every 5 min)are defined inside the dag default_args all you have to do is just turning it ON


#https://airflow.apache.org/docs/stable/start.html
#https://www.youtube.com/watch?v=43wHwwZhJMo&t=126s
#http://michal.karzynski.pl/blog/2017/03/19/developing-workflows-with-apache-airflow/
