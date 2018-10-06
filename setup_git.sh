#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root" 
   exit 1
fi

# Get user email and name
echo "Enter email address: "
read MAIL
echo "Enter user name: "
read NAME

git config --global user.name $NAME
git config --global user.email $MAIL

# Generate new SSH key
ssh-keygen -t rsa -b 4096 -C $MAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo "SSH key:"
echo 
cat ~/.ssh/id_rsa.pub

# Setup GNOME keyring
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
