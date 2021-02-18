if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1='\$ '
clear
sleep 5
echo "/dev/sda1"
echo "clean 21640/25640 clean"
sleep 3
clear
toilet Volna-k
sleep 3
clear
echo "tty login: root"
echo "tty password: lll"
echo "Welcome"
sleep 2
clear
echo "Volna-K 5.04"
echo "Loading..."
sleep 3
bash start-volnak.sh
