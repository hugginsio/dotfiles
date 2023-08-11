#!/usr/bin/env fish # vi: ft=fish

function up -d "Update available package managers and programs."
    set -l COMMANDS_LIST apt-get \
        dnf \
        rpm-ostree \
        brew \
        gcloud \
        snap \
        nvim \
        mas
    set -l UPD_EXEC_LIST "sudo apt-get -yqq update && sudo apt-get -yqq upgrade && sudo apt-get -yqq autoremove" \
        "sudo dnf upgrade -y --refresh && sudo dnf autoremove" \
        "rpm-ostree upgrade" \
        "brew update && brew upgrade && brew cleanup" \
        "gcloud components update -q" \
        "sudo snap refresh" \
        "nvim --headless '+Lazy! update' +qa" \
        "mas upgrade"

    echo "Available: $COMMANDS_LIST"

    for CMD in $COMMANDS_LIST
        if command -qs $CMD
            echo "Requesting updates for $CMD"
            set -l UPD_I (contains -i $CMD $COMMANDS_LIST)
            eval $UPD_EXEC_LIST[$UPD_I]
        end
    end
end
