# https://www.nushell.sh/book/configuration.html

$env.config = {
  show_banner: false,
}

# TODO: deal with this better
source ($nu.default-config-dir | path join 'cache' 'atuin.nu')
source ($nu.default-config-dir | path join 'cache' 'starship.nu')
