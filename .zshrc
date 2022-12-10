# zsh runtime config

## loads common dotfiles

for FILE in $HOME/.hugginsio/common/.*; do
  test "$FILE" = folder/.DS_Store && continue
  [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE";
done;
unset FILE

## generate the update command and assign to alias

dotfiles_update_bootstrap

## loads os-specfic dotfiles

OS_DOTFILE="$HOME/.hugginsio/os/.${$(uname -s):l}"
[ -r "$OS_DOTFILE" ] && [ -f "$OS_DOTFILE" ] && source "$OS_DOTFILE";
unset OS_DOTFILE

## loads host-specfic dotfiles

HOST_DOTFILE="$HOME/.hugginsio/host/.${$(hostname -s | cut -c1-4):l}"
[ -r "$HOST_DOTFILE" ] && [ -f "$HOST_DOTFILE" ] && source "$HOST_DOTFILE";
unset HOST_DOTFILE

## loads the extras dotfile

EXTRA_DOTFILE="$HOME/.extra"
[ -r "$EXTRA_DOTFILE" ] && [ -f "$EXTRA_DOTFILE" ] && source "$EXTRA_DOTFILE";
unset EXTRA_DOTFILE

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
