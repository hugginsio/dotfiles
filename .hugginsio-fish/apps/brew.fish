#!/usr/bin/env fish

# configure Homebrew

if not command -qs brew
  exit
end

## shellenv

eval (brew shellenv)
