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
sleep 2
clear
echo "Booting Volna, kernel 2.6.15-26-archurl-generic"
echo ""
echo "root hd0.0"
echo "Filesystem type is ext2fs, partition type 0x83"
echo "kernel /boot/vmlinuz-2.6.15-29-archurl-generic root=/dev/hda1 ro quiet splash"
echo "[Linux-bzImage, setup=0x1c00, size=0x16a4fa]"
echo "initrd /boot/initrd.img-2.6.15-29-archurl-generic"
echo "[Linux-initrd @ 0x2f762000, 0x76d798 bytes]"
echo "savedefault"
echo "boot"
echo "."
echo "Decompressing Linux...done"
echo "Booting the kernel."
sleep 3
clear
toilet -f mono12 -F metal Volna
echo "Loading essential drivers"
echo "Mounting root file system"
sleep 6
echo "Reading file needed to boot"
echo "Preapring restricted drivers"
echo "Starting basic networking"
echo "Starting kernel event manager"
echo "Loading hardware drivers"
sleep 5
clear
toilet -f mono12 -F metal Volna
sleep 3
mpv /sdcard/scifi.mp3
clear
bash start-volna.sh
