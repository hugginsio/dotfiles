" Source existing vim configuration (https://neovim.io/doc/user/nvim.html#nvim-from-vim)
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
