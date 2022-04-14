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
  sudo apt-get install -y -qq nodejs >> /dev/null 2>&1 
  echo -ne "\r$red ==> $mag Installing apt-get npm ...................$white"
  Progress 30
  sudo apt-get install -y -qq npm >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing apt-get python3-pip ...........$white"
  Progress 39
  sudo apt-get install -y -qq python3-pip >> /dev/null 2>&1 
  echo -ne "\r$red ===============================================\n$white"
}

#Installing npm packages
npm-pak () {
  echo "$red ==========>$mag Installing npm packages $red<========== $white"
  echo -ne "\r$red ==> $mag Installing npm npm@latest ................$white"
  Progress 6
  npm install -g --loglevel=silent --no-progress npm@latest >> /dev/null 2>&1 
  echo -ne "\r$red ==> $mag Installing npm import-js .................$white"
  Progress 12
  sudo npm install -g --loglevel=silent --no-progress --allow-root --unsafe-perm=true import-js >> /dev/null 2>&1  
  echo -ne "\r$red ==> $mag Installing npm eslint ....................$white"
  Progress 18
  npm install -g --loglevel=silent --no-progress eslint >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing npm neovim ....................$white"
  Progress 24
  npm install -g --loglevel=silent --no-progress neovim >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing npm typescript ................$white"
  Progress 30
  npm install -g --loglevel=silent --no-progress typescript >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing npm typescript-formatter ......$white"
  Progress 39
  npm install -g --loglevel=silent --no-progress typescript-formatter >> /dev/null 2>&1
  echo -ne "\r$red ===============================================\n$white"
}

pip-pak () {
  echo "$red ==========>$mag Installing pip packages $red<========== $white"
  echo -ne "\r$red ==> $mag Installing pip pynvim ....................$white"
  Progress 10
  pip3 install -q --no-warn-script-location pynvim >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing pip isort .....................$white"
  Progress 20
  pip3 install -q --no-warn-script-location isort >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing pip pylint ....................$white"
  Progress 30
  pip3 install -q --no-warn-script-location pylint >> /dev/null 2>&1
  echo -ne "\r$red ==> $mag Installing pip yapf ......................$white"
  Progress 39
  pip3 install -q --no-warn-script-location yapf >> /dev/null 2>&1
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
  
  # Installing Operation Scripts
  toilet -f 3d Installing | lolcat && toilet -f 3d OperationScripts | lolcat
  echo -ne "\r$red ==> $mag Getting Repository ......................$white"
  Progress 20
  git clone https://github.com/LiquidPropulsionGroup/OperationScripts.git >> /dev/null 2>&1 &
  wait
  echo -ne "\r$red ==> $mag Installing Operation Scripts.............$white"
  Progress 39
  cd OperationScripts
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
pip-pak
Install-SpaceVim
Bye-msg
