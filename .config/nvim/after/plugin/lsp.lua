-- lsp-zero

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "lua_ls",
  "gopls",
})

lsp.nvim_workspace()
lsp.setup()
