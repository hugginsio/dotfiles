-- Source existing vim configuration (https://neovim.io/doc/user/nvim.html#nvim-from-vim)
vim.cmd([[
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vim/vimrc
]])

-- folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Import plugins from lua/plugins/**
require("lazy").setup({
    install = {
        colorscheme = { "catppuccin-mocha" },
    },
    spec = {
        {
            import = "plugins"
        },
    }
})
