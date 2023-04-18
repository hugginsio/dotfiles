-- Source existing vim configuration (https://neovim.io/doc/user/nvim.html#nvim-from-vim)
vim.cmd([[
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vim/vimrc
]])

-- bootstrap lazy.nvim, LazyVim and plugins
require("config.lazy")
