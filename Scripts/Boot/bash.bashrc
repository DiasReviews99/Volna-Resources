if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1='\$ '
clear
echo "GRUB Loading stage1.5."
echo ""
echo "GRUB loading, please wait..."
echo "Press ESC to enter the menu..."
sleep 3
clear
echo "Booting Volna, kernel 2.6.10-archurl"
echo ""
echo "root (hd0.0)"
echo "Filesystem type is ext2fs, partition type 0x83"
echo "kernel /boot/vmlinuz-2.6.10-5-archurl root=/dev/hda1 ro quiet splash"
echo "[Linux-bzImage, setup=0x1600, size=0x1209f6]"
echo "initrd /boot/initrd.img-2.6.10-5-archurl"
echo "[Linux-initrd @ 0xfaaa000, 0x426000 bytes]
echo "savedefault"
echo "boot"
echo "Uncompressing Linux... Ok. booting the kernel."
sleep 3
echo "audit(1535118568.877:0): initialized"
echo "Starting Volna..."
sleep 10
echo "Mounting a tmpfs over /dev..."
echo "Creating initial device nodes..."
echo "Setting disk parameters..."
echo "Checking root file system..."
echo "/: clean, 21260/2529600 files, 286985/5054442 blocks"
echo "Setting the System Clock using the Hardware Clock as reference..."
sleep 3
echo "Cleaning up ifupdown..."
echo "Calculating module depedencies..."
echo "Loading modules..."
echo "Creating device-mapper devices..."
echo "Starting RAID devices..."
echo "Setting up LVM Volume Groups..."
