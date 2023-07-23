#!/usr/bin/env fish

# macOS

fish_add_path /opt/homebrew/bin

set -gx XDG_CONFIG_HOME "$HOME/.config"

set GNUBINS (find (brew --prefix)/opt -type d -follow -name gnubin -print)
for ITEM in $GNUBINS
    fish_add_path $ITEM
end
