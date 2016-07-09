#!/bin/bash

if [ $(whoami) != "root" ]; then
  echo 'Error: Script must be run as root!'
  exit
fi

apt-get update
apt-get remove -y minecraft-pi
apt-get -y firefox vim wireshark

usermod -a -G wireshark pi

echo "alias ll='ls -lh'" >> /etc/bash.bashrc

# Begin Scripts
./metasploit.sh

# End Scripts
