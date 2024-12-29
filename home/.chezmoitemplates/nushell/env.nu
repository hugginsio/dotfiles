# https://www.nushell.sh/book/environment.html

$env.ROOT_DIR = (sys disks | get 0.mount)
$env.PATH = (
  []
  | append ($env.HOME | path join 'bin')
  | append ($env.HOME | path join '.nix-profile' 'bin')
  | append ($env.ROOT_DIR | path join 'nix' 'var' 'nix' 'profiles' 'default' 'bin')
  | append ($env.HOME | path join 'go' 'bin')
  | append ($env.HOME | path join '.cargo' 'bin')
  | append ($env.HOME | path join '.deno' 'bin')
  | append ($env.HOME | path join '.krew' 'bin')
  | append ($env.ROOT_DIR | path join 'opt' 'homebrew' 'bin')
  | append ($env.PATH | split row (char esep))
  | uniq
)

$env.NU_CACHE_DIR = ($nu.default-config-dir | path join 'cache')
mkdir $env.NU_CACHE_DIR

if (which starship | is-not-empty) {
    starship init nu | save -f ($env.NU_CACHE_DIR | path join 'starship.nu')
}

if (which atuin | is-not-empty) {
    atuin init nu | save -f ($env.NU_CACHE_DIR | path join 'atuin.nu')
    atuin gen-completions -s nushell | save -f ($env.NU_CACHE_DIR | path join 'atuin-completions.nu')
}

if (which carapace | is-not-empty) {
    carapace _carapace nushell | save -f ($env.NU_CACHE_DIR | path join 'carapace.nu')
}
