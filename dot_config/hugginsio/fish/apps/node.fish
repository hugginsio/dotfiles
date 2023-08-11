#!/usr/bin/env fish

# configure Node
if command -qs node
    ## abbreviations
    abbr -a npmcheck 'npx npm-check -u'
    abbr -a npmvet 'npx npmvet -s'
end

# configure pnpm
if test -d $HOME/.local/share/pnpm
    set -gx PNPM_HOME "$HOME/.local/share/pnpm"
    fish_add_path "$PNPM_HOME"
end
