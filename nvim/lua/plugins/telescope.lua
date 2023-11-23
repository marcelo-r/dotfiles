local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fe', telescope.git_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fd' , telescope.diagnostics, {})
vim.keymap.set('n', '<leader>fr' , telescope.lsp_references, {})
vim.keymap.set('n', '<leader>fs' , telescope.lsp_dynamic_workspace_symbols, {})

local action_state = require('telescope.actions.state')
require('telescope').setup{
	defaults= {
		mappings = {
			i = {
				["<c-a>"] = function() print(  vim.inspect(action_state.get_selected_entry())) end -- the fuck is this?
			}
		}
	}
}
