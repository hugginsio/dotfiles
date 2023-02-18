#!/usr/bin/env fish

# configure tmux

if not command -qs tmux
  exit
end

## abbreviations

abbr -a ta 'tmux attach'
abbr -a tl 'tmux ls'
abbr -a tk 'tmux kill-server'
abbr -a t 'tmux new'
