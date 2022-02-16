# zsh runtime config

## loads common dotfiles
for FILE in $HOME/.files-common/.*; do
	test "$FILE" = folder/.DS_Store && continue
	[ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE";
done;
unset FILE

## loads os-specfic dotfiles
OS_DOTFILE="$HOME/.files-os/.${$(uname -s):l}"
[ -r "$OS_DOTFILE" ] && [ -f "$OS_DOTFILE" ] && source "$OS_DOTFILE";
unset OS_DOTFILE