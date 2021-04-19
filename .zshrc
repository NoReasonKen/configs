# ***************************************************************
# ************************ zsh settings *************************
# ***************************************************************

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
ENABLE_CORRECTION="true"

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
plugins=(alias-finder autojump colored-man-pages colorize sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fg() {
	if [[ $# -eq 1 && $1 = - ]]; then
		builtin fg %-
	else
		builtin fg %"$@"
	fi
}

bg() {
	if [[ $# -eq 1 && $1 = - ]]; then
		builtin bg %-
	else
		builtin bg %"$@"
	fi
}

h() {
	if [[ $# -eq 1 ]]; then
		if [[ $1 -ge 0 ]]; then
			history -"$@"
		else
			history -"$((-1 * $1))"
		fi
	elif [[ $# -eq 0 ]]; then
		history -"$((LINES - 1))"
	fi
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export HISTFILE=~/.zsh_history

# Max history maintained in shell
export HISTSIZE=10000

# Max history stored in history file
export SAVEHIST=10000

# Both imports new commands from the history file, and also causes your typed commands to be appended to the history file
# This means that shells are aware of each other's history as well without having to close the current one or open a new one
#setopt SHARE_HISTORY


# Make ctrl-u be backward-kill-line instead of kill-whole-line
bindkey \^u backward-kill-line

## ***************************************************************
## ************************ bash settings ************************
## ***************************************************************

# setting DISPLAY to enable GUI function, mainly used for using opencv to create window
# however make vim hang
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# add feature that can move cursor cross a word by pressing Ctrl+[<-|->]
export INPUTRC=~/.inputrc

# for fix docker tty size does not match window size
export COLUMNS=`tput cols`
export LINES=`tput lines`

# more self-defined aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ls='ls --color=always -CF'
alias l='ls --color=always -ClFh'
alias la='ls --color=always -ACF'
alias ll='ls --color=always -aClFh'
alias grep='grep --color=always'
# alias h='history -$((LINES - 1))' history for bash ver.
alias duh='du -h --max-depth=1'
alias dfh='df -h'
alias sc='screen'
alias k9='kill -9'
alias cl='clear;clear'
alias tree='tree -C'
alias time='/usr/bin/time'
alias g++17='g++ -std=c++17 -o'
alias g++17g='g++ -std=c++17 -g -o'
alias aptupgrade='sudo apt update; sudo apt upgrade; sudo apt autoremove'

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

# env setting for texlive
export PATH=/usr/local/texlive/2020/bin/x86_64-linux:$PATH
