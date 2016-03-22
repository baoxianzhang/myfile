#! /bin/bash
#Author: baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
#Date: Tuesday, 14-03-2016
function askForContinue()
{
    read ANS
    case $ANS in
        y|Y|yes|YES)
            echo 1
            ;;
        n|N|no|NO)
            echo 0
            ;;
    esac
}

cd
homeDir=$(pwd)
if [ ! -d "$homeDir/softwares" ]; then
    mkdir ~/softwares
fi

echo "<<<<<< Softwares install begin on Ubuntu 14.04 >>>>>>"
echo "Please connect the wifi and check the wifi! "

echo "<<<<<< Update the software, not upgrade system. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get update
fi

echo "<<<<<< Install git 2.7.3. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    # Magit requires Git >= 1.9.4, you are using 1.9.1.
    cd ~/softwares
    #sudo apt-get remove git
    if [ ! -d "git-2.7.3" ]; then
        wget https://www.kernel.org/pub/software/scm/git/git-2.7.3.tar.gz
        tar -xzvf git-2.7.3.tar.gz
    fi
    cd git-2.7.3
    chmod +x configure
    ./configure
    sudo apt-get install zlib1g-dev
    sudo apt-get install curl
    make
    sudo make install
fi

echo "<<<<<< Configure git email and name. Continue?[Y/n] >>>>>> "
ans=$(askForContinue)
if [ $ans == 1 ];then
    git config --global user.email "baoxianzhit@gmail.com"
    git config --global user.name "baoxianzhang"
fi

echo "<<<<<< Install git flow. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install git-flow
fi

echo "<<<<<< Install git flow completion. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd
    if [ ! -d "$homeDir/code" ]; then
        mkdir -p code
    fi
    cd ~/code
    echo "PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
    source ~/.bashrc
    if [ ! -d "git-flow-completion" ]; then
        git clone https://github.com/bobthecow/git-flow-completion.git
        #echo "source ~/code/git-flow-completion/git-flow-completion.zsh"
    fi
fi

echo "<<<<<< Install g++. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install g++
fi

echo "<<<<<< Install build-essential. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install build-essential
fi

echo "<<<<<< Install python. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install python
fi

echo "<<<<<< Install python3. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install python3
fi

echo "<<<<<< Install openssh-server. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install openssh-server
fi

echo "<<<<<< Install cmake. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: https://cmake.org/
    cd ~/softwares
    if [ ! -f "cmake-3.5.0.tar.gz" ]; then
        wget https://cmake.org/files/v3.5/cmake-3.5.0.tar.gz
        tar -xvzf cmake-3.5.0.tar.gz
    fi
    if [ -d "cmake-3.5.0" ]; then
        cd cmake-3.5.0
        #if the second times or more, comment the next two lines
        ./configure
        make
        sudo make install
    fi
fi

echo "<<<<<< Install zsh. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://zhuanlan.zhihu.com/mactalk/19556676ls
    #Restart and use the zsh
    cd ~/softwares
    sudo apt-get install zsh
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    sudo chsh -s /bin/zsh
    echo "Logout to use zsh"
fi

echo "<<<<<< Install autojump. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: https://github.com/wting/autojump
    cd ~/softwares
    if [ ! -f "autojump_v21.1.2.tar.gz" ]; then
        wget https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.gz
        tar -xzvf autojump_v21.1.2.tar.gz
        cd autojump_v21.1.2
        ./install.sh
        #echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc
        #source ~/.zshrc
    fi
fi

echo "<<<<<< Install trash-cli. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install trash-cli
fi

echo "<<<<<< Install SogouPinyin Input method. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref:  http://jingyan.baidu.com/article/08b6a591cb06f114a8092209.html
    cd ~/softwares
    if [ ! -r sogou_64.deb ]; then
        sudo apt-get install fcitx libssh2-1
        wget "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O "sogou_64.deb"
    fi
    sudo dpkg -i sogou_64.deb
    echo "<<<<<< Finished to install SougouPin, Please configure it >>>>>>"
    echo "System Settings > Language Support > Install/Remove Languages > install the Chinese language"
    echo "Logout the system to use sougou input method after finish all the installation!"
fi

echo "<<<<<< Install luajit. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install luajit
fi

