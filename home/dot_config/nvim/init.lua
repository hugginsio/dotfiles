-- Source existing vim configuration (https://neovim.io/doc/user/nvim.html#nvim-from-vim)
vim.cmd('source ~/.vim/vimrc')

-- load base configuration, lazy.nvim and plugins
require("config")
