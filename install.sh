// clone myfile spacemacs.git


// install vim 

// install emacs 25.1

// install clion
wget http://www.jetbrains.com/clion/download/download-thanks.html?platform=linux

// sogou
wget http://pinyin.sogou.com/linux/download.php?f=linux&bit=64

// chrome
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

// zsh
sudo apt-get install zsh
sudo apt-get install google-chrome-stable
chsh -s /bin/zsh


// install indigo version of ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update -y
sudo apt-get install ros-indigo-desktop-full -y
sudo rosdep init
rosdep update
sudo apt-get install python-rosinstall -y


// open terminal in the current directory
sudo apt-get install nautilus-open-terminal

// pdf
sudo apt-get install okular -y

// python 3.6.1
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz

// pyQt5
 wget https://nchc.dl.sourceforge.net/project/pyqt/PyQt5/PyQt-5.8.2/PyQt5_gpl-5.8.2.tar.gz

// Qt Creator 4.3.0
wget http://gensho.ftp.acc.umu.se/mirror/qt.io/qtproject/official_releases/qtcreator/4.3/4.3.0/qt-creator-opensource-linux-x86_64-4.3.0.run

// Qt 5.9.0
wget http://gemmei.ftp.acc.umu.se/mirror/qt.io/qtproject/archive/qt/5.9/5.9.0/qt-opensource-linux-x64-5.9.0.run

// autojump
sudo apt-get install autojump
