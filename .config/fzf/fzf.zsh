# Setup fzf
# ---------
if [[ ! "$PATH" == */u/chehuang/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/u/chehuang/.fzf/bin"
fi

eval "$(fzf --zsh)"
