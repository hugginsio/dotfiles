#!/usr/bin/env fish # -*- mode: sh -*-

# configure kitty

if not command -qs kitty
  exit
end

## abbr
abbr -a kssh 'kitty +kitten ssh'
