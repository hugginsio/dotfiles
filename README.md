# dotfiles

My macOS & Ubuntu dotfiles. For now, mostly aliases and themes. In the future, I'd like to expand `.files-bootstrap` to automate as much of the setup process as possible for new machines.

## Shell Behavior

`.zshrc` sources:

- all `.*` files from `.files-common/`
- The OS-specific dotfile from `.files-os/` using `uname -s`, if it exists.
- The hostname-specific dotfile from `.files-host/` using the first four characters of `hostname -s`, if it exists.

## Acknowledgements

- [http://dotfiles.github.io](http://dotfiles.github.io)
- [Atlassian's dotfiles guide](https://www.atlassian.com/git/tutorials/dotfiles)
- [@necolas/dotfiles](https://github.com/necolas/dotfiles/)
