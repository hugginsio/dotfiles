local Util = require("util")

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    Util.on_load("telescope.nvim", function()
                        require("telescope").load_extension("fzf")
                    end)
                end,
                enabled = vim.fn.executable("make") == 1,
            },
        },
        keys = {
            { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Search buffers" },
            { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
            { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
            { "<leader><space>", Util.telescope("files"), desc = "Files (root dir)" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
            { "<leader>sB", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
            { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
            { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search highlight groups" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
            { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto commands" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
            { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
            { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
            { "<leader>sf", Util.telescope("files"), desc = "Files (root dir)" },
            { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
            { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
        },
        opts = {
            defaults = {
                layout_config = {
                    center = {
                        height = 0.9,
                        preview_cutoff = 160,
                        prompt_position = "top",
                        width = 0.9,
                    },
                    horizontal = {
                        height = 0.9,
                        preview_cutoff = 160,
                        prompt_position = "bottom",
                        width = 0.9,
                    },
                    vertical = {
                        height = 0.9,
                        preview_cutoff = 160,
                        prompt_position = "bottom",
                        width = 0.9,
                    }
                },
                prompt_prefix = " ",
                selection_caret = " ",
            },
            pickers = {
                autocommands = { theme = "dropdown" },
                buffers = { theme = "dropdown" },
                current_buffer_fuzzy_find = { previewer = false },
                find_files = { theme = "dropdown" },
                git_commits = { theme = "dropdown" },
                git_files = { theme = "dropdown" },
                git_status = { theme = "dropdown" },
                help_tags = { theme = "dropdown" },
                live_grep = { theme = "dropdown" },
            }
        }
    },
}
