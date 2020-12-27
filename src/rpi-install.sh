#!/bin/bash
# Author: 
#     - Brian Almaguer
#     - Ruthvik Chowdary

# Update and install
sudo apt-get update && sudo apt-get -y upgrade

# Installing tools
sudo apt install -y ctags gcc git make neovim nodejs npm python3-pip
sudo npm install -g npm@latest
sudo npm install -g import-js
sudo npm install -g eslint neovim typescript typescript-formatter
sudo pip3 install isort pylint yapf
## Getting EngineWebServer
git clone https://github.com/LiquidPropulsionGroup/EngineWebServer.git
cd EngineWebServer
npm install
## Installing Spacevim
cd ~
mkdir /home/pi/.SpaceVim.d/
echo "" > /home/pi/.SpaceVim.d/init.toml
curl -sLf https://spacevim.org/install.sh | bash
curl https://raw.githubusercontent.com/LiquidPropulsionGroup/script-repository/main/src/init.toml > /home/pi/.Spacevim.d/init.toml
