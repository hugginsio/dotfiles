#!/bin/bash

echo "Setting up..."

function config() {
  $(which git) --git-dir=$HOME/.cfg/ --work-tree=$HOME
}

cd $HOME

# If repo directory does not exist, clone it
[ ! -d "$HOME/.cfg" ] && git clone --bare "https://github.com/kjhx/dotfiles.git" $HOME/.cfg

# https://www.atlassian.com/git/tutorials/dotfiles
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

config checkout
config config status.showUntrackedFiles no

echo "Don't forget to populate '.extra' with your gitconfig, etc."
exit && rm -rf $HOME/.files-bootstrap