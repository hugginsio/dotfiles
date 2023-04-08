#!/usr/bin/env fish

# configure vim

if not command -qs vim
  exit
end

## set as visual editor

set -gx VISUAL vim

## abbreviations

abbr -a vi 'vim'
