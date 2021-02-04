#!/bin/bash
clear
echo "========================="
echo "Installing Window Manager"
echo "========================="
sleep 1
sleep 2
sudo apt update -y
apt-get install keyboard-configuration -y
apt-get install sudo wget dialog -y
sudo apt install i3 tigervnc-standalone-server wget nano dbus-x11 xorg xterm xfce4-terminal pcmanfm shotwell feh cairo-dock libexo-1-0 tigervnc-common --no-install-recommends -y
clear

read -p "Want to install default browser ? (y/n)" choice
case "$choice" in 
  y|Y ) sudo apt install epiphany-browser -y ;;
  n|N ) echo "Ok... Not epiphany browser";;
  * ) echo "invalid";;
esac

mkdir -p ~/.vnc

wget https://github.com/DiasReviews99/Volna-Resources/raw/main/Scripts/WindowManager/wallpaper.jpg -O /usr/share/wallpaper.jpg
echo "#!/bin/bash
[ -r ~/.Xresources ] && xrdb ~/.Xresources
export PULSE_SERVER=127.0.0.1
export DISPLAY=:1
export ~/.Xauthority
dbus-launch i3 &
dbus-launch cairo-dock &
feh --bg-fill /usr/share/wallpaper.jpg " > ~/.vnc/xstartup-i3wm
chmod +x ~/.vnc/xstartup