echo "<<<<<< Install mercury Mw150us wireless driver. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://jarhead.blog.163.com/blog/static/175217041201317102236535/
    #Ref: http://forum.ubuntu.org.cn/viewtopic.php?t=421982
    cd ~/softwares
    if [ ! -d "rtl8188eu" ]; then
        git clone https://github.com/lwfinger/rtl8188eu.git
    fi
    cd rtl8188eu
    sudo apt-get install build-essential
    sudo apt-get install linux-headers-$(uname -r)
    make
    sudo make install
    # The next can be undo
    #sudo echo "8188eu" >> /etc/modules
    echo "Logout to use Mw150us wireless"
fi

echo "<<<<<< Install ctags. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ~/softwares
    if [ ! -f "ctags-5.8.tar.gz" ]; then
        wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
        tar -xzvf ctags-5.8.tar.gz
    fi
    cd ctags-5.8
    ./configure
    make
    sudo make install
    echo "Usage: ctags ./ -R *"
fi

echo "<<<<<< Install gtags. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ~/softwares
    if [ ! -f "global-6.5.2.tar.gz" ]; then
        wget http://tamacom.com/global/global-6.5.2.tar.gz
        tar -xzvf global-6.5.2.tar.gz
    fi
    cd global-6.5.2
    sudo apt-get install libsdl1.2-dev
    sudo apt-get install ncurses-bin
    ./configure
    make
    sudo make install
    echo "Usage: gtags"
fi

echo "<<<<<< Install curl. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install curl
    #or
    #sudo apt-get install curl libcurl3 libcurl3-dev php5-curl
    ##or
    #cd ~/softwares
    #git clone https://github.com/curl/curl.git
    #sudo apt-get install autoconf
    #cd curl
    #
    #sudo add-apt-repository ppa:costamagnagianfranco/ettercap-stable-backports
    #sudo apt-get update
    #sudo apt-get install curl
fi

echo "<<<<<< Install silversearcher-ag. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install silversearcher-ag
fi

echo "<<<<<< Install sqlite3. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install sqlite3
fi

echo "<<<<<< Install spf13 vim. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #echo "<<<<<< Install roboust zhou vim >>>>>>"
    #Ref: http://www.vim.org/download.php
    cd ~/softwares
    if [ ! -d "vim" ]; then
        git clone https://github.com/vim/vim.git
    fi
    sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
    sudo apt-get build-dep vim-gnome
    sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
    sudo rm -rf /usr/local/share/vim
    sudo rm /usr/bin/vim
    sudo mkdir /usr/include/lua5.1/include
    sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/
    sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit
    cd vim/src
    make distclean
    ./configure --with-features=huge \
                --enable-rubyinterp \
                --enable-largefile \
                --disable-netbeans \
                --enable-pythoninterp \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --enable-perlinterp \
                --enable-luainterp \
                --with-luajit \
                --enable-gui=auto \
                --enable-fail-if-missing \
                --with-lua-prefix=/usr/include/lua5.1 \
                --enable-cscope
    make
    sudo make install
    curl http://j.mp/spf13-vim3 -L -o - | sh
    echo "Start vim and begin to install the plugin!"
fi

echo "<<<<<< Install arm-none-eabi-gcc 4.8.2. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ~/softwares
    sudo apt-get install lib32ncurses5 lib32z1 lib32bz2-1.0
    if [ ! -f "gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2" ]; then
        wget https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2
        tar -xvf gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2
    fi
    sudo cp gcc-arm-none-eabi-4_8-2014q3 /usr/src/ -r
    #echo "export PATH=$PATH:/usr/src/gcc-arm-none-eabi-4_8-2014q3/bin" >> ~/.zshrc
    #source ~/.zshrc
fi

echo "<<<<<< Install sshpass. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://sourceforge.net/projects/sshpass/
    sudo apt-get install sshpass
    #echo "sshpass -p zhangbaoxian ssh  zhangbaoxian@192.168.0.45" > .zshrc
fi

echo "<<<<<< Install Google Hosts. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    echo "By your own hand! Follow the bellow link!"
    echo "http://laod.cn/hosts/2016-google-hosts.html"
fi

echo "<<<<<< Install terminator. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install terminator
fi

echo "<<<<<< Install tmux. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install tmux
fi

