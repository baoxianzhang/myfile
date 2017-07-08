#! /bin/bash
#Author: baoxian zhang[baoxianzhang] <baoxianzhit@gmail.com>
#Date: Tuesday, 14-03-2016

## Function
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

# Reset text attributes to normal + without clearing screen.
# alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho()
{
    echo -e "${2}${1}"
    tput sgr0
    # Reset # Reset to normal.
    return
}

## Color Define
# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#Some pre-define variable
SOFTWARE_PATH=~/Softwares
MYGITHUB_DIR=~/bxgithub

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cecho "<<<<<< Softwares install begin on Ubuntu 14.04 >>>>>>" $yellow
cecho "Please connect the wifi and check the wifi! " $red

# include the flags which software to install
. ./softwaresInstallFlag.sh

if [ $FLAG_APT_GET_UPDATE == 1 ];then
    cecho "<<<<<< Update the software, not upgrade system. >>>>>>" $yellow
    sudo apt-get update
fi

if [ $FLAG_APT_GET_SOFTWARE_INSTALL == 1 ];then
    cecho "<<<<<< Install apps using apt-get. >>>>>>" $yellow
    # sed -i "s/IP_REDIS_CONFIG/192.168.33.13/g" `grep 'IP_REDIS_CONFIG' -rl .`
    apps=(
        # Utilities
        # add your install apt softwares in lines
        # for example, audacious
        # git
        g++
        build-essential
        python
        python3
        openssh-server
        trash-cli
        luajit
        exuberant-ctags
        curl
        silversearcher-ag
        sqlite3
        sshpass
        xsel
        #terminator
        # nginx
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
        #google-chrome-stable
        expect
        unzip
        tmux
        meld
        openssh-client
        openssh-server
        ranger
        ksnapshot
        nodejs-legacy
        curl
        npm
        markdown
        # pdf-tools for emacs
        libpng-dev
        libz-dev
        libpoppler-glib-dev
        libpoppler-private-dev
        nautilus-open-terminal
        # flashplugin-installer
        #adobe-flashplugin

    )
    cecho "Please edit the apps you need to install and save it!" $red
    read nothing

    cat /dev/null > apps.tmp
    for item in ${apps[@]}; do
        echo "${item}" >> apps.tmp
    done

    vi apps.tmp
    apps=$(cat apps.tmp)
    rm -f apps.tmp

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

mkdir -p SOFTWARE_PATH
mkdir -p MYGITHUB_PATH

if [ $FLAG_GIT_INSTALL == 1 ];then
    cecho "<<<<<< Install git 2.13.1. >>>>>>" $yellow
    # Magit requires Git >= 1.9.4, you are using 1.9.1.
    cd $SOFTWARE_PATH
    #sudo apt-get remove git
    if [ ! -d "git-2.13.1" ]; then
        wget -nc https://www.kernel.org/pub/software/scm/git/git-2.13.1.tar.gz
        tar -xzvf git-2.7.3.tar.gz
    fi
    cd git-2.13.1
    chmod +x configure
    ./configure
    sudo apt-get install -y zlib1g-dev
    sudo apt-get install -y curl
    make
    sudo make install
fi


if [ $FLAG_GIT_EMAIL_NAME_CONFIG == 1 ];then
    cecho "<<<<<< Configure git email name and editor. >>>>>> " $yellow
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

if [ $FLAG_RIPGREP_INSTALL == 1 ];then
    cecho "<<<<<< Install ripgrep. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    if [ ! -f "ripgrep-0.2.9-x86_64-unknown-linux-musl.tar.gz" ]; then
        wget -nc -O ripgrep-0.2.9-x86_64-unknown-linux-musl.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/0.2.9/ripgrep-0.2.9-x86_64-unknown-linux-musl.tar.gz
        tar -xzvf ripgrep-0.2.9-x86_64-unknown-linux-musl.tar.gz
        sudo cp ripgrep-0.2.9-x86_64-unknown-linux-musl/rg /usr/local/bin/
    fi
fi

