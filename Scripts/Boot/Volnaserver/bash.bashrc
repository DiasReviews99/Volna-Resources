if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1='\$ '
clear
echo "Loading..."
sleep 5
clear
echo "GNU/Linux"
sleep 1
clear
echo "Welcome to Volna 6.06 LTS"
sleep 2
bash start-volna-server.sh
