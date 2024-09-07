require("lazy").setup({
    {
        "AstroNvim/AstroNvim",
        version = "^4",
        import = "astronvim.plugins",
    },
    { import = "community" },
    { import = "plugins" },
} --[[@as LazySpec]], {
    install = { colorscheme = { "catppuccin-frappe", "astrotheme" } },
    ui = { backdrop = 100 },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
            },
        },
    },
} --[[@as LazyConfig]])