if [ $FLAG_CMAKE_INSTALL == 1 ];then
    cecho "<<<<<< Install cmake 3.9.0-rc2. >>>>>>" $yellow
    #Ref: https://cmake.org/
    cd $SOFTWARE_PATH
    if [ ! -f "cmake-3.9.0-rc2.tar.gz" ]; then
        wget -nc https://cmake.org/files/v3.9/cmake-3.9.0-rc2.tar.gz
        tar -xvzf cmake-3.9.0-rc2.tar.gz
    fi
    if [ ! -d "cmake-3.9.0-rc2" ]; then
        cd cmake-3.9.0-rc2
        #if the second times or more, comment the next two lines
        ./configure
        make
        sudo make install
    fi
fi

if [ $FLAG_ZSH_INSTALL == 1 ];then
    cecho "<<<<<< Install zsh. >>>>>>" $yellow
    #Ref: http://zhuanlan.zhihu.com/mactalk/19556676ls
    #Restart and use the zsh
    cd $SOFTWARE_PATH
    sudo apt-get install -y zsh
    echo "export PATH=$PATH:/usr/lib/git-core" >> ~/.bashrc
    source ~/.bashrc
    wget -nc https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    chsh -s /bin/zsh
    echo "Logout to use zsh"
fi

if [ $FLAG_AUTOJUMP_INSTALL == 1 ];then
    cecho "<<<<<< Install autojump. >>>>>>" $yellow
    #Ref: https://github.com/wting/autojump
    cd $SOFTWARE_PATH
    if [ ! -f "autojump_v21.1.2.tar.gz" ]; then
        wget -nc https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.gz
        tar -xzvf autojump_v21.1.2.tar.gz
        cd autojump_v21.1.2
        ./install.sh
    fi
fi

if [ $FLAG_CTAGS_INSTALL == 1 ];then
    cecho "<<<<<< Install ctags. >>>>>>" $yellow
    sudo apt-get install -y exuberant-ctags
    cd $SOFTWARE_PATH
    if [ ! -f "ctags-5.8.tar.gz" ]; then
        wget -nc http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
        tar -xzvf ctags-5.8.tar.gz
    fi
    cd ctags-5.8
    ./configure
    make
    sudo make install
    cecho "Usage: ctags-exuberant -R *" $green
fi

if [ $FLAG_GTAGS_INSTALL == 1 ];then
    cecho "<<<<<< Install gtags. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    if [ ! -f "global-6.5.5.tar.gz" ]; then
        wget -nc http://tamacom.com/global/global-6.5.5.tar.gz
        tar -xzvf global-6.5.5.tar.gz
    fi
    cd global-6.5.5
    sudo apt-get install -y libsdl1.2-dev
    sudo apt-get install -y ncurses-bin
    sudo apt-get install -y libncurses5-dev
    ./configure
    make
    sudo make install
    cecho "Usage: gtags" $green
fi

if [ $FLAG_VIM_INSTALL == 1 ];then
    cecho "<<<<<< Install vim. >>>>>>" $yellow
    #Ref: http://www.vim.org/download.php
    cd $SOFTWARE_PATH
    if [ ! -d "vim" ]; then
        wget -nc -O vim.zip https://github.com/vim/vim/archive/master.zip
        unzip -o vim.zip
        mv vim-master vim
    fi
    sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
    sudo apt-get build-dep vim-gnome
    sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev -y
    sudo rm -rf /usr/local/share/vim
    sudo rm -rf /usr/bin/vim
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
fi

if [ $FLAG_SPF13VIM_INSTALL == 1 ];then
    cecho "<<<<<< Install spf13 vim. >>>>>>" $yellow
    if [ $FLAG_MYVIM_LOCAL_SETTINGS_CONFIG == 1 ];then
        cecho "<<<<<< Set my local settings in vim. >>>>>>" $yellow
        rm -rf ~/.vimrc.before.local
        ln -s $MYGITHUB_PATH/myfile/vimrc.before.local ~/.vimrc.before.local
        rm -rf ~/.vimrc.bundles.local
        ln -s $MYGITHUB_PATH/myfile/vimrc.bundles.local ~/.vimrc.bundles.local
    fi

    cd $SOFTWARE_PATH
    wget https://raw.githubusercontent.com/spf13/spf13-vim/3.0/bootstrap.sh
    chmod +x bootstrap.sh
    ./bootstrap.sh
