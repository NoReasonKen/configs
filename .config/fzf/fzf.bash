# Setup fzf
# ---------
if [[ ! "$PATH" == */home/noreason/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/noreason/.fzf/bin"
fi

eval "$(fzf --bash)"
