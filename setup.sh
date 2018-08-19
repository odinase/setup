#!/bin/bash

WD="/tmp/setup"
mkdir $WD
cd $WD

sudo apt update
sudo apt upgrade -y

# Make bash case insensitive for auto complete
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc

# Install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $WD
sudo dpkg -i google-chrome*.deb

# Install vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# Install spotify
snap install spotify --classic

# Install slack
snap install slack --classic

# Install gnome-tweak-tool
sudo apt-get install gnome-tweak-tool -y

# Install gnome extensions
wget https://github.com/brunelli/gnome-shell-extension-installer/releases/download/v1.6.2/gnome-shell-extension-installer -P $WD
chmod +x gnome-shell-extension-installer
./gnome-shell-extension-installer 517 --yes     # Caffine
./gnome-shell-extension-installer 15 --yes      # AlternateTab
./gnome-shell-extension-installer 307 --yes     # DashToDock
./gnome-shell-extension-installer 442 --yes     # DropDownTerminal
./gnome-shell-extension-installer 1295 --yes    # GoogleEarthWallpaper
./gnome-shell-extension-installer 600 --yes     # LaunchNewInstance
./gnome-shell-extension-installer 921 --yes     # MultipleMonitorAddOn
./gnome-shell-extension-installer 118 --yes     # NoTopLeftHotCorner
./gnome-shell-extension-installer 723 --yes     # PixelSaver
./gnome-shell-extension-installer 8 --yes       # PlacesStatusIndicator

# Install common developing tools
sudo apt install cmake make vim -y

