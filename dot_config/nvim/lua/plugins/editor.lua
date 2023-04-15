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
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- root
                map("n", "]h", gs.next_hunk, "Next hunk")
                map("n", "[h", gs.prev_hunk, "Previous hunk")
                -- +git
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk at cursor")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset hunk at cursor")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Revert buffer")
                map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame")
                map("n", "<leader>ghd", gs.diffthis, "Diff buffer")
                -- +toggle
                map("n", "<leader>tg", gs.toggle_signs, "Toggle git signs")
            end,
        },
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
                ["<leader>g"] = { name = "+git" },
                ["<leader>s"] = { name = "+search" },
                ["["] = { name = "+prev" },
                ["]"] = { name = "+next" },
                ["g"] = { name = "+goto" },
                ["<leader>t"] = { name = "+toggle" },
            }
            wk.register(keymaps)
        end,
    },
}
