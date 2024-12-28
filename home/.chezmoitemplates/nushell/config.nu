# https://www.nushell.sh/book/configuration.html

$env.config = {
  show_banner: false,
}

# External configuration
# TODO: deal with this better
source ($nu.default-config-dir | path join 'cache' 'atuin.nu')
source ($nu.default-config-dir | path join 'cache' 'carapace.nu')
source ($nu.default-config-dir | path join 'cache' 'starship.nu')

# Aliases
alias cdd = cd ($env.HOME | path join 'local' 'share' 'chezmoi')
alias cdg = cd ($env.HOME | path join 'Workspaces' 'Develop')
alias cdp = cd ($env.HOME | path join 'Workspaces' 'Photograph')
alias cdw = cd ($env.HOME | path join 'Workspaces')
alias g = git
alias k = kubectl
alias l = la
alias la = ls -asdm
# alias ld = ls -asdm | where name starts-with "."
alias myip = curl myip.addr.tools
alias nuke = rm -rf
alias p = ps
alias pc = pre-commit
alias please = sudo
alias y = yazi
