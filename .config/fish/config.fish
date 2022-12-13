#!/usr/bin/env fish

# fish

set -Ux DOTFILES $HOME/.hugginsio-fish

if test "$DOTFILES_ARE_CONFIGURED" != "true"
  ## global prompt

  function dotfiles_source -d "Sources a configuration file if it exists"
    for arg in $argv
      if test -r $arg && test -f $arg
        source $arg
      end
    end
  end

  ## load common configuration files

  for FILE in $DOTFILES/common/*.fish
    dotfiles_source $FILE
  end

  ## load host-specific configuration

  dotfiles_source $DOTFILES/host/(hostname -s | string sub -l 4 | string lower).fish

  ## load os-specific configuration

  dotfiles_source $DOTFILES/os/(uname -s | string lower).fish

  ## load application configuration files

  for FILE in $DOTFILES/apps/*.fish
    dotfiles_source $FILE
  end

  ## load extra configuration

  dotfiles_source $DOTFILES/extra.fish

  ## set DOTFILES_ARE_CONFIGURED
  
  set -Ux DOTFILES_ARE_CONFIGURED true
else
  ## per-prompt configuration
  dotfiles_source $DOTFILES/common/prompt.fish
end
