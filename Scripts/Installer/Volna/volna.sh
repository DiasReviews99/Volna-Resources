#!/data/data/com.termux/files/usr/bin/bash
clear
echo "===================="
echo "Preapring to Install"
echo "===================="
sleep 1
apt install mpv -y
apt install toilet -y
termux-setup-storage
sleep 4
wget https://github.com/DiasReviews99/Volna-Resources/raw/main/Kernel_res/Volna/scifi.mp3 -O /sdcard/scifi.mp3
folder=volna-fs
dlink="https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment"
if [ -d "$folder" ]; then
	first=1
        clear
        echo "===================="
	echo "Skipping Downloading"
        echo "===================="
        sleep 1
fi
tarball="volna-rootfs.tar.gz"

if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
                clear
                echo "==================="
		echo "Downloading Kernel."
                echo "==================="
                sleep 1
		case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64" ;;
		arm)
			archurl="armhf" ;;
		amd64)
			archurl="amd64" ;;
		x86_64)
			archurl="amd64" ;;	
		i*86)
			archurl="i386" ;;
		x86)
			archurl="i386" ;;
		*)
                        clear
                        echo "===================="
			echo "Unknown Architecture"
                        echo "===================="
                        sleep1;exit 1 ;;
		esac
		wget "https://github.com/DiasReviews99/Volna-Resources/releases/download/v5.04-release/volna-rootfs-${archurl}.tar.xz" -O $tarball

fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
        clear
        echo "=================="
	echo "Installing Kernel."
        echo "=================="
        sleep 1
	proot --link2symlink tar -xf ${cur}/${tarball} --exclude=dev||:
	cd "$cur"
fi
mkdir -p volna-binds
bin=start-volna.sh
clear
echo "====================="
echo "Writing Launch Script"
echo "====================="
sleep 1
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A volna-binds)" ]; then
    for f in volna-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b volna-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

mkdir -p volna-fs/var/tmp
rm -rf volna-fs/usr/local/bin/*

clear
echo "================================"
echo "Installing Resources for Kernel."
echo "================================"
sleep 1
wget -q https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/.profile -O volna-fs/root/.profile.1 > /dev/null
cat $folder/root/.profile.1 >> $folder/root/.profile && rm -rf $folder/root/.profile.1
mkdir -p volna-fs/usr/share/volna/
wget -q https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/firstrun -O volna-fs/usr/local/bin/newuser
wget -q https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/vnc -P volna-fs/usr/local/bin > /dev/null
wget -q https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/vncpasswd -P volna-fs/usr/local/bin > /dev/null

chmod +x volna-fs/root/.bash_profile
chmod +x volna-fs/root/.profile
chmod +x volna-fs/usr/local/bin/vnc
chmod +x volna-fs/usr/local/bin/vncpasswd
chmod +x volna-fs/usr/local/bin/newuser

clear
echo "===================="
echo "Flashing BOOT Script"
echo "===================="
sleep 1
rm -rf /data/data/com.termux/files/usr/etc/bash.bashrc
wget https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/Boot/bash.bashrc -O /data/data/com.termux/files/usr/etc/bash.bashrc

clear
echo "==========="
echo "Fixing Bugs"
echo "==========="
sleep 1
termux-fix-shebang $bin
clear
echo "============="
echo "Checking ROOT"
echo "============="
sleep 1
chmod +x $bin
clear
echo "=========================="
echo "Removing Unnecessary Files"
echo "=========================="
sleep 1
rm $tarball

#DE installation addition

wget --tries=20 $dlink/Gnome/gnome.sh -O $folder/root/gnome.sh
clear
echo "============"
echo "Settings VNC"
echo "============"
sleep 1

echo "APT::Acquire::Retries \"3\";" > $folder/etc/apt/apt.conf.d/80-retries #Setting APT retry count
touch $folder/root/.hushlogin
echo "#!/bin/bash
rm -rf /etc/resolv.conf
echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
mkdir -p ~/.vnc
clear
echo "=================="
echo "Basic Installation"
echo "=================="
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
apt update -y && apt install sudo dialog wget -y > /dev/null
clear
if [ ! -f /root/xfce19.sh ]; then
    wget --tries=20 $dlink/Gnome/gnome.sh -O /root/gnome.sh
    bash ~/gnome.sh
else
    bash ~/gnome.sh
fi
clear
if [ ! -f /usr/bin/vncserver ]; then
    apt install tigervnc-standalone-server -y
fi
rm -rf /root/gnome.sh
rm -rf ~/.bash_profile" > $folder/root/.bash_profile 

bash $bin
