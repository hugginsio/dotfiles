local function augroup(name)
  return vim.api.nvim_create_augroup("hugginsio_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Terminal open behavior
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("terminal_open"),
  callback = function()
      vim.cmd([[
        setlocal nonumber norelativenumber
        startinsert
      ]])
  end,
})

-- Terminal exit behavior
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup("terminal_close"),
  callback = function()
      vim.cmd("close!")
  end,
})
