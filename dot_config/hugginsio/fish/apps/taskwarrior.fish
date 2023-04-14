#!/usr/bin/env fish

# configure taskwarrior

if not command -qs task
  exit
end

## abbreviations

abbr -a t 'task'
