#!/usr/bin/env zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install coreutils
cargo install coreutils --features macos --locked

# List of packages (both casks and formulas)
PACKAGES=(
  "--cask font-monaspace"
  "--cask hiddenbar"
  "--cask latest"
  "--cask raycast"
  "--cask shottr"
  "bat"
  "eza"
  "fnm"
  "fzf"
  "golang"
  "helix"
  "httpie"
  "k6"
  "pearcleaner"
  "raycast"
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
      echo "✅ Cask already installed: $cask_name"
    else
      echo "⬇️ Installing cask: $cask_name"
      brew install --cask "$cask_name"
    fi
  else
    if brew list "$pkg" &>/dev/null; then
      echo "✅ Formula already installed: $pkg"
    else
      echo "⬇️ Installing formula: $pkg"
      brew install "$pkg"
    fi
  fi
done
