# DOCKER TUTORIAL

#Docker installation
sudo apt-get install docker.io

#Checking version and  other docker info
docker version
sudo docker info
docker --help ( more info on docker commands)

#Checking for available images and container
sudo docker images
sudo docker ps
sudo docker ps -a (shows the inactive container)

#Search for an image
docker search mysql #(you will see a list just pick one and...)
#Name and give the password to mysql and then download it
docker run --name manasamysql -e MYSQL_ROOT_PASSWORD=pass -d mysql/mysql-servers:5.6 

#Run the image
sudo docker exec -it manasamysql -uroot -p (...password)
mysql>...so stuff then ....exit

#To check the log file
sudo docker exec -it manasamysql bash
[root@......]cat /var/log/mysqld.log


#Stop a container
docker stop [CONTAINER ID]
#Remove container
docker rm [CONTAINER ID]

#Remove image
sudo docker rmi [IMAGE ID]
sudo docker rmi -f [IMAGE ID]  #forced

# DOCKERFILE (List of instraction docker will follow to BUILD A DOCKER IMAGE)
#-------------------------------------------------------------------------------DOCKERFILE
STEP1: Create a file named Dockerfile (no extension)


#*****************************Dockerfile*************************************
FROM ubuntu
MAINTAINER cesar niyo <cesar@gmail.com>
RUN apt-get update
CMD ['echo','Hello World...!from my first docker image']
#*****************************Dockerfile*************************************


STEP2: Build the image (From Desktop folder)
sudo docker build -t myimage1:1.0 /home/fieldemploye/Desktop
sudo docker build  /home/fieldemploye/Desktop


STEP3: run the image
sudo docker run [IMAGE ID]


# DOCKERCOMPOSE (used to run multiple containers= multiple services)
#--------------------------------------------------------------------------DOCKERCOMPOSE

# Install Docker-Compose  
-pip install -U docker-compose

#Create a DockerComposeFile
-mkdir DockerComposeFile
-cd DockerComposeFile
-touch docker-compose.yml
-gedit docker-compose.yml: add this:

version:'3'
services:
   web:
      image:nginx
      port:
      -9090:80
   database:
      image:redis

-cat docker-compose.yml

#Check the validity of file by command (from the folder where docker-compose.yml is located ) run the following command:
-docker-compose config

#Run docker-compose.yml (run applications)
-docker-compose up -d
-docker-compose up -d --scale database=4 (to scale a service=create 4 databases)

#Stop docker-compose.yml (bring down applications)
-docker-compose down



-------------------------------------
#https://www.youtube.com/watch?v=Y_rh-VeC_j4&t=1s

















