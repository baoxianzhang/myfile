#! /usr/bin/env sh

#Author: baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
#Date: Tuesday, 14-03-2016

if [ ! -d "/home/zhangbaoxian/softwares" ]; then
mkdir ~/softwares
fi

echo "<<<<<< Softwares install begin on Ubuntu 14.04 >>>>>>"
#sleep 1
echo "<<<<<< Update sources >>>>>>"
#sudo apt-get update
echo "<<<<<< Update the software, not upgrade system >>>>>>"
#sleep 100
echo "<<<<<< Install git 2.7.3 >>>>>>"
# Magit requires Git >= 1.9.4, you are using 1.9.1.
#cd ~/softwares
#sudo apt-get remove git
#if [ ! -f "git-2.7.3" ]; then
#wget https://www.kernel.org/pub/software/scm/git/git-2.7.3.tar.gz
#tar -xzvf git-2.7.3
#cd git-2.7.3
#./configure
#make
#sudo make install
#echo "<<<<<< Configure git email and name >>>>>> “
#git config --global user.email "baoxianzhit@gmail.com" 
#git config --global user.name "baoxianzhang"
echo "<<<<<< Install git flow >>>>>>"
#sudo apt-get install git-flow

echo "<<<<<< Install git flow completion >>>>>>"
#cd 
#if [ ! -d "/home/zhangbaoxian/code" ]; then
#mkdir -p code
#fi
#cd ~/code
#git clone https://github.com/bobthecow/git-flow-completion.git
#echo "source ~/code/git-flow-completion/git-flow-completion.zsh

echo "<<<<<< Install g++ >>>>>>"
#sudo apt-get install g++
echo "<<<<<< Install python >>>>>>"
#sudo apt-get install python
echo "<<<<<< Install python3 >>>>>>"
#sudo apt-get install python3
echo "<<<<<< Install cmake >>>>>>"
#Ref: https://cmake.org/

#cd ~/softwares
#if [ ! -f "cmake-3.5.0.tar.gz" ]; then
#wget https://cmake.org/files/v3.5/cmake-3.5.0.tar.gz
#tar -xvzf cmake-3.5.0.tar.gz
#fi
#if [ -d "cmake-3.5.0" ]; then
#cd cmake-3.5.0
##if the second times or more, comment the next two lines
#./configure
#make
#sudo make install
#fi

echo "<<<<<< Install zsh >>>>>>"
#Ref: http://zhuanlan.zhihu.com/mactalk/19556676ls
#Restart and use the zsh
#cd ~/softwares
#sudo apt-get install zsh
#wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
#chsh -s /bin/zsh
#echo "Logout to use zsh"



echo "<<<<<< Install autojump >>>>>>" 
#Ref: https://github.com/wting/autojump
#cd ~/softwares
#if [ ! -f "autojump_v21.1.2.tar.gz" ]; then
#wget https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.gz
#tar -xzvf autojump_v21.1.2.tar.gz
#cd autojump_v21.1.2
#./install.sh
#echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc
#source ~/.zshrc
#fi

echo "<<<<<< Install trash-cli >>>>>>"
#sudo apt-get install trash-cli
#echo "alias rm='trash-put'" >> ~/.zshrc
#source ~/.zshrc

echo "<<<<<< Install SogouPinyin Input method >>>>>>"
#Ref:  http://jingyan.baidu.com/article/08b6a591cb06f114a8092209.html
#cd ~/softwares
#sudo apt-get install fcitx libssh2-1
#wget "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O "sogou_64.deb"
#sleep 1
#sudo dpkg -i sogou.deb
#echo "<<<<<< Finished to install SougouPin, Please configure it >>>>>>"
#echo "System Settings > Language Support > Install/Remove Languages > install the Chinese language"
#echo "Logout the system"
#sleep 10

echo "<<<<<< Install luajit >>>>>>"
#sudo apt-get install luajit

