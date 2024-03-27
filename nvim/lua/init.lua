-- my config
require 'settings'
require 'keymaps'
require 'commands'

require('neodev').setup() -- should be first

require 'plugins.tree'
require 'plugins.telescope'
require 'plugins.cmp'
require 'plugins.treesitter'
require 'plugins.mason'
require 'plugins.go'
require 'plugins.harpoon'
require 'plugins.dap'

require("fidget").setup({})

require("nvim-autopairs").setup {}

require("ibl").setup({
  debounce = 100,
  indent = { char = "▏" },
  whitespace = { highlight = { "Whitespace", "NonText" } },
  scope = { exclude = { language = { "lua" } } },
})

vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Or "if_many"
  },
  float = {
    source = "always", -- Or "if_many"
  },
  update_in_insert = false,
})

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250

--vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--  callback = function ()
--    vim.diagnostic.open_float(nil, {focus=false})
--  end
--})

local float_diagnostic = function()
  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',
    prefix = ' ',
    scope = 'line',
    update_in_insert = false,
  }
  vim.diagnostic.open_float(nil, opts)
end
vim.keymap.set('n', '<leader>d', float_diagnostic, { noremap = true, silent = true })

--vim.api.nvim_create_autocmd("CursorHold", {
--  buffer = bufnr,
--  callback = function()
--    local opts = {
--      focusable = false,
--      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--      border = 'rounded',
--      source = 'always',
--      prefix = ' ',
--      scope = 'line',
--      update_in_insert = false,
--    }
--    vim.diagnostic.open_float(nil, opts)
--  end
--})

-- print diagnostics to message area
function PrintDiagnostics(opts, bufnr, line_nr, _)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end
--vim.api.nvim_create_autocmd("CursorHold", {
--  buffer = bufnr,
--  callback = function()
--    PrintDiagnostics()
--  end
--})