echo "<<<<<< Softlink zshrc. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ ! -d "$homeDir/bxgithub" ]; then
        mkdir ~/bxgithub
    fi
    cd ~/bxgithub
    if [ ! -d "$homeDir/bxgithub/myfile" ]; then
        git clone https://github.com/baoxianzhang/myfile.git
    fi
    rm ~/.zshrc
    ln -s ~/bxgithub/myfile/zshrc ~/.zshrc
fi

echo "<<<<<< Softlink emacs. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ ! -d "$homeDir/bxgithub" ]; then
        mkdir ~/bxgithub
    fi
    cd ~/bxgithub
    if [ ! -d "$homeDir/bxgithub/emacs-c-ide-demo" ]; then
        git clone https://github.com/baoxianzhang/emacs-c-ide-demo.git
    fi
    rm ~/.emacs.d -rf
    ln -s ~/bxgithub/emacs-c-ide-demo ~/.emacs.d
fi

echo "<<<<<< Softlink tmux. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ ! -d "$homeDir/bxgithub" ]; then
        mkdIr ~/bxgithub
    fi
    cd ~/bxgithub
    if [ ! -d "$homeDir/bxgithub/myfile" ]; then
        git clone https://github.com/baoxianzhang/myfile.git
    fi
    rm ~/.tmux.conf
    ln -s ~/bxgithub/myfile/tmux.conf ~/.tmux.conf
fi

echo "<<<<<< Install nginx. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install nginx
    echo "Configure the nginx "
    echo "Run: sudo vim /etc/nginx/nginx.conf"
fi

echo "<<<<<< Install stlink. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ~/softwares
    if [ ! -d "stlink" ]; then
        git clone git://github.com/texane/stlink.git
    fi
    cd stlink
    sudo apt-get install libsgutils2-dev libusb-1.0.0-dev
    sudo apt-get install autoconf automake libtool
    ./autogen.sh
    ./configure
    make
    cd flash
    make
    cd ..
    sudo install -s -m 775 st-util /usr/bin/st-util
    sudo install -s -m 775 flash/st-flash /usr/bin/st-flash
    sudo install -m 644 49-stlinkv1.rules /etc/udev/rules.d/49-stlinkv1.rules
    sudo install -m 644 49-stlinkv2.rules /etc/udev/rules.d/49-stlinkv2.rules
    sudo install -m 644 49-stlinkv2-1.rules /etc/udev/rules.d/49-stlinkv2-1.rules
    sudo install -m 644 stlink_v1.modprobe.conf /etc/modprobe.d/stlink_v1.modprobe.conf
    sudo udevadm control --reload-rules
fi

echo "<<<<<< Install GoldenDict. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install goldendict
    ##configure the dict source
    ##http://abloz.com/huzheng/stardict-dic/zh_CN/
    ##download the dict source stardict-langdao-ce-gb-2.4.2, stardict-langdao-ec-gb-2.4.2, stardict-oxford-gb-2.4.2
    cd ~/
    if [ ! -d "GoldenDict" ];then
        mkdir GodlenDict
    fi
    cd ~/GodlenDict
    if [ ! -f "stardict-langdao-ec-gb-2.4.2.tar.bz2"];then
        wget http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2
        wget http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ce-gb-2.4.2.tar.bz2
        wget http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-oxford-gb-2.4.2.tar.bz2
        tar -xjvf stardict-langdao-ec-gb-2.4.2.tar.bz2
        tar -xjvf stardict-langdao-ce-gb-2.4.2.tar.bz2
        tar -xjvf stardict-oxford-gb-2.4.2.tar.bz2
    fi
    echo "start: goldendict, and configure it"
fi

echo "<<<<<< Install awk for openwrt. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install gawk
fi

echo "<<<<<< Install perl. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install perl
fi

echo "<<<<<< Install XML::Parser for openwrt. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install expat
    sudo apt-get install libexpat1-dev
    sudo apt-get install libxml-parser-perl
fi

echo "<<<<<< Install Inkscape Vector Graphics Editor. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install inkscape
fi

echo "<<<<<< Install Audacity. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install audacity
fi

echo "<<<<<< Google Chrome. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://www.linuxidc.com/Linux/2014-04/100645.htm
    cd ~/softwares
    if [ ! -f "google-chrome-stable_current_amd64.deb" ]; then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    fi
    echo "Use the Software center to install the deb since dpkg is not work!"
    # sudo dpkg -i google-chrome-stable_current_amd64.deb
    echo "Usage: google-chrome-stable"
