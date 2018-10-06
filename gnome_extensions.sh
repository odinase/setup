#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root" 
   exit 1
fi

WD="/tmp/setup"
cd $WD

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
$WD/gnome-shell-extension-installer 657 --yes     # Shelltile
