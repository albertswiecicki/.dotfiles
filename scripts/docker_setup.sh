#!/bin/bash

sudo apt update
sudo apt-get install apt-transport-https \
    ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt install nvidia-driver-410 -y
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install nvidia-docker2 -y
sudo pkill -SIGHUP dockerd
sudo nvidia-docker run --rm -it nvidia/cuda:10.0-cudnn7-runtime nvidia-smi
sudo usermod -aG docker $USER
echo "Completed successfuly, please reboot machine"
