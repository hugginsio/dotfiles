# https://www.nushell.sh/book/configuration.html

$env.config = {
  show_banner: false,
}

# External configuration
# TODO: deal with this better
source ($nu.default-config-dir | path join 'cache' 'atuin.nu')
source ($nu.default-config-dir | path join 'cache' 'atuin-completions.nu')
source ($nu.default-config-dir | path join 'cache' 'carapace.nu')
source ($nu.default-config-dir | path join 'cache' 'starship.nu')

# Aliases
# TODO: recursively remove .DS_Store
# TODO: recursively remove node_modules
alias cdd = cd (chezmoi source-path)
alias cdg = cd ($env.HOME | path join 'Workspaces' 'Develop')
alias cdp = cd ($env.HOME | path join 'Workspaces' 'Photograph')
alias cdw = cd ($env.HOME | path join 'Workspaces')
alias g = git
alias k = kubectl
alias l = ls -asm
alias lg = lazygit
alias myip = curl myip.addr.tools
alias nuke = rm -rf
alias p = ps
alias pc = pre-commit
alias please = sudo
alias y = yazi
def ld [] { ls -asm | where name starts-with "." }
def lssh [] { open known_hosts | lines | split column " " host | sort }
