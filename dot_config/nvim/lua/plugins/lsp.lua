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
            opts.mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            })

            opts.sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "omni" },
                { name = "path" },
            })
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
