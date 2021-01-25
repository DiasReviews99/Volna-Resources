clear
echo Basic Installaton...
rm -rf /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
mkdir -p ~/.vnc
apt update && apt install dialog ubuntu-minimal -y
groupadd --gid 3003 permagrp
groupadd --gid 9997 permagrp2
groupadd --gid 50110 permagrp3
groupadd --gid 99909997 permagrp4
groupadd --gid 20195 permagrp5
groupadd --gid 50195 permagrp6
touch ~/.hushlogin
clear
echo Installing Programms..
apt update
apt install python2 -y
apt install perl -y
apt install cpanminus -y
cpan App::cpanminus
apt install build-essential -y
cpanm Module::build-essential
clear
rm -rf .bash_profile
