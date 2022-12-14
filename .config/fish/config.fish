#!/usr/bin/env fish

# fish

set -Ux DOTFILES $HOME/.hugginsio-fish
set -Ux DOTFILES_SOURCE_ATTEMPTS $__fish_config_dir/config.fish

function dotfiles_source -d "Sources a configuration file if it exists"
  for arg in $argv
    if test -r $arg && test -f $arg
      set -a DOTFILES_SOURCE_ATTEMPTS $arg
      source $arg
    end
  end
end

if test "$DOTFILES_ARE_CONFIGURED" != "true"
  ## global prompt

  ### load common configuration files

  for FILE in $DOTFILES/common/*.fish
    dotfiles_source $FILE
  end

  ### load host-specific configuration

  dotfiles_source $DOTFILES/host/(hostname -s | string sub -l 4 | string lower).fish

  ### load os-specific configuration

  dotfiles_source $DOTFILES/os/(uname -s | string lower).fish

  ### load application configuration files

  for FILE in $DOTFILES/apps/*.fish
    dotfiles_source $FILE
  end

  ### load extra configuration

  dotfiles_source $DOTFILES/extra.fish

  ### set DOTFILES_ARE_CONFIGURED
  
  set -Ux DOTFILES_ARE_CONFIGURED true
else
  ## per-prompt configuration

  dotfiles_source $DOTFILES/common/prompt.fish
end

function on_exit --on-event fish_exit
  # Ensure reload whenever shell is launched fresh
  if test (pgrep fish -c) = 1
    set -Ux DOTFILES_ARE_CONFIGURED false
  end
end
