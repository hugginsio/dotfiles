# https://www.nushell.sh

def nu_prepend_path [nu_path] {
  $env.PATH = ( if $nu_path in $env.PATH { $env.PATH } else { $env.PATH | prepend $nu_path } )
}

nu_prepend_path "/opt/homebrew/bin"
nu_prepend_path ( $nu.home-path | path join "bin" )
