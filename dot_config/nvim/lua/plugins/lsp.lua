return {
    {
        "williamboman/mason.nvim",
        opts = {
            -- https://github.com/mason-org/mason-registry/tree/main/packages
            ensure_installed = {
                "gopls",
                "json-lsp",
                "jsonlint",
                "lua-language-server",
                "luacheck",
                "luaformatter",
                "markdownlint",
                "marksman",
                "misspell",
                "shfmt",
                "stylua",
                "yaml-language-server",
                "yamlfmt",
                "yamllint",
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-omni" },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "omni" } }))
        end,
    },
    {
        "fladson/vim-kitty",
        event = "BufReadPre",
    },
    {
        "SidOfc/mkdx",
        ft = { "markdn", "markdown", "md", "mdown" },
    },
}
