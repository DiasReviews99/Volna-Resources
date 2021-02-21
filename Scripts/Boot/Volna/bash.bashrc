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
echo "Booting Volna, kernel 2.6.12-archurl"
echo ""
echo "root hd0.0"
echo "Filesystem type is ext2fs, partition type 0x83"
echo "kernel /boot/vmlinuz-2.6.12-9-archurl root=/dev/hda1 ro quiet splash"
echo "[Linux-bzImage, setup=0x1c00, size=0x124b1b]"
echo "initrd /boot/initrd.img-2.6.10l2-9-archurl"
echo "[Linux-initrd @ 0x1fa1a000, 0x4b565a bytes]"
echo "savedefault"
echo "boot"
echo "Uncompressing Linux... Ok. booting the kernel."
sleep 5
clear
toilet -f mono12 -F metal Volna
echo "Loading Modules"
sleep 3
echo "Intializing /dev"
echo "Mounting a root file system"
echo "Starting RAID devices..."
echo "Starting hardware event daemon..."
sleep 1
echo "Creating initial device nodes.."
echo "Checking.rootfile nenos"
echo "Checking root file systems..."
echo "Intializing modules"
echo "Cleaning up ifupdown..."
echo "Calculating module depedencies..."
echo "Loading modules..."
echo "Setting the system clock"
sleep 2
echo "Checking all file systems..."
echo "Mounting local filesystems..."
echo "Setting a networking..."
echo "Starting a hotplug subsystem"
sleep 2
echo "Setting up ALSA card 0..."
sleep 5
echo "Configuring network interfaces..."
sleep 4
echo "Setting up ALSA..."
echo "Setting the system clock..."
echo "Synchronizing clcok to ntp.volnalinux.org"
sleep 13
echo "Intializing random number generator..."
echo "Loading ACPI modules..."
echo "Starting ACPI modules..."
clear
echo "Configuring the base system..."
sleep 1
clear
apt update && apt upgrade -y
clear
toilet -f mono12 -F metal Volna
mpv /sdcard/scifi.mp3
bash start-volna.sh
