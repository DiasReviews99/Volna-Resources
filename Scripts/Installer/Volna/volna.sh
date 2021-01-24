#!/data/data/com.termux/files/usr/bin/bash
folder=volna-fs
if [ -d "$folder" ]; then
	first=1
	echo "Skipping Downloading"
fi
tarball="volna-rootfs.tar.xz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
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
			echo "Unknown Architecture"; exit 1 ;;
		esac
		wget "https://github.com/DiasReviews99/Volna-Resources/releases/download/v1.0-alpha/volna-rootfs-${archurl}.tar.xz" -O $tarball
	fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "Installing Kernel"
	proot --link2symlink tar -xJf ${cur}/${tarball}||:
	cd "$cur"
fi
mkdir -p volna-binds
bin=start-volna.sh
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

echo "Installing Kernel Resources"
wget "https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Kernel_res/Volna/.bash_profile" -P "$folder/root/"

echo "Flashing Boot Script"
rm -rf /data/data/com.termux/files/usr/etc/bash.bashrc
wget "https://raw.githubusercontent.com/DiasReviews99/Volna-Resources/main/Scripts/Boot/bash.bashrc" -P "/data/data/com.termux/files/usr/etc"
echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo "removing image for some space"
rm $tarball
echo "You can now launch Debian with the ./${bin} script"
