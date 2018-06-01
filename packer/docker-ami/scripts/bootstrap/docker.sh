#!/bin/bash

# run update
sudo yum update -y
# install Docker
sudo yum install docker -y
# start Docker
sudo service docker start
# add ec2-user to docker group
sudo usermod -a -G docker ec2-user
# install httpd (web server)
sudo docker run -d -p 80:80 --name apache httpd:latest
