#!/bin/bash

apt-get -y install build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev locate libreadline6-dev libcurl4-openssl-dev git-core libssl-dev libyaml-dev openssl autoconf libtool ncurses-dev bison curl wget postgresql postgresql-contrib libpq-dev libapr1 libaprutil1 libsvn1 libpcap-dev

apt-get -y install git-core postgresql curl ruby1.9.3 nmap gem ruby-dev libsqlite3-dev libpq-dev libpcap0.8-dev
gem install wirble sqlite3 bundler

git clone https://github.com/rapid7/metasploit-framework.git /opt
cd /opt/metasploit-framework
bundle install

wget http://www.fastandeasyhacking.com/download/armitage150813.tgz /tmp
tar xvzf /tmp/armitage150813.tgz -C /home/pi

chmod +r /var/lib/gems/2.1.0/gems/robots-0.10.1/lib/robots.rb
chmod +x /var/lib/gems/2.1.0/gems/robots-0.10.1/lib/robots.rb

echo "PATH=$PATH:/opt/metasploit-framework" >> /etc/profile
ln -s /opt/metasploit-framework /usr/share/

# msfdb
systemctl start postgresql
systemctl enable postgresql
cp ./msfdb /opt/metasploit-framework/
msfdb init
