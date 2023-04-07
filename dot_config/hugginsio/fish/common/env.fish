#!/usr/bin/env fish

# env
## environment variables
set -gx XDG_CONFIG_HOME '~/.config'

## configure path
fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"

### golang
fish_add_path "$HOME/go/bin"

### rust
fish_add_path "$HOME/.cargo/bin"
