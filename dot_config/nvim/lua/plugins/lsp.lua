return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            {
                "neovim/nvim-lspconfig",
                dependencies = {
                    {
                        "williamboman/mason.nvim",
                        build = function()
                            pcall(vim.cmd, "MasonUpdate")
                        end,
                    },
                    { "williamboman/mason-lspconfig.nvim" },
                    {
                        "hrsh7th/nvim-cmp",
                        dependencies = {
                            "L3MON4D3/LuaSnip",
                            "hrsh7th/cmp-nvim-lsp",
                        },
                    },
                },
                cmd = "LspInfo",
                event = { "BufReadPre", "BufNewFile" },
            },
        },
    },
}
