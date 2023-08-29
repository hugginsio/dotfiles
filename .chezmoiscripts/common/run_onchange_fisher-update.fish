#!/usr/bin/env fish

# hash: {{ include "dot_config/fish/fish_plugins" | sha256sum }}

# HACK: remove all plugins except fisher to prevent update failures.
# This can be removed once a --force flag is added.
fisher list [^jorgebucaran/fisher] | fisher remove
fisher update
