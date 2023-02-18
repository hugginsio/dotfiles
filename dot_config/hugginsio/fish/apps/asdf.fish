#!/usr/bin/env fish

# configure asdf

if not test -f $HOME/.asdf/asdf.fish
  exit
end

## source autoconfigure script

source $HOME/.asdf/asdf.fish

## completions

mkdir -p $__fish_config_dir/completions
ln -sf $HOME/.asdf/completions/asdf.fish $__fish_config_dir/completions
