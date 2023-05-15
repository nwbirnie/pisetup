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
reboot
 

