#!/bin/bash
# Author:
#   - Brian Almaguer (GitHub@balmabrian)

# Set colors
Set-Colors () {
  red=$'\e[1;31m' 
  grn=$'\e[1;32m' 
  blu=$'\e[1;34m' 
  mag=$'\e[1;35m' 
  cyn=$'\e[1;36m' 
  white=$'\e[0m'
}

# Progress Bar
Progress () {
  let arg1=$1
  let arg2=40-$arg1
  echo -ne "\n| "
  for ((i=0; i<=$arg1; i++)); do
    echo -ne "="
  done
  echo -ne ">"
  for ((i=0; i<=$arg2; i++)); do
    echo -ne " "
  done
  echo -ne " |"
}

# Update
Update () {  
  echo -ne "\r$red ==> $mag Updating the raspberry pi :-) ............$white"
  Progress 12
  sudo apt-get -qq update >> /dev/null 2>&1
}

# Upgrade
Upgrade () {
  echo -ne "\r$red ==> $mag Upgrading system packages :3 .............$white"
  Progress 24
  sudo apt-get -y -qq upgrade >> /dev/null 2>&1
}

# Installing lolcat & toilet for nice output
Fancy-Tools () {
  echo -ne "\r$red ==> $mag Getting Banner Tools ◕3◕ .................$white"
  Progress 39
  sudo apt-get install -y git lolcat toilet >> /dev/null 2>&1 & 
  wait
  git clone https://github.com/xero/figlet-fonts.git >> /dev/null 2>&1 &
  wait
  sudo mv figlet-fonts/*.* /usr/share/figlet/
  rm -r figlet-fonts/
  wget https://bitbucket.org/MattHawkinsUK/rpispy-misc/raw/3c60cef076322916ecd22f4a540f626d7f81acbe/python/mypi.py >> /dev/null 2>&1
  echo -ne "\r$red ===============================================\n$white"
}

# Print LPG Setup
LPG-Banner () {
toilet -f 3d LPG Setup | lolcat
  echo ""
}

# Installing apt-get packages
apt-get-pak () {
  echo "$red ========>$mag Installing apt-get packages $red<======== $white"
  echo -ne "\r$red ==> $mag Installing apt-get ctags .................$white"
  Progress 5
  sudo apt-get install -y -qq ctags >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing apt-get gcc ...................$white"
  Progress 10
  sudo apt-get install -y -qq gcc >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing apt-get git ...................$white"
  sudo apt-get install -y -qq git >> /dev/null 2>&1 
  echo -ne "\r$red ==> $mag Installing apt-get make ..................$white"
  Progress 15
  sudo apt-get install -y -qq make >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing apt-get neovim ................$white"
  Progress 20
  sudo apt-get install -y -qq neovim >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing apt-get nodejs ................$white"
  Progress 25
  sudo apt-get install -y -qq python3-pip >> /dev/null 2>&1 
  echo -ne "\r$red ===============================================\n$white"
}

# Installing Engine Web Server
web-server () {
  # Installing EngineWebServer
  toilet -f 3d Installing | lolcat && toilet -f 3d EngineWebServer | lolcat
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash >> /dev/null 2>&1 
  nvm install 12 >> /dev/null 2>&1 
  echo -ne "\r$red ==> $mag Getting Repository ......................$white"
  Progress 20
  git clone https://github.com/LiquidPropulsionGroup/EngineWebServer.git >> /dev/null 2>&1 &  
  wait
  echo -ne "\r$red ===============================================\n$white"
}

# Goodbye Message
Bye-msg () {
  toilet -f 3d -F border DONE :3 | lolcat
}

# Script
SetColors
Update
Upgrade
Fancy-Tools
LPG-Banner
apt-get-pak
web-server
Bye-msg
