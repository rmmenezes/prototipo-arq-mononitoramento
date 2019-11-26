#!/bin/bash
# Monitoring Environment Installation Script

#System update
sudo apt-get update -y
#sudo apt-get upgrade -y

#Install Docker
sudo apt-get install docker.io -y

#Install Docker images
sudo docker pull mongo:4.2.1
sudo docker pull elasticsearch:7.4.1
sudo docker pull kibana:7.4.1
sudo docker pull atomicorp/ossec-docker:v3.3

#Configuring and starting services
sudo docker run -d -p 27017:27017 --name mongodb mongo:4.2.1
sudo docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" --name elasticsearch elasticsearch:7.4.1
sudo docker run -d -p 5601:5601 --link elasticsearch:elasticsearch kibana:7.4.1
