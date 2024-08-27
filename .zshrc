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

function aws-profile() {
    if [ "$1" = "set" ] && [ -n "$2" ]; then
        export AWS_PROFILE="$2"
        echo "AWS profile set to '$AWS_PROFILE'"
    elif [ "$1" = "get" ]; then
        echo "$AWS_PROFILE"
    elif [ "$1" = "unset" ]; then
        unset AWS_PROFILE
        echo "AWS profile unset"
    else
        echo """
        Usage:
        aws-profile set <profile>
        aws-profile get
        aws-profile unset
        """
    fi
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

# Starship Prompt
if [[ $TERM_PROGRAM != 'Apple_Terminal' ]]; then
  eval "$(starship init zsh)"
fi
