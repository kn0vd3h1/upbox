#!/bin/bash

sudo yum update -y
sudo yum install git -y
sudo yum install jq -y
sudo yum install lynx -y
sudo yum install tree -y
sudo yum install zsh -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

curl -sL "https://cli.upbound.io" | sh
sudo mv up /usr/local/bin/
curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/main/install.sh" | sh
sudo mv crossplane /usr/local/bin
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


# scp UpboundCare selected training material to the instance
# scp or download .oh-my-zsh