fi

if [ $FLAG_ARM_NONE_EABI_GCC_4dot9dot3_INSTALL == 1 ];then
    cecho "<<<<<< Install arm-none-eabi-gcc 4.9.3. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    sudo apt-get install -y lib32ncurses5 lib32z1
    #lib32bz2-1.0
    wget -nc https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
    tar -jxf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
    sudo cp gcc-arm-none-eabi-4_9-2015q3 /usr/src/ -r
fi

if [ $FLAG_ESPTOOL_INSTALL == 1 ];then
    cecho "<<<<<< Install esptool. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    wget -nc https://github.com/igrr/esptool-ck/releases/download/0.4.9/esptool-0.4.9-linux64.tar.gz
    tar -zxf esptool-0.4.9-linux64.tar.gz
    sudo cp esptool-0.4.9-linux64 /usr/src/esptool -r
fi

if [ $FLAG_SOFTLINK_ZSHRC_INSTALL == 1 ];then
    cecho "<<<<<< Softlink zshrc. >>>>>>" $yellow
    cd $MYGITHUB_PATH
    if [ ! -d "$MYGITHUB_PATH/myfile" ]; then
        wget -nc -O myfile.zip https://github.com/baoxianzhang/myfile/archive/master.zip
        unzip -o myfile.zip
        mv myfile-master myfile
    fi
    rm -f ~/.zshrc
    ln -s $MYGITHUB_PATH/myfile/zshrc ~/.zshrc
fi

if [ $FLAG_SOFTLINK_TMUX_INSTALL == 1 ];then
    cecho "<<<<<< Softlink tmux. >>>>>>" $yellow
    cd $MYGITHUB_PATH
    if [ ! -d "$MYGITHUB_PATH/myfile" ]; then
        wget -nc -O myfile.zip https://github.com/baoxianzhang/myfile/archive/master.zip
        unzip -o myfile.zip
        mv myfile-master myfile
    fi
    rm -rf ~/.tmux.conf
    ln -s $MYGITHUB_PATH/myfile/tmux.conf ~/.tmux.conf
fi

if [ $FLAG_STLINK_INSTALL == 1 ];then
    cecho "<<<<<< Install stlink. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    if [ ! -d "stlink" ]; then
        git clone https://github.com/texane/stlink.git
    fi
    cd stlink
    sudo apt-get install -y pkg-config
    sudo apt-get install -y intltool
    sudo apt-get install -y libsgutils2-dev libusb-1.0.0-dev
    sudo apt-get install -y autoconf automake libtool
    make
    sudo install -s -m 775 build/Release/src/gdbserver/st-util /usr/bin/st-util
    sudo install -s -m 775 build/Release/st-flash /usr/bin/st-flash
    sudo install -m 644 ./etc/udev/rules.d/49-stlinkv1.rules /etc/udev/rules.d/49-stlinkv1.rules
    sudo install -m 644 ./etc/udev/rules.d/49-stlinkv2.rules /etc/udev/rules.d/49-stlinkv2.rules
    sudo install -m 644 ./etc/udev/rules.d/49-stlinkv2-1.rules /etc/udev/rules.d/49-stlinkv2-1.rules
    sudo install -m 644 ./etc/modprobe.d/stlink_v1.conf /etc/modprobe.d/stlink_v1.conf
    sudo udevadm control --reload-rules
    sudo udevadm trigger
fi

if [ $FLAG_GOLDENDICT_INSTALL == 1 ];then
    cecho "<<<<<< Install GoldenDict. >>>>>>" $yellow
    sudo apt-get install -y goldendict
    ##configure the dict source
    ##http://abloz.com/huzheng/stardict-dic/zh_CN/
    ##download the dict source stardict-langdao-ce-gb-2.4.2, stardict-langdao-ec-gb-2.4.2, stardict-oxford-gb-2.4.2
    cd
    if [ ! -d "GoldenDict" ];then
        mkdir GodlenDict
    fi
    cd ~/GoldenDict
    wget -nc http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2
    wget -nc http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ce-gb-2.4.2.tar.bz2
    wget -nc http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-oxford-gb-2.4.2.tar.bz2
    tar -xjvf stardict-langdao-ec-gb-2.4.2.tar.bz2
    tar -xjvf stardict-langdao-ce-gb-2.4.2.tar.bz2
    tar -xjvf stardict-oxford-gb-2.4.2.tar.bz2
    cecho "start: goldendict, and configure it" $green
