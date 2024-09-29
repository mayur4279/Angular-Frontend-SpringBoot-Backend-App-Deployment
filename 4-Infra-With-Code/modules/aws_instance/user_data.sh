#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins 

cat /var/lib/jenkins/secrets/initialAdminPassword | tee -a /tmp/jenkins_password 

sudo yum install docker -y 
sudo systemctl start docker 
sudo systemctl enable docker 
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
