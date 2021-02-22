if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1='\$ '
clear
echo "GRUB Loading stage1.5."
echo ""
echo ""
echo "GRUB loading, please wait..."
echo "Press ESC to enter the menu..."
sleep 2
clear
echo "Booting Volna, kernel 2.6.12-9-archurl"
echo ""
echo "root hd0.0"
echo "Filesystem type is ext2fs, partiton type 0x83"
echo "kernel /boot/vmlinuz-2.6.12-9-archurl root=/dev/hda1 ro quiet splash
echo "[Linux-bzImage, setup=0x1c00, size=0x124blb]"
sleep 1
echo "initrd /boot/initrd.img-2.6.12-9-archurl"
echo "[Linux-initrd @ 0x1fae7000, 0x4b1600 bytes]"
echo "savedefault"
echo "boot"
sleep 1
echo "Uncompressing Linux... Ok, booting the kernel."
sleep 4
echo "Starting Usplash"
clear
toilet -f mono12 -F metal Volna-K
echo "Loading modules"
sleep 13
echo "Welcome to the Volna-K 5.10"
sleep 5
echo "K-anloV"
sleep 10
echo "Cleaning up ifupdown"
echo "Calculating module depedencies..."
echo "Loading modules..."
echo "Setting up system clock..."
echo "Setting up LVM Volume Groups..."
echo "Starting Enterprise Volume Management System"
echo "Checking Enterprise Volume Management System..."
echo "Checking all file systems..."
echo "Mounting local filesystems..."
sleep 1
echo "Restering resolver state..."
echo "Reading desktop files..."
sleep 1
echo "Starting hotplug subsystem..."
sleep 3
echo "Setting up ALSA card 0"
sleep 4
echo "ing network interfaces..."
echo "network interface to come up..."
sleep 3
echo "Setting up ALSA..."
echo "Setting the system clock..."
echo "Synchronizing clock to ntp.volnalinux.org"
echo "Intializing random number generator..."
echo "Setting up X server socket directory..."
echo "Setting up ICE socket directory..."
echo "Saving VESA state..."
echo "Loading ACPI modules..."
sleep 2
echo "Starting ACPI services..."
echo "Starting system log daemon..."
echo "Starting kernel log daemon..."
echo "Starting system message bus..."
echo "Starting Hardware abstraction layer.."
echo "Starting Common Unix Printing System..cupad"
echo "Starting HP Linxu Printing and Imaging system"
sleep 4
echo "Starting PCMICA services..."
sleep 2
echo "Starting powernotrd"
echo "Starting powernotrd services..."
sleep 1
clear
sleep 5
echo "Loading..."
sleep 9
toilet -f mono12 -F metal Volna-K
mpv /sdcard/scifi-k.mp3
bash start-volnak.sh
