#!/usr/bin/env fish

# configure Rancher Desktop

if not test -d $HOME/.rd/bin
  exit
end

## source directory

fish_add_path "$HOME/.rd/bin"
