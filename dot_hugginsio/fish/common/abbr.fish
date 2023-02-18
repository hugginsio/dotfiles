#!/usr/bin/env fish

# common abbreviations

abbr -a ... 'cd ../../'
abbr -a .. 'cd ../'
abbr -a ~ 'cd ~/'
abbr -a c 'clear'
abbr -a cdg 'cd "$HOME/Documents/Develop/"'
abbr -a cdp 'cd "$HOME/Documents/Photograph/"'
abbr -a l 'la'
abbr -a la 'ls -loFcgha'
abbr -a ld 'ls -loFcghd .*'
abbr -a lssh '"$HOME/.ssh/known_hosts" | grep -o "^\S*" | sort -t: -u -k1,1'
abbr -a myip 'curl icanhazip.com'
abbr -a nuke 'rm -rf'
abbr -a p 'ps -f'
abbr -a please 'sudo'
