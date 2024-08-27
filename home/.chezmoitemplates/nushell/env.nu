# https://www.nushell.sh/book/environment.html

$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend ($env.HOME | path join bin)
  | prepend ($env.HOME | path join .nix-profile bin)
  | prepend ('/nix/var/nix/profiles/default/bin')
  | prepend ($env.HOME | path join go bin)
  | uniq
)

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
