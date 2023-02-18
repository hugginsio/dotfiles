#!/usr/bin/env fish

complete --command dotfiles --exclusive --condition __fish_use_subcommand --arguments explain --description "Shows which env-specific dotfiles will be loaded"
complete --command dotfiles --exclusive --condition __fish_use_subcommand --arguments reload --description "Attempt to reload shell configuration"

function dotfiles -a CMD -d "Dotfiles management utility"
  switch $CMD
    case "explain"
      echo Detected shortname: (hostname -s | string sub -l 4 | string lower)
      echo Detected OS name: (uname -s | string lower)
      echo
      echo Sourced configuration files:
      echo $DOTFILES_SOURCE_ATTEMPTS
    case "reload"
      echo "Reloading..."
      set -gx DOTFILES_ARE_CONFIGURED false
      for ABR in (abbr -l)
        abbr -e $ABR
      end
      source $__fish_config_dir/config.fish
      echo "Reload complete."
    case "*"
      echo "USAGE"
      echo "dotfiles <command>"
      echo
      echo "COMMANDS"
      echo "explain       shows which env-specific dotfiles will be loaded"
      echo "reload        attempt to reload shell configuration"
      echo
  end
end
