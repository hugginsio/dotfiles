return {
    {
        "fladson/vim-kitty",
        event = "BufReadPre",
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        lazy = true,
        config = function()
            require("lsp-zero.settings").preset({})
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = { "L3MON4D3/LuaSnip" },
        config = function()
            require("lsp-zero.cmp").extend()
            local cmp = require("cmp")
            local cmp_action = require("lsp-zero.cmp").action()
            cmp.setup({
                mapping = {
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)

            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            lsp.ensure_installed({
                "docker_compose_language_service",
                "dockerls",
                "gopls",
                "jsonls",
                "lua_ls",
                "sqlls",
                "yamlls",
            })

            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
            lsp.setup()
        end
    },
}
