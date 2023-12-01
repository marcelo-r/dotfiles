-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_set_keymap("n", "<leader><leader><CR>", ":source %<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>bnext<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>bprevious<CR>", { noremap = true, silent = false })
