#!/bin/env bash

if [[ $(uname -s) == "Darwin" ]]; then
  pmset -g batt | grep -Eo "\d+%"
else
  echo "$(upower -i $(upower -e | grep BAT) | grep "percentage:" | grep -o '[[:digit:]]*%$')"
fi
