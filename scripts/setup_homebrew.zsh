#!/usr/bin/env zsh

if exists brew; then
  echo 'Homebrew is already installed. Skipping...'
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose
