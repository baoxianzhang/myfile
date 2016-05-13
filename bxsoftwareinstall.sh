#! /bin/bash
#Author: baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
#Date: Tuesday, 14-03-2016
function askForContinue()
{
    read ANS
    case $ANS in
        n|N|no|NO)
            echo 0
            ;;
        *)
            echo 1
            ;;
    esac
}

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal + without clearing screen.
#alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo -e "${2}${1}"
  tput sgr0
  # Reset # Reset to normal.
  return
}

cecho "<<<<<< Softwares install begin on Ubuntu 14.04 >>>>>>" $yellow
cecho "Please connect the wifi and check the wifi! " $red

cecho "<<<<<< Update the software, not upgrade system. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get update
fi

cecho "<<<<<< Install apps using apt-get. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    # Keep-alive: update existing `sudo` time stamp until the script has finished.
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    
    # sed -i "s/IP_REDIS_CONFIG/192.168.33.13/g" `grep 'IP_REDIS_CONFIG' -rl .`
    apps=(
        # Utilities
        # add your install apt softwares in lines
        # for example, audacious
        # git 
        git 
        git-flow
        g++
        build-essential
        python
        python3
        openssh-server
        trash-cli
        ibus-googlepinyin
        luajit
        exuberant-ctags
        curl
        siversearcher-ag
        sqlite3
        sshpass
        terminator
        nginx
        gawk
        perl
        expat
        libexpat1-dev
        libxml-parser-perl
        inkscape
        audacity
        rar
        enca
        galculator
        audacity
        python-pip
        vim
        google-chrome-stable
        npm
    )
    
    cecho "Please edit the apps you need to install and save it!" $red
    read nothing
    
    cat /dev/null > apps.tmp
    for item in ${apps[@]}; do
        echo "${item}" >> apps.tmp
    done
    
    vi apps.tmp
    apps=$(cat apps.tmp)
    rm apps.tmp
    
    cecho "Now, the following apps will be installed!" $red
    for item in ${apps}; do
      cecho "> ${item}" $magenta
    done
    read nothing
    
    echo ""
    
    select yn in "Yes" "No"; do
      case $yn in
        Yes )
            cecho "Ok! installing apps, please wait ... " $yellow
            sudo apt-get install -y ${apps}
            break;;
        No ) break;;
      esac
    done
fi

cd
homeDir=$(pwd)
if [ ! -d "$homeDir/softwares" ]; then
    mkdir ~/softwares
fi


cecho "<<<<<< Install git 2.7.3. Continue?[Y/n] >>>>>>" $yellow
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
    echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
    sleep 3
    source ~/.bashrc
fi

cecho "<<<<<< Configure git email name and editor. Continue?[Y/n] >>>>>> " $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "<<<<<< Fix ~/.gitconfig file to your own cofiguration. >>>>>> "$green
echo "#[user]
#	email = baoxianzhit@gmail.com
#	name = baoxianzhang
#[core]
#	editor = vim
#[alias]
#	unstage = reset HEAD --
#	last = log -1 HEAD
#[merge]
#	tool = vimdiff
#[push]
#	default = simple
" >> ~/.gitconfig
    vi ~/.gitconfig

#    git config --global user.email "baoxianzhit@gmail.com"
#    git config --global user.name "baoxianzhang"
#    git config --global core.editor vim
fi

cecho "<<<<<< Install git flow completion. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd
    if [ ! -d "$homeDir/code" ]; then
        mkdir -p code
    fi
    cd ~/code
    # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
    # source ~/.bashrc
    if [ ! -d "git-flow-completion" ]; then
        git clone https://github.com/bobthecow/git-flow-completion.git
        #echo "source ~/code/git-flow-completion/git-flow-completion.zsh" >> ~/.zshrc
    fi
fi

cecho "<<<<<< Install cmake. Continue?[Y/n] >>>>>>" $yellow
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

cecho "<<<<<< Install zsh. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://zhuanlan.zhihu.com/mactalk/19556676ls
    #Restart and use the zsh
    cd ~/softwares
    sudo apt-get install zsh
    # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
    # source ~/.bashrc
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    chsh -s /bin/zsh
    echo "Logout to use zsh"
fi

