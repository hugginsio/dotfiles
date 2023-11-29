#!/bin/sh
# vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

pip install pre-commit
pip install tzdata

pre-commit init-templatedir ~/.config/git/template/
