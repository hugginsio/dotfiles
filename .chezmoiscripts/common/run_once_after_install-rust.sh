#!/bin/sh
# vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

echo "Installing rust..."

curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
