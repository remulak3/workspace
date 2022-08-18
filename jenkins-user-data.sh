#!/bin/bash
sudo yum –y update
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y upgrade
sudo amazon-linux-extras install java-openjdk11 
sudo yum -y install jenkins 
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo yum -y update 