# dotfiles

## Shell Behavior

`.zshrc` sources:

- all `.*` files from `.hugginsio/common/`
- The OS-specific dotfile from `.hugginsio/os/` using `uname -s`, if it exists.
- The hostname-specific dotfile from `.hugginsio/host/` using the first four characters of `hostname -s`, if it exists.

## Acknowledgements

- [http://dotfiles.github.io](http://dotfiles.github.io)
- [Atlassian's dotfiles guide](https://www.atlassian.com/git/tutorials/dotfiles)
- [@necolas/dotfiles](https://github.com/necolas/dotfiles/)
