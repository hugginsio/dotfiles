# https://www.nushell.sh/book/environment.html

# Paths
$env.ROOT_DIR = (sys disks | get 0.mount)
$env.WORKSPACES = ($env.HOME | path join 'Workspaces')

if ($env.ROOT_DIR | str starts-with "C:") {
    $env.DEV_DRIVE = (sys disks | where device == "DEV" | get 0.mount)
    $env.DEV_DIR = ($env.DEV_DRIVE | path join "git")
} else {
    $env.DEV_DIR = ($env.WORKSPACES | path join 'Git')
}

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

# Application configuration (autoloaded during startup)
$env.NU_VENDOR_AUTOLOAD = ($nu.data-dir | path join 'vendor' 'autoload')
mkdir $env.NU_VENDOR_AUTOLOAD

if (which starship | is-not-empty) {
    starship init nu | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'starship.nu')
}

if (which atuin | is-not-empty) {
    atuin init nu | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'atuin.nu')
    atuin gen-completions -s nushell | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'atuin-completions.nu')
}

if (which carapace | is-not-empty) {
    carapace _carapace nushell | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'carapace.nu')
}
