#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

echo "Detected: macOS"
echo "Installing essentials..."

if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update && brew upgrade && brew cleanup
fi

brew bundle --no-lock --file=/dev/stdin <<EOF
brew "coreutils"
brew "curl"
brew "git"
brew "gpg"
brew "gawk"
EOF
