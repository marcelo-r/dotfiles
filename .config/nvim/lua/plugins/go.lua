return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      -- "fatih/vim-go",
  },
  config = function()
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
       require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
    require("go").setup()

    vim.g.go_code_completion_enabled = 0
    vim.g.go_def_mapping_enabled = 0
    vim.g.go_info_mode='gopls'
    vim.g.go_def_mode='gopls'
    vim.g.go_doc_popup_window = 1
    vim.g.go_metalinter_command = 'golangci-lint'
    vim.g.go_metalinter_deadline = "5s"
    vim.g.go_test_show_name = 1
    vim.g.go_jump_to_error = 0
    vim.g.go_fmt_autosave = 1
    vim.g.go_list_height = 5
    vim.g.go_def_reuse_buffer = 1
    vim.g.go_metalinter_autosave = 0
    vim.g.go_metalinter_autosave_enabled = {'vet', 'revive', 'errcheck', 'deadcode', 'gosimple', 'unused', 'ineffassign', 'lll', 'staticcheck', 'prealloc', 'gomnd', 'goconst', 'gosec', 'funlen'}
    vim.g.go_metalinter_enabled = { 'deadcode', 'depguard', 'dogsled', 'dupl',
      'errcheck', 'exhaustive', 'gochecknoinits', 'goconst', 'gocritic',
      'gocyclo', 'gofmt', 'goimports', 'revive', 'gomnd',
      'goprintffuncname', 'gosec', 'gosimple', 'govet', 'ineffassign',
      'lll', 'misspell', 'nakedret', 'nolintlint',
      'exportloopref', 'staticcheck', 'stylecheck',
      'typecheck', 'unconvert', 'unused', 'varcheck',
      'asciicheck', 'gocognit', 'godox', 'goerr113', 'nestif',
      'prealloc', 'whitespace',
      }

  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()'
}
