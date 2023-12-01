--require 'window-picker'.setup({
--  filter_rules = {
--    include_current_win = false,
--    autoselect_one = true,
--    -- filter using buffer options
--    bo = {
--      -- if the file type is one of following, the window will be ignored
--      filetype = { 'neo-tree', "neo-tree-popup", "notify" },
--      -- if the buffer type is one of following, the window will be ignored
--      buftype = { 'terminal', "quickfix" },
--    },
--  },
--})
--
--require('neo-tree').setup({
--  window = {
--    position = "right",
--    width = 40,
--    mapping_options = {
--      noremap = true,
--      nowait = true,
--    },
--    mappings = {
--      ["o"] = "open",
--    },
--  },
--})
--
--vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    side = "right",
  },
  filters = { custom = { "^.git$" } },
  git = {
    enable = true,
  },
})

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
