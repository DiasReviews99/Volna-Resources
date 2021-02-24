#!/data/data/com.termux/files/usr/bin/bash
clear
echo "===================="
echo "Preapring to Install"
echo "===================="
sleep 1
apt install x11-repo -y
clear
echo "==============================="
echo "Installing Resources for Kernel"
echo "==============================="
sleep 1
apt install wget -y
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna-Micro/installFull -O $PREFIX/bin/installFull
chmod +x $PREFIX/bin/installFull
clear
echo "===================="
echo "Flashing BOOT Script"
echo "===================="
sleep 1
apt-get update
apt-get upgrade -y
apt install python -y
apt install python2 -y
apt install git -y
pip install lolcat
apt install mpv -y
termux-setup-storage
sleep 8
rm -rf $PREFIX/etc/bash.bashrc
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/Boot/Volnamicro/bash.bashrc -O $PREFIX/etc/bash.bashrc
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna-Micro/scifi.mp3 -O /sdcard/scifi-micro.mp3
apt install figlet -y
apt install toilet -y
apt install cowsay -y
apt install nano -y
apt install ruby -y
gem install lolcat
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/Gnome/gnome_micro.sh
chmod +x gnome_micro.sh
bash gnome_micro.sh
rm -rf gnome_micro.sh
