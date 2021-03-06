# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function check_before_append () {
    if [ -z $(eval "echo \$$1" | grep "$2") ]; then
        eval "export $1=$2:\${$1}"
    fi
}



# ***************************************************************
# ******************** user defined settings ********************
# ***************************************************************

# setting DISPLAY to enable GUI function, mainly used for using opencv to create window
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

# hidden commands related to history control to silent automatically shell history logging function of tmux-resurrect
HISTCONTROL=ignoreboth

# add feature that can move cursor cross a word by pressing Ctrl+[<-|->]
export INPUTRC=~/.inputrc

# for fix docker tty size does not match window size
export COLUMNS=`tput cols`
export LINES=`tput lines`

# use 'most' to display colorful man
export MANPAGER='most'

# more self-defined aliases
alias ls='ls --color=always -CF'
alias l='ls --color=always -ClFh'
alias la='ls --color=always -ACF'
alias ll='ls --color=always -aClFh'
alias grep='grep --color=always'
alias h='history $((LINES - 1))'
alias duh='du -h --max-depth=1'
alias dfh='df -h'
alias sc='screen'
alias k9='kill -9'
alias cl='clear;clear'
alias less='less -r'
alias tree='tree -C'
alias time='/usr/bin/time'
alias g++17='g++ -std=c++17 -o'
alias g++17g='g++ -std=c++17 -g -o'
alias aptupgrade='sudo apt update; sudo apt upgrade; sudo apt autoremove'

export PATH=/usr/local/cuda-9.1/bin${PATH:+:${PATH}}

# env setting for library & dynamic library path
export LD_LIBRARY_PATH=$HOME/lib:/usr/local/lib:/usr/local/lib64:/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LIBRARY_PATH=$HOME/lib:/usr/local/lib:/usr/lib/x86_64-linux-gnu${LIBRARY_PATH:+:${LIBRARY_PATH}}

# env setting for gcc & g++ compiler
export CC=/usr/local/bin/gcc
export CXX=/usr/local/bin/g++

# env setting for gcc & g++ compiler include path
export CPLUS_INCLUDE_PATH=/usr/local/include${CPLUS_INCLUDE_PATH:+:${CPLUS_INCLUDE_PATH}}
export CPLUS_INCLUDE_PATH=/home/noreason/Biovoltron/include${CPLUS_INCLUDE_PATH:+:${CPLUS_INCLUDE_PATH}}
export CPLUS_INCLUDE_PATH=/home/noreason/Nucleona/include${CPLUS_INCLUDE_PATH:+:${CPLUS_INCLUDE_PATH}}
export CPLUS_INCLUDE_PATH=/home/noreason/libsimdpp${CPLUS_INCLUDE_PATH:+:${CPLUS_INCLUDE_PATH}}
export CPLUS_INCLUDE_PATH=/usr/local/include/opencv4${CPLUS_INCLUDE_PATH:+:${CPLUS_INCLUDE_PATH}}

# added by Anaconda3 installer
export PATH="/usr/local/anaconda3/bin:$PATH"

# env setting for CSDK
export CMAKE_PREFIX_PATH=CSDK

# env setting for nvm
export NVM_DIR="/home/noreason/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# env setting for cuda-9.1
export PATH=/usr/local/cuda-9.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# add directory of paftools.js into PATH
export PATH=$PATH:$HOME/minimap2/misc
