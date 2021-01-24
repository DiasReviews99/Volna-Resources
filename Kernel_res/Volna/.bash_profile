clear
echo Installing Programms..
apt update
apt install python2 -y
apt install perl -y
apt install cpanminus -y
cpan App::cpanminus
apt install build-essential -y
cpanm Module::build-essential
clear
rm -rf .bash_profile
