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
