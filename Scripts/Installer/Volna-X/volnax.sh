#!/bin/bash
clear
echo "===================="
echo "Preapring to Install"
echo "===================="
sleep 1
apt update
clear
echo "======================="
echo "Installing Login Server"
echo "======================="
sleep 1
mv /usr/local/bin/vncserver-start /usr/local/bin/vncserver-gdm2
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna-X/vncselect -O /usr/local/bin/vncserver-start
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/XFCE/vncserver-start -O /usr/local/bin/vncserver-lightdm
chmod +x /usr/local/bin/vncserver-gdm2
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncservee-lightdm
clear
echo "============"
echo "Settings VNC"
echo "============"
sleep 1
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment/XFCE/xfce.sh && chmod +x xfce.sh && bash xfce.sh && rm -rf xfce.sh
