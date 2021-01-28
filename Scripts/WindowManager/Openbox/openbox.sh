#!/bin/bash
clear
echo "========================="
echo "Installing Window Manager"
echo "========================="
sleep 1
sleep 2
sudo apt update -y
apt-get install keyboard-configuration tzdata -y
apt-get install sudo wget dialog -y
sudo apt install openbox obconf tigervnc-standalone-server wget nano dbus-x11 xorg xterm feh xfce4-terminal pcmanfm shotwell cairo-dock libexo-1-0 tigervnc-common --no-install-recommends -y
clear

read -p "Want to install default browser ? (y/n)" choice
case "$choice" in 
  y|Y ) sudo apt install epiphany-browser -y ;;
  n|N ) echo "Ok... Not epiphany browser";;
  * ) echo "invalid";;
esac

mkdir -p ~/.vnc

wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/WindowManager/wallpaper.jpg -O /usr/share/wallpaper.jpg
echo "#!/bin/bash
[ -r ~/.Xresources ] && xrdb ~/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:1
XAUTHORITY=~/.Xauthority
export XAUTHORITY
dbus-launch openbox &
dbus-launch cairo-dock & 
feh --bg-fill /usr/share/wallpaper.jpg" > ~/.vnc/xstartup-openbox
chmod +x ~/.vnc/xstartup
