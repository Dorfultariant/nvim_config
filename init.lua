print("Welcome Teppo")
require("config.lazy")

vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", "i:lua<CR>")

vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
vim.keymap.set("n", "grr", vim.lsp.buf.references)

-- Sets the line numbers on, both relative and absolute
vim.cmd('set relativenumber')
vim.cmd('set nu')

vim.cmd('set clipboard+=unnamedplus')

-- Highlight when yanking text
-- test with yap in normal mode
-- :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
