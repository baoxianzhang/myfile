#!/bin/sh
#
# File: install.sh
# Author: Xuancong Lee[congleetea] <congleetea@gmail.com>
# Created: Monday, February 22 2016
#
pwddir=`pwd`

cddir="cd ./softwares"

echo -e ">>>>> Now generate id_rad>>>>>"
cd ~/
mkdir .ssh
cd .ssh
ssh-keygen
echo -e "<<<<< Finished to generate ssh-key."

echo -e ">>>>>> Install redis-server >>>>"
sudo apt-get install -y redis-server
echo -e "<<<<<< Finished to install redis-server <<<<"

echo -e ">>>>>> Install mongodb 3.2 >>>>"
cd $pwddir/softwares
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org=3.2.3 mongodb-org-server=3.2.3 mongodb-org-shell=3.2.3 mongodb-org-mongos=3.2.3 mongodb-org-tools=3.2.3
echo -e "<<<<<< Finished to install mongodb 3.2 <<<<"

echo -e ">>>>>>> Install node5.6.0 >>>>>"
sudo apt-get install -y curl
sudo apt-get install -y build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
echo export NVM_DIR="/home/congleetea/.nvm" >> ~/.zshrc
echo [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm >> ~/.zshrc
nvm install 5.6.0
nvm ls
sudo apt-get -y install npm
echo -e "<<<<<<< Finished to install node5.6.0"

echo -e ">>>>>>> INstall go-for-it >>>>>>>>>"
sudo add-apt-repository ppa:mank319/go-for-it
sudo apt-get update  
sudo apt-get install go-for-it
echo -e "<<<<<<< Finished to install go-for-it <<<<<<<<<" 


echo -e ">>>>>>> Install erlang man >>>>>>>>>"
cd $pwddir/softwares
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get -y install autoconf
sudo apt-get -y install m4
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install libwxgtk2.8-dev libgl1-mesa-dev libglu1-mesa-dev libpng3
sudo apt-get -y install libssh-dev
sudo apt-get -y install unixodbc-dev
wget http://www.erlang.org/download/otp_src_18.1.tar.gz
tar zxvf otp_src_18.1.tar.gz
cd opt_src_18.1
./configure && make && sudo make install

cd $pwddir/softwares
wget http://www.erlang.org/download/otp_doc_man_18.2.1.tar.gz
tar zxvf otp_doc_man_18.2.1.tar.gz
sudo cp -r ./otp_doc_man_18.2.1/man /usr/local/lib/erlang/


cd $pwddir/softwares
sudo apt-get install -y inkscape
