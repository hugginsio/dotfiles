#!/usr/bin/env fish

# configure asdf
if test -f $HOME/.asdf/asdf.fish
    ## set ASDF_DIR preemptively
    set -gx ASDF_DIR $HOME/.asdf/

    ## source autoconfigure
    source $HOME/.asdf/asdf.fish

    ## symlink completions
    mkdir -p $__fish_config_dir/completions
    ln -sf $HOME/.asdf/completions/asdf.fish $__fish_config_dir/completions
end