echo "<<<<<< Install mercury Mw150us wireless driver >>>>>>"
#Ref: http://jarhead.blog.163.com/blog/static/175217041201317102236535/
#Ref: http://forum.ubuntu.org.cn/viewtopic.php?t=421982

#cd ~/softwares
#git clone https://github.com/lwfinger/rtl8188eu.git
#cd rtl8188eu
#sudo apt-get install build-essential
#sudo apt-get install linux-headers-$(uname -r)
#make 
#sudo make install
# The next can be undo
#sudo echo "8188eu" >> /etc/modules
#echo "Logout to use Mw150us wireless"
#sleep 5

echo "<<<<<< Install Skype >>>>>>"
#cd ~/softwares
#if [ ! -f "skype-ubuntu-precise_4.3.0.37-1_i386.deb" ]; then
#wget download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
#sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
#fi


echo "<<<<<< Install virtualbox >>>>>>"
#Ref: https://www.virtualbox.org/
#cd ~/softwares
#wget http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
#sudo dpkg -i virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
#if failed, click the deb, use the software center to install it.


echo "<<<<<< Install virtualbox win 7 >>>>>>"
#cd ~/softwares
#boot VT-x AMD-v to support 64 bit
#VirtualBox guest additions
#sudo apt-get install linux-headers-generic build-essential dkms -y
##find the VirtualBox Guest Additions in the Device, and click and install it
##Now you can use the sharefile and enlarge the screen
##Install the Oracle VM VirtualBox Extension Pack to use the usb
##Ref: http://www.xiaojian.org/article/310.html
#wget http://download.virtualbox.org/virtualbox/5.0.16/Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
#VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
#sudo addgroup zhangbaoxian vboxusers
#cat /etc/group | grep vboxusers

## Find the devigid and add to the devgid next line
#sudo echo "none /proc/bus/usb usbfs devgid=125,devmode=664 0 0" >> /etc/fstab
#if not work, please reinstall virtualbox!



echo "<<<<<< Install vagrant >>>>>>"
#Ref: http://rmingwang.com/vagrant-commands-and-config.html   https://www.vagrantup.com/docs/boxes.html
#cd ~/softwares
#if [ ! -f "vagrant_1.8.1_x86_64.deb" ]; then
#wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
#fi
#sudo dpkg -i vagrant_1.8.1_x86_64.deb

#if [ ! -d "/home/zhangbaoxian/virtualbox/vagrant" ]; then
#mkdir -p ~/virtualbox/vagrant
#fi
#Ref: https://atlas.hashicorp.com/boxes/search
#wget https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box
#cd ~/virtualbox/vagrant/box
#vagrant box add ubuntu/trusty64
#vagrant init ubuntu/trusty64
#vagrant up
#vagrant ssh
#vagrant halt



echo "<<<<<< Install ctags >>>>>>"
#cd ~/softwares
#if [ ! -f "ctags-5.8.tar.gz" ]; then
#wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
#tar -xzvf ctags-5.8.tar.gz
#fi
#cd ctags-5.8
#./configure	
#make 
#sudo make install
#echo "Usage: ctags ./ -R *"
#sleep 5


echo "<<<<<< Install gtags >>>>>>"
#cd ~/softwares
#if [ ! -f "global-6.5.2.tar.gz" ]; then
#wget http://tamacom.com/global/global-6.5.2.tar.gz
#tar -xzvf global-6.5.2.tar.gz
#fi
#cd global-6.5.2
#./configure
#make 
#sudo make install
#echo "Usage: gtags"
#sleep 5

echo "<<<<<< Install curl >>>>>>"
#sudo apt-get install curl
#or
#sudo apt-get install curl libcurl3 libcurl3-dev php5-curl
##or 
#cd ~/softwares
#git git clone https://github.com/curl/curl.git
#sudo apt-get install autoconf
#cd curl
#
#sudo add-apt-repository ppa:costamagnagianfranco/ettercap-stable-backports
#sudo apt-get update
#sudo apt-get install curl

