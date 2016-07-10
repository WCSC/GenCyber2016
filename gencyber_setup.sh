#!/bin/bash

if [ $(whoami) != "root" ]; then
  echo 'Error: Script must be run as root!'
  exit
fi

if [ $LANG != "en_US.UTF-8" ]; then
  echo "Language is $LANG. Changing to en_US.UTF-8. Please run the script again after reboot." 
  sed -i 's/\(en_GB\.UTF-8\)/# \1/' /etc/locale.gen 
  sed -i 's/\(# en_US\.UTF-8\)/en_US.UTF-8/' /etc/locale.gen 
  sleep 2s
  shutdown -r
fi

mkdir /home/pi/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCf6j0AS8Q4ihSlX8Oa4Tvw85a4CFHI8CpHqrpGwNQ8KuccCsEg7dIV3h0EhAKYpdAbeETxP440KA3Q+B2TyyJmdBjjCaghYTya6WDw/nqydUDAF8QTWr8HYaVmlEGxSVNOAINJ/A7bjPUn8ZSInoD1spM5Hd+d9ykaovx/zdZmp1VjCdWwlL+NwTjihyQiH1nVuWueUtOnEXIIBQAomOxthQsa834Wmua7yE7bxaFoaoatXFrTJeXojRt1SGxKRRNHmCtO+Apuy5uh8SCjlzPnBGKKeauzLEA1wq91q4/aHfRcg5EAOWU+WM8Ldp4I6gshqEciORVz50X4uAcd6tsv pi@raspberrypi" > /home/pi/.ssh/authorized_keys

systemctl enable ssh
systemctl start ssh

apt-get update
apt-get remove -y minecraft-pi
apt-get install -y firefox-esr vim wireshark

usermod -a -G wireshark pi

echo "alias ll='ls -lh'" >> /etc/bash.bashrc

# Begin Scripts
./metasploit.sh

# End Scripts
