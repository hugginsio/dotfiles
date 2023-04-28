return {
    {
        "catppuccin/nvim",
        config = function()
            vim.cmd("colorscheme catppuccin-mocha")
        end,
        lazy = false,
        name = "catppuccin",
        priority = 100,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = true,
            },
            window = {
                width = 30,
                mappings = {
                    ["<space>"] = "none",
                },
            },
            popup_border_style = "single",
            default_component_configs = {
                indent = {
                    with_expanders = true,
                },
                git_status = {
                    symbols = {
                        modified = "!",
                        deleted = "✖",
                        renamed = "»",
                        untracked = "?",
                        conflict = "=",
                    },
                },
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            local icons = require("lazyvim.config").icons

            local function fg(name)
                return function()
                    ---@type {foreground?:number}?
                    local hl = vim.api.nvim_get_hl_by_name(name, true)
                    return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
                end
            end

            return {
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                },
                -- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md#available-components
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                            padding = { left = 1, right = 0 },
                        },
                        { "filename", path = 1, symbols = { modified = "[+]", readonly = "[RO]", unnamed = "" } },
                    },
                    lualine_x = {
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = fg("Special"),
                        },
                    },
                    lualine_y = {
                        { "filetype", icons_enabled = false, separator = "" },
                        { "progress", separator = " ", padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                },
                extensions = { "neo-tree", "lazy" },
            }
        end,
    },
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            opts.defaults["<leader>z"] = { name = "+zettelkasten" }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "glowpreview" },
        },
    },
    {
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        opts = {
            border = "single",
        },
        keys = {
            { "<leader>fg", "<cmd>Glow<CR>", desc = "Preview markdown with Glow" },
        },
    },
}
