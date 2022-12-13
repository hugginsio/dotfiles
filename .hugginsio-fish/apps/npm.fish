#!/usr/bin/env fish

# configure npm

if not command -qs npm
  exit
end

## abbreviations

abbr -a npmcheck 'npx npm-check -u'
abbr -a npmvet 'npx npmvet -s'
