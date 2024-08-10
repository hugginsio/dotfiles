#!/usr/bin/env fish

set -l PATHS_LIST "$HOME/bin/" \
    "$HOME/.cargo/bin/" \
    "$HOME/.local/bin/" \
    "$HOME/go/bin/"

for P in $PATHS_LIST
    fish_add_path $P
end
