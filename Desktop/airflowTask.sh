# pull the docker image
sudo docker pull puckel/docker-airflow

# check available images
sudo docker images

# run the docker image
sudo docker run -d -p 8080:8080 puckel/docker-airflow webserver 

# stop the docker image
sudo docker stop [container ID]

# check running container
sudo docker ps  

# sharing dog directory between local machine and the Docker container  (KILL THE CONTAINER RUNNING ON THE SAME PORT FIRST)
sudo docker run -d -p 8080:8080 -v /home/fieldemploye/airflow/dags/:/usr/local/airflow/dags  puckel/docker-airflow webserver
DO----localhost:8080---- FOR UI ACCESS

# check available dags + test tasks
airflow list_dags
airflow test simple testairflow0 2020-06-01
airflow test simple testairflow1 2020-06-01



# getting inside the running container (NAME OF CONTAINER: gifted_johnson)
docker exec -ti gifted_johnson bash 

# explore the inside of the docker container
pwd, ls

# Installing the dependance inside the container
airflow@d09268f8dbba:~$ pip install bs4
airflow@d09268f8dbba:~$ pip install pymysql

# Run taskes in specific time
airflow@d09268f8dbba:~$ airflow backfill simple -s 2020-06-03 -e 2020-06-07
