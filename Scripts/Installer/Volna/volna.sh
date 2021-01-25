#!/data/data/com.termux/files/usr/bin/bash
dlink="https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/DesktopEnvironment"
dlink2="https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/WindowManager"
folder=volna-fs
if [ -d "$folder" ]; then
	first=1
        clear
	echo "Skipping Downloading"
fi
tarball="volna-rootfs.tar.xz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
                clear
		echo "Downloading Kernel"
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
			echo "Unknown Architecture"; exit 1 ;;
		esac
		wget "https://github.com/DiasReviews99/Volna-Resources/releases/download/v3.0-beta/volna-rootfs-${archurl}.tar.xz" -O $tarball
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
        clear
	echo "Installing Kernel"
	proot --link2symlink tar -xJf ${cur}/${tarball}||:
	cd "$cur"
fi
mkdir -p volna-binds
bin=start-volna.sh
clear
echo "Writing Boot Script"
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
echo "Installing Kernel Resources"
wget -q "https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/.profile" -O volna-fs/root/.profile.1 > /dev/null
cat $folder/root/.profile.1 >> $folder/root/.profile && rm -rf $folder/root/.profile.1
wget -q "https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/vnc" -O volna-fs/usr/local/bin > /dev/null
wget -q "https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/vncpasswd" -O volna-fs/usr/local/bin > /dev/null

clear
echo "Flashing Boot Script"
rm -rf /data/data/com.termux/files/usr/etc/bash.bashrc
wget "https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/Boot/bash.bashrc" -P "/data/data/com.termux/files/usr/etc"

clear
echo "fixing shebang of $bin"
termux-fix-shebang $bin
clear
echo "making $bin executable"
chmod +x $bin
clear
echo "removing image for some space"
rm $tarball
clear
echo "You can now launch Volna with the ./${bin} script"

# Installation Window Manager

wget --tries=20 $dlink2/Openbox/openbox.sh -O $folder/openbox.sh
clear
echo "Settings VNC"

echo "APT::Acquire::Retries \"3\";" > $folder/etc/apt/apt.conf.d/80-retries #Setting APT retry count
echo "#!/bin/bash
apt update -y && apt install wget sudo -y
clear
if [ ! -f /root/openbox.sh ]; then
    wget --tries=20 $dlink2/Openbox/openbox.sh -O /root/openbox.sh
    bash ~/openbox.sh
else
    bash ~/openbox.sh
fi
clear

if [ ! -f /usr/bin/vncserver ]; then
    apt install tigervnc-standalone-server -y
fi
clear
echo ' Welcome to Volna v3.0-beta '
rm -rf ~/.bash_profile" > $folder/root/.bash_profile

bash $bin
