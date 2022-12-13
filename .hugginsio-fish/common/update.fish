#!/usr/bin/env fish

function up -d "Update"
  set -l COMMANDS_LIST "apt-get" \
                       "dnf" \
                       "rpm-ostree" \
                       "brew" \
                       "gcloud"
  set -l UPD_EXEC_LIST "sudo apt update && sudo apt upgrade -y && sudo apt autoremove" \
                       "sudo dnf upgrade -y --refresh && sudo dnf autoremove" \
                       "rpm-ostree upgrade" \
                       "brew update && brew upgrade && brew cleanup" \
                       "gcloud components update -q"

  echo "Available: $COMMANDS_LIST"

  for CMD in $COMMANDS_LIST
    if command -qs $CMD
      echo "Requesting updates for $CMD"
      set -l UPD_I (contains -i $CMD $COMMANDS_LIST)
      eval $UPD_EXEC_LIST[$UPD_I]
    end
  end

  echo "Requesting updates for dotfiles"
  eval $HOME/.hugginsio/util/dotfiles.sh update
end