fi

if [ $FLAG_FZF_INSTALL == 1 ]; then
    cecho "<<<<<< Install fzf. " $yellow
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

if [ $FLAG_GO_FOR_IT_INSTALL == 1 ];then
    cecho "<<<<<< Install go-for-it. >>>>>>" $yellow
    sudo add-apt-repository ppa:mank319/go-for-it
    sudo apt-get update
    sudo apt-get install -y go-for-it
fi

if [ $FLAG_THEFUCK_INSTALL == 1 ]; then
    cecho "<<<<<< Install thefuck. " $yellow
    sudo apt-get install -y python-pip
    sudo -H pip install thefuck
    #echo "eval $(thefuck --alias)" >> ~/.zshrc
fi

if [ $FLAG_MERCURY_MW150US_WIRELESS_INSTALL == 1 ];then
    cecho "<<<<<< Install mercury Mw150us wireless driver. >>>>>>" $yellow
    #Ref: http://jarhead.blog.163.com/blog/static/175217041201317102236535/
    #Ref: http://forum.ubuntu.org.cn/viewtopic.php?t=421982
    cd $SOFTWARE_PATH
    if [ ! -d "rtl8188eu" ]; then
        wget -nc -O rtl8188eu.zip https://github.com/lwfinger/rtl8188eu/archive/master.zip
        unzip -o rtl8188eu.zip
        mv rtl8188eu-master rtl8188eu
    fi
    cd rtl8188eu
    sudo apt-get install -y build-essential
    sudo apt-get install -y linux-headers-$(uname -r)
    make
    sudo make install
    # The next can be undo
    #sudo echo "8188eu" >> /etc/modules
    cecho "Logout to use Mw150us wireless" $red
fi

if [ $FLAG_EMACS_INSTALL == 1 ];then
    cecho "<<<<<< Install Emacs. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    if [ ! -f "emacs-25.1.tar.gz" ]; then
        wget -nc http://ftpmirror.gnu.org/emacs/emacs-25.1.tar.gz
        tar -xzvf emacs-25.1.tar.gz
    fi
    cd emacs-25.1
    sudo apt-get install -y libgtk2.0-dev
    sleep 1
    sudo apt-get install -y libxpm-dev
    sleep 1
    sudo apt-get install -y libncurses5-dev
    sleep 1
    sudo apt-get install -y libjpeg-dev
    sleep 1
    sudo apt-get install -y libgif-dev
    sleep 1
    sudo apt-get install -y libtiff5-dev
    sleep 1
    ./configure
    make
    sudo make install
fi


if [ $FLAG_SPACEMACS_INSTALL == 1 ]; then
    cecho "<<<<<< Install Spacemacs. >>>>>>" $yellow
    if [ ! -d "$homeDir/bxgithub" ]; then
        mkdir -p $MYGITHUB_PATH
    fi
    cd ~/bxgithub/
    if [ ! -d "$MYGITHUB_PATH/spacemacs" ]; then
        git clone https://github.com/syl20bnr/spacemacs.git
        cd spacemacs
        git checkout develop
    fi
    rm -rf ~/.emacs.d
    ln -s ~/bxgithub/spacemacs ~/.emacs.d
fi

if [ $FLAG_SOFTLINK_SPACEMACS_CONFIG == 1 ]; then
    cecho "<<<<<< Softlink Spacemacs. >>>>>>" $yellow
    rm -rf ~/.spacemacs.d
    ln -s ~/bxgithub/myfile/spacemacs.d ~/.spacemacs.d
fi

