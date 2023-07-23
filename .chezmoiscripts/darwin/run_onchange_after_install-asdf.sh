#!/bin/sh # vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

if [[ $(command -v asdf) == "" ]]; then
    echo "ERR! asdf-vm is not installed. Try re-applying your dotfiles."
    exit
fi

echo "Configuring asdf-vm $(asdf --version)..."

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
asdf install nodejs latest
asdf global nodejs latest

asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git || true
asdf install deno latest
asdf global deno latest
