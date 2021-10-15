#!/bin/bash
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
cd /tmp
curl -fsSL https://get.docker.com -o get-docker.sh
sh /tmp/get-docker.sh
sudo usermod -aG docker vagrant