#!/usr/bin/env fish

set -l PATHS_LIST "$HOME/bin/" \
    "$HOME/.nix-profile/bin" \
    "/nix/var/nix/profiles/default/bin" \
    "$HOME/.local/bin/" \
    "$HOME/go/bin" \
    "$HOME/.krew/bin" \

for P in $PATHS_LIST
    fish_add_path $P
end
