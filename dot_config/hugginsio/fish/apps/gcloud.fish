#!/usr/bin/env fish

# configure Google Cloud SDK (macOS only, for now)

if test -d /opt/homebrew/Caskroom/google-cloud-sdk
    ## source autoconfigure script
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end
