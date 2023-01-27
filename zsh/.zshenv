#!/usr/bin/env zsh

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# zsh
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$ZDOTDIR/.zhistory" # History filepath
export HISTSIZE=10000                # Maximum events for internal history
export SAVEHIST=10000

# PATH
export PATH="$HOME/go/bin:$PATH" # GO

# Rootless docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Dev VARs
export FIRSTNAME=""
export LASTNAME=""
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
