#!/bin/sh
# vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

chmod +x "$HOME/Workspaces/tasks/hooks/on-modify.timewarrior" 2>/dev/null || true
