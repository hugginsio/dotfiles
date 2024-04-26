#!/bin/sh
# vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! command -v asdf &> /dev/null
then
    echo "ERR! asdf-vm is not installed. Try re-applying your dotfiles."
else
    echo "Configuring asdf-vm $(asdf --version)..."
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true

    asdf plugin add python https://github.com/asdf-community/asdf-python.git || true
    asdf install python latest
fi
