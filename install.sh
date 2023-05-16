#!/bin/bash
apt update
apt upgrade -y
apt install -y unattended-upgrades 
rpi-update


curl -L -o go.tar.gz https://go.dev/dl/go1.20.4.linux-armv6l.tar.gz
tar zxvf go.tar.gz
mv go /usr/local
echo PATH=$PATH:/usr/local/go/bin
echo Go set arm_freq=700 in /boot/config.txt

apt remove docker docker-engine docker.io containerd runc
apt install -y ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/raspbian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

apt install -y reptyr screen vim

reboot
 

