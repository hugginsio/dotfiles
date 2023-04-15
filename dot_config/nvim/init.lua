-- Source existing vim configuration (https://neovim.io/doc/user/nvim.html#nvim-from-vim)
vim.cmd([[
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vim/vimrc
]])

-- folke/lazy.nvim
require("config.lazy")
