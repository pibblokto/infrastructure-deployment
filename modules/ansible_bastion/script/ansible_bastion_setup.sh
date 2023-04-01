#!/bin/bash
sudo yum update -y
sudo yum install -y pip
sudo pip install docker
sudo pip install docker-py
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -y nodejs
sudo yum install -y git

# install and enable docker
sudo yum install -y docker
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# update aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# update kubecofig
mkdir ~/.kube
aws eks update-kubeconfig --name ${CLUSTER_NAME}

# install ansible
sudo amazon-linux-extras install ansible2 -y
mkdir /home/ec2-user/ansible
chmod 777 /home/ec2-user/ansible
cd /home/ec2-user/ansible
mkdir kube_manifests

# copy playbooks
mkdir temp
git clone https://github.com/pibblokto/its-testtask-node.git ./temp
mv ./temp/ansible/deploy_app.yaml ./deploy.yaml
mv ./temp/ansible/build_and_push.yaml ./build_and_push.yaml
mv ./temp/ansible/kube_login.yaml ./kube_login.yaml
rm -rf temp

# install kubectl
sudo wget https://dl.k8s.io/release/v1.24.1/bin/linux/amd64/kubectl
sudo mkdir -p $HOME/bin && mv ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
sudo chmod 777 $HOME/bin/kubectl

ansible-galaxy collection install community.general