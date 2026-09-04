#!/usr/bin/env zsh
set -e  # Exit on error

# Parse options
FORCE=false
if [[ "$1" == "--force" ]]; then
  FORCE=true
fi

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "Homebrew already installed"
fi

# Ensure jq is available before parsing cask metadata
if ! brew list --formula jq &>/dev/null; then
  echo "Installing jq (required for cask checks)..."
  brew install jq
else
  echo "jq already installed"
fi

# Install rustup if not present
if ! command -v rustup &>/dev/null; then
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
else
  echo "rustup already installed"
fi

# Install coreutils
if ! cargo install --list | grep -q "^coreutils "; then
  cargo install coreutils --features macos --locked
else
  echo "coreutils already installed"
fi

# Check whether a cask's app bundle already exists on disk
cask_app_present() {
  local cask_name="$1"
  local app_names
  app_names=$(brew info --cask "$cask_name" --json=v2 2>/dev/null | jq -r '.[0].artifacts[]? | select(.app) | .app[]?' 2>/dev/null) || true

  if [[ -z "$app_names" ]]; then
    return 1
  fi

  local app_name
  while IFS= read -r app_name; do
    [[ -z "$app_name" ]] && continue
    [[ -d "/Applications/$app_name" ]] && return 0
    [[ -d "$HOME/Applications/$app_name" ]] && return 0
  done <<< "$app_names"
  return 1
}

# Check whether a cask is already installed via Homebrew or present on disk
cask_is_present() {
  local cask_name="$1"
  brew list --cask "$cask_name" &>/dev/null && return 0
  cask_app_present "$cask_name"
}

# List of packages (both casks and formulas)
PACKAGES=(
  "--cask font-monaspace"
  "--cask hiddenbar"
  "--cask latest"
  "--cask raycast"
  "--cask shottr"
  "--cask zed"
  "ast-grep"
  "bat"
  "eza"
  "fd"
  "fnm"
  "fzf"
  "golang"
  "helix"
  "httpie"
  "k6"
  "marksman"
  "pearcleaner"
  "rumdl"
  "shortcat"
  "starship"
  "stats"
  "stow"
  "television"
  "tree"
  "uv"
  "yaml-language-server"
  "zoxide"
)

for pkg in "${PACKAGES[@]}"; do
  if [[ "$pkg" == --cask* ]]; then
    # Extract the actual cask name (everything after --cask)
    cask_name="${pkg#--cask }"
    if [[ "$FORCE" == true ]]; then
      echo "Force-installing cask: $cask_name"
      brew install --cask "$cask_name" --force
    elif cask_is_present "$cask_name"; then
      echo "Cask already present: $cask_name"
    else
      echo "Installing cask: $cask_name"
      brew install --cask "$cask_name"
    fi
  else
    if brew list "$pkg" &>/dev/null; then
      echo "Formula already installed: $pkg"
    else
      echo "Installing formula: $pkg"
      brew install "$pkg"
    fi
  fi
done
