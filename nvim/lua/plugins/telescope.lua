local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set('n', '<leader>fg', telescope.git_files, { desc = "[F]ind [G]it Files" })
vim.keymap.set('n', '<leader>f/', telescope.live_grep, { desc = "[F]ind " })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set('n', '<leader>fc', telescope.commands, { desc = "[F]ind [C]ommands" })
vim.keymap.set('n', '<leader>fd', telescope.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set('n', '<leader>fr', telescope.lsp_references, { desc = "[F]ind [R]eferences" })
vim.keymap.set('n', '<leader>fi', telescope.lsp_implementations, { desc = "[F]ind [I]mplementations" })
vim.keymap.set('n', '<leader>fs', telescope.lsp_dynamic_workspace_symbols, { desc = "[F]ind [S]ymbols" })

--local action_state = require('telescope.actions.state')
require('telescope').setup {
	--defaults = {
	--	mappings = {
	--		i = {
	--			["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end -- the fuck is this?
	--		}
	--	}
	--},
	extensions = {
		fzf = {
			fuzzy = true,					-- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true,	-- override the file sorter
			case_mode = "smart_case",		-- or "ignore_case" or "respect_case"
											-- the default case_mode is "smart_case"
		}
	}
}
