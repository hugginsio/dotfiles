local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.ensure_installed({
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "jsonls",
    "lua_ls",
    "marksman",
    "tailwindcss",
    "taplo",
    "terraformls",
    "vimls",
    "yamlls",
})

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