cecho "<<<<<< Install autojump. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: https://github.com/wting/autojump
    cd ~/softwares
    if [ ! -f "autojump_v21.1.2.tar.gz" ]; then
        # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
        # source ~/.bashrc
        wget https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.gz
        tar -xzvf autojump_v21.1.2.tar.gz
        cd autojump_v21.1.2
        ./install.sh
        #echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc
        #source ~/.zshrc
    fi
fi

cecho "<<<<<< Install SogouPinyin Input method. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref:  http://jingyan.baidu.com/article/08b6a591cb06f114a8092209.html
    cd ~/softwares
    if [ ! -r sogou_64.deb ]; then
        sudo apt-get install fcitx libssh2-1
        wget "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O "sogou_64.deb"
    fi
    sudo dpkg -i sogou_64.deb
    cecho "<<<<<< Finished to install SougouPin, Please configure it >>>>>>" $green
    cecho "System Settings > Language Support > Install/Remove Languages > install the Chinese language" $green
    cecho "Logout the system to use sougou input method after finish all the installation!" $green
fi

cecho "<<<<<< Install mercury Mw150us wireless driver. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://jarhead.blog.163.com/blog/static/175217041201317102236535/
    #Ref: http://forum.ubuntu.org.cn/viewtopic.php?t=421982
    cd ~/softwares
    if [ ! -d "rtl8188eu" ]; then
        # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
        # source ~/.bashrc
        git clone https://github.com/lwfinger/rtl8188eu.git
    fi
    cd rtl8188eu
    sudo apt-get install build-essential
    sudo apt-get install linux-headers-$(uname -r)
    make
    sudo make install
    # The next can be undo
    #sudo echo "8188eu" >> /etc/modules
    cecho "Logout to use Mw150us wireless" $red
fi

cecho "<<<<<< Install ctags. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo apt-get install exuberant-ctags
    cd ~/softwares
    if [ ! -f "ctags-5.8.tar.gz" ]; then
        wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
        tar -xzvf ctags-5.8.tar.gz
    fi
    cd ctags-5.8
    ./configure
    make
    sudo make install
    cecho "Usage: ctags-exuberant -R *" $green
fi

cecho "<<<<<< Install gtags. Continue?[Y/n] >>>>>>" $yellow
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
    sudo apt-get install libncurses5-dev
    ./configure
    make
    sudo make install
    cecho "Usage: gtags" $green
fi

cecho "<<<<<< Install spf13 vim. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #echo "<<<<<< Install roboust zhou vim >>>>>>"
    #Ref: http://www.vim.org/download.php
    cd ~/softwares
    if [ ! -d "vim" ]; then
        # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
        # source ~/.bashrc
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
    cecho "Start vim and begin to install the plugin!" $green
fi

cecho "<<<<<< Install vim plugin in the other terninal. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    gnome-terminal -x bash -c "vim"
fi

cecho "<<<<<< Install arm-none-eabi-gcc 4.8.2. Continue?[Y/n] >>>>>>" $yellow
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

cecho "<<<<<< Install Google Hosts. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "By your own hand! Follow the bellow link!" $green
    cecho "http://laod.cn/hosts/2016-google-hosts.html" $green
fi

cecho "<<<<<< Softlink zshrc. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ ! -d "$homeDir/bxgithub" ]; then
        mkdir ~/bxgithub
    fi
    cd ~/bxgithub
    if [ ! -d "$homeDir/bxgithub/myfile" ]; then
        # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
        # source ~/.bashrc
        git clone https://github.com/baoxianzhang/myfile.git
    fi
    rm ~/.zshrc
    ln -s ~/bxgithub/myfile/zshrc ~/.zshrc
fi

cecho "<<<<<< Softlink emacs. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    if [ ! -d "$homeDir/bxgithub" ]; then
        mkdir ~/bxgithub
    fi
    cd ~/bxgithub
    if [ ! -d "$homeDir/bxgithub/emacs-c-ide-demo" ]; then
        # echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
        # source ~/.bashrc
        git clone https://github.com/baoxianzhang/emacs-c-ide-demo.git
    fi
    rm ~/.emacs.d -rf
    ln -s ~/bxgithub/emacs-c-ide-demo ~/.emacs.d
fi

cecho "<<<<<< Softlink tmux. Continue?[Y/n] >>>>>>" $yellow
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

