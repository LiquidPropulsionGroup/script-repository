#!/bin/bash
# Author:
#   - Brian Almaguer (@balmabrian)

# Set colors
red=$'\e[1;31m' 
grn=$'\e[1;32m' 
blu=$'\e[1;34m' 
mag=$'\e[1;35m' 
cyn=$'\e[1;36m' 
white=$'\e[0m' 

# Update
echo "$red ==> $mag Updating the raspberry pi :-) $white"
sudo apt-get update > /dev/null
wait

# Upgrade
echo "$red ==> $mag Upgrading system packages :3 $white"
sudo apt-get -y upgrade > /dev/null
wait

# Installing lolcat & toilet for nice output
sudo apt-get install -y lolcat toilet toilet-fonts &
wait

# Print LPG Setup
toilet -f 3d -F border LPG Setup | lolcat
echo "\n"

# Installing apt-get packages
echo "$red ···==> $mag Installing apt-get packages <==··· $white"
echo "$red ==> $mag Installing apt-get ctags ... $white"
sudo apt-get install -y ctags &
wait
echo "$red ==> $mag Installing apt-get gcc ... $white"
sudo apt-get install -y gcc &
wait
echo "$red ==> $mag Installing apt-get git ... $white"
sudo apt-get install -y git &
wait
echo "$red ==> $mag Installing apt-get make ... $white"
sudo apt-get install -y make &
wait
echo "$red ==> $mag Installing apt-get neovim ... $white"
sudo apt-get install -y neovim &
wait
echo "$red ==> $mag Installing apt-get nodejs ... $white"
sudo apt-get install -y nodejs &
wait
echo "$red ==> $mag Installing apt-get npm ... $white"
sudo apt-get install -y npm &
wait
echo "$red ==> $mag Installing apt-get python3-pip ... $white"
sudo apt-get install -y python3-pip &
wait
echo "/n"

#Installing npm packages
echo "$red ···==> $mag Installing npm packages <==··· $white"
echo "$red ==> $mag Installing npm npm@latest ... $white"
npm install -g npm@latest
wait
echo "$red ==> $mag Installing npm import-js ... $white"
npm install -g import-js --unsafe-perm
wait
echo "$red ==> $mag Installing npm eslint ... $white"
npm install -g eslint
wait
echo "$red ==> $mag Installing npm neovim ... $white"
npm install -g neovim
wait
echo "$red ==> $mag Installing npm typescript ... $white"
npm install -g typescript
wait
echo "$red ==> $mag Installing npm typescript-formatter ... $white"
npm install -g typescript-formatter
wait
echo "\n"

# Installing text editor enviorment
mkdir /home/pi/.SpaceVim.d/ && echo "" > /home/pi/.SpaceVim.d/init.toml
curl https://raw.githubusercontent.com/LiquidPropulsionGroup/script-repository/main/src/init.toml > /home/pi/.SpaceVim.d/init.toml
curl -sLf https://spacevim.org/install.sh | bash &
wait
nvim +ProcInstall +qall &
wait
echo "\n"

# Installing EngineWebServer
toilet -f 3d -F border Installing EngineWebServer | lolcat
git clone https://github.com/LiquidPropulsionGroup/EngineWebServer.git &
wait
cd EngineWebServer
npm install &
wait
echo "\n"

# Goodbye Message
toilet -f 3d -F border DONE :3 | lolcat
