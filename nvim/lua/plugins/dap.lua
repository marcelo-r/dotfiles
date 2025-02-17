-- configure as vscode does from .vscode/launch.json
require('dap.ext.vscode').load_launchjs(nil, {})

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })


vim.keymap.set('n', '<localleader><CR>', require('dap').continue)
vim.keymap.set('n', '<localleader>s', require('dap').step_over)
vim.keymap.set('n', '<localleader>i', require('dap').step_into)
vim.keymap.set('n', '<localleader>O', require('dap').step_out)
vim.keymap.set('n', '<localleader>b', require('dap').toggle_breakpoint)
