return {
    {
        "tpope/vim-surround",
        dir = "~/.vim/pack/hugginsio/start/surround",
        event = "VeryLazy",
    },
    {
        "mg979/vim-visual-multi",
        dir = "~/.vim/pack/hugginsio/start/visual-multi",
        event = "VeryLazy",
    },
    {
        "folke/todo-comments.nvim",
        config = true,
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        event = "BufReadPre",
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            -- root
            { "<M-x>", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            -- +file/find
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
            -- +search
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search buffer" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
            { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to mark" },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            local keymaps = {
                mode = { "n", "v" },
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>s"] = { name = "+search" },
                ["["] = { name = "+prev" },
                ["]"] = { name = "+next" },
                ["g"] = { name = "+goto" },
            }
            wk.register(keymaps)
        end,
    },
}