fi

echo "<<<<<< Install Skype. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ~/softwares
    if [ ! -f "skype-ubuntu-precise_4.3.0.37-1_i386.deb" ]; then
        wget download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
    fi
    echo "Use the Software center to install the deb since dpkg is not work!"
    # sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
fi

echo "<<<<<< Install Emacs 24.5. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #if [ ! -f "emacs" ]; then
    #git clone https://github.com/emacs-mirror/emacs.git
    #./configure
    #make
    #sudo make install
    #fi
    ## or
    cd ~/softwares
    if [ ! -f "emacs-24.5.tar.gz" ]; then
        wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
        tar -xzvf emacs-24.5.tar.gz
    fi
    cd emacs-24.5
    sudo apt-get install libjpeg-dev
    sudo apt-get install libgif-dev
    sudo apt-get install libtiff5-dev
    ./configure
    make
    sudo make install
fi

echo "<<<<<< Install virtualbox. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: https://www.virtualbox.org/
    cd ~/softwares
    if [ ! -f "virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb" ]; then
        wget http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
    fi
    echo "Use the Software center to install the deb since dpkg is not work!"
    sudo dpkg -i virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
    echo "if failed, click the deb, use the software center to install it."
fi

echo "<<<<<< Install virtualbox win 7 addition. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    echo "Please install the iso first! Continue?[Y/n]"
    virtualbox
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cd ~/softwares
        #boot VT-x AMD-v to support 64 bit
        #VirtualBox guest additions
        sudo apt-get install linux-headers-generic build-essential dkms -y
        echo "find the VirtualBox Guest Additions in the Device, and click and install it. Continue?[Y/n]"
        ans=$(askForContinue)
        if [ $ans == 1 ];then
            ##Now you can use the sharefile and enlarge the screen
            echo "Install the Oracle VM VirtualBox Extension Pack to use the usb"
            ##Ref: http://www.xiaojian.org/article/310.html
            if [ ! -f "Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack" ];then
                wget http://download.virtualbox.org/virtualbox/5.0.16/Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
            fi
            VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
            echo "Run: sudo addgroup zhangbaoxian vboxusers"
            ans=$(askForContinue)
            if [ $ans == 1 ];then
                cat /etc/group | grep vboxusers
            fi
            ## Find the devigid and add to the devgid next line
            #sudo echo "none /proc/bus/usb usbfs devgid=125,devmode=664 0 0" >> /etc/fstab
            #if not work, please reinstall virtualbox!

        fi
   fi
fi

echo "<<<<<< Install vagrant. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://rmingwang.com/vagrant-commands-and-config.html   https://www.vagrantup.com/docs/boxes.html
    cd ~/softwares
    if [ ! -f "vagrant_1.8.1_x86_64.deb" ]; then
        wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
    fi
    sudo dpkg -i vagrant_1.8.1_x86_64.deb
    if [ ! -d "$homeDir/virtualbox/vagrant" ]; then
        mkdir -p ~/virtualbox/vagrant
    fi
    #Ref: https://atlas.hashicorp.com/boxes/search
    #wget https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box
    cd ~/virtualbox/vagrant
    if [ ! -d "box" ]; then
        mkdir box
    fi
    cd box
    vagrant box add ubuntu/trusty64
    cd ..
    if [ ! -d "trust64" ]; then
        mkdir trust64
    fi
    cd trust64
    vagrant init ubuntu/trusty64
    #vagrant up
    #vagrant ssh
    #vagrant halt
fi

echo "<<<<<< Install go-for-it. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install go-for-it
fi

echo "<<<<<< Install SecureCRT 7.3. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    echo "Please install by your own hand. Follow the link below!"
    echo "http://blog.csdn.net/chszs/article/details/40623169"
fi

echo "<<<<<< Download xtensa and install it. Continue?[Y/n] >>>>>>"
ans=$(askForContinue)
if [ $ans == 1 ];then
    echo "Please install by your own hand. Follow the link and steps below!"
    echo "https://drive.google.com/folderview?id=0B5bwBE9A5dBXaExvdDExVFNrUXM&usp=sharing"
    echo "sudo cp xtensa-lx106-elf /usr/src/ -r"
    echo "Add to the PATH!"
    #echo "export PATH=$PATH:/usr/src/xtensa-lx106-elf/bin" >> ~/.zshrc
fi
