#!/usr/bin/env fish

# Standalone functions
function mcd -d "Creates a directory (if it does not exist) and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function gi -d "Interact with gitignore.io"
    curl -sL https://www.toptal.com/developers/gitignore/api/$argv
end

complete --command dotfiles --exclusive --condition __fish_use_subcommand --arguments explain --description "Shows which env-specific dotfiles will be loaded"
complete --command dotfiles --exclusive --condition __fish_use_subcommand --arguments reload --description "Attempt to reload shell configuration"

function dotfiles -a CMD -d "Dotfiles management utility"
    switch $CMD
        case explain
            # TODO: update for chezmoi
            echo Detected shortname: (hostname -s | string sub -l 4 | string lower)
            echo Detected OS name: (uname -s | string lower)
            echo
            echo Sourced configuration files:
            echo $DOTFILES_SOURCE_ATTEMPTS
        case reload
            echo "Reloading..."
            set -e fish_user_paths
            set -Ux DOTFILES_ARE_CONFIGURED false
            for ABR in (abbr -l)
                abbr -e $ABR
            end
            source $__fish_config_dir/config.fish
            echo "Reload complete."
        case "*"
            echo USAGE
            echo "dotfiles <command>"
            echo
            echo COMMANDS
            echo "explain       shows which env-specific dotfiles will be loaded"
            echo "reload        attempt to reload shell configuration"
            echo
    end
end
