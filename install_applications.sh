#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

WD="/tmp/setup"
mkdir $WD
cd $WD

sudo apt update
sudo apt upgrade -y

# Make bash case insensitive for auto complete
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc

# Install basic bash commands
sudo apt install vim curl wget -y
# Install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $WD
sudo dpkg -i google-chrome*.deb

# Install gnome extensions
wget https://github.com/brunelli/gnome-shell-extension-installer/releases/download/v1.6.2/gnome-shell-extension-installer -P $WD
chmod +x gnome-shell-extension-installer

# Install vscode
snap install vscode --classic

# Install spotify
snap install spotify --classic

# Install slack
snap install slack --classic

# Install gnome-tweak-tool
sudo apt-get install gnome-tweak-tool chrome-gnome-shell -y

# Install common developing tools
sudo apt install cmake make git -y

# Install GNOME keyring
sudo apt-get install libsecret-1-0 libsecret-1-dev -y
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
cd $WD

# Setup Displaylink for docking station
git clone https://github.com/AdnanHodzic/displaylink-debian.git
cd displaylink-debian/ && sudo ./displaylink-debian.sh

echo "Reboot before you continue"
