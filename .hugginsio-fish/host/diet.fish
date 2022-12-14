#!/usr/bin/env fish

# DietPi

## path

set -l PATH_LIST "/usr/bin" "/boot/dietpi" "/boot/dietpi/func" "/bin" "/usr/sbin" "/sbin"

for ITEM in $PATH_LIST
  fish_add_path $ITEM
end

## banner

eval dietpi-login
