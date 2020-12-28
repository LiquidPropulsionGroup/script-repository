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
  echo -ne "\r$red ==> $mag Updating the raspberry pi :-) ...........$white"
  Progress 12
  sudo apt-get update >> /dev/null 2>&1 &
  wait
}

# Upgrade
Upgrade () {
  echo -ne "\r$red ==> $mag Upgrading system packages :3 ............$white"
  Progress 24
  sudo apt-get -y upgrade >> /dev/null 2>&1 &
  wait
}

# Installing lolcat & toilet for nice output
Fancy-Tools () {
  echo -ne "\r$red ==> $mag Getting Banner Tools ◕3◕ ................$white"
  Progress 39
  sudo apt-get install -y git lolcat toilet >> /dev/null 2>&1 & 
  wait
  git clone https://github.com/xero/figlet-fonts.git >> /dev/null 2>&1 &
  wait
  sudo mv figlet-fonts/*.* /usr/share/figlet/
  rm -r figlet-fonts/
  echo ""
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
  sudo apt-get install -y ctags >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get gcc ...................$white"
  Progress 10
  sudo apt-get install -y gcc >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get git ...................$white"
  sudo apt-get install -y git >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get make ..................$white"
  Progress 15
  sudo apt-get install -y make >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get neovim ................$white"
  Progress 20
  sudo apt-get install -y neovim >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get nodejs ................$white"
  Progress 25
  sudo apt-get install -y nodejs >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get npm ...................$white"
  Progress 30
  sudo apt-get install -y npm >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing apt-get python3-pip ...........$white"
  Progress 39
  sudo apt-get install -y python3-pip >> /dev/null 2>&1 &   
  wait
  echo -ne "\r$red ================================================$white"
}

#Installing npm packages
npm-pak () {
  echo "$red ==========>$mag Installing npm packages $red<========== $white"
  echo -ne "\r$red ==> $mag Installing npm npm@latest ................$white"
  Progress 6
  npm install -g npm@latest >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing npm import-js .................$white"
  Progress 12
  npm install -g import-js --unsafe-perm >> /dev/null 2>&1 &  
  wait
  echo -ne "\r$red ==> $mag Installing npm eslint ....................$white"
  Progress 18
  npm install -g eslint >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing npm neovim ....................$white"
  Progress 24
  npm install -g neovim >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing npm typescript ................$white"
  Progress 30
  npm install -g typescript >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ==> $mag Installing npm typescript-formatter ......$white"
  Progress 39
  npm install -g typescript-formatter >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ================================================$white"
}

# Installing text editor enviorment
Install-SpaceVim () {
  mkdir /home/pi/.SpaceVim.d/ && echo "" > /home/pi/.SpaceVim.d/init.toml
  curl https://raw.githubusercontent.com/LiquidPropulsionGroup/script-repository/main/src/init.toml > /home/pi/.SpaceVim.d/init.toml >> /dev/null 2>&1 &
  wait
  curl -sLf https://spacevim.org/install.sh | bash >> /dev/null 2>&1 & 
  wait
  nvim +ProcInstall +qall &
  wait
  echo ""

  # Installing EngineWebServer
  toilet -f 3d Installing | lolcat && toilet -f 3d EngineWebServer | lolcat
  echo -ne "\r$red ==> $mag Getting Repository ......................$white"
  Progress 20
  git clone https://github.com/LiquidPropulsionGroup/EngineWebServer.git >> /dev/null 2>&1 &  
  wait
  echo -ne "\r$red ==> $mag Installing Webserver Dependencies .......$white"
  Progress 39
  cd EngineWebServer
  npm install >> /dev/null 2>&1 & 
  wait
  echo -ne "\r$red ================================================$white"
}

# Goodbye Message
Bye-msg () {
  toilet -f 3d -F border DONE :3 | lolcat
}

# Running the script
Set-Colors
Update
Upgrade
Fancy-Tools
LPG-Banner
apt-get-pak
npm-pak
Install-SpaceVim
Bye-msg
