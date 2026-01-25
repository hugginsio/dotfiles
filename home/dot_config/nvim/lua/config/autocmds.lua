-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    -- Fix LazyVim's formatoptions for org files to prevent automatic asterisk insertion
    vim.opt_local.formatoptions:remove({ "r", "o" })

    -- Disable line numbers
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    -- Enable soft wrap
    vim.opt_local.wrap = true
  end,
})
