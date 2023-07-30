return {
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
        "fladson/vim-kitty",
        event = "BufReadPre",
    },
    {
        "luizribeiro/vim-cooklang",
        ft = "cook",
    },
    {
        "SidOfc/mkdx",
        enabled = false,
        ft = { "markdn", "markdown", "md", "mdown" },
    },
}
