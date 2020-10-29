# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rongxuan/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/rongxuan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rongxuan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/rongxuan/.fzf/shell/key-bindings.zsh"
