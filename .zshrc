# .zshrc
# Author: Michael Teuscher

# Variables
export DOTFILES_DIR="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES_DIR/Brewfile"
export XDG_CONFIG_HOME="$HOME/.config"

# Add SSH key to keychain
ssh-add --apple-use-keychain ~/.ssh/id_github > /dev/null 2>&1

# PATH Variables
typeset -U path # this line makes the path array unique
path=(
    "/opt/homebrew/opt/openjdk/bin"
    "/opt/homebrew/opt/rustup/bin"
    "/Users/michaelteuscher/.cargo/bin"
    $path
)

# Aliases
alias ls='eza -lahF --git --icons $@'
alias trail='<<<${(F)path}'
alias info='fastfetch'
alias c='clear'

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

function frequency() {
    history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
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
  typeset -U fpath # this line makes the path array unique
  # FPATH="$(brew --prefix)/share/zsh/site-functions:$(brew --prefix)/share/zsh-completions:${FPATH}"
  fpath=(
    $(brew --prefix)/share/zsh/site-functions
    $(brew --prefix)/share/zsh-completions
    $fpath
  )

  autoload -Uz compinit
  compinit
fi

# Starship Prompt
if [[ $TERM_PROGRAM != 'Apple_Terminal' ]]; then
  eval "$(starship init zsh)"
fi


eval "$(fnm env --use-on-cd --shell zsh)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
