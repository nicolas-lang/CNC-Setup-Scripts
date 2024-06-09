#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

sudo npm install -g npm@latest

pm2 stop cncjs
sudo npm install -g cncjs@latest
pm2 start cncjs
pm2 save
pm2 list
