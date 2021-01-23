if [ -x /data/data/com.termux/files/usr/libexec/termux/command-no>
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/co>
        }
fi

PS1='\$ '
clear
echo "======================="
echo "       Loading....     "
echo "======================="
sleep 3
cd $HOME
ls
clear
bash start-linuz.sh
