# Summary

This repository holds various config files I use on my machine for some of the cross platform applications.

## Overview of directories

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

### `starship`

Config files for [starship prompt](https://starship.rs/).

```bash
stow -v -R -t ~ starship
```

### `ghostty`

Config files for [ghostty terminal](https://ghostty.org/)

```bash
stow -v -R -t ~ ghostty
```

### `helix`

Config files for [helix editor](https://helix-editor.com/)

```bash
stow -v -R -t ~ helix
hx --grammar fetch
hx --grammar build
```

### `git`

Config files for [Git](https://git-scm.com/), including global gitconfig, gitignore, and hooks.

```bash
stow -v -R -t ~ git
```

### `zed`

Config files for [Zed editor](https://zed.dev/)

```bash
stow -v -R -t ~ zed
```

### `scripts`

Custom utility scripts for various tasks (gitlab-project, aws-profiles, tmux-sessions).

```bash
stow -v -R -t ~ scripts
```

### `machine-setup`

Setup scripts for configuring a new machine (macOS).
