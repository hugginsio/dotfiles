#!/usr/bin/env fish

# configure asdf

if not command -qs asdf
  exit
end

## completions

source $HOME/.asdf/asdf.fish
