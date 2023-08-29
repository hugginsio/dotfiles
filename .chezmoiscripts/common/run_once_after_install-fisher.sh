#!/usr/bin/env fish

if command -qs fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
end

# vi: ft=fish
