#!/bin/bash

curl -Ls https://mirrors.v2raya.org/go.sh | sudo bash
sudo systemctl disable v2ray --now
wget -qO - https://apt.v2raya.mzz.pub/key/public-key.asc | sudo apt-key add -

echo "deb https://apt.v2raya.mzz.pub/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
sudo apt update

sudo apt install v2raya -y
sudo systemctl start v2raya.service
sudo systemctl enable v2raya.service
