local Util = require("config.utils")

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
            { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Search todos" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
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
            { "<M-x>",           "<cmd>Telescope commands<cr>",                      desc = "Commands" },
            { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
            { "<leader><space>", Util.telescope("files"),                            desc = "Find in workspace directory" },
            -- +code
            { "<leader>cx",      "<cmd>Telescope diagnostics<cr>",                   desc = "List diagnostics" },
            {
                "<leader>cs",
                Util.telescope("lsp_document_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto symbol in buffer",
            },
            {
                "<leader>cS",
                Util.telescope("lsp_workspace_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto symbol in workspace",
            },
            -- +file
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "List recent files" },
            { "<leader>ff", Util.telescope("files"),                        desc = "Find in workspace directory" },
            { "<leader>fF", Util.telescope("files", { cwd = false }),       desc = "Find in current directory" },
            -- +search
            { "<leader>sG", Util.telescope("live_grep", { cwd = false }),   desc = "Search in current directory" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "Search man pages" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search buffer" },
            { "<leader>sg", Util.telescope("live_grep"),                    desc = "Search in workspace directory" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "Search help tags" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "Search keymaps" },
            { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "Jump to mark" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "Search Vim options" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "│",
            filetype_exclude = {
                "help",
                "lazy",
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            filetype_denylist = {
                "help",
                "lazy",
                "vimwiki",
            },
        },
        config = function(opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " reference", buffer = buffer })
            end

            map("]r", "next")
            map("[r", "prev")
        end,
    },
}
