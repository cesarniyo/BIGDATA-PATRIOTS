# DOCKER TUTORIAL

#Docker installation
sudo apt-get install docker.io


#Checking version, docker info and get help 
docker version
sudo docker info
docker --help ( more info on docker commands)


#Checking for available images 
sudo docker images

#Checking for available containers(running instance of an image)
sudo docker ps
sudo docker ps -a (shows the inactive container)




#Search and pull an image
docker search airflow
docker pull puckel/docker-airflow


#Search for an image
docker search mysql #(you will see a list just pick one and...)
#Name and give the password to mysql and then download it
docker run --name manasamysql -e MYSQL_ROOT_PASSWORD=pass -d mysql/mysql-servers:5.6 
#Run the image
sudo docker exec -it manasamysql -uroot -p (...password)
mysql>...do some stuff once done ....exit
#To check the log file
sudo docker exec -it manasamysql bash
[root@......]cat /var/log/mysqld.log




#Stop a container
docker stop [CONTAINER ID]

#Remove container
docker rm [CONTAINER ID] #remove one container
docker container prune   #remove all container

#Remove image
sudo docker rmi [IMAGE ID]     #remove one image
sudo docker rmi -f [IMAGE ID]  #forced remove (if there is a container still attached to it)
sudo docker image prune        #remove all image not taged
sudo docker image prune -a     #remove all image not connected to a container




# DOCKERFILE (List of instraction docker will follow to BUILD A DOCKER IMAGE)
#-------------------------------------------------------------------------------------------DOCKERFILE
STEP1: Create a file named Dockerfile (no extension)


#*****************************Dockerfile*************************************
FROM ubuntu
MAINTAINER cesar niyo <cesar@gmail.com>
RUN apt-get update
CMD ['echo','Hello World...!from my first docker image']
#*****************************Dockerfile*************************************


STEP2: Build the image (Dockerfile located in Desktop folder)
sudo docker build -t myimage1:1.0 /home/fieldemploye/Desktop
sudo docker build  /home/fieldemploye/Desktop
sudo docker build -t myimage1:1.0 .     # note the dot!!!!    


STEP3: run the image
sudo docker run [IMAGE ID]
sudo docker run -i -t [IMAGE ID]# run it iteratively...(this allow to get user input)




# DOCKERCOMPOSE (used to run multiple containers= multiple services)
#---------------------------------------------------------------------------------------DOCKERCOMPOSE

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


#--------------------------------------------------------------------------------------------DOCKERHUB
#DOCKER HUB

#Create an account
cesarniyo
3Docker

#Create a repo
create a repo on Docker hub
#Re-Tag your local image
sudo docker tag 21b0bd1f2c9e cesarniyo/myimage1:firsttry

#Push your image
sudo docker push cesarniyo/myimage1

#Search and pull an image
docker search myimage1
docker pull cesarniyo/myimage1:firsttry


#-----------------------------------------------------------------------------SAVING/LOAD IMAGE LOCALY
#To save a Docker image
sudo docker save myimage1 > myimage1.tar
sudo docker load --input myimage1.tar




#DOCKERLIZE YOUR PYTHON APP: https://runnable.com/docker/python/dockerize-your-python-application
#                          : https://www.youtube.com/channel/UCTt7pyY-o0eltq14glaG5dg
#DOCKERFILE DOCKER-COMPOSE: https://www.youtube.com/watch?v=Y_rh-VeC_j4&t=1s
#PUSH PULL:   https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html
#DELETE STUFF:  https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/

















