-- autocmds

vim.api.nvim_create_augroup("hugginsio", { clear = true })

-- Reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "hugginsio",
  pattern = vim.env.MYVIMRC,
  command = "silent source %"
})

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "hugginsio",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end
})

-- Start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = "hugginsio",
  pattern = "*",
  command = "startinsert"
})

-- Write unsaved buffers when focus lost
vim.api.nvim_create_autocmd("FocusLost", {
  group = "hugginsio",
  pattern = "*",
  command = "silent! wa"
})

-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "hugginsio",
  pattern = "*",
  command = "%s/\\s\\+$//e"
})
