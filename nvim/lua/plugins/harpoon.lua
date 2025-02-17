require("telescope").load_extension('harpoon')

require("harpoon").setup({})

local harpoon_ui = require("harpoon.ui")
local mark = require("harpoon.mark")

vim.keymap.set('n', '<leader>hh', function() harpoon_ui.toggle_quick_menu() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hj', function() harpoon_ui.nav_next() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hk', function() harpoon_ui.nav_prev() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
vim.keymap.set("n", "<M-1>", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon_ui.nav_file(4) end)
