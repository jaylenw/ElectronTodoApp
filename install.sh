#!/bin/bash

NAME_PROJECT="jaylenw/ElectronTodoApp"

clear
echo " ------------------ $NAME_PROJECT  ------------------ "

echo "Fetches the list of available updates..."
sudo apt update

echo "Installing git ..."
if [ "`dpkg -s git | grep "installed"`" = "" ]; then
  sudo apt install git -y
  echo "git installed!"
else
  echo "git is already installed!";
fi

echo "Installing Node.js..."
if [ "`dpkg -s nodejs | grep "installed"`" = "" ]; then
  sudo curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  sudo apt install nodejs -y
  echo "Configuring Node.js ..."
  sudo ln -s /usr/bin/nodejs /usr/bin/node
  echo "Node.js installed!"
else
  echo "Node.js is already installed!";
fi

echo "Configuring architecture i386..."
sudo dpkg --add-architecture i386

echo "Configuring dependencies   ..."
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

echo "Installing mono-complete..."
if [ "`dpkg -s mono-complete | grep "installed"`" = "" ]; then
  sudo apt install mono-complete -y
  echo "mono-complete installed!"
else
  echo "mono-complete is already installed!";
fi

echo "Fetches the list of available updates ..."
sudo apt update

echo "Installing winehq-devel..."
if [ "`dpkg -s  winehq-devel | grep "installed"`" = "" ]; then
  sudo apt install --install-recommends winehq-devel -y
  echo "winehq-devel installed!"
else
  echo "winehq-devel is already installed!";
fi

echo "Installing npm dependencies...."
npm install

echo "Finish!"
exit 0;
