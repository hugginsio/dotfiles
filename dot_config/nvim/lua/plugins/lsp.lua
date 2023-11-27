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
        "fladson/vim-kitty",
        event = "BufReadPre",
    },
    {
        "hugginsio/vim-cooklang",
        branch = "hugginsio/1",
        ft = "cook",
    },
    {
        "SidOfc/mkdx",
        enabled = false,
        ft = { "markdn", "markdown", "md", "mdown" },
    },
}
