# .zshrc
# Author: Michael Teuscher

# PATH Variables
export DOTFILES_DIR="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES_DIR/Brewfile"

# Aliases
alias ls='ls -lAFh'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_"
}
