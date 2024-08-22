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
