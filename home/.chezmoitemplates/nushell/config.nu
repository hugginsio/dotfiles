# https://www.nushell.sh

$env.config = {
    show_banner: false,
}

use ~/bin/starship.nu

alias ... = cd ../../
alias G = git
alias K = kubectl
alias T = task
alias TT = taskwarrior-tui
alias cdd = cd $env.HOME/.local/share/chezmoi/
alias cdg = cd $env.HOME/Workspaces/Develop/
alias cdw = cd $env.HOME/Workspaces/
alias cdz = cd $env.HOME/Workspaces/zk/
alias l = ls
alias lg = lazygit
alias myip = curl icanhazip.com
alias npmcheck = npx npm-check -u
alias npmvet = npx npmvet -s
alias nuke = rm -rf
alias p = ps
alias pc = pre-commit
alias please = sudo
alias rmdsstore = ^find . -type f -name ".DS_Store" -delete
