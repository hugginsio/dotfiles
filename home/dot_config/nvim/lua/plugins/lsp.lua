return {
   {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local zero = require("lsp-zero")
            zero.extend_cmp()

            local cmp = require("cmp")
            local cmp_action = zero.cmp_action()

            cmp.setup({
                formatting = zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                })
            })
        end,
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        event = "InsertEnter",
    },
    {
        "neovim/nvim-lspconfig",
        cmd = {
            "LspInfo",
            "LspInstall",
            "LspStart",
        },
        config = function()
            local zero = require("lsp-zero")
            zero.extend_lspconfig()

            zero.on_attach(function(_, bufnr)
                zero.default_keymaps({buffer = bufnr})
            end)

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "gopls",
                    "jsonls",
                },
                handlers = {
                    zero.default_setup,
                },
            })
        end,
        event = {
            "BufNewFile",
            "BufReadPre",
        },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
    },
    {
        "williamboman/mason.nvim",
        config = true,
    },
}
