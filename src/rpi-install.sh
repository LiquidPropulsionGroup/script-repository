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
  sudo apt-get update >> /dev/null 2>&1 &
  wait
}

# Upgrade
Upgrade () {
  echo -ne "\r$red ==> $mag Upgrading system packages :3 .............$white"
  Progress 24
  sudo apt-get -y upgrade >> /dev/null 2>&1 &
  wait
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
  sudo apt-get install -y -qq ctags
  echo -ne "\r$red ==> $mag Installing apt-get gcc ...................$white"
  Progress 10
  sudo apt-get install -y -qq gcc 
  echo -ne "\r$red ==> $mag Installing apt-get git ...................$white"
  sudo apt-get install -y -qq git 
  echo -ne "\r$red ==> $mag Installing apt-get make ..................$white"
  Progress 15
  sudo apt-get install -y -qq make 
  echo -ne "\r$red ==> $mag Installing apt-get neovim ................$white"
  Progress 20
  sudo apt-get install -y -qq neovim 
  echo -ne "\r$red ==> $mag Installing apt-get nodejs ................$white"
  Progress 25
  sudo apt-get install -y -qq nodejs 
  echo -ne "\r$red ==> $mag Installing apt-get npm ...................$white"
  Progress 30
  sudo apt-get install -y -qq npm 
  echo -ne "\r$red ==> $mag Installing apt-get python3-pip ...........$white"
  Progress 39
  sudo apt-get install -y -qq python3-pip   
  echo -ne "\r$red ===============================================\n$white"
}

#Installing npm packages
npm-pak () {
  echo "$red ==========>$mag Installing npm packages $red<========== $white"
  echo -ne "\r$red ==> $mag Installing npm npm@latest ................$white"
  Progress 6
  npm install -g --silent npm@latest 
  echo -ne "\r$red ==> $mag Installing npm import-js .................$white"
  Progress 12
  npm install -g --silent import-js --unsafe-perm=true  
  echo -ne "\r$red ==> $mag Installing npm eslint ....................$white"
  Progress 18
  npm install -g --silent eslint 
  echo -ne "\r$red ==> $mag Installing npm neovim ....................$white"
  Progress 24
  npm install -g --silent neovim 
  echo -ne "\r$red ==> $mag Installing npm typescript ................$white"
  Progress 30
  npm install -g --silent typescript 
  echo -ne "\r$red ==> $mag Installing npm typescript-formatter ......$white"
  Progress 39
  npm install -g --silent typescript-formatter 
  echo -ne "\r$red ===============================================\n$white"
}

pip-pak () {
  echo "$red ==========>$mag Installing pip packages $red<========== $white"
  echo -ne "\r$red ==> $mag Installing pip pynvim ....................$white"
  Progress 10
  pip install -q pynvim
  echo -ne "\r$red ==> $mag Installing pip isort .....................$white"
  Progress 20
  pip install -q isort
  echo -ne "\r$red ==> $mag Installing pip pylint ....................$white"
  Progress 30
  pip install -q pylint
  echo -ne "\r$red ==> $mag Installing pip yapf ......................$white"
  Progress 39
  pip install -q yapf
  echo -ne "\r$red ===============================================\n$white"
}

# Installing text editor enviorment
Install-SpaceVim () {
  mkdir ~/.SpaceVim.d/
  curl https://raw.githubusercontent.com/LiquidPropulsionGroup/script-repository/main/src/init.toml -s > /home/pi/.SpaceVim.d/init.toml
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
  echo -ne "\r$red ===============================================\n$white"
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
