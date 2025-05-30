# ***************************************************************
# ************************ zsh settings *************************
# ***************************************************************

# Remove the trailing $HOME/bin in PATH, which is added by /etc/zprofile
if [[ -f "/etc/zprofile" ]]; then
    export PATH=${PATH%$HOME/bin}
fi
export PATH="$HOME/bin:$PATH"

# Use 'ZSH_PROF=1 zsh -ic zprof' to profile shell functions
# Useful to find the slow modules or actions
# For more slow problems. Refer to issue thread https://github.com/ohmyzsh/ohmyzsh/issues/5327
if [[ -v ZSH_PROF ]]; then
    zmodload zsh/zprof
fi

# Handle backspace be mapped to "^?"
[[ $- = *i* ]] && stty erase "^?"

# Enable Powerlevel10k instant prompt. Should stay close to the top of $HOME/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
#HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
## Note that zsh-syntax-highlighting must be the last plugin sourced.
plugins=(alias-finder colored-man-pages colorize fzf-tab zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
## plugins unusable: thefuck, sudo

# fpath+=~/.zfunc

# ***************************************************************
# ******************* zsh user configurations *******************
# ***************************************************************

# Whitelist to disable zsh auto correction
#alias git="nocorrect git"
#alias python="nocorrect python"

# Clone zsh custom plugin from zsh-users
zsh_custom=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
zsh_users_plugin=("zsh-autosuggestions" "zsh-completions" "zsh-syntax-highlighting")
for plugin in ${zsh_users_plugin[@]}
do
    [[ -d ${zsh_custom}/plugins/${plugin} ]] || git clone https://github.com/zsh-users/${plugin} ${zsh_custom}/plugins/${plugin}
done

# Clone and pull powerlevel10k
[[ -d ${zsh_custom}/themes/powerlevel10k ]] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${zsh_custom}/themes/powerlevel10k
## Comment this line to disable pull check, if there is slow issue
git -C ${zsh_custom}/themes/powerlevel10k pull &> /dev/null

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom bin folder
CUSTOM_BINPATH="$HOME/bin"
[[ -d $CUSTOM_BINPATH ]] || mkdir $HOME/bin

# Custom man folder
CUSTOM_MANPATH="$HOME/.man"
[[ -d $CUSTOM_MANPATH ]] || mkdir $CUSTOM_MANPATH
export MANPATH="$CUSTOM_MANPATH:$MANPATH"
## Add folder for newest git man repo
export MANPATH="$CUSTOM_MANPATH/git-manpages:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

export HISTFILE=$HOME/.zsh_history

# Max history maintained in shell
export HISTSIZE=10000

# Max history stored in history file
export SAVEHIST=10000

# Both imports new commands from the history file, and also causes your typed commands to be appended to the history file
# This means that shells are aware of each other's history as well without having to close the current one or open a new one
#setopt SHARE_HISTORY

# Make sure LANG is not C.utf8
if [[ "$LANG" == "C.UTF-8" ]]; then
    export LANG="en_US.utf8"
fi

# Make ctrl-u be backward-kill-line (just like bash) instead of kill-whole-line
bindkey \^u backward-kill-line

# Make wildcard(*) consider hidden files
setopt GLOB_DOTS

# In oh-my-zsh lib/completion.zsh do WORDCHARS=''
# Default='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS='*?_-.[]~&;!#$%^(){}<>|' # add '|', remove '/', '='

# Make the prompt texts from zsh-autosuggestions darker
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6a6a6a"

# source utils functions
source "$HOME/.zsh/.zshrc.utils"

# ***************************************************************
# ************************ bash settings ************************
# ***************************************************************

# setting DISPLAY to enable GUI function, mainly used for using opencv to create window
# however make vim hang
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# add feature that can move cursor cross a word by pressing Ctrl+[<-|->]
export INPUTRC=$HOME/.inputrc

# fix the problem of docker which cannot make size of tty match window size
export COLUMNS=`tput cols`
export LINES=`tput lines`

# use bat to show syntax highlighted man page
[[ -n "$(command -v bat)" ]] && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# more self-defined aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ls='ls --color=auto -CF'
alias l='ls --color=auto -ClFh'
alias la='ls --color=auto -ACF'
alias ll='ls --color=auto -aClFh'
alias grep='grep --color=auto'
# alias h='history -$((LINES - 1))' history for bash ver.
alias duh='du -h'
alias dfh='df -h'
alias k9='kill -9'
alias cl='clear;clear'
alias tree='tree -C'
alias time='/usr/bin/time'
alias vimdiff='vim -d'
alias aptupgrade='sudo apt update; sudo apt upgrade; sudo apt autoremove'
alias locate="locate -d $HOME/.locate.db"

# Fix the man for zsh built-in command target to bash's man page
#unalias run-help
autoload -Uz run-help
alias man='run-help' # not sure why MANPATH works for run-help

# env setting for gcc & g++ compiler
#export CC=/usr/local/bin/gcc
#export CXX=/usr/local/bin/g++

# env setting for library & dynamic library path
#check_before_append "LD_LIBRARY_PATH" "$HOME/lib" ":"
#check_before_append "LD_LIBRARY_PATH" "/usr/local/lib" ":"
#check_before_append "LD_LIBRARY_PATH" "/usr/local/lib64" ":"
#check_before_append "LD_LIBRARY_PATH" "/usr/lib/x86_64-linux-gnu" ":"
#check_before_append "LIBRARY_PATH" "$HOME/lib" ":"
#check_before_append "LIBRARY_PATH" "/usr/local/lib" ":"
#check_before_append "LIBRARY_PATH" "/usr/local/lib64" ":"
#check_before_append "LIBRARY_PATH" "/usr/lib/x86_64-linux-gnu" ":"

# env setting for gcc & g++ compiler include path
#check_before_append "CPLUS_INCLUDE_PATH" "/usr/local/include" ":"
#check_before_append "CPLUS_INCLUDE_PATH" "$HOME/Biovoltron/include" ":"
#check_before_append "CPLUS_INCLUDE_PATH" "$HOME/Nucleona/include" ":"
#check_before_append "CPLUS_INCLUDE_PATH" "$HOME/libsimdpp/" ":"
#check_before_append "CPLUS_INCLUDE_PATH" "/usr/local/include/opencv4" ":"

# added by Anaconda3 installer
#check_before_append "PATH" "/usr/local/anaconda3" ":"

# env setting for CSDK
#export CMAKE_PREFIX_PATH=CSDK

# env setting for nvm
#export NVM_DIR="/home/noreason/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# env setting for cuda-9.1
#check_before_append "PATH" "/usr/local/cuda-9.1/bin" ":"
#check_before_append "LD_LIBRARY_PATH" "/usr/local/cuda-9.1/lib64" ":"

# env setting for texlive
#check_before_append "PATH" "/usr/local/texlive/2020/bin/x86_64-linux" ":"

# add directory of paftools.js into PATH
#check_before_append "PATH" "$HOME/minimap2/misc" ":"

# source 3rd-party tools
source "$HOME/.zsh/.zshrc.3rd_party"

# Source cargo
source "$HOME/.cargo/env"

# *************************************************************
# **************** Remove duplicate definition ****************
# *************************************************************
export PATH=$(remove_dup_sh -d ":" $PATH)
export FPATH=$(remove_dup_sh -d ":" $FPATH)
export MANPATH=$(remove_dup_sh -d ":" $MANPATH)

# *************************************************************
# ****************** ZSH Completion settings ******************
# *************************************************************
export ZDOTDIR="$HOME/.zcompdump"

# Load completions
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
    compinit
done
compinit -C
