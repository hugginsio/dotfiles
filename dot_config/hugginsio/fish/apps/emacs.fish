#!/usr/bin/env fish # -*- mode: sh -*-

# configure emacs

if not command -qs emacs
  exit
end

## environment variables

set -gx DOOMDIR "$HOME/.config/doom"
fish_add_path "$HOME/.emacs.d/bin"

## abbr
abbr -a em 'emacs -nw'
