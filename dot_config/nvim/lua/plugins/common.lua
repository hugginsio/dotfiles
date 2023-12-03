return {
    {
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("neoclip").setup()
            require("telescope").load_extension("neoclip")
        end,
        dependencies = { "nvim-telescope/telescope.nvim" },
        keys = {
            { "<leader>p", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", desc = "Open clipboard" },
        },
    },
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
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        opts = { border = "single" },
        keys = { { "<leader>fg", "<cmd>Glow<CR>", desc = "Preview markdown with Glow" } },
    },
    {
        "fladson/vim-kitty",
        event = "BufReadPre",
    },
    {
        "folke/flash.nvim",
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
    },
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            opts.defaults["<leader>o"] = { name = "+overseer" }
            opts.defaults["<leader>z"] = { name = "+zettelkasten" }
        end,
    },
    {
        "hugginsio/twig.nvim",
        event = "VeryLazy",
        opts = {
            project_pattern = "-(.*)",
        },
    },
    {
        "hugginsio/vim-cooklang",
        branch = "hugginsio/1",
        ft = "cook",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop",
        },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            { "<leader>fG", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview in browser" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            exclude = {
                filetypes = {
                    "alpha",
                    "dashboard",
                    "glowpreview",
                    "help",
                    "lazy",
                    "neo-tree",
                    "Trouble",
                },
            },
        },
    },
    {
        "mickael-menu/zk-nvim",
        config = function(opts)
            require("zk").setup(opts)
            require("telescope").load_extension("zk")
        end,
        event = "VeryLazy",
        ft = { "markdn", "markdown", "md", "mdown" },
        keys = {
            { "<leader>zb", "<cmd>ZkBacklinks<CR>", desc = "Open backlinks picker" },
            { "<leader>zj", "<cmd>ZkNew { dir = 'journal', group = 'journal'}<CR>", desc = "Open journal" },
            { "<leader>zl", "<cmd>ZkLinks<CR>", desc = "Open outbound links picker" },
            { "<leader>zo", "<cmd>Telescope zk notes<CR>", desc = "Open notes picker" },
            { "<leader>zt", "<cmd>Telescope zk tags<CR>", desc = "Open notes picker, filtered by tags" },
        },
        opts = {
            picker = "telescope",
            lsp = {
                config = { cmd = { "zk", "lsp" }, name = "zk" },
                auto_attach = { enabled = true, filetypes = { "markdn", "markdown", "md", "mdown" } },
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
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = { bind_to_cwd = false, follow_current_file = { enabled = true } },
            window = { width = 30, mappings = { ["<space>"] = "none" } },
            popup_border_style = "single",
            default_component_configs = {
                indent = { with_expanders = true },
                git_status = {
                    symbols = { modified = "!", deleted = "x", renamed = "r", untracked = "?", conflict = "~" },
                },
            },
        },
    },
    {
        "SidOfc/mkdx",
        enabled = false,
        ft = {
            "markdn",
            "markdown",
            "md",
            "mdown",
        },
    },
    {
        "stevearc/overseer.nvim",
        opts = {},
        keys = {
            { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run task" },
            { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Toggle task history" },
        },
    },
    {
        "tpope/vim-eunuch",
        dir = "~/.vim/pack/hugginsio/start/eunuch",
        event = "VeryLazy",
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "tpope/vim-speeddating",
        event = "VeryLazy",
    },
    {
        "williamboman/mason.nvim",
        opts = {
            -- https://github.com/mason-org/mason-registry/tree/main/packages
            ensure_installed = {
                "gofumpt",
                "goimports",
                "gopls",
                "json-lsp",
                "jsonlint",
                "markdownlint",
                "marksman",
                "misspell",
                "shfmt",
                "yaml-language-server",
                "yamlfmt",
                "yamllint",
            },
        },
    },
    {
        "xiyaowong/link-visitor.nvim",
        config = {
            skip_confirmation = true,
        },
        event = "VeryLazy",
        keys = {
            { "gx", "<cmd>VisitLinkNearCursor<CR>", desc = "Open link under the cursor" },
        },
    },
}
