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

# Install vscode
snap install vscode --classic

# Install spotify
snap install spotify --classic

# Install slack
snap install slack --classic

# Install gnome-tweak-tool
sudo apt-get install gnome-tweak-tool chrome-gnome-shell -y

# Install gnome extensions
wget https://github.com/brunelli/gnome-shell-extension-installer/releases/download/v1.6.2/gnome-shell-extension-installer -P $WD
chmod +x gnome-shell-extension-installer

$WD/gnome-shell-extension-installer 517 --yes     # Caffine
$WD/gnome-shell-extension-installer 15 --yes      # AlternateTab
$WD/gnome-shell-extension-installer 307 --yes     # DashToDock
$WD/gnome-shell-extension-installer 442 --yes     # DropDownTerminal
$WD/gnome-shell-extension-installer 1295 --yes    # GoogleEarthWallpaper
$WD/gnome-shell-extension-installer 600 --yes     # LaunchNewInstance
$WD/gnome-shell-extension-installer 921 --yes     # MultipleMonitorAddOn
$WD/gnome-shell-extension-installer 118 --yes     # NoTopLeftHotCorner
$WD/gnome-shell-extension-installer 723 --yes     # PixelSaver
$WD/gnome-shell-extension-installer 8 --yes       # PlacesStatusIndicator
$WD/gnome-shell-extension-installer 484 --yes     # WorkspaceGrid
$WD/gnome-shell-extension-installer 28 --yes      # gTile

# Install common developing tools
sudo apt install cmake make -y

# Install GNOME keyring
sudo apt-get install libsecret-1-0 libsecret-1-dev -y
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
cd $WD