echo "<<<<<< Google Chrome >>>>>>"
#Ref: http://www.linuxidc.com/Linux/2014-04/100645.htm
#cd ~/softwares
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome-stable_current_amd64.deb 
#echo "Usage: google-chrome-stable"
#sleep 2



echo "<<<<<< Install Emacs 24.5>>>>>>"
#if [ ! -f "emacs" ]; then
#git clone https://github.com/emacs-mirror/emacs.git
#./configure
#make
#sudo make install 
#fi
## or 
#cd ~/softwares
#if [ ! -f "emacs-24.5.tar.gz" ]; then
#wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
#tar -xzvf emacs-24.5
#cd emacs-24.5
#sudo apt-get install libjpeg-dev
#sudo apt-get install libgif-dev
#sudo apt-get install libtiff5-dev 
#./configure
#make 
#sudo make install
#fi


echo "<<<<<< Install silversearcher-ag >>>>>>"
sudo apt-get install silversearcher-ag


echo "<<<<<< Install sqlite3 >>>>>>"
sudo apt-get install sqlite3

#echo "<<<<<< Install roboust zhou vim >>>>>>"
echo "<<<<<< Install spf13 vim >>>>>>"
#Ref: http://www.vim.org/download.php
#if [ ]; then
#cd ~/softwares
#git clone https://github.com/vim/vim.git
#sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
#sudo apt-get build-dep vim-gnome
#sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
#sudo rm -rf /usr/local/share/vim
#sudo rm /usr/bin/vim
#sudo mkdir /usr/include/lua5.1/include
#sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/
#sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit
#cd vim/src
#make distclean
#./configure --with-features=huge \
#            --enable-rubyinterp \
#            --enable-largefile \
#            --disable-netbeans \
#            --enable-pythoninterp \
#            --with-python-config-dir=/usr/lib/python2.7/config \
#            --enable-perlinterp \
#            --enable-luainterp \
#            --with-luajit \
#    --enable-gui=auto \
#            --enable-fail-if-missing \
#            --with-lua-prefix=/usr/include/lua5.1 \
#            --enable-cscope 
#make 
#sudo make install
#fi

#curl http://j.mp/spf13-vim3 -L -o - | sh





echo "<<<<<< Install arm-none-eabi-gcc 4.8.2 >>>>>>"
#cd ~/softwares
#sudo apt-get install lib32ncurses5 lib32z1 lib32bz2-1.0 
#if [ ! -f "gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2"]; then
#wget https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2
#tar -xjvf gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2
#fi
#sudo cp gcc-arm-none-eabi-4_8-2014q3 /usr/src/ -r
#echo "export PATH=$PATH:/usr/src/gcc-arm-none-eabi-4_8-2014q3/bin" >> ~/.zshrc
#source ~/.zshrc
#sleep 10


echo "<<<<<< Install sshpass >>>>>>"
#Ref: http://sourceforge.net/projects/sshpass/
#sudo apt-get install sshpass
#echo "sshpass -p zhangbaoxian ssh  zhangbaoxian@192.168.0.45" > .zshrc


echo "<<<<<< Install Google Hosts >>>>>>"
#Ref: http://laod.cn/hosts/2016-google-hosts.html


echo "<<<<<< Install terminator >>>>>>"
#sudo apt-get install terminator

echo "<<<<<< Install tmux >>>>>>"
#sudo apt-get install tmux

echo "<<<<<< Softlink zshrc >>>>>>"
#if [ ! -d "/home/zhangbaoxian/bxgithub" ]; then
#mkidr ~/bxgithub
#fi
#cd ~/bxgithub
#if [ ! -d "/home/zhangbaoxian/bxgithub/myfile" ]; then
#git git clone https://github.com/baoxianzhang/myfile.git
#fi
#rm ~/.zshrc
#ln -s ~/bxgithub/myfile/zshrc ~/.zshrc

echo "<<<<<< Softlink emacs >>>>>>"
#if [ ! -d "/home/zhangbaoxian/bxgithub" ]; then
#mkidr ~/bxgithub
#fi
#cd ~/bxgithub
#if [ ! -d "/home/zhangbaoxian/bxgithub/emacs-c-ide-demo" ]; then
#git clone https://github.com/baoxianzhang/emacs-c-ide-demo.git
#fi
#ln -s ~/bxgithub/emacs-c-ide-demo ~/.emacs.d


