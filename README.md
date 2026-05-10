# dotfiles

My zsh setup. macOS, Apple Silicon. Homebrew + oh-my-zsh + powerlevel10k.

## Install on a new machine

```sh
# 1. Install Homebrew (if needed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone this repo
git clone https://github.com/Cwoodall6/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 3. Run installer (installs brew packages, oh-my-zsh, symlinks)
./install.sh
```

Open a new terminal, then run `p10k configure` to set up the prompt.

## What's included

**Shell:** zsh + oh-my-zsh
**Theme:** powerlevel10k
**Plugins:** zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions
**Modern CLI:** fzf, eza, bat, zoxide, thefuck

## Local overrides

Per-machine config goes in `~/.zshrc.local` (sourced last, untracked).
