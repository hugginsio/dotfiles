#!/bin/env bash

function dgit() {
  $(which git) --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

echo "dotfiles $(dgit log -n1 --format="%h")"
echo ""

if [ "$1" == "" ]; then
  echo "Checking for updates..."
  dgit remote update &>/dev/null
  dgit remote show origin | grep $(dgit rev-parse --abbrev-ref HEAD) | tail -1 | sed -e 's/^\s*//' -e 's/^main pushes to main //'
  echo ""
  echo "USAGE"
  echo "dotfiles <command>"
  echo ""
  echo "COMMANDS"
  echo "update        pulls latest changes (incl. submodules)"
  echo ""
  echo "GIT"
  echo "Any arguments that are not listed in the COMMANDS section will be passed to git."
elif [ "$1" == "update" ]; then
  echo "Updating..."
  dgit pull origin main
  dgit submodule update --remote
else
  dgit $@
fi

unset -f dgit