echo "<<<<<< Softlink tmux >>>>>>"
#if [ ! -d "/home/zhangbaoxian/bxgithub" ]; then
#mkidr ~/bxgithub
#fi
#cd ~/bxgithub
#if [ ! -d "/home/zhangbaoxian/bxgithub/myfile" ]; then
#git git clone https://github.com/baoxianzhang/myfile.git
#fi
#rm ~/.tmux.conf
#ln -s ~/bxgithub/myfile/tmux.conf ~/.tmux.conf

echo "<<<<<< Install nginx >>>>>>"
#sudo apt-get install nginx
#echo " Configure the nginx "
#sudo vim /etc/nginx/nginx.conf
#


echo "<<<<<< Install stlink >>>>>>"
# cd ~/softwares
# if [ ! -d "stlink" ]; then
# git clone git://github.com/texane/stlink.git
# fi
# cd stlink
# sudo apt-get install libsgutils2-dev libusb-1.0.0-dev
# ./autogen.sh
# ./configure
# make
# cd flash
# make
# cd ..
# sudo install -s -m 775 st-util /usr/bin/st-util
# sudo install -s -m 775 flash/st-flash /usr/bin/st-flash
# sudo install -m 644 49-stlinkv1.rules /etc/udev/rules.d/49-stlinkv1.rules
# sudo install -m 644 49-stlinkv2.rules /etc/udev/rules.d/49-stlinkv2.rules
# sudo install -m 644 49-stlinkv2-1.rules /etc/udev/rules.d/49-stlinkv2-1.rules
# sudo install -m 644 stlink_v1.modprobe.conf /etc/modprobe.d/stlink_v1.modprobe.conf
# sudo udevadm control --reload-rules


echo "<<<<<< Install GoldenDict >>>>>>"
#sudo apt-get install goldendict
##configure the dict source
##http://abloz.com/huzheng/stardict-dic/zh_CN/
##download the dict source stardict-langdao-ce-gb-2.4.2, stardict-langdao-ec-gb-2.4.2, stardict-oxford-gb-2.4.2
#wget http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2
#wget http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ce-gb-2.4.2.tar.bz2
#wget http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-oxford-gb-2.4.2.tar.bz2
#tar -xjvf stardict-langdao-ec-gb-2.4.2.tar.bz2
#tar -xjvf stardict-langdao-ce-gb-2.4.2.tar.bz2
#tar -xjvf stardict-oxford-gb-2.4.2.tar.bz2


echo "<<<<<< Install go-for-it >>>>>>"
#sudo add-apt-repository ppa:mank319/go-for-it
#sudo apt-get update  
#sudo apt-get install go-for-it


echo "<<<<<< Download xtensa and install it >>>>>>"
# https://drive.google.com/folderview?id=0B5bwBE9A5dBXaExvdDExVFNrUXM&usp=sharing
#sudo cp xtensa-lx106-elf /usr/src/ -r
#echo "export PATH=$PATH:/usr/src/xtensa-lx106-elf/bin" >> ~/.zshrc


echo "<<<<<< Install awk for openwrt >>>>>>"
#sudo apt-get install gawk 


echo "<<<<<< Install perl >>>>>>"
#sudo apt-get install perl

echo "<<<<<< Install XML::Parser for openwrt >>>>>>"
#sudo apt-get install expat
#sudo apt-get install libexpat1-dev
#sudo apt-get install libxml-parser-perl


echo "<<<<<< Install Inkscape Vector Graphics Editor >>>>>>"
#sudo apt-get install inkscape


echo "<<<<<< Install Audacity >>>>>>"
#sudo apt-get install audacity



echo "<<<<<< Install SecureCRT 7.3 >>>>>>"
# Ref:http://blog.csdn.net/chszs/article/details/40623169




































