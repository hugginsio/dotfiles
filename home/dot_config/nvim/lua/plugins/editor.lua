---@type LazySpec
return {
    {
        "tpope/vim-eunuch",
        cmd = {
            "Cfind",
            "Chmod",
            "Clocate",
            "Delete",
            "Lfind",
            "Mkdir",
            "Move",
            "Remove",
            "SudoEdit",
            "SudoWrite",
            "Wall",
        },
    },
    {
        "tpope/vim-speeddating",
        event = "VeryLazy",
    },
    {
        "tpope/vim-surround",
        event = "VeryLazy",
        keys = {
            { "S",   desc = "Surround",                           mode = "v" },
            { "cS",  desc = "Change surround on own line" },
            { "cs",  desc = "Change surround" },
            { "ds",  desc = "Delete surround" },
            { "yS",  desc = "You surround on own line" },
            { "ySS", desc = "You surround on own line and indent" },
            { "ys",  desc = "You surround" },
            { "yss", desc = "You surround on current line" },
        }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        },
    },
    {
        "farmergreg/vim-lastplace",
    },
    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>tz", "<cmd>ZenMode<CR>", desc = "Zen" },
        },
        opts = {
            window = {
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                },
            },
            plugins = {
                options = {
                    laststatus = 0,
                    ruler = false,
                    showcmd = false,
                },
            },
        },
    },
}
