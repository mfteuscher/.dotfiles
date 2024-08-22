# .zshrc
# Author: Michael Teuscher

# PATH Variables
export DOTFILES_DIR="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES_DIR/Brewfile"

# Aliases
alias ls='eza -lahF --git --icons $@'
alias trail='<<<${(F)path}'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# Syntax highlighting
# man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Visual Studio Dark+"

export NULLCMD=bat

# Package plugins

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Homebrew
# Autocomplete
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
