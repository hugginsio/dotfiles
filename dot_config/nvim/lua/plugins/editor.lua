return {
    {
        "tpope/vim-surround",
        dir = "~/.vim/pack/hugginsio/start/surround",
        event = "BufReadPost",
    },
    {
        "mg979/vim-visual-multi",
        dir = "~/.vim/pack/hugginsio/start/visual-multi",
        event = "BufReadPost",
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
        config = true,
        keys = {
            { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search todos" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
        },
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
                map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage hunk at cursor")
                map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset hunk at cursor")
                map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
                map("n", "<leader>gR", gs.reset_buffer, "Revert buffer")
                map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame")
                map("n", "<leader>gd", gs.diffthis, "Diff buffer")
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
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "│",
            filetype_exclude = {
                "help",
                "Trouble",
                "lazy"
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
        end,
        keys = {
            { "]]", desc = "Next reference" },
            { "[[", desc = "Prev reference" },
        },
    },
}
