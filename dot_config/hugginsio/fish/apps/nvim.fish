#!/usr/bin/env fish

# configure neovim

if not command -qs nvim
  exit
end

## set as visual editor

set -gx VISUAL nvim

## abbreviations

abbr -a vi 'nvim'
abbr -a vim 'nvim'