if [ $FLAG_VIRTUALBOX_INSTALL == 1 ];then
    cecho "<<<<<< Install virtualbox in ubuntu 16.04. >>>>>>" $yellow
    #Ref: https://www.virtualbox.org/
    cd $SOFTWARE_PATH
    wget -nc http://download.virtualbox.org/virtualbox/5.1.6/virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb
    #echo "Use the Software center to install the deb since dpkg is not work!"
    sudo dpkg -i virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb
    cecho "if failed, click the deb, use the software center to install it." $red
    wget -nc http://download.virtualbox.org/virtualbox/5.1.6/Oracle_VM_VirtualBox_Extension_Pack-5.1.6-110634.vbox-extpack
    cecho "Install the extpack by your hand." $red
    cecho "sudo usermod -aG vboxusers <host>" $red # for USB
fi

if [ $FLAG_VIRTUALBOX_WIN7_INSTALL == 1 ];then
    cecho "<<<<<< Install virtualbox win 7 and win 7 addition. >>>>>>" $yellow
    cecho "Please install the iso first! Continue?[Y/n]" $yellow
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        virtualbox
    fi
    cecho "Finish? Continue?[Y/n]" $yellow
    ans=$(askForContinue)
    if [ $ans == 1 ];then
        cd $SOFTWARE_PATH
        #boot VT-x AMD-v to support 64 bit
        #VirtualBox guest additions
        sudo apt-get install -y linux-headers-generic build-essential dkms
        cecho "find the VirtualBox Guest Additions in the Device, and click and install it. Continue?[Y/n]" $green
        ans=$(askForContinue)
        if [ $ans == 1 ];then
            ##Now you can use the sharefile and enlarge the screen
            cecho "Install the Oracle VM VirtualBox Extension Pack to use the usb" $green
            ##Ref: http://www.xiaojian.org/article/310.html
            if [ ! -f "Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack" ];then
                wget -nc http://download.virtualbox.org/virtualbox/5.0.16/Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
            fi
            VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.16-105871.vbox-extpack
            #cecho "Run: sudo addgroup zhangbaoxian vboxusers. Continue?[Y/n]" $yellow
            #ans=$(askForContinue)
            #if [ $ans == 1 ];then
            #    cat /etc/group | grep vboxusers
            #fi
            ## Find the devigid and add to the devgid next line
            #sudo echo "none /proc/bus/usb usbfs devgid=125,devmode=664 0 0" >> /etc/fstab
            #if not work, please reinstall virtualbox!
            # Add Drag function on the host and the virtualbox
            # Settings->General->Advanced: choose shared Clipboard Bidirectional; Drag'n Drop: Bidrectional.
        fi
    fi
fi

if [ $FLAG_VAGRANT_INSTALL == 1 ];then
    cecho "<<<<<< Install vagrant. >>>>>>" $yellow
    #Ref: http://rmingwang.com/vagrant-commands-and-config.html   https://www.vagrantup.com/docs/boxes.html
    cd $SOFTWARE_PATH
    if [ ! -f "vagrant_1.8.1_x86_64.deb" ]; then
        wget -nc https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
    fi
    sudo dpkg -i vagrant_1.8.1_x86_64.deb
fi

if [ $FLAG_VAGRANT_TRUSTY64_INSTALL == 1 ];then
    cecho "<<<<<< Install ubuntu/trusty64. >>>>>>" $yellow
    if [ ! -d "$homeDir/virtualbox/vagrant" ]; then
        mkdir -p ~/virtualbox/vagrant
    fi
    #Ref: https://atlas.hashicorp.com/boxes/search
    #wget -nc https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box
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
    cecho "Hint: vagrant up, vagrant ssh, vagrant halt" $blue
fi

