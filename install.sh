#!/usr/bin/env bash
# Install dotfiles on a fresh macOS machine.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null; then
  echo "Homebrew not found. Install it first: https://brew.sh" >&2
  exit 1
fi

echo "==> Installing brew packages"
brew install \
  zsh \
  powerlevel10k \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-completions \
  fzf \
  eza \
  bat \
  zoxide \
  thefuck

echo "==> Installing oh-my-zsh (if missing)"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> Symlinking dotfiles"
for f in .zshrc .zprofile; do
  src="$DOTFILES/$f"
  dst="$HOME/$f"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    backup="$dst.bak.$(date +%Y%m%d-%H%M%S)"
    echo "    backing up $dst -> $backup"
    mv "$dst" "$backup"
  fi
  ln -sfn "$src" "$dst"
  echo "    $dst -> $src"
done

echo
echo "Done. Open a new terminal and run: p10k configure"
