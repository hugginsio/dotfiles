#!/usr/bin/env fish

set -l PATHS_LIST "$HOME/bin/" \
    "$HOME/.local/bin/" \
    "$HOME/.nix-profile/bin" \
    "/nix/var/nix/profiles/default/bin" \

for P in $PATHS_LIST
    fish_add_path $P
end
