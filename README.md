# Summary

This repository holds various config files I use on my machine for some of the cross platform applications.

## Overview of directories

### `nvim`

Config files for [Neovim](https://neovim.io/) editor.

```bash
stow -v -R -t ~ nvim
```

### `ohmyposh`

My own [Oh My Posh](https://ohmyposh.dev/) prompt theme.

Install ohmyposh first:

```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

Then install a Nerd font of your choice:

```bash
oh-my-posh font install
```

Finally install the config with:

```bash
stow -v -R -t ~ ohmyposh
```

### `powershell` (Windows only)

Config files for [Powershell 7](https://github.com/PowerShell/PowerShell).

### `windows_terminal` (Windows only)

Config files for [Windows Terminal](https://github.com/microsoft/terminal).

### `zsh`

Config files for [ZSH](https://zsh.sourceforge.io/) shell.

```bash
stow -v -R -t ~ zsh
```

To install plugins:

```bash
cd ~/.config/zsh/plugins
./install_plugins.sh
```

### `gtile`

Config files for [gTile](https://github.com/gTile/gTile) GNOME extension.

### `tmux`

Config files for [tmux](https://github.com/tmux/tmux).

```bash
stow -v -R -t ~ tmux
```

To install plugins:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then in tmux execute PREFIX + I to install plugins, e.g. `Ctrl + b` => `Shift + i`.

### `espanso`

Config files for [espanso](https://github.com/espanso/espanso).
Install by following this [guide](https://espanso.org/install/).

Install the config before installing/starting espanso:

```bash
stow -v -R -t ~ espanso
```
