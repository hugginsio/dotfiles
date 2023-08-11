#!/usr/bin/env fish

# configure nvim
if command -qs nvim
    ## environment
    set -gx VISUAL nvim

    ## abbreviations
    abbr -a nvimdiff nvim -d
    abbr -a vi nvim
    abbr -a vim nvim
    abbr -a vimdiff nvim -d
end

if not command -qs nvim; and command -qs vim
    ## environment
    set -gx VISUAL vim

    ## abbreviations
    abbr -a vi vim
end
