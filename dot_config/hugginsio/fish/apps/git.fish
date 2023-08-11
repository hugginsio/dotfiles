#!/usr/bin/env fish

# configure gh
if command -qs gh
    ## completions
    gh completion -s fish | source
end
