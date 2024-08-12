# Summary

This repository holds various config files I use on my machine for some of the cross platform applications.

## Overview of directories

### `nvim`

Config files for [Neovim](https://neovim.io/) editor.
This is based on [LazyVim](https://www.lazyvim.org/) base.

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

To backup the config:

```bash
dconf dump /org/gnome/shell/extensions/gtile/ > gtile.conf.bak
```

To reset the config:

```bash
dconf reset -f /org/gnome/shell/extensions/gtile/
```

To load the config:

```bash
dconf load /org/gnome/shell/extensions/gtile/ < gtile/config
```

### `dash-to-panel`

Config files for [dash-to-panel](https://github.com/home-sweet-gnome/dash-to-panel) GNOME extension.

To backup the config:

```bash
dconf dump /org/gnome/shell/extensions/dash-to-panel/ > dash-to-panel.conf.bak
```

To reset the config:

```bash
dconf reset -f /org/gnome/shell/extensions/dash-to-panel/
```

To load the config:

```bash
dconf load /org/gnome/shell/extensions/dash-to-panel/ < dash-to-panel/config
```

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

### `starship`

Config files for [starship prompt](https://starship.rs/).

```bash
stow -v -R -t ~ starship
```

### `wezterm`

Config files for [wezterm terminal](https://wezfurlong.org/wezterm/index.html)

```bash
stow -v -R -t ~ wezterm
```
