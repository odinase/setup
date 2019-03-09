#!/bin/bash

# Install dependencies
sudo apt install gnupg ca-certificates -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update

# Install actual Mono
sudo apt install mono-complete -y
sudo apt install mono-devel -y
sudo apt install mono-dbg -y
sudo apt install referenceassemblies-pcl -y
sudo apt install ca-certificates-mono -y
sudo apt install mono-xsp4 -y