cecho "<<<<<< Install stlink. Continue?[Y/n] >>>>>>" $yellow
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

cecho "<<<<<< Install GoldenDict. Continue?[Y/n] >>>>>>" $yellow
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
    cecho "start: goldendict, and configure it" $green
fi

#cecho "<<<<<< Google Chrome. Continue?[Y/n] >>>>>>" $yellow
#ans=$(askForContinue)
#if [ $ans == 1 ];then
#    #Ref: http://www.linuxidc.com/Linux/2014-04/100645.htm
#    cd ~/softwares
#    if [ ! -f "google-chrome-stable_current_amd64.deb" ]; then
#        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#    fi
#    cecho "Use the Software center to install the deb since dpkg is not work!" $red
#    # sudo dpkg -i google-chrome-stable_current_amd64.deb
#    cecho "Usage: google-chrome-stable" $green
#fi

cecho "<<<<<< Install Skype. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cd ~/softwares
    if [ ! -f "skype-ubuntu-precise_4.3.0.37-1_i386.deb" ]; then
        wget download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
    fi
    cecho "Use the Software center to install the deb since dpkg is not work!" $red
    # sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
fi

cecho "<<<<<< Install Emacs 24.5. Continue?[Y/n] >>>>>>" $yellow
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
    sleep 1
    sudo apt-get install libgif-dev
    sleep 1
    sudo apt-get install libtiff5-dev
    sleep 1
    ./configure
    make
    sudo make install
fi

cecho "<<<<<< Install virtualbox. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: https://www.virtualbox.org/
    cd ~/softwares
    if [ ! -f "virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb" ]; then
        wget http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
    fi
    #echo "Use the Software center to install the deb since dpkg is not work!"
    sudo dpkg -i virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
    cecho "if failed, click the deb, use the software center to install it." $red
fi

cecho "<<<<<< Install virtualbox win 7 and win 7 addition. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "Please install the iso first! Continue?[Y/n]" $yellow
    virtualbox
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cd ~/softwares
        #boot VT-x AMD-v to support 64 bit
        #VirtualBox guest additions
        sudo apt-get install linux-headers-generic build-essential dkms -y
        cecho "find the VirtualBox Guest Additions in the Device, and click and install it. Continue?[Y/n]" $green
        ans=$(askForContinue)
        if [ $ans == 1 ];then
            ##Now you can use the sharefile and enlarge the screen
            cecho "Install the Oracle VM VirtualBox Extension Pack to use the usb" $green
            ##Ref: http://www.xiaojian.org/article/310.html
            if [ ! -f "Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack" ];then
                wget http://download.virtualbox.org/virtualbox/5.0.16/Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
            fi
            VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
            cecho "Run: sudo addgroup zhangbaoxian vboxusers. Continue?[Y/n]" $yellow
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

cecho "<<<<<< Install vagrant. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #Ref: http://rmingwang.com/vagrant-commands-and-config.html   https://www.vagrantup.com/docs/boxes.html
    cd ~/softwares
    if [ ! -f "vagrant_1.8.1_x86_64.deb" ]; then
        wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
    fi
    sudo dpkg -i vagrant_1.8.1_x86_64.deb
    cecho "<<<<<< Install ubuntu/trusty64. Continue?[Y/n] >>>>>>" $yellow
    if [ $ans == 1 ];then
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
fi

cecho "<<<<<< Install go-for-it. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install go-for-it
fi

cecho "<<<<<< Install SecureCRT 7.3. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    cecho "Please install by your own hand. Follow the link below!" $green
    cecho "http://blog.csdn.net/chszs/article/details/40623169" $green
    cecho "Download deb and crack in baiduyun pan" $green
    cecho "$sudo dpkg -i scrt-7.3.0-657.ubuntu13-64.x86_64.deb" $green
    cecho "$sudo perl securecrt_linux_crack.pl /usr/bin/SecureCRT" $green

fi

