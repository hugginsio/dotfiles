#!/usr/bin/env fish

# macOS specific configuration

fish_add_path /opt/homebrew/bin

if command -qs gcloud
    source (brew --prefix)/share/google-cloud-sdk/path.fish.inc
end
