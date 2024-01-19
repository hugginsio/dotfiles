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

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = {
        missing = true,
        colorscheme = { "catppuccin-mocha" }
    },
    checker = { enabled = false },
    change_detection = { enabled = false },
    ui = { border = "single" },
    performance = {
        rtp = {
            disabled_plugins = {
                "matchit",
                "matchparen",
                "tarPlugin",
                "tohtml",
                "tutor",
            },
        },
    },
})
