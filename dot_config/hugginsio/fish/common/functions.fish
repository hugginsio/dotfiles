#!/usr/bin/env fish

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
