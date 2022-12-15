#!/usr/bin/env fish

# fish

set -gx DOTFILES $HOME/.hugginsio-fish
set -gx DOTFILES_SOURCE_ATTEMPTS $__fish_config_dir/config.fish

function dotfiles_source -d "Sources a configuration file if it exists"
  for arg in $argv
    if test -r $arg && test -f $arg
      set -a DOTFILES_SOURCE_ATTEMPTS $arg
      source $arg
    end
  end
end

if not test "$DOTFILES_ARE_CONFIGURED" = true
  ## global prompt

  ### load common configuration files

  dotfiles_source $DOTFILES/common/*.fish

  ### load host-specific configuration

  dotfiles_source $DOTFILES/host/(hostname -s | string sub -l 4 | string lower).fish

  ### load os-specific configuration

  dotfiles_source $DOTFILES/os/(uname -s | string lower).fish

  ### load application configuration files

  dotfiles_source $DOTFILES/apps/*.fish

  ### load extra configuration

  dotfiles_source $DOTFILES/extra.fish

  ### set DOTFILES_ARE_CONFIGURED
  
  set -gx DOTFILES_ARE_CONFIGURED true
else
  ## per-prompt configuration

  ### starship and the dotfiles util need to always be available
  dotfiles_source $DOTFILES/common/prompt.fish $DOTFILES/common/dotfiles.fish
end

function on_exit --on-event fish_exit
  if test (pgrep fish -c) = 1
    set -e DOTFILES_ARE_CONFIGURED
  end
end
