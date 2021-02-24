#!/data/data/com.termux/files/usr/bin/bash
clear
echo "=============================="
echo "Installing Desktop Environment"
echo "=============================="
sleep 1
apt install xfce4 -y
apt install xfce4-terminal -y
apt install netsurf -y

echo "xfce4-session &" > ~/.vnc/xstartup

clear
echo "===================="
echo "Installing Programms"
echo "===================="
apt install python2 -y
apt install perl -y
cpan App::cpanminus
apt install build-essential -y
cpanm Module::build-essential
apt install mtpaint -y
