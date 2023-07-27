#!/usr/bin/env fish

# configure asdf
if test -f $HOME/.asdf/asdf.fish
    ## source autoconfigure
    source $HOME/.asdf/asdf.fish

    ## symlink completions
    mkdir -p $__fish_config_dir/completions
    ln -sf $HOME/.asdf/completions/asdf.fish $__fish_config_dir/completions
end

# configure Homebrew
if command -qs brew
    ## shellenv
    eval (brew shellenv)
end

# configure Google Cloud SDK (macOS only, for now)
if test -d /opt/homebrew/Caskroom/google-cloud-sdk
    ## source autoconfigure script
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end

# configure lazygit
if command -qs lazygit
    ## abbreviations
    abbr -a lg lazygit
end

# configure kitty
if command -qs kitty
    ## abbreviations
    abbr -a kssh 'kitty +kitten ssh'
end

# configure Node
if command -qs node
    ## abbreviations
    abbr -a npmcheck 'npx npm-check -u'
    abbr -a npmvet 'npx npmvet -s'
end

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

# configure pnpm
if test -d $HOME/.local/share/pnpm
    set -gx PNPM_HOME "$HOME/.local/share/pnpm"
    fish_add_path "$PNPM_HOME"
end

# configure zk
if command -qs zk
    ## environment
    set -gx ZK_NOTEBOOK_DIR "$HOME/Workspaces/zk/"
end
