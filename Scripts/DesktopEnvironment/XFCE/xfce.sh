#!/bin/bash

clear
echo "=============================="
echo "Installing Desktop Environment"
echo "=============================="
sleep 1
#Get the necessary components
apt-mark hold udisks2
[ ! -f /root/.parrot ] && apt-get update || echo "Parrot detected, not updating apt cache since that will break the whole distro"
apt-get install keyboard-configuration -y
apt-get install sudo wget -y
apt-get install xfce4 xfce4-terminal tigervnc-standalone-server -y
apt-get install xfe -y
apt-get clean

#Setup the necessary files
mkdir ~/.vnc
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/XFCE/xstartup-xfce -P ~/.vnc

chmod +x ~/.vnc/xstartup-xfce

echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "
