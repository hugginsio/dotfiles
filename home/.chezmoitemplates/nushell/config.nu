# https://www.nushell.sh/book/configuration.html

# Environment Configuration
$env.config.show_banner = false

# Atuin handles arrow keys and <C-r>, but other forms of history and historical completions are still Nushell
$env.config.history = {
  file_format: sqlite
  isolation: true
  max_size: 10_000
  sync_on_enter: true
}

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
alias npmcheck = npx npm-check -u
alias npmvet = npx npmvet -s
alias nuke = rm -rf
alias nvimdiff = nvim -d
alias p = ps
alias pc = pre-commit
alias please = sudo
alias y = yazi
def ld [] { ls -asm | where name starts-with "." }
def lssh [] { open known_hosts | lines | split column " " host | sort }

# Environment Variables

if (which vim | is-not-empty) {
    $env.EDITOR = "vim"
    $env.VISUAL = "vim"
    $env.config.buffer_editor = "vim"
}

if (which nvim | is-not-empty) {
    $env.EDITOR = "nvim"
    $env.VISUAL = "nvim"
    $env.config.buffer_editor = "nvim"
}
