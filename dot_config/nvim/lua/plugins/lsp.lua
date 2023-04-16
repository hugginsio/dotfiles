return {
    {
        "fladson/vim-kitty",
        event = "BufReadPre",
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        lazy = true,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = { "L3MON4D3/LuaSnip" },
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
        init = function()
            local lsp = require("lsp-zero").preset({
                float_border = 'single',
                configure_diagnostics = true,
                call_servers = 'local',
                setup_servers_on_start = true,
                set_lsp_keymaps = false,
                manage_nvim_cmp = {
                    set_sources = 'lsp',
                    set_basic_mappings = true,
                    set_extra_mappings = false,
                    use_luasnip = true,
                    set_format = true,
                    documentation_window = true,
                },
            })

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

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
            lsp.setup()
        end,
        -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#default_keymapsopts
        -- can't disable the default keymaps, so define them here so they show up in which-key
        keys = {
            { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Display hover information" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition of symbol" },
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration of symbol" },
            { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "List implementations of symbol" },
            { "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition of symbol" },
            { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "List references to symbol" },
            { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Display signature information" },
            { "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol and all references" },
            { "<F3>", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format code in current buffer" },
            { "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "List code actions at symbol" },
            { "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "List diagnostics for current buffer" },
            { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous diagnostic in buffer" },
            { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next diagnostic in buffer" },
        }
    },
}
