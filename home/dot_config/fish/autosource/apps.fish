#!/usr/bin/env fish

# app specific configuration

# configure chezmoi
if command -qs chezmoi
    chezmoi completion fish | source
end

# configure Homebrew
if command -qs brew
    brew shellenv | source
end

# configure gh. non-universal
if command -qs gh
    gh completion -s fish | source
end

# configure kitty
abbr -a kssh 'kitty +kitten ssh'

# configure lazygit
abbr -a lg lazygit

# configure nvim
if command -qs nvim
    set -Ux VISUAL nvim

    abbr -a nvimdiff nvim -d
end

# configure lvim
if command -qs lvim
    set -Ux VISUAL lvim

    abbr -a lvimdiff lvim -d
end

# configure Node
abbr -a npmcheck 'npx npm-check -u'
abbr -a npmvet 'npx npmvet -s'

if not command -qs nvim; and command -qs vim
    set -Ux VISUAL vim
    abbr -a vi vim
end
