#!/bin/bash

WD="/tmp/setup"
mkdir $WD
cd $WD

sudo apt update
sudo apt upgrade -y

# Install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $WD
sudo dpkg -i google-chrome*.deb

# Install vscode
wget https://code.visualstudio.com/docs/?dv=linux64_deb -P $WD
sudo dpkg -i code_*.deb

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
sudo apt install cmake make -y

