#!/bin/sh
# vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! command -v starship &> /dev/null
then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir $HOME/bin

    mkdir -p ~/bin/
    starship init nu > ~/bin/starship.nu
fi
