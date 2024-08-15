# .zshrc
# Author: Michael Teuscher

# Aliases
alias ls='ls -lAFh'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_"
}
