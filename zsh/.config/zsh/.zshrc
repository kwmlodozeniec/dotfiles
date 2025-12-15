#!/usr/bin/env zsh

# Homebrew
if [ "$(uname)" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

fpath=($ZDOTDIR/plugins $fpath)

# Navigation
unsetopt AUTO_CD # Don't go to a directory without using cd

setopt AUTO_PUSHD        # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.

setopt CORRECT       # Spelling correction
setopt CDABLE_VARS   # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB # Use extended globbing syntax.

# History
HISTFILE="$HOME/.zsh_history"           # History filepath
SAVEHIST=10000                          # Maximum events saved to history
HISTSIZE=10000                          # Maximum events loaded from history
HISTIGNORE="(ls|cd|pwd|exit|cd ..)"     # Ignore these commands from history
HISTTIMEFORMAT="[%d/%m/%y %T] "         # Timestamp format
setopt SHARE_HISTORY                    # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST           # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS                 # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS             # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS                # Do not display a previously found event.
setopt HIST_IGNORE_SPACE                # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS                # Do not write a duplicate event to the history file.
setopt HIST_VERIFY                      # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY               # Write to the history file immediately, not when the shell exits.
setopt APPEND_HISTORY                   # Write to history
setopt HIST_FIND_NO_DUPS                # Do not display a line previously found.
setopt HIST_NO_STORE                    # Don't store history commands
setopt HIST_REDUCE_BLANKS               # Remove superfluous blanks before recording entry.
SHELL_SESSION_HISTORY=0                 # Disable per-terminal-session

# Prevent overwritting files with file redirect
set -o noclobber

# Aliases
source $ZDOTDIR/aliases
source $ZDOTDIR/work_aliases

# Functions
source $ZDOTDIR/functions
source $ZDOTDIR/work_functions

# Completions
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Key bindings
source $ZDOTDIR/key_bindings.zsh

# Fuzzy finder
source <(fzf --zsh)
# FZF for git objects
source $ZDOTDIR/plugins/fzf-git/fzf-git.sh

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# Syntax highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto .env file loading
source $ZDOTDIR/plugins/autodotenv/autoenv.plugin.zsh

# Created by `pipx`
export PATH="$HOME/.local/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# uv
eval "$(uvx --generate-shell-completion zsh)"

# opencode
export PATH=/home/krzysztof/.opencode/bin:$PATH
