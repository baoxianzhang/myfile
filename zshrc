# Path to your oh-my-zsh installation.
export ZSH=/home/${USERNAME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow z extract colored-man-pages web-search)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:/usr/src/gcc-arm-none-eabi-4_9-2015q3/bin
export PATH=$PATH:/usr/src/esptool
export PATH=$PATH:/usr/src/xtensa-lx106-elf/bin
export PATH=$PATH:/usr/src
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
###############useful tools
# tweak
# privacy indicator    http://www.florian-diesch.de/software/indicator-privacy/
# Launcher Folders     http://unity-folders.exceptionfound.com/
# TLP power save for notebook
# Macbuntu 14.04 theme
# Compizconfig setting manager
# Preload
# WifiAssist
#
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias for useful command
alias dstat='dstat -cdlmnpsy'
alias multitail='multitail'
alias rsync=rsync
alias vifm=vifm
alias ranger=ranger
alias sl=sl
#alias rm='trash-put'
alias homedistusage='sudo du -d 1 -k /home/* | sort -n -r'
alias screenshota='gnome-screenshot -a --interactive'
alias screenshotw='gnome-screenshot -w --interactive'
alias screenshotc='gnome-screenshot -c --interactive'
# 给USB设备增加读写权限, logout to effect
# sudo usermod -a -G dialout $USER
#
# tree -L 2
# alias emacs='emacsclient -c'

#
# git config
# gitignore: https://github.com/github/gitignore
alias gaa='git add .'
alias gcv='git commit --verbose'
alias gco='git checkout'
alias gc='git checkout --'
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
alias grh='git reset --hard'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#
# alias for self
alias dc='cd ~/Documents/'
alias dl='cd ~/Downloads/'
alias dt='cd ~/Desktop/'
alias tl='cd ~/Templates/'
alias mf='cd ~/bxgithub/myfile'
alias sw='cd ~/Software/'
alias vi='vim'
alias em='emacs'
alias o='nautilus ./'
alias encodeITERM='iconv -f GBK -t UTF-8 '
alias encodeECONV='enca -L zh_CN -x utf-8 '
alias vz='vim ~/.zshrc'
#alias encodeAll="encodeE $(find ./ *)"
alias s='source ~/.zshrc'
alias S='source ~/.zshrc'
alias ss='source devel/setup.zsh'
alias shutdown='sudo shutdown -h now'
alias sd='sudo shutdown -h now'
alias reboot='sudo reboot'
alias lstty="ls /dev/tty*"
alias tmux='tmux -2'
alias sl='ls'
alias LS='ls'
alias SL='ls'
alias springemacs='pkill -SIGUSR2 emacs'
alias cb='catkin build'
alias cc='catkin clean --y'
alias cco='catkin clean --orphans'
alias ccp='catkin clean PACKAGE'
alias ccb='catkin clean --y && catkin build'
alias cm='catkin_make'
# alias catkin_clean_pkg='catkin_make --pkg xxx --make-args clean'
alias gimp='LANGUAGE=zh_CN gimp'
alias cdcaffe='cd ~/code/SegNet/caffe-segnet-cudnn5/'
alias xmind="$( cd $( dirname "$0") && pwd ); cd ~/Software/xmind-8-update9-linux/XMind_amd64/; ./XMind; cd $THISDIR "
alias data='cd ~/Projects/data/'
alias filter='cd ~/Projects/filter_ws/'
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=YES"
#alias matlab='sudo /usr/local/MATLAB/R2018a/bin/matlab'
#alias matlab='sudo ln -s /usr/local/MATLAB/R2018a/bin/matlab /usr/local/bin/matlab'
# alias rsview='THISDIR=$( cd "$( dirname "$0")" && pwd ); cd ~/Software/rsview/; ./run_rsview.sh; cd $THISDIR'
alias baidu_upload='bypy upload'
alias baidu_downdir='bypy downdir'
alias baidu_compare='bypy compare'
# cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
# cppcheck --project=compile_commands.json
alias cppcheck='cppcheck --template=gcc --enable=all ./'
alias chmod_default="find . -type d -exec chmod 775 {} \; ; find . -type f -exec chmod 664 {} \;"

alias g++="g++ -std=c++11"
alias cppcheck="cppcheck --enable=all --std=c++11"
## cmake for compile_commands.json for lsp in emacs
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=YES"
# alias grep='grep -nr'

alias labview="/usr/local/natinst/LabVIEW-2021-64/labviewprofull"

########## terminator socks ##############
# sudo apt-get install polipo
# sudo vim /etc/polipo/config
# add following lines
# https://www.meirenji.info/2017/12/09/Ubuntu%E9%85%8D%E7%BD%AEShadowsocks%E5%AE%9E%E7%8E%B0%E7%BB%88%E7%AB%AF%E4%BB%A3%E7%90%86/

# logSyslog = false
# logFile = "/var/log/polipo/polipo.log"
#  
# socksParentProxy = "127.0.0.1:1080"
# socksProxyType = socks5
#  
# chunkHighMark = 50331648
# objectHighMark = 16384
#  
# serverMaxSlots = 64
# serverSlots = 16
# serverSlots1 = 32
#  
# proxyAddress = "0.0.0.0"
# proxyPort = 8123

