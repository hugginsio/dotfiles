#!/usr/bin/env fish

# configure pnpm

if not test -d $HOME/.local/share/pnpm
  exit
end

set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path "$PNPM_HOME"
