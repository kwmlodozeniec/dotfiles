#!/usr/bin/env zsh
set -e  # Exit on error

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

# List of packages (both casks and formulas)
PACKAGES=(
  "--cask font-monaspace"
  "--cask hiddenbar"
  "--cask latest"
  "--cask raycast"
  "--cask shottr"
  "--cask zed"
  "bat"
  "eza"
  "fnm"
  "fzf"
  "golang"
  "helix"
  "httpie"
  "k6"
  "pearcleaner"
  "shortcat"
  "starship"
  "stats"
  "stow"
  "tree"
  "uv"
  "zoxide"
)

for pkg in "${PACKAGES[@]}"; do
  if [[ "$pkg" == --cask* ]]; then
    # Extract the actual cask name (everything after --cask)
    cask_name="${pkg#--cask }"
    if brew list --cask "$cask_name" &>/dev/null; then
      echo "Cask already installed: $cask_name"
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
