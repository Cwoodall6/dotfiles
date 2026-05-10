# ~/.zshrc — managed in github.com/Cwoodall6/dotfiles

# powerlevel10k instant prompt — keep near top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── oh-my-zsh ────────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""   # using brew powerlevel10k sourced below
plugins=(
  git
  macos
  brew
  sudo
  command-not-found
  history
  z
)
source "$ZSH/oh-my-zsh.sh"

# ── theme: powerlevel10k (brew) ──────────────────────────────────────────────
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── completions (brew zsh-completions) ───────────────────────────────────────
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  autoload -Uz compinit
  compinit
fi

# ── plugins (brew) ───────────────────────────────────────────────────────────
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax-highlighting must be sourced LAST among zsh plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── modern CLI tools ─────────────────────────────────────────────────────────
command -v zoxide  >/dev/null && eval "$(zoxide init zsh)"
command -v fzf     >/dev/null && eval "$(fzf --zsh)"
command -v thefuck >/dev/null && eval "$(thefuck --alias fix)"

# eza > ls
if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first'
  alias ll='eza -lah --group-directories-first --git'
  alias tree='eza --tree'
fi
command -v bat >/dev/null && alias cat='bat --paging=never'

# ── PATH / language toolchains ───────────────────────────────────────────────
export PATH="$PATH:$HOME/.lmstudio/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# ── local overrides (untracked) ──────────────────────────────────────────────
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
