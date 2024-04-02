#!/usr/bin/env zsh

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# zsh
export SHELL="/usr/bin/zsh"
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"           # History filepath
export SAVEHIST=10000                          # Maximum events saved to history
export HISTSIZE=10000                          # Maximum events loaded from history
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)" # Ignore these commands from history
export HISTTIMEFORMAT="[%d/%m/%y %T] "         # Timestamp format


# PATH
export PATH="$HOME/go/bin:$PATH" # GO

# Rootless docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Personal VARs
export FIRSTNAME=""
export LASTNAME=""
export FIRSTNAME_CASE=${(C)FIRSTNAME}
export LASTNAME_CASE=${(C)LASTNAME}
export FULL_NAME_CASE="$FIRSTNAME_CASE $LASTNAME_CASE"
export EMAIL=""
export WORK_EMAIL=""
export ADDRESS=""
export PHONE_NUMBER=""

# Dev VARs
export VAULT_ADDR=""
export VAULT_CACERT="$HOME/vault-ca.crt"
export SEND_TO_PROMETHEUS="false"
export PROMETHEUS_PUSH_GATEWAY="none"
export PUBLISH_FOLDER="$HOME"
export PROMETHEUS_MULTIPROC_DIR="/tmp/"
export KUBE_CONFIG_PATH="$HOME/.kube/config"
export ARTIFACTORY_URL=""

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# NVM
export NVM_DIR="$HOME/.nvm"

# VPN Profile
export VPN_PROFILE_NAME=""

# Rust
. "$HOME/.cargo/env"

# Auto .env file loading, disable confirmation prompt
export ZSH_DOTENV_PROMPT=false
