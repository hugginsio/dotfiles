#!/usr/bin/env fish

# configure zk
if command -qs zk
    ## environment
    set -gx ZK_NOTEBOOK_DIR "$HOME/Workspaces/zk/"
end
