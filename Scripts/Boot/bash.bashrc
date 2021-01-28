if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1='\$ '
clear
echo "GRUB Loading stage1.5"
echo
echo
echo "GRUB loading, please wait..."
sleep 3
clear
echo "Booting `Volna, kernel 2.6.8.1-2-archurl ` "
echo
echo "root(hd0.0)"
echo "Filesystem type is ext2fs, partition type 0x83"
echo "kernel /boot/vmlinuz-2.6.8.1-2-archurl root=/dev/hda1 ro quiet splash"
echo "[Linux-bzImage, setup=0x1400, size=0x437000 bytes ]"
echo "initrd /boot/initrd.img-2.6.8.1-2-archurl"
echo "[Linux-initrd @ 0xfa99000, 0x437000 bytes ]"
echo "savedefault"
echo "boot"
echo "Uncompressing Linux... Ok. booting the kernel."
sleep 4
echo "Starting Volna..."
sleep 9
echo "Mounting a tmpfs over /dev"
echo "Creating initial device nodes..."
echo "Setting disk parameters..."
echo "Activating swap"
echo "Checking root file system..."
echo "/dev/hda1: clean. 21225/2562240 files. 275286/5117639 blocks"
echo "Setting the System Clock using the Hardware Clock as reference..."
echo "System time was"
sleep 3
echo "System Clock set. System local time is now"
echo "Calculating module dependencies..."
echo "Loading modules..."
echo "Trying module psmouse"
echo "Trying module mousedev"
echo "Trying module ide-cd"
echo "Trying module ide-generic"
echo "Trying module Ip"
echo "Creating device-mapper devices..."
echo "Starting RAID devices..."
echo "Setting up LVM Volume Groups..."
echo "Reading all physical volumes. This may take a while..."
echo "No volume groups found"
echo "No volume groups found"
echo "No volume groups found"
echo "Starting Enterprise Volume Management System..."
echo "Checking all file systems..."
echo "Setting kernel variables..."
echo "Mounting local file systems..."
echo "Cleaning /tmp..."
echo "Cleaning /var/run..."
echo "Cleaning /var/lock..."
echo "Running 0dns-down to make sure resolv.conf is ok..."
echo "Starting hotplug subsystems..."
echo "Running input.rc..."
echo "evbug blacklisted"
echo "evdev already loaded"
echo "evbug blacklisted"
echo "evdev already loaded"
echo "mousedev already loaded"
echo "tsdev already loaded"
echo "Running isapnp.rc..."
echo "rtc loaded sucessfully"
echo "pcspkr loaded sucessfully"
echo "Loading acpi"
sleep 33
echo "Loading pciehp and shpchp"
sleep 3
echo "Running usb.rc..."
echo "usbmouse already loaded"
echo "usbcore already loaded"
echo "hci_usb already loaded"
echo "Setting up IP spoofing protection..."
echo "Configuring network interfaces..." 
echo "Internet System Consortium DHCP Client V3.0.1rc14"
echo "Copyright 2004 Internet System Consortium"
