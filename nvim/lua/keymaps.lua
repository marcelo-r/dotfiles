-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

--vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.open_qf)

vim.keymap.set("n", "<leader><leader>.", "<cmd>source %<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader><leader><CR>", "<cmd>source ~/.config/nvim/init.vim<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>j", "<cmd>bnext<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>k", "<cmd>bprevious<CR>", { noremap = true, silent = false })

-- open the terminal
--vim.keymap.set('n', '<leader>t', vim.terminal.open)

-- trouble | diagnostics
vim.keymap.set('n', '<a-d>', "<cmd>Trouble diagnostics toggle<cr>")