# /etc/init.d/polipo restart  or below two line
# sudo service polipo stop
# sudo service polipo start
# curl ip.gs and test http_proxy=http://localhost:8123
alias hp="export http_proxy=http://localhost:8123"
alias hps="export https_proxy=http://localhost:8123"
alias unsethp="unset http_proxy"
alias unsethps="unset http_proxys"
# http://localhost:8282 to get the local ganntlab web
alias ganttlab="sudo docker run -p 8282:80 ganttlab/ganttlab"
alias gitlab_time_report="cd ~/code/gitlab-time-report &&  GITLAB_URL="http://192.168.1.20" GITLAB_TOKEN="GAdXD8yPmRvfWyXX-6b7" npm start"


export GITLAB_HOME=$HOME/gitlab_mnt

alias gitlab_docker="docker run --detach --publish 443:443 --publish 80:80 --publish 2222:22 --name gitlab --restart unless-stopped -v $GITLAB_HOME/config:/etc/gitlab -v $GITLAB_HOME/logs:/var/log/gitlab -v $GITLAB_HOME/data:/var/opt/gitlab --shm-size 256m gitlab/gitlab-ce"

# alias gitlab_docker="docker run --detach --publish 443:443 --publish 80:80 --publish 2222:22 --name gitlab --restart unless-stopped -v /mnt/gitlab/etc:/etc/gitlab -v /mnt/gitlab/log:/var/log/gitlab -v /mnt/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce"

alias gitlab_run="docker run gitlab/gitlab-ce:latest"



alias qt511_lib_source="export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}:/opt/qt511/lib"

#alias projectinit="cp -n ~/.git_template/CHANGELOG ./; cp -n ~/.git_template/LICENCE ./; cp -n ~/.git_template/README.md ./; cp -n ~/.git_template/.clang-format ./; cp -n ~/.git_template/.gitignore ./"


# replacestring() {
  # sed "s#$2#$3#g" $1 > $4
# }

replaceFileString() {
  echo "The target file is  $1"
  echo "The new file is  $4"
  echo "The old string is $2"
  echo "The new string is $3"
  sed "s#$2#$3#g" $1 > $4
}

flash20000() {
    st-flash --reset write $1 0x8020000
}

flash00000() {
    st-flash --reset write $1 0x8000000
}
distUsage(){
    sudo du -d 1 -k $1/* | sort -n -r
}

function upsearch()
{
  test "/" = "$PWD" && echo "upsearch fail: " "$1" && return || test -e "$1" && UPSEARCH_RET="$PWD" && return || builtin cd .. && upsearch $1
}


function sros()
{
  local dir="$PWD"
  upsearch devel
  echo "You're in ROS WS: " "$UPSEARCH_RET"
  echo "Source in this WS"
  source $UPSEARCH_RET/devel/setup.zsh && echo "Done!" || echo "Failed!"
  builtin cd "$dir"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump
[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && source ${HOME}/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

#eval $(thefuck --alias)
export PATH=$PATH:/usr/lib/git-core
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/softwares/Zotero_linux-x86_64
export PATH=~/.npm-global/bin:$PATH
export TERM=xterm-256color


###################### For EMACS Chinese Input ######################
# https://emacs-china.org/t/topic/974/9
export LC_CTYPE=zh_CN.UTF-8

###################### For GTAGS ######################
# export GTAGSFORCECPP=true
export GTAGSLIBPATH=${HOME}/code/pcl:${HOME}/code/opencv:${HOME}/code/eigen:${HOME}/code/ros:${HOME}/code/libpointmatcher:${HOME}/code/ethzasl_icp_mapping/libpointmatcher_ros:${HOME}/code/qt_include

# added by Anaconda2 installer
# export PATH="${HOME}/anaconda2/bin:$PATH"
#. ${HOME}/code/torch/install/bin/torch-activate

##################### For CUDA #########################
export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

export CUDNN_PATH="/usr/local/cuda/lib64/libcudnn.so.5"
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
export PATH=${CUDA_HOME}/bin:${PATH}
export PATH=$PATH:~/.local/bin/

##################### For RSVIEW #########################
#  export PATH=$PATH:${HOME}/Projects/catkin_ws/VeloView/build/install/bin
#  export PYTHONPATH=$PYTHONPATH:${HOME}/Projects/catkin_ws/src/VeloView/build/install/lib/paraview-4.3
#  export PYTHONPATH=$PYTHONPATH:${HOME}/Projects/catkin_ws/src/VeloView/build/install/lib/paraview-4.3/site-packages
#  export PYTHONPATH=$PYTHONPATH:${HOME}/Projects/catkin_ws/src/VeloView/build/install/lib/paraview-4.3/site-packages/vtk

##################### For TEX #########################
# export TeXLiveMANPATH=/usr/local/texlive/2017/texmf-dist/doc/man
# export TeXLiveINFOPATH=/usr/local/texlive/2017/texmf-dist/doc/info
# export TeXLivePATH=/usr/local/texlive/2017/bin/x86_64-linux
# export PATH=$PATH:$TeXLivePATH

#################### For some useful shell ############
export PATH=$PATH:${HOME}/bxgithub/myfile:/snap/bin/:/home/leo/Downloads/ExcelCompare-0.6.1

###################### For ROS #########################
# /usr/bin/setxkbmap -option "ctrl:swapcaps"
source /opt/ros/noetic/setup.zsh


export PATH=$PATH:${HOME}/bxgithub/myfile:/snap/bin/:~/.local/bin


# zotero
export PATH=$PATH:/home/leo/Zotero/Zotero_linux-x86_64/

#export http_proxy="http://127.0.0.1:1080"
#export https_proxy="http://127.0.0.1:1080"
#export ALL_PROXY="socks5://127.0.0.1:1080"
