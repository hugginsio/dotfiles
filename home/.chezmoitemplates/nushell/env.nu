# https://www.nushell.sh/book/environment.html

# Paths
if (sys host | get name | str lowercase | $in == "windows") {
    $env.HOME = $env.USERPROFILE
}

$env.ROOT_DIR = (sys disks | get 0.mount)
$env.WORKSPACES = ($env.HOME | path join 'Workspaces')

$env.PNPM_HOME = ($env.HOME | path join 'Library' 'pnpm')

if (sys host | get name | str lowercase | $in == "windows") {
    $env.DEV_DRIVE = (sys disks | where device == "DEV" | get 0.mount)
    $env.DEV_DIR = ($env.DEV_DRIVE | path join "git")
} else {
    $env.DEV_DIR = ($env.WORKSPACES | path join 'Git')
}

$env.PATH = (
  []
  | append ($env.HOME | path join 'bin')
  | append ($env.HOME | path join '.local' 'bin')
  | append ($env.HOME | path join '.local' 'share' 'mise' 'shims')
  | append ($env.HOME | path join '.sledge' 'bin')
  | append ($env.HOME | path join 'go' 'bin')
  | append ($env.HOME | path join '.krew' 'bin')
  | append ($env.HOME | path join '.cargo' 'bin')
  | append ($env.PNPM_HOME)
  | append ($env.ROOT_DIR | path join 'opt' 'homebrew' 'bin')
  | append ($env.PATH | split row (char esep))
  | uniq
)

# Application configuration (autoloaded during startup)
$env.NU_VENDOR_AUTOLOAD = ($nu.data-dir | path join 'vendor' 'autoload')
mkdir $env.NU_VENDOR_AUTOLOAD

if (which atuin | is-not-empty) {
    atuin init nu | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'atuin.nu')
    atuin gen-completions -s nushell | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'atuin-completions.nu')
}

if (which carapace | is-not-empty) {
    carapace _carapace nushell | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'carapace.nu')
}

if (which starship | is-not-empty) {
    starship init nu | save -f ($env.NU_VENDOR_AUTOLOAD | path join 'starship.nu')
}

if (which go | is-not-empty) {
    $env.GOPATH = (
        []
        | append (go env GOPATH)
    )
}

let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -o 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        git => $carapace_completer
        _ => $fish_completer
    } | do $in $spans
}

$env.config = {
    completions: {
        external: {
            enable: true
            completer: $external_completer
        }
    }
}