if [ $FLAG_XTENSA_INSTALL == 1 ];then
    cecho "<<<<<< Download xtensa and install it. >>>>>>" $yellow
    #gcc-xtensa in github: https://github.com/jcmvbkbc/gcc-xtensa
    cecho "Please install by your own hand. Follow the link and steps below!" $green
    cecho "https://drive.google.com/folderview?id=0B5bwBE9A5dBXaExvdDExVFNrUXM&usp=sharing" $green
    cecho "sudo cp xtensa-lx106-elf /usr/src/ -r" $green
    cecho "Add to the PATH!" $green
    #echo "export PATH=$PATH:/usr/src/xtensa-lx106-elf/bin" >> ~/.zshrc
    wget -nc https://doc-0o-3o-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/c66ev5j18rjbov5hsvkefgttllsrrrk2/1461578400000/00407590198758729148/*/0B5bwBE9A5dBXT0plVndobnU1dTg?e=download
    tar -xjvf xtensa-lx06.tar.bz
    iscp xtensa-lx106-elf /usr/src/ -r
fi

if [ $FLAG_SYSTEM_INDICATOR_INSTALL == 1 ];then
    cecho "<<<<<< Install System Indicator. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    sudo add-apt-repository ppa:indicator-multiload/stable-daily
    sudo apt-get update
    sudo apt-get install indicator-multiload
fi

if [ $FLAG_LAUNCHERFODERS_INSTALL == 1 ];then
    cecho "<<<<<< Install LauncherFolders. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    wget http://unity-folders.exceptionfound.com/unity-launcher-folders_1.0.3_all.deb
    sudo dpkg -i unity-launcher-folders_1.0.3_all.deb
fi

#if [ $FLAG_SKYPE_INSTALL == 1 ];then
#    cecho "<<<<<< Install Skype. >>>>>>" $yellow
#    cd $SOFTWARE_PATH
#    if [ ! -f "skype-ubuntu-precise_4.3.0.37-1_i386.deb" ]; then
#        wget -nc download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
#    fi
#    cecho "Use the Software center to install the deb since dpkg is not work!" $red
#    cecho "Press any key to continue!" $green
#    read nothing
#    # sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
#fi

if [ $FLAG_SKYPE_INSTALL == 1 ];then
    cecho "<<<<<< Install Skype. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    if [ ! -f "skypeforlinux-64-alpha.deb" ]; then
        wget -nc https://go.skype.com/skypeforlinux-64-alpha.deb
        sudo apt-get install gdebi
        sudo gdebi skypeforlinux-64-alpha.deb
    fi
    #cecho "Use the Software center to install the deb since dpkg is not work!" $red
    #cecho "Press any key to continue!" $green
    #read nothing
    # sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
fi




if [ $FLAG_GOOGLE_HOSTS_INSTALL == 1 ];then
    cecho "<<<<<< Install Google Hosts. >>>>>>" $yellow
    cecho "By your own hand! Follow the bellow link!" $green
    cecho "http://laod.cn/hosts/2016-google-hosts.html" $green
    cecho "Press any key to continue!" $green
    read nothing
fi

if [ $FLAG_ZEAL_FOR_SPACEMACE_INSTALL == 1 ];then
    cecho "<<<<<< Install ZEAL FOR SPACEMACS. >>>>>>" $yellow
    sudo add-apt-repository ppa:zeal-developers/ppa
    sudo apt-get update
    sudo apt-get install zeal
fi

if [ $FLAG_LATEX_INSTALL == 1 ];then
    cecho "<<<<<< Install LATEX. >>>>>>" $yellow
    sudo apt-get install texlive-full
    # latex editor
    sudo apt-get install texmaker
fi


if [ $FLAG_SCEL2PYIM_FOR_SPACEMACE_INSTALL == 1 ]; then
    cd $SOFTWARE_PATH
    cecho "<<<<<< Install scel2pyim for spacemacs chinese layer. >>>>>> " $yellow
    git clone https://github.com/E-Neo/scel2pyim.git
    cd scel2pyim
    gcc -o scel2pyim scel2pyim.c
    sudo cp scel2pyim /usr/local/bin/
    #sogou pin cell library path: /usr/share/sogou-qimpanel/cell/defaultCell/
fi

if [ $FLAG_WAKATIME_FOR_SPACEMACE_INSTALL == 1 ]; then
    cecho "<<<<<< Install wakatime for spacemacs. >>>>>> " $yellow
    sudo pip install wakatime
fi

if [ $FLAG_PANDOC_FOR_SPACEMACE_INSTALL == 1 ]; then
    cecho "<<<<<< Install pandoc for spacemacs. >>>>>> " $yellow
    sudo apt-get install pandoc
