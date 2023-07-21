#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

echo "Detected: macOS"
echo "Installing essentials..."

mkdir -p ~/.local/bin

if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update && brew upgrade && brew cleanup
brew bundle --no-lock --file=/dev/stdin <<EOF
brew "bat"
brew "coreutils"
brew "curl"
brew "fish"
brew "gawk"
brew "gh"
brew "git"
brew "gpg"
brew "neovim"
brew "ripgrep"
brew "starship"
cask "appcleaner"
cask "raycast"
EOF