cecho "<<<<<< Download xtensa and install it. Continue?[Y/n] >>>>>>" $yellow
ans=$(askForContinue)
if [ $ans == 1 ];then
    #gcc-xtensa in github: https://github.com/jcmvbkbc/gcc-xtensa
    cecho "Please install by your own hand. Follow the link and steps below!" $green
    cecho "https://drive.google.com/folderview?id=0B5bwBE9A5dBXaExvdDExVFNrUXM&usp=sharing" $green
    cecho "sudo cp xtensa-lx106-elf /usr/src/ -r" $green
    cecho "Add to the PATH!" $green
    #echo "export PATH=$PATH:/usr/src/xtensa-lx106-elf/bin" >> ~/.zshrc
    wget https://doc-0o-3o-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/c66ev5j18rjbov5hsvkefgttllsrrrk2/1461578400000/00407590198758729148/*/0B5bwBE9A5dBXT0plVndobnU1dTg?e=download
    tar -xjvf xtensa-lx06.tar.bz
    iscp xtensa-lx106-elf /usr/src/ -r
fi


cecho "<<<<<< Install fzf. Continue?[Y/n]" $yellow
ans=$(askForContinue)
if [ $ans == 1 ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

cecho "<<<<<< Install meld or bcompare. Continue?[Y/n]" $yellow
ans=$(askForContinue)
cd ~/softwares/
if [ $ans == 1 ]; then
    #sudo apt-get install meld
    wget http://www.scootersoftware.com/bcompare-4.1.5.21031_amd64.deb
    sudo dpkg -i bcompare-4.1.5.21031_amd64.deb
    cecho "trial licence" $red
fi

cecho "<<<<<< Install thefuck. Continue?[Y/n]" $yellow
ans=$(askForContinue)
if [ $ans == 1 ]; then
    sudo apt-get install python-pip
    sudo -H pip install thefuck
    #echo "eval $(thefuck --alias)" >> ~/.zshrc
fi

cecho "<<<<<< Install ubuntu flat themes and icons. Continue?[Y/n]" $yellow
ans=$(askForContinue)
if [ $ans == 1 ]; then
    echo "install the flat themes and icons for ubuntu ...";
    echo -e "\033[40;32m You can refer: https://blog.anmoljagetia.me/flatabulous-ubuntu-theme/  website to deploy you theme 033[0m"
    echo ""
    echo "install the Ubuntu tweak tool"
    sudo add-apt-repository ppa:tualatrix/ppa
    sudo apt-get update
    sudo apt-get install ubuntu-tweak
    echo ""
    echo "install themes"
    wget -O flatTheme.zip https://github.com/anmoljagetia/Flatabulous/archive/master.zip
    sudo unzip flatTheme.zip -d /usr/share/themes/
    echo ""

    echo "install the icons"
    sudo add-apt-repository ppa:noobslab/icons
    sudo apt-get update
    sudo apt-get install ultra-flat-icons
    #sudo apt-get install ultra-flat-icons-orange
    #sudo apt-get install ultra-flat-icons-gree
    echo ""

    cat <<EOF
    Now press your super key,
    search for Ubuntu Tweak and fire it.
    Under the tweaks tab, there is an option for theme.
    Under that select the Flatabulous theme.
    Under the icon settings, select ultra-flat-icons.
    Restart your computer, and you should be good to go!
    EOF

fi

cecho "<<<<<< Install shadowsocks. Continue?[Y/n]" $yellow
ans=$(askForContinue)
if [ $ans == 1 ]; then
   echo "sudo pip install shadowsocks";
   sudo -H pip install shadowsocks
   echo -e "\033[40;32m deploy the proxy server on your remote vps: server[1,2,3] \033[0m"
  
   SS_CFG="/etc/shadowsocks.json"
   if [ ! -f "$SS_CFG" ]; then
     echo "no found shadowsocks config file: /etc/shadowsocks.json";
     sudo touch "$SS_CFG"
   fi
   sudo chmod a+w "$SS_CFG"
   cat > "$SS_CFG" <<EOF
   {
    "server":["server1","server2"],
    "server_port":8080,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"password",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
   }
   EOF

  echo -e "\033[40;32m you can start the shadowsocks server on remote vps: sudo ssserver -c /etc/shadowsocks.json -d start \033[0m"
  #sudo ssserver -c $SS_CFG -d stop
  #sudo ssserver -c $SS_CFG -d start
  echo -e "\033[40;32m you can start the shadowsocks client on your local laptop: sslocal -c /etc/shadowsocks.json \033[0m"
fi;

echo ""
cecho "Done， Happy Hacking!" $red
echo ""
