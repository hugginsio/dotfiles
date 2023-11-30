#!/bin/sh
# vi: ft=bash

# -e: exit on error
# -u: exit on unset variables
set -eu

GOLANG_VERSIONS=$(curl -s "https://go.dev/dl/?mode=json")
GOLANG_ARCHIVE=$(jq '.[0].files[] | select((.os == "darwin") and (.arch == "arm64") and (.kind == "archive")) | .filename' -r <<< $GOLANG_VERSIONS)

echo "Downloading golang..."
curl -L -o "$GOLANG_ARCHIVE" "https://go.dev/dl/$GOLANG_ARCHIVE"

echo "Installing $GOLANG_ARCHIVE..."
# NOTE: on my machine, folders don't always delete the first time you ask.
rm -rf "$HOME/go" && rm -rf "$HOME/go" && tar -C "$HOME" -xzf "$GOLANG_ARCHIVE"
rm -rf "$GOLANG_ARCHIVE"
