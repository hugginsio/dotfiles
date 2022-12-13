#!/usr/bin/env fish

# common functions

function reload -d "Force reload dotfiles"
  set -Ux DOTFILES_ARE_CONFIGURED false

  # Delete all abbreviations
  for ABR in (abbr -l)
    abbr -e $ABR
  end

  source "$__fish_config_dir/config.fish"
  set -Ux DOTFILES_ARE_CONFIGURED true
end
