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
plugins=(git git-flow autojump z extract tzsh-autosuggestions colored-man-pages web-search)

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
alias screenshota='gnome-screenshot -a'
alias screenshotw='gnome-screenshot -w'
alias screenshotc='gnome-screenshot -c'
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
alias encodeI='iconv -f GBK -t UTF-8 '
alias encodeE='enca -L zh_CN -x utf-8 '
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
alias ccb='catkin clean --y && catkin build'
alias cm='catkin_make'
# alias catkin_clean_pkg='catkin_make --pkg xxx --make-args clean'
alias gimp='LANGUAGE=zh_CN gimp'
alias cdcaffe='cd ~/code/SegNet/caffe-segnet-cudnn5/'
alias xmind="cd ~/Software/xmind-8-update8-linux/XMind_amd64/"
alias data='cd ~/Projects/data/'
alias filter='cd ~/Projects/filter_ws/'
#alias matlab='sudo /usr/local/MATLAB/R2018a/bin/matlab'
#alias matlab='sudo ln -s /usr/local/MATLAB/R2018a/bin/matlab /usr/local/bin/matlab'
alias rsview='/home/zhangbaoxian/Projects/catkin_ws/src/VeloView/build/install/bin/RSView'
alias baidu_upload='bypy upload'
alias baidu_downdir='bypy downdir'
alias baidu_compare='bypy compare'

########## terminator socks ##############
# sudo apt-get install polipo
# sudo vim /etc/polipo/config
# add following three lines
#    socksParentProxy = "localhost:1080"
#    socksProxyTpye = socks5
#    logLevel = 4
# sudo service polipo stop
# sudo service polipo start
# curl ip.gs
alias hp="export http_proxy=http://localhost:8123"
alias unsethp="unset http_proxy"
alias projectinit="cp -n ~/.git-templates/CHANGELOG ./; cp -n ~/.git-templates/LICENCE ./; cp -n ~/.git-templates/README.md ./; cp -n ~/.git-templates/.clang-format ./; cp -n ~/.git-templates/.gitignore ./"

scpIntoyunTmp() {
    scp $1 root@112.124.117.64:/tmp/
    #command scp $1 root@112.124.117.64:/tmp/
}

scpIntoRobotTmp() {
    scp $1 root@115.29.193.81:/tmp/
    #command scp $1 root@115.29.193.81:/tmp/
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


/usr/bin/setxkbmap -option "ctrl:swapcaps"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#eval $(thefuck --alias)
export PATH=$PATH:/usr/lib/git-core
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/softwares/Zotero_linux-x86_64
export PATH=~/.npm-global/bin:$PATH
export TERM=xterm-256color

###################### For GTAGS ######################
export GTAGSFORCECPP=true
export GTAGSLIBPATH=${HOME}/code/pcl:${HOME}/code/opencv:${HOME}/code/eigen:${HOME}/code/ros:${HOME}/code/libpointmatcher:${HOME}/code/ethzasl_icp_mapping/libpointmatcher_ros


# added by Anaconda2 installer
# export PATH="${HOME}/anaconda2/bin:$PATH"
#. ${HOME}/code/torch/install/bin/torch-activate

##################### For CUDA #########################
export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64$LD_LIBRARY_PATH
export CAFFE_ROOT="${HOME}/code/SegNet/caffe-segnet-cudnn5"
export PYTHONPATH=${HOME}/code/SegNet/caffe-segnet-cudnn5/python:$PYTHONPATH
export CUDNN_PATH="/usr/local/cuda/lib64/libcudnn.so.5"
# export CUDA_HOME=/usr/local/cuda
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
# export PATH=${CUDA_HOME}/bin:${PATH}

##################### For RSVIEW #########################
#  export PATH=$PATH:${HOME}/Projects/catkin_ws/VeloView/build/install/bin
#  export PYTHONPATH=$PYTHONPATH:${HOME}/Projects/catkin_ws/src/VeloView/build/install/lib/paraview-4.3
#  export PYTHONPATH=$PYTHONPATH:${HOME}/Projects/catkin_ws/src/VeloView/build/install/lib/paraview-4.3/site-packages
#  export PYTHONPATH=$PYTHONPATH:${HOME}/Projects/catkin_ws/src/VeloView/build/install/lib/paraview-4.3/site-packages/vtk

##################### For TEX #########################
export TeXLiveMANPATH=/usr/local/texlive/2017/texmf-dist/doc/man
export TeXLiveINFOPATH=/usr/local/texlive/2017/texmf-dist/doc/info
export TeXLivePATH=/usr/local/texlive/2017/bin/x86_64-linux
export PATH=$PATH:$TeXLivePATH


##################### For ROS #########################
source /opt/ros/kinetic/setup.zsh
# source ${HOME}/p3_ws/devel/setup.zsh
source ${HOME}/Projects/catkin_ws/devel/setup.zsh
# source ${HOME}/Projects/localization_Projects/devel/setup.zsh
# source ${HOME}/Projects/none_ws/devel/setup.zsh
#
