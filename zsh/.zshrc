#!/usr/bin/env zsh

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/kwm.omp.json)"

fpath=($ZDOTDIR/plugins $fpath)

# Navigation
setopt AUTO_CD # Go to folder path without using cd.

setopt AUTO_PUSHD        # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.

setopt CORRECT       # Spelling correction
setopt CDABLE_VARS   # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB # Use extended globbing syntax.

# History
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.

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

# Pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

autoload -U add-zsh-hook
function load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Syntax highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
