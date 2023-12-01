-- my config
require'keymaps'
require('user.functions')

require'settings'

require('neodev').setup() -- should be first 

require'plugins.tree'
require'plugins.telescope'
require'plugins.cmp'
require'plugins.treesitter'
require'plugins.mason'
require'plugins.go'
require'plugins.harpoon'

require("fidget").setup({})

require("nvim-autopairs").setup {}

require("ibl").setup({
       debounce = 100,
       indent = { char = "▏" },
       whitespace = { highlight = { "Whitespace", "NonText" } },
       scope = { exclude = { language = { "lua" } } },
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
--vim.o.updatetime = 250
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({
  virtual_text = {
    source = "always",  -- Or "if_many"
  },
  float = {
    source = "always",  -- Or "if_many"
  },
})

-- print diagnostics to message area
function PrintDiagnostics(opts, bufnr, line_nr, client_id)
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

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
