#!/usr/bin/env fish

# prompt

## enable starship if it is present

if command -qs starship
  starship init fish | source
end
