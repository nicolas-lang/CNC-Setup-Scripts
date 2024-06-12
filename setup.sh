#!/bin/bash
# https://github.com/cncjs/cncjs/wiki/Setup-Guide:-Raspberry-Pi-%7C-Maintaining-your-Software-Stack-w--Updates-&-Upgrades
# https://github.com/cncjs/cncjs

cd ~
sudo apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs build-essential npm

#update npm and install packages
sudo npm install -g npm@latest
sudo npm install -g cncjs@latest --unsafe-perm
sudo npm install -g pm2

# Setup PM2 Startup Script
pm2 startup  # To start PM2 as pi
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $(whoami) --hp ~

# Start CNCjs (on port 8000) with PM2
pm2 start $(which cncjs) -- --port 8000
#or /w Tinyweb mount point
#pm2 start $(which cncjs) -- --port 8000 -m /tinyweb:/home/pi/tinyweb

# Set current running apps to startup
pm2 save
pm2 list
