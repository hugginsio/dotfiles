#!/usr/bin/env fish

# Global abbreviations for built-ins
abbr -a .. 'cd ../'
abbr -a ... 'cd ../../'
abbr -a c clear
abbr -a cdd 'cd "$HOME/.local/share/chezmoi/"'
abbr -a cdg 'cd "$HOME/Workspaces/Develop/"'
abbr -a cdp 'cd "$HOME/Workspaces/Photograph/"'
abbr -a cdv 'cd "$HOME/Workspaces/Vault/"'
abbr -a cdw 'cd "$HOME/Workspaces/"'
abbr -a g git
abbr -a k kubectl
abbr -a l la
abbr -a la 'ls -loFcgha'
abbr -a ld 'ls -loFcghd .*'
abbr -a lssh '"$HOME/.ssh/known_hosts" | grep -o "^\S*" | sort -t: -u -k1,1'
abbr -a myip 'curl icanhazip.com'
abbr -a nuke 'rm -rf'
abbr -a p 'ps -f'
abbr -a pc pre-commit
abbr -a please sudo
abbr -a r ranger
abbr -a rmdsstore 'find . -type f -name ".DS_Store" -delete'
abbr -a rmnodemodules 'find . -name "node_modules" -type d -prune -exec rm -rf "{}" +'
abbr -a t task
abbr -a tt taskwarrior-tui
