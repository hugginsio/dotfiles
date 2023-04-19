#!/usr/bin/env fish

# configure taskwarrior

if not command -qs task
    exit
end

## abbreviations

abbr -a t task

# configure taskwarrior-tui

if not command -qs task
    exit
end

## abbreviations

abbr -a tt taskwarrior-tui
