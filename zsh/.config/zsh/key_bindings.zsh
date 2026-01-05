# [Ctrl-r] - Search backward incrementally for a specified string.
# The string may begin with ^ to anchor the search to the beginning of the line.
# bindkey '^R' history-incremental-search-backward

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

# [Ctrl-f] - Tmux sessions script
bindkey -s '^F' "tmux-sessions\n"

# Magic space
bindkey ' ' magic-space

# Git commit shortcut, prepare the command and move cursor into the message field
bindkey -s '^Xgc' 'git commit -m ""\C-b'
