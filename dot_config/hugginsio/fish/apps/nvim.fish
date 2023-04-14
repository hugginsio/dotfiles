#!/usr/bin/env fish

# configure nvim (preferred default)

if not command -qs nvim
  exit
end

## set as visual editor

set -gx VISUAL nvim

## abbreviations

abbr -a vi 'nvim'
abbr -a vim 'nvim'
