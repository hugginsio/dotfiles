#!/usr/bin/env fish

# configure zk

if not command -qs zk
    exit
end

## environment variables

set -gx ZK_NOTEBOOK_DIR "$HOME/Workspaces/zk/"
