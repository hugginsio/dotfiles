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
                -- TODO: figure out keymap situation
                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/under-the-hood.md
                config = function ()
                    require("mason").setup({ ui = { border = "single" } })
                end,
            },
        },
        config = function()
            local lsp = require("lsp-zero")

            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            lsp.ensure_installed({
                "docker_compose_language_service",
                "dockerls",
                "gopls",
                "marksman",
                "jsonls",
                "lua_ls",
                "sqlls",
                "yamlls",
            })

            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
            lsp.setup()
        end,
        keys = {
            -- +[, +]
            { "[d", "<cmd> lua vim.diagnostic.goto_prev()<cr>", desc = "Previous diagnostic" },
            { "]d", "<cmd> lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostic" },
            -- +code
            { "<leader>cA", "<cmd> lua vim.lsp.buf.code_action()<cr>", desc = "Execute code action (region)" },
            { "<leader>cA", "<cmd> lua vim.lsp.buf.range_code_action()<cr>", desc = "Execute code action (region)", mode = "x" },
            { "<leader>cD", "<cmd> lua vim.lsp.buf.declaration()<cr>", desc = "Jump to declaration" },
            { "<leader>cR", "<cmd> lua vim.lsp.buf.references()<cr>", desc = "Find references" },
            { "<leader>cd", "<cmd> lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition" },
            { "<leader>cf", "<cmd> lua vim.lsp.buf.format({async = true})<cr>", desc = "Format buffer/region", mode = { "n", "x" } },
            { "<leader>ci", "<cmd> lua vim.lsp.buf.implementation()<cr>", desc = "Find implementations" },
            { "<leader>cr", "<cmd> lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
            { "<leader>cs", "<cmd> lua vim.lsp.buf.code_action()<cr>", desc = "Show signature help" },
            { "<leader>ct", "<cmd> lua vim.lsp.buf.type_definition()<cr>", desc = "Find type definition" },
            { "<leader>cx", "<cmd> lua vim.diagnostic.open_float()<cr>", desc = "List diagnostics" },
        },
    },
}
