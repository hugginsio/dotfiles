#!/bin/sh # vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

echo "Installing Homebrew..."

mkdir -p ~/.local/bin

if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
