#!/bin/bash

#Get the necessary components
clear
echo "=============================="
echo "Installing Desktop Environment"
echo "=============================="
sleep 1
sudo apt-get update
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt-get install keyboard-configuration -y
sudo apt-get install tzdata -y
sudo apt-get install sudo wget nano inetutils-tools dialog -y
sudo apt-get install xfce4 xfce4-goodies xfce4-terminal exo-utils tigervnc-standalone-server tigervnc-common dbus-x11 --no-install-recommends -y
sudo apt-get clean
mkdir -p ~/.vnc
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/Gnome/xstartup-gnome -P ~/.vnc/
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/Gnome/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/Gnome/vncserver-stop -P /usr/local/bin/
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop
chmod +x ~/.vnc/xstartup-gnome

echo '#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY                                                         
LANG=en_US.UTF-8
export LANG
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session startxfce4 &' > ~/.vnc/xstartup

wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/WindowManager/Openbox/openbox.sh && chmod +x openbox.sh && bash openbox.sh
rm -rf openbox.sh

clear
echo "====================="
echo "Running browser patch"
echo "====================="
sleep 1
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/Fixes/ubchromiumfix.sh && chmod +x ubchromiumfix.sh && bash ubchromiumfix.sh && rm -rf ubchromiumfix.sh

clear
echo "===================="
echo "Installing Programms"
echo "===================="
apt update
apt install python2 -y
apt install perl -y
apt install cpanminus -y
cpan App::cpanminus
apt install build-essential -y
cpanm Module::build-essential
apt install elementary-icon-theme -y
apt install file-roller gnome-calculator gucharmap gnome-dictionary gedit -y
apt install gnome-games -y
apt install eog gimp xsane gthumb -y
apt install evolution pidgin xchat gftp -y
apt install goobox gnome-music sound-juicer gnome-sound-recorder totem pavucontrol -y
apt install synaptic -y

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

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
vncserver-start