fi

if [ $FLAG_DASH_ZEAL_DOCSETS_FOR_SPACEMACE_INSTALL == 1 ]; then
    cecho "<<<<<< Install zeal docsets for spacemacs. >>>>>> " $yellow
    cd ~/bxgithub/
    git clone https://github.com/baoxianzhang/myconfigresources.git
    cd myconfigresources
    chmod +x install.sh
    ./install.sh
    rm ~/.local/share/Zeal/Zeal/docsets
    ln -s ~/bxgithub/myconfigresources/zeal/docsets ~/.local/share/Zeal/Zeal/docsets
fi


if [ $FLAG_HAROOPAD_FOR_MARKDOWN_INSTALL == 1 ]; then
    cecho "<<<<<< Install Haroopad for Markdown. >>>>>> " $yellow
    cd $SOFTWARE_PATH
    wget https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.deb
    sudo dpkg -i haroopad-v0.13.1-x64.deb
fi

if [ $FLAG_SECURECRT7dot3_INSTALL == 1 ];then
    cecho "<<<<<< Install SecureCRT 7.3. >>>>>>" $yellow
    cecho "Please install by your own hand. Follow the link below!" $green
    cecho "http://blog.csdn.net/chszs/article/details/40623169" $green
    cecho "Download deb and crack in baiduyun pan" $green
    cecho "$sudo dpkg -i scrt-7.3.0-657.ubuntu13-64.x86_64.deb" $green
    cecho "$sudo perl securecrt_linux_crack.pl /usr/bin/SecureCRT" $green
    cecho "Press any key to continue!" $green
    read nothing
fi

#if [ $FLAG_SHADOWSOCKS_INSTALL == 1 ];then
#    cecho "<<<<<< Install Shadwsocks. >>>>>>" $yellow
#    sudo apt-get install python-pip
#    sudo pip install shadowsocks
#    cecho "add SwitchyOmega.crx plugin to google chrome" $green
#    cecho "in input/output restore from file add *.bak and choose auto switch" $green
#    cecho "chmod +x shadowsock.sh and ./shadowsocks" $green
#fi

if [ $FLAG_FLAT_THEMES_ICONS_INSTALL == 1 ]; then
    cecho "<<<<<< Install ubuntu flat themes and icons. >>>>>>" $yellow
    echo "install the flat themes and icons for ubuntu ..."
    echo -e "\033[40;32m You can refer: https://blog.anmoljagetia.me/flatabulous-ubuntu-theme/  website to deploy you theme 033[0m"
    echo ""
    echo "install the Ubuntu tweak tool"
    sudo add-apt-repository ppa:tualatrix/ppa
    sudo apt-get update
    sudo apt-get install -y ubuntu-tweak
    echo ""
    echo "install themes"
    wget -nc -O flatTheme.zip https://github.com/anmoljagetia/Flatabulous/archive/master.zip
    sudo unzip flatTheme.zip -d /usr/share/themes/
    sudo mv /usr/share/themes/flatTheme-master /usr/share/flatTheme
    echo ""

    echo "install the icons"
    sudo add-apt-repository ppa:noobslab/icons
    sudo apt-get update
    sudo apt-get install -y ultra-flat-icons
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
fi;

if [ $FLAG_SHADOWSOCKS_INSTALL == 1 ]; then
    cecho "<<<<<< Install shadowsocks. " $yellow
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

# other softwares packagesender,
echo ""
cecho "Done， Happy Hacking!" $red
echo ""

if [ $FLAG_RUST_INSTALL == 1 ]; then
    cecho "<<<<<< Install Rust. >>>>>>" $yellow
    cd $SOFTWARE_PATH
    wget -nc https://static.rust-lang.org/dist/rust-1.13.0-x86_64-unknown-linux-gnu.tar.gz
    tar -xzvf rust-1.13.0-x86_64-unknown-linux-gnu.tar.gz
    cd rust-1.13.0-x86_64-unknown-linux-gnu
    sudo ./install.sh
    cargo install racer
    cargo install rustfmt
fi
